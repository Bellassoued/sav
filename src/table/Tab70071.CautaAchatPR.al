table 70071 "Cauta Achat PR"
{
    // version NAVW17.00

    CaptionML = ENU='Cauta Achat PR',
                FRA='Cauta Achat PR';
    DrillDownPageID = 70106;
    LookupPageID = 70106;

    fields
    {
        field(1;"Vendor No.";Code[20])
        {
            CaptionML = ENU='Vendor No.',
                        FRA='N° fournisseur';
            NotBlank = true;
            TableRelation = Vendor;

            trigger OnValidate();
            begin
                IF Vend.GET("Vendor No.") THEN
                  BEGIN
                  "Currency Code" := Vend."Currency Code";
                  "Vendor Name" := Vend.Name
                  END;
            end;
        }
        field(2;"Vendor Name";Text[80])
        {
        }
        field(3;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            TableRelation = Currency;
        }
        field(4;"Starting Date";Date)
        {
            CaptionML = ENU='Starting Date',
                        FRA='Date début';

            trigger OnValidate();
            begin
                IF ("Starting Date" > "Ending Date") AND ("Ending Date" <> 0D) THEN
                  ERROR(Text000,FIELDCAPTION("Starting Date"),FIELDCAPTION("Ending Date"));
            end;
        }
        field(5;"Ending Date";Date)
        {
            CaptionML = ENU='Ending Date',
                        FRA='Date fin';

            trigger OnValidate();
            begin
                VALIDATE("Starting Date");
            end;
        }
        field(6;"Cauta PR";Decimal)
        {
        }
        field(7;"Total Cmd Achat";Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Outstanding Amount" WHERE (Document Type=CONST(Order),
                                                                          Currency Code=FIELD(Currency Filter),
                                                                          Pay-to Vendor No.=FIELD(Vendor No.),
                                                                          Order Date=FIELD(Date Filter),
                                                                          Status=CONST(Released)));
            FieldClass = FlowField;
        }
        field(8;"Total Reception Achat";Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Amt. Rcd. Not Invoiced" WHERE (Document Type=CONST(Order),
                                                                              Currency Code=FIELD(Currency Filter),
                                                                              Pay-to Vendor No.=FIELD(Vendor No.),
                                                                              Order Date=FIELD(Date Filter)));
            FieldClass = FlowField;
        }
        field(9;"Total Facture";Decimal)
        {
            CalcFormula = -Sum("Detailed Vendor Ledg. Entry".Amount WHERE (Vendor No.=FIELD(Vendor No.),
                                                                           Posting Date=FIELD(Date Filter),
                                                                           Currency Code=FIELD(Currency Filter),
                                                                           Initial Document Type=CONST(Invoice),
                                                                           Entry Type=CONST(Initial Entry)));
            FieldClass = FlowField;
        }
        field(10;"Total Reglement";Decimal)
        {
            CalcFormula = Sum("Detailed Vendor Ledg. Entry".Amount WHERE (Initial Document Type=CONST(Payment),
                                                                          Posting Date=FIELD(Date Filter),
                                                                          Currency Code=FIELD(Currency Filter),
                                                                          Vendor No.=FIELD(Vendor No.),
                                                                          Entry Type=CONST(Initial Entry)));
            FieldClass = FlowField;
        }
        field(11;Reliquat;Decimal)
        {
        }
        field(12;"Date Filter";Date)
        {
            CaptionML = ENU='Date Filter',
                        FRA='Filtre date';
            FieldClass = FlowFilter;
        }
        field(13;"Currency Filter";Code[10])
        {
            CaptionML = ENU='Currency Filter',
                        FRA='Filtre devise';
            FieldClass = FlowFilter;
            TableRelation = Currency;
        }
    }

    keys
    {
        key(Key1;"Vendor No.","Starting Date","Currency Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        TESTFIELD("Vendor No.");
    end;

    trigger OnRename();
    begin
        TESTFIELD("Vendor No.");
    end;

    var
        Vend : Record "23";
        Text000 : TextConst ENU='%1 cannot be after %2',FRA='%1 ne peut pas être postérieur(e) à %2';
}

