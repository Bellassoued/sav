table 50001 "FA Budget"
{
    // version DEM ACHAT

    CaptionML = ENU = 'Investment Budget',
                FRA = 'Budget investissement';
    DrillDownPageID = 50003;
    LookupPageID = 50003;

    fields
    {
        field(1; "No Budget"; Code[20])
        {
            CaptionML = ENU = 'Budget No',
                        FRA = 'N° Budget';
            NotBlank = true;
        }
        field(2; "Désignation"; Text[250])
        {
            CaptionML = ENU = 'Description',
                        FRA = 'Désignation';
        }
        field(3; "Nature d'investissement"; Code[20])
        {
            CaptionML = ENU = 'Investment Nature',
                        FRA = 'Nature d''investissement';
            TableRelation = "Dimension Value".Code WHERE(Dimension Code=FIELD(Axe Nature d'investissement));
        }
        field(4; "Type d'investissement"; Code[20])
        {
            CaptionML = ENU = 'Investment Type',
                        FRA = 'Type d''investissement';
            TableRelation = "Dimension Value".Code WHERE(Dimension Code=FIELD(Axe Type d'investissement));
        }
        field(6;"Montant demandé";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Requested Amount',
                        FRA='Montant demandé';
            DecimalPlaces = 0:0;
        }
        field(7;"Montant autorisé";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Allowed Amount',
                        FRA='Montant autorisé';
            DecimalPlaces = 0:0;
        }
        field(8;"Montant en commande";Decimal)
        {
            AutoFormatType = 2;
            CalcFormula = Sum("Purchase Line"."Outstanding Amount (LCY)" WHERE (Document Type=FILTER(Order),
                                                                                Type=FILTER(Fixed Asset),
                                                                                No budget d'investissement=FIELD(No Budget),
                                                                                Amount=FILTER(<>0)));
            CaptionML = ENU='Ordered Amount',
                        FRA='Montant en commande';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9;"Montant comptabilisé";Decimal)
        {
            AutoFormatType = 2;
            CalcFormula = Sum("G/L Entry".Amount WHERE (N° budget d'investissement=FIELD(No Budget)));
            CaptionML = ENU='Posted Amount',
                        FRA='Montant comptabilisé';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10;"Montant sur demande achat";Decimal)
        {
            CalcFormula = Sum("Purchase Request Line"."Montant DS" WHERE (N° budget d'investissement=FIELD(No Budget),
                                                                          Type=FILTER(Fixed Asset|Existing Fixed Asset),
                                                                          Status=FILTER(Released)));
            CaptionML = ENU='Amount on Purch. Order',
                        FRA='Montant sur Demande d''achat';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20;"Axe Nature d'investissement";Code[20])
        {
            CaptionML = ENU='Investment Nature Dimension ',
                        FRA='Axe Nature d''investissement';
        }
        field(21;"Axe Type d'investissement";Code[20])
        {
            CaptionML = ENU='Investment Type Dimension',
                        FRA='Axe Type d''investissement';
        }
        field(22;Cloture;Boolean)
        {
            CaptionML = ENU='Closed',
                        FRA='Clôturé';
        }
        field(23;"Budget Amount";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(24;"T1 Request";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(25;"T2 Request";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(26;"T3 Request";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(27;"T4 Request";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(28;"T1 allowed";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(29;"T2 allowed";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(30;"T3 allowed";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(31;"T4 allowed";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(32;"Acquisitions since Jan 1st";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(33;"PO issued/received Apr 30th";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(34;Special;Boolean)
        {
            CaptionML = ENU='Special',
                        FRA='Spécial';
        }
        field(35;"Receive not posted";Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Amt. Rcd. Not Invoiced (LCY)" WHERE (Type=FILTER(Fixed Asset),
                                                                                    No budget d'investissement=FIELD(No Budget),
                                                                                    Document Type=FILTER(Order),
                                                                                    Amount=FILTER(<>0)));
            FieldClass = FlowField;
        }
        field(36;"Payment Amount";Decimal)
        {
            CaptionML = ENU='Payment Amount',
                        FRA='Montant de Paiement';
        }
        field(37;"Total Amount";Decimal)
        {
            CaptionML = ENU='Total Amount',
                        FRA='Montant total';
        }
    }

    keys
    {
        key(Key1;"No Budget")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        CALCFIELDS("Montant en commande","Montant comptabilisé","Montant sur demande achat");
        TESTFIELD("Montant en commande",0);
        TESTFIELD("Montant comptabilisé",0);
        TESTFIELD("Montant sur demande achat",0);
    end;

    trigger OnInsert();
    begin
        RecGGeneralLedgerSetup.GET;
        //RecGGeneralLedgerSetup.TESTFIELD("Nature d'investissement");
        //RecGGeneralLedgerSetup.TESTFIELD("Type d'investissement");
        //"Axe Nature d'investissement":=RecGGeneralLedgerSetup."Nature d'investissement";
        //"Axe Type d'investissement":=RecGGeneralLedgerSetup."Type d'investissement";
    end;

    var
        RecGGeneralLedgerSetup : Record "98";

    procedure ControleDepassementBudget(CodeBudget : Code[20]);
    var
        RecLLigneBudget : Record "50001";
        Error001 : TextConst ENU='Error, Budget overtaking : %5\Allowed Amount :%1\Amount on purchase requests :%2\Amount on orders :%3\Posted Amount:%4',FRA='Erreur, dépassement de budget :%5.\Montant autorisé :%1\Montant sur demande achat :%2\Montant commandé :%3\Montant comptabilisé :%4';
    begin
        IF RecLLigneBudget.GET(CodeBudget) THEN
        BEGIN
          RecLLigneBudget.CALCFIELDS("Montant sur demande achat","Montant en commande","Montant comptabilisé");

          IF (RecLLigneBudget."Montant sur demande achat"+RecLLigneBudget."Montant en commande"
          +  RecLLigneBudget."Montant comptabilisé"
              >RecLLigneBudget."Montant autorisé") THEN
          BEGIN
                ERROR(Error001,RecLLigneBudget."Montant autorisé",RecLLigneBudget."Montant sur demande achat",
                RecLLigneBudget."Montant en commande",RecLLigneBudget."Montant comptabilisé",CodeBudget
                );
          END;
        END
    end;
}

