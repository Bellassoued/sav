table 70001 "Recouvrement Line"
{
    // version CT16V002

    DrillDownPageID = 70136;
    LookupPageID = 70136;
    Permissions = TableData 21=rm,
                  TableData 112=rm;

    fields
    {
        field(1;"No. Bord. Recouvrement";Code[20])
        {
            CaptionML = ENU='No. Slip Cover',
                        FRA='No. Bordereau Recouvrement';
        }
        field(2;"No. Ligne";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne';
        }
        field(3;"No. Facture";Code[20])
        {
            CaptionML = ENU='No. Invoice',
                        FRA='No. Facture';
            Editable = false;

            trigger OnValidate();
            begin
                //FctTestStatusOpen
                IF RecSalesInvoiceHeader.GET("No. Facture") THEN
                "Pour le compte de":=RecSalesInvoiceHeader."Sell-to Customer Name";
            end;
        }
        field(4;"Mnt TTC Facture";Decimal)
        {
            CaptionML = ENU='Invoice Amount',
                        FRA='Montant Facturé';
            Editable = false;

            trigger OnValidate();
            begin
                FctTestStatusOpen
            end;
        }
        field(5;"Date Echéance";Date)
        {
            CaptionML = ENU='Due Date',
                        FRA='Date Echéance';
            Editable = false;

            trigger OnValidate();
            begin
                FctTestStatusOpen
            end;
        }
        field(6;"Code Client";Code[20])
        {
            CaptionML = ENU='Customer',
                        FRA='Client';
            Editable = false;
            TableRelation = Customer;

            trigger OnValidate();
            begin
                FctTestStatusOpen;
                RecCustomer.GET("Code Client");
                VALIDATE("Nom Client",RecCustomer.Name);
                VALIDATE("Address Client",RecCustomer.Address);
            end;
        }
        field(7;"Nom Client";Text[80])
        {
            CaptionML = ENU='Customer Name',
                        FRA='Nom Client';
            Editable = false;

            trigger OnValidate();
            begin
                FctTestStatusOpen
            end;
        }
        field(8;"Date Recep. Decharge";Date)
        {
            CaptionML = ENU='Reception Discharge Date',
                        FRA='Date Reception Décharge';
        }
        field(9;"Réception Décharge";Boolean)
        {
            CaptionML = ENU='Reception Discharge',
                        FRA='Réception Décharge';

            trigger OnValidate();
            begin
                FctTestStatusOpen;
                //OLD TESTFIELD("Code coursier");
                //OLD TESTFIELD("Code coursier");
                IF ("Code coursier" = '') AND (Recouvreur ='') THEN
                  ERROR(Text005);
                TESTFIELD("Remis Coursier");
                IF "Réception Décharge" = TRUE THEN BEGIN
                VALIDATE("Date Recep. Decharge",WORKDATE);
                 Selected := TRUE;
                  END
                ELSE BEGIN
                  VALIDATE("Date Recep. Decharge",0D);
                 Selected := FALSE;
                  END;
            end;
        }
        field(10;"Reglé";Boolean)
        {
            CaptionML = ENU='Paid',
                        FRA='Reglé';
        }
        field(12;Etape;Option)
        {
            CaptionML = ENU='Steep',
                        FRA='Etape';
            OptionCaptionML = ENU=' ,Remis coursier,Reception décharge',
                              FRA=' ,Remis coursier,Reception décharge';
            OptionMembers = " ","Remis coursier","Reception décharge";
        }
        field(13;"Date Facture";Date)
        {
            CaptionML = ENU='Invoice Date',
                        FRA='Date Facture';
            Editable = false;

            trigger OnValidate();
            begin
                FctTestStatusOpen
            end;
        }
        field(14;"Date reglement";Date)
        {
            CalcFormula = Max("Detailed Cust. Ledg. Entry"."Posting Date" WHERE (Cust. Ledger Entry No.=FIELD(No Sequence Document No.),
                                                                                 Entry Type=FILTER(Application)));
            CaptionML = ENU='Payment Date',
                        FRA='Date réglement';
            Editable = false;
            FieldClass = FlowField;
        }
        field(15;"Mnt Reglement";Decimal)
        {
            CalcFormula = -Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Cust. Ledger Entry No.=FIELD(No Sequence Document No.),
                                                                          Entry Type=FILTER(Application)));
            CaptionML = ENU='Payment amount',
                        FRA='Montant réglement';
            Editable = false;
            FieldClass = FlowField;
        }
        field(16;"Ecart date Ech. Regl.";Integer)
        {
            CaptionML = ENU='Discard Due Payment Date',
                        FRA='Ecart Date Echéance  Réglement';
            Editable = false;
        }
        field(17;"Mnt Ouvert";Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry".Amount WHERE (Cust. Ledger Entry No.=FIELD(No Sequence Document No.)));
            CaptionML = ENU='Open Amount',
                        FRA='Montant Ouvert';
            Editable = false;
            FieldClass = FlowField;
        }
        field(18;"Address Client";Text[80])
        {
            CaptionML = ENU='Customer address',
                        FRA='Address Client';
        }
        field(19;Commentaire;Text[250])
        {
            CaptionML = ENU='Comment',
                        FRA='Commentaire';
        }
        field(20;"Code coursier";Code[20])
        {
            CaptionML = ENU='Steed Code',
                        FRA='Code coursier';
            TableRelation = Employee;

            trigger OnValidate();
            begin
                FctTestStatusOpen;
                IF RecEmployee.GET("Code coursier") THEN
                "Nom coursier":= RecEmployee."First Name" + RecEmployee."Last Name"
                ELSE
                "Nom coursier":= '';
            end;
        }
        field(21;"Nom coursier";Text[80])
        {
            CaptionML = ENU='steed Name',
                        FRA='Nom Coursier';
        }
        field(22;"Remis Coursier";Boolean)
        {

            trigger OnValidate();
            begin
                FctTestStatusOpen;

                //OLD TESTFIELD("Code coursier");
                //KK_
                IF NOT "Déposé par le client" THEN
                //END
                IF ("Code coursier" = '') AND (Recouvreur ='') THEN
                  ERROR(Text005);

                IF "Remis Coursier" = TRUE THEN BEGIN
                VALIDATE("Date Remis Coursier",WORKDATE);
                 Selected := TRUE;
                  END
                ELSE BEGIN
                  VALIDATE("Date Remis Coursier",0D);
                 Selected := FALSE;
                  END;
            end;
        }
        field(23;"Date Remis Coursier";Date)
        {
        }
        field(24;Selected;Boolean)
        {
        }
        field(25;"No Sequence Document No.";Integer)
        {
        }
        field(26;"Centre ge gestion";Code[20])
        {
        }
        field(27;"No. Bon de commande";Code[35])
        {
        }
        field(28;"No. Contrat Leasing";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Pour le compte de";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(30;Recouvreur;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Shipping Agent".Code;

            trigger OnValidate();
            begin
                CLEAR(ShippingAgent);
                IF ShippingAgent.GET(Recouvreur) THEN
                   "Nom Recouvreur" := ShippingAgent.Name
                ELSE
                  "Nom Recouvreur" := '';
            end;
        }
        field(31;"Nom Recouvreur";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Déposé par le client";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50000;"Commission théorique";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50001;"Commission calculée";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50002;"% commission";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50003;"Commission à payer";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50004;"Commission payée";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50005;"Date proposition commission";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50006;"Date paiement commission";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50007;"Recouvreur entete";Code[20])
        {
            CalcFormula = Lookup("Recouvrement Entete"."Code coursier" WHERE (No. Bord. Recouvrement=FIELD(No. Bord. Recouvrement)));
            FieldClass = FlowField;
        }
        field(50008;"A imprimer";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No. Bord. Recouvrement","No. Ligne")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        // RecRecouvrementEntete.GET("No. Bord. Recouvrement");
        // RecRecouvrementEntete.TESTFIELD("Code coursier",'');
        // IF "Commission payée" THEN
        //  ERROR('Suppression interdite après paiement commission');
         IF RecSalesInvoiceHeader.GET("No. Facture") THEN
          BEGIN
            RecSalesInvoiceHeader."No. Bordereau" := '';
            RecSalesInvoiceHeader.MODIFY;
          END;

         IF ServiceInvoiceHeader.GET("No. Facture") THEN
          BEGIN
            ServiceInvoiceHeader."No. Bordereau Recouv." := '';
            ServiceInvoiceHeader.MODIFY;
          END;


         CLEAR(CustLedgerEntry);
         CustLedgerEntry.SETRANGE("Document No.","No. Facture");
         IF CustLedgerEntry.FINDFIRST THEN
          BEGIN
            CustLedgerEntry."No. Bordereau" := '';
            CustLedgerEntry.MODIFY;
          END;
    end;

    var
        RecRecouvrementEntete : Record "70000";
        Text002 : TextConst ENU='Creating Sales Invoice Lines\',FRA='Création de lignes facture vente\';
        Text003 : TextConst ENU='Inserted lines             #1######',FRA='Lignes insérées             #1######';
        NextLineNo : Integer;
        RecCustomer : Record "18";
        RecRecouvrementEnteteOpen : Record "70000";
        RecEmployee : Record "5200";
        RecSalesInvoiceHeader : Record "112";
        Text004 : Label 'Vous devez utiliser Remis coursier ou Reception décharge';
        ServiceInvoiceHeader : Record "5992";
        GLEntry : Record "17";
        CustLedgerEntry : Record "21";
        ShippingAgent : Record "291";
        Text005 : Label 'Vous devez renseigner code coursier ou recouvreur !';

    procedure FctCreateInvLines(var PRecSalesInvoiceHeader : Record "112");
    var
        Window : Dialog;
        LineCount : Integer;
        LRecRecouvrementLine : Record "70001";
        LRecCustLedgerEntry : Record "21";
    begin
        WITH PRecSalesInvoiceHeader DO BEGIN
          IF FINDSET THEN BEGIN
            LRecRecouvrementLine.LOCKTABLE;
            LRecRecouvrementLine.SETRANGE("No. Bord. Recouvrement",RecRecouvrementEntete."No. Bord. Recouvrement");
            Window.OPEN(Text002 + Text003);

           REPEAT
              LineCount := LineCount + 1;
              Window.UPDATE(1,LineCount);

              IF LRecRecouvrementLine.FIND('+') THEN
                 NextLineNo := LRecRecouvrementLine."No. Ligne" + 10000
                  ELSE
                      NextLineNo := 10000;

              LRecRecouvrementLine.INIT;
              LRecRecouvrementLine."No. Ligne" := NextLineNo;
              LRecRecouvrementLine."No. Bord. Recouvrement" := RecRecouvrementEntete."No. Bord. Recouvrement";
              NextLineNo := NextLineNo + 10000;
              LRecRecouvrementLine.VALIDATE("No. Facture",PRecSalesInvoiceHeader."No.");
              //LRecRecouvrementLine.VALIDATE("Mnt TTC Facture",PRecSalesInvoiceHeader."Amount Including VAT");
              CLEAR(GLEntry);
                  GLEntry.SETRANGE(GLEntry."Document No.",LRecRecouvrementLine."No. Facture");
                  GLEntry.SETFILTER(GLEntry."Debit Amount",'>%1',0);
                  IF GLEntry.FIND('-') THEN
                   LRecRecouvrementLine.VALIDATE("Mnt TTC Facture",GLEntry.Amount);
              LRecRecouvrementLine."Date Echéance":=PRecSalesInvoiceHeader."Due Date";
              LRecRecouvrementLine.VALIDATE("Code Client",PRecSalesInvoiceHeader."Bill-to Customer No.");
              LRecRecouvrementLine."No. Bon de commande" := PRecSalesInvoiceHeader."Your Reference";
              //LRecRecouvrementLine."Nom Client":=PRecSalesInvoiceHeader."Bill-to Name";
                LRecRecouvrementLine."Centre ge gestion"   := PRecSalesInvoiceHeader."Responsibility Center";
              LRecRecouvrementLine.VALIDATE("Date Facture",PRecSalesInvoiceHeader."Posting Date");
              LRecCustLedgerEntry.RESET;
              LRecCustLedgerEntry.SETRANGE("Document No." , PRecSalesInvoiceHeader."No.");
              IF LRecCustLedgerEntry.FINDFIRST THEN
                  LRecRecouvrementLine."No Sequence Document No." := LRecCustLedgerEntry."Entry No.";
              LRecRecouvrementLine.INSERT(TRUE);
              FctUpdatePostedSalesinvoiceHeader(PRecSalesInvoiceHeader,RecRecouvrementEntete."No. Bord. Recouvrement");
           UNTIL PRecSalesInvoiceHeader.NEXT = 0;
          END;
        END;
    end;

    procedure FctSetRecouvrement(PrecRecouvrementEntete : Record "70000");
    begin
        RecRecouvrementEntete.GET(PrecRecouvrementEntete."No. Bord. Recouvrement");
    end;

    local procedure FctUpdatePostedSalesinvoiceHeader(PRecSalesInvoiceHeader : Record "112";PCdeNoBordereau : Code[20]);
    var
        LRecSalesInvoiceHeader : Record "112";
    begin
        LRecSalesInvoiceHeader.GET(PRecSalesInvoiceHeader."No.");
        LRecSalesInvoiceHeader.Recouvrer := TRUE ;
        LRecSalesInvoiceHeader."No. Bordereau" := PCdeNoBordereau ;
        LRecSalesInvoiceHeader.MODIFY;
    end;

    local procedure FctTestStatusOpen();
    begin
        RecRecouvrementEnteteOpen.GET("No. Bord. Recouvrement");
        RecRecouvrementEnteteOpen.TESTFIELD(Status,RecRecouvrementEnteteOpen.Status::Open);
    end;

    procedure FctUpdateRecouverLine(PRecRecouvrementEntete : Record "70000";Pintchoise : Integer);
    var
        LRecRecouvrementLine : Record "70001";
    begin
        SETRANGE("No. Bord. Recouvrement",PRecRecouvrementEntete."No. Bord. Recouvrement");
        SETRANGE(Selected , TRUE);
        IF FINDSET THEN
          BEGIN
            REPEAT
              IF Pintchoise = 1 THEN
                BEGIN
                  TESTFIELD("Remis Coursier");
                  Etape := Etape :: "Remis coursier"
                END ELSE IF Pintchoise = 2 THEN
                  BEGIN
                    TESTFIELD("Remis Coursier");
                    TESTFIELD("Réception Décharge");
                    Etape := Etape :: "Reception décharge" ;
                  END;
              Selected := FALSE;
              MODIFY;
            UNTIL NEXT = 0 ;
          END ELSE ERROR(Text004);
    end;

    procedure FctCalcEcratDateReglEcheance(PRecRecouvrementEntete : Record "70000");
    begin
        SETRANGE("No. Bord. Recouvrement",PRecRecouvrementEntete."No. Bord. Recouvrement");
        IF FINDSET THEN
          REPEAT
            CALCFIELDS("Date reglement");
             IF  "Date reglement" <> 0D THEN
                "Ecart date Ech. Regl." := "Date reglement" -"Date Echéance";
             MODIFY
          UNTIL NEXT = 0 ;
    end;

    procedure FctTestEtapeBordereau(PRecRecouvrementEntete : Record "70000") : Boolean;
    begin
        SETRANGE("No. Bord. Recouvrement",PRecRecouvrementEntete."No. Bord. Recouvrement");
        IF FINDSET THEN
          REPEAT
            TESTFIELD("Code coursier");
            TESTFIELD("Remis Coursier");
            TESTFIELD("Réception Décharge");
            TESTFIELD(Etape,Etape::"Reception décharge");
            CALCFIELDS("Mnt Ouvert");
            IF "Mnt Ouvert" <> 0 THEN
               EXIT (FALSE);
          UNTIL NEXT = 0 ;
    end;

    procedure FctCreateServiceInvLines(var PRecServiceInvoiceHeader : Record "5992");
    var
        Window : Dialog;
        LineCount : Integer;
        LRecRecouvrementLine : Record "70001";
        LRecCustLedgerEntry : Record "21";
    begin
        WITH PRecServiceInvoiceHeader DO BEGIN
          IF FINDSET THEN BEGIN
            LRecRecouvrementLine.LOCKTABLE;
            LRecRecouvrementLine.SETRANGE("No. Bord. Recouvrement",RecRecouvrementEntete."No. Bord. Recouvrement");
            Window.OPEN(Text002 + Text003);

           REPEAT
              LineCount := LineCount + 1;
              Window.UPDATE(1,LineCount);

              IF LRecRecouvrementLine.FIND('+') THEN
                 NextLineNo := LRecRecouvrementLine."No. Ligne" + 10000
                  ELSE
                      NextLineNo := 10000;

              LRecRecouvrementLine.INIT;
              LRecRecouvrementLine."No. Ligne" := NextLineNo;
              LRecRecouvrementLine."No. Bord. Recouvrement" := RecRecouvrementEntete."No. Bord. Recouvrement";
              NextLineNo := NextLineNo + 10000;
              LRecRecouvrementLine.VALIDATE("No. Facture",PRecServiceInvoiceHeader."No.");
              //LRecRecouvrementLine.VALIDATE("Mnt TTC Facture",PRecServiceInvoiceHeader."Amount Including VAT");

                  CLEAR(GLEntry);
                  GLEntry.SETRANGE(GLEntry."Document No.",LRecRecouvrementLine."No. Facture");
                  GLEntry.SETFILTER(GLEntry."Debit Amount",'>%1',0);
                  IF GLEntry.FIND('-') THEN
                   LRecRecouvrementLine.VALIDATE("Mnt TTC Facture",GLEntry.Amount);


              LRecRecouvrementLine."Date Echéance":=PRecServiceInvoiceHeader."Due Date";
              LRecRecouvrementLine.VALIDATE("Code Client",PRecServiceInvoiceHeader."Bill-to Customer No.");
              LRecRecouvrementLine."Centre ge gestion"   := PRecServiceInvoiceHeader."Responsibility Center";
              LRecRecouvrementLine."No. Bon de commande"   := PRecServiceInvoiceHeader."Your Reference";
              //LRecRecouvrementLine."Nom Client":=PRecSalesInvoiceHeader."Bill-to Name";
              LRecRecouvrementLine.VALIDATE("Date Facture",PRecServiceInvoiceHeader."Posting Date");
              LRecRecouvrementLine."Pour le compte de":=PRecServiceInvoiceHeader.Name;
              LRecCustLedgerEntry.RESET;
              LRecCustLedgerEntry.SETRANGE("Document No." , PRecServiceInvoiceHeader."No.");
              IF LRecCustLedgerEntry.FINDFIRST THEN
                  LRecRecouvrementLine."No Sequence Document No." := LRecCustLedgerEntry."Entry No.";
              LRecRecouvrementLine.INSERT(TRUE);
              FctUpdatePostedServiceinvoiceHeader(PRecServiceInvoiceHeader,RecRecouvrementEntete."No. Bord. Recouvrement");

           UNTIL PRecServiceInvoiceHeader.NEXT = 0;
          END;
        END;
    end;

    local procedure FctUpdatePostedServiceinvoiceHeader(PRecServiceInvoiceHeader : Record "5992";PCdeNoBordereau : Code[20]);
    var
        LRecserviceInvoiceHeader : Record "5992";
    begin
        LRecserviceInvoiceHeader.GET(PRecServiceInvoiceHeader."No.");
        //LRecserviceInvoiceHeader.Recouvrer := TRUE ;
        LRecserviceInvoiceHeader."No. Bordereau Recouv." := PCdeNoBordereau ;
        LRecserviceInvoiceHeader.MODIFY;
    end;

    procedure FctCreateInvLinesCustEntry(var PRecCustLedgerEntry : Record "21");
    var
        Window : Dialog;
        LineCount : Integer;
        LRecRecouvrementLine : Record "70001";
        LRecCustLedgerEntry : Record "21";
    begin
        WITH PRecCustLedgerEntry DO BEGIN
          IF FINDSET THEN BEGIN
            LRecRecouvrementLine.LOCKTABLE;
            LRecRecouvrementLine.SETRANGE("No. Bord. Recouvrement",RecRecouvrementEntete."No. Bord. Recouvrement");
            Window.OPEN(Text002 + Text003);

           REPEAT
              LineCount := LineCount + 1;
              Window.UPDATE(1,LineCount);

              IF LRecRecouvrementLine.FIND('+') THEN
                 NextLineNo := LRecRecouvrementLine."No. Ligne" + 10000
                  ELSE
                      NextLineNo := 10000;

              LRecRecouvrementLine.INIT;
              LRecRecouvrementLine."No. Ligne" := NextLineNo;
              LRecRecouvrementLine."No. Bord. Recouvrement" := RecRecouvrementEntete."No. Bord. Recouvrement";
              NextLineNo := NextLineNo + 10000;
              LRecRecouvrementLine.VALIDATE("No. Facture",PRecCustLedgerEntry."Document No.");
              //LRecRecouvrementLine.VALIDATE("Mnt TTC Facture",PRecSalesInvoiceHeader."Amount Including VAT");
              CLEAR(GLEntry);
                  GLEntry.SETRANGE(GLEntry."Document No.",LRecRecouvrementLine."No. Facture");
                  GLEntry.SETFILTER(GLEntry."Debit Amount",'>%1',0);
                  IF GLEntry.FIND('-') THEN
                   LRecRecouvrementLine.VALIDATE("Mnt TTC Facture",GLEntry.Amount);
              LRecRecouvrementLine."Date Echéance":=PRecCustLedgerEntry."Due Date";
              LRecRecouvrementLine.VALIDATE("Code Client",PRecCustLedgerEntry."Customer No.");
              LRecRecouvrementLine."No. Bon de commande" := PRecCustLedgerEntry."External Document No.";
              //LRecRecouvrementLine."Nom Client":=PRecSalesInvoiceHeader."Bill-to Name";
                LRecRecouvrementLine."Centre ge gestion"   := PRecCustLedgerEntry."Responsibility Center";
              LRecRecouvrementLine.VALIDATE("Date Facture",PRecCustLedgerEntry."Posting Date");
              LRecRecouvrementLine."No Sequence Document No." := PRecCustLedgerEntry."Entry No.";
              LRecRecouvrementLine.INSERT(TRUE);
              FctUpdatePostedCustEntryHeader(PRecCustLedgerEntry,RecRecouvrementEntete."No. Bord. Recouvrement");

           UNTIL PRecCustLedgerEntry.NEXT = 0;
          END;
        END;
    end;

    local procedure FctUpdatePostedCustEntryHeader(PRecCustLedEntry : Record "21";PCdeNoBordereau : Code[20]);
    var
        LRecCustLedEntry : Record "21";
    begin
        LRecCustLedEntry.SETRANGE("Document No.",PRecCustLedEntry."Document No.");
        IF LRecCustLedEntry.FINDFIRST THEN
          BEGIN
        LRecCustLedEntry."Existe Recouvrement" := TRUE ;
        LRecCustLedEntry."No. Bordereau" := PCdeNoBordereau ;
        LRecCustLedEntry.MODIFY;
        END;
    end;

    local procedure GetNextLineNo() : Integer;
    var
        RecouvrementLineL : Record "70001";
    begin
        RecouvrementLineL.RESET;
        RecouvrementLineL.SETRANGE("No. Bord. Recouvrement","No. Bord. Recouvrement");
        IF RecouvrementLineL.FINDLAST THEN
          EXIT(RecouvrementLineL."No. Ligne"+10000);
        EXIT(10000);
    end;
}

