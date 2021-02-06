table 70022 "Ligne bordereau PVN"
{
    // version MAZDA13,MAZDA13.1,MAZDA13.2,MAZDA301.1,MAZDA13.3


    fields
    {
        field(1;"N° Bordereau";Code[20])
        {
        }
        field(2;"N° Ligne";Integer)
        {
            AutoIncrement = true;
        }
        field(3;VIN;Code[20])
        {
            Editable = false;

            trigger OnValidate();
            var
                RecLigneBordPVN : Record "70022";
            begin
                RecLigneBordPVN.RESET;
                RecLigneBordPVN.SETRANGE(VIN,VIN);
                RecLigneBordPVN.SETFILTER("N° Bordereau",'<>%1',"N° Bordereau");
                RecLigneBordPVN.SETFILTER("N° Ligne",'<>%1',"N° Ligne");
                IF RecLigneBordPVN.FINDFIRST THEN
                  ERROR(TXT50000,RecLigneBordPVN."N° Bordereau");
            end;
        }
        field(4;Statut;Option)
        {
            Editable = false;
            OptionCaption = 'Ouvert,Encours de préparation,Terminé';
            OptionMembers = Ouvert,"Encours de préparation","Terminé";

            trigger OnLookup();
            var
                Rec336Temp : Record "336" temporary;
            begin
            end;
        }
        field(5;"Modèle Véhicule";Code[20])
        {
            TableRelation = Item;
        }
        field(6;"Code Variant";Code[20])
        {
            TableRelation = "Item Variant".Code WHERE (Item No.=FIELD(Modèle Véhicule));
        }
        field(7;"N° Matriculation";Code[20])
        {

            trigger OnValidate();
            var
                RecServiceItem : Record "5940";
            begin
                //SM 24/04/2014
                RecServiceItem.RESET;
                RecServiceItem.SETRANGE("Serial No.",VIN);
                IF RecServiceItem.FINDFIRST THEN BEGIN
                  RecServiceItem.Matricule := "N° Matriculation";
                  RecServiceItem.MODIFY;
                END ELSE MESSAGE(TXT50002,VIN);
                //END SM
            end;
        }
        field(8;"Date Mise en Circulation";Date)
        {
            Description = 'SM MAZDA301.1';

            trigger OnValidate();
            var
                RecServiceItem : Record "5940";
            begin
                //SM MAZDA301.1
                RecServiceItem.RESET;
                RecServiceItem.SETRANGE("Serial No.",VIN);
                IF RecServiceItem.FINDFIRST THEN BEGIN
                  RecServiceItem."Date Mise en Circulation":= "Date Mise en Circulation";
                  RecServiceItem.MODIFY;
                  "Date Reception" := CURRENTDATETIME;
                END ELSE MESSAGE(TXT50002,VIN);
                //END SM

                //SM MAZDA856
                TESTFIELD("N° Matriculation");
                VALIDATE(Statut,Statut::"4");
                //END SM
            end;
        }
        field(9;"Date Reception";DateTime)
        {
            Description = 'SM MAZDA301.1';
            Editable = false;
        }
        field(50000;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='N° article';
            Description = 'SM MAZDA13';
            Editable = false;
            TableRelation = Item;
        }
        field(50001;"Location Code";Code[10])
        {
            CaptionML = ENU='Location Code',
                        FRA='Code magasin';
            Description = 'SM MAZDA13';
            Editable = false;
            TableRelation = Location;
        }
        field(50002;"Source Type";Integer)
        {
            CaptionML = ENU='Source Type',
                        FRA='Type origine';
            Description = 'SM MAZDA13';
            Editable = false;
        }
        field(50003;"Source Subtype From 337";Option)
        {
            CaptionML = ENU='Source Subtype',
                        FRA='Sous-type origine';
            Description = 'SM MAZDA13';
            Editable = false;
            OptionCaptionML = ENU='0,1,2,3,4,5,6,7,8,9,10',
                              FRA='0,1,2,3,4,5,6,7,8,9,10';
            OptionMembers = "0","1","2","3","4","5","6","7","8","9","10";
        }
        field(50004;"Source ID";Code[20])
        {
            CaptionML = ENU='Source ID',
                        FRA='ID origine';
            Description = 'SM MAZDA13';
            Editable = false;
        }
        field(50005;"Item Ledger Entry No.";Integer)
        {
            CaptionML = ENU='Item Ledger Entry No.',
                        FRA='N° écriture comptable article';
            Description = 'SM MAZDA13';
            Editable = false;
            TableRelation = "Item Ledger Entry";
        }
        field(50006;"Created By";Code[50])
        {
            CaptionML = ENU='Created By',
                        FRA='Créé par';
            Description = 'SM MAZDA13';
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup();
            var
                UserMgt : Codeunit "418";
            begin
            end;
        }
        field(50007;"Changed By";Code[50])
        {
            CaptionML = ENU='Changed By',
                        FRA='Modifié par';
            Description = 'SM MAZDA13';
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup();
            var
                UserMgt : Codeunit "418";
            begin
            end;
        }
        field(50008;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code variante';
            Description = 'SM MAZDA13';
            Editable = false;
            TableRelation = "Item Variant".Code WHERE (Item No.=FIELD(Item No.));
        }
        field(50009;"Source Ref. No.";Integer)
        {
            CaptionML = ENU='Source Ref. No.',
                        FRA='N° réf. origine';
            Description = 'SM MAZDA13';
            Editable = false;
        }
        field(50010;"Sell-to Customer No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N° donneur d''ordre';
            Description = 'SM MAZDA13';
            Editable = false;
        }
        field(50011;Name;Text[50])
        {
            CaptionML = ENU='Name',
                        FRA='Nom donneur d''ordre';
            Description = 'SM MAZDA13';
            Editable = false;
        }
        field(50012;Status;Option)
        {
            CaptionML = ENU='Status',
                        FRA='Statut';
            Description = 'SM MAZDA13';
            Editable = false;
            OptionCaptionML = ENU='Open,Released,Pending Approval,Pending Prepayment',
                              FRA='Ouvert,Lancé,Approbation suspendue,Acompte suspendu';
            OptionMembers = Open,Released,"Pending Approval","Pending Prepayment";
        }
        field(50013;"Bill-to Customer No.";Code[20])
        {
            CaptionML = ENU='Bill-to Customer No.',
                        FRA='N° client facturé';
            Description = 'SM MAZDA13';
            Editable = false;
            NotBlank = true;
            TableRelation = Customer;
        }
        field(50014;"Bill-to Name";Text[50])
        {
            CaptionML = ENU='Bill-to Name',
                        FRA='Nom client facturé';
            Description = 'SM MAZDA13';
            Editable = false;
        }
        field(50015;"Type Paiement";Code[10])
        {
            Caption = 'Type Paiement';
            Description = 'SM MAZDA13';
            Editable = false;
            TableRelation = "Type Paiement";

            trigger OnValidate();
            var
                RecSalesSetup : Record "311";
                RecSalesLines : Record "37";
            begin
            end;
        }
        field(50016;"Frais immatriculation";Decimal)
        {
            Description = 'SM MAZDA13';
        }
        field(50017;"Frais Redevence Comp. Véhicule";Decimal)
        {
            Description = 'SM MAZDA13';
        }
        field(50018;"Frais TME";Decimal)
        {
            Description = 'SM MAZDA13.1';
        }
        field(50021;"Payment No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N° Bordereau de Paiement';
            Description = 'SM MAZDA13.1';
            TableRelation = "Payment Header";
        }
        field(50022;"Payment Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne Bordereau Paiement';
            Description = 'SM MAZDA13.1';
        }
        field(50023;"Payment Class";Text[30])
        {
            CaptionML = ENU='Payment Class',
                        FRA='Type de règlement';
            Description = 'SM MAZDA13.1';
            TableRelation = "Payment Class";
        }
        field(50024;"Payment Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° document Paiement';
            Description = 'SM MAZDA13.1';
        }
        field(50025;"Payment External Document No.";Code[35])
        {
            CaptionML = ENU='External Document No.',
                        FRA='N° doc. externe Paiement';
            Description = 'SM MAZDA13.1';
        }
        field(50026;"Account Type";Option)
        {
            CaptionML = ENU='Account Type',
                        FRA='Type compte';
            Description = 'SM MAZDA13.2';
            OptionCaptionML = ENU='G/L Account,Customer,Vendor,Bank Account,Fixed Asset',
                              FRA='Général,Client,Fournisseur,Banque,Immobilisation';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset";
        }
        field(50027;"Account No.";Code[20])
        {
            CaptionML = ENU='Account No.',
                        FRA='N° compte';
            Description = 'SM MAZDA13.2';
            TableRelation = IF (Account Type=CONST(G/L Account)) "G/L Account"
                            ELSE IF (Account Type=CONST(Customer)) Customer
                            ELSE IF (Account Type=CONST(Vendor)) Vendor
                            ELSE IF (Account Type=CONST(Bank Account)) "Bank Account"
                            ELSE IF (Account Type=CONST(Fixed Asset)) "Fixed Asset";
        }
        field(50028;"Bank Branch No.";Text[20])
        {
            CaptionML = ENU='Bank Branch No.',
                        FRA='Code établissement';
            Description = 'SM MAZDA13.2';
        }
        field(50029;"Bank Account No.";Text[30])
        {
            CaptionML = ENU='Bank Account No.',
                        FRA='N° compte bancaire';
            Description = 'SM MAZDA13.2';
        }
        field(50030;"Agency Code";Text[20])
        {
            CaptionML = ENU='Agency Code',
                        FRA='Code agence';
            Description = 'SM MAZDA13.2';
        }
        field(50031;"Bank Name";Text[50])
        {
            CaptionML = ENU='Bank Name',
                        FRA='Nom de la banque';
            Description = 'SM MAZDA13.2';
        }
        field(50032;"Désignation Modèle";Text[100])
        {
            CalcFormula = Lookup(Item.Description WHERE (No.=FIELD(Modèle Véhicule)));
            Description = 'SM MAZDA13.2';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50033;"Responsibility Center";Code[10])
        {
            Description = 'RA 13.3';
        }
        field(50034;"Date Comptable";Date)
        {
            CalcFormula = Lookup("Payment Header"."Posting Date" WHERE (No.=FIELD(Payment No.)));
            Description = 'SM';
            FieldClass = FlowField;
        }
        field(50035;"Date Lettrage";DateTime)
        {
            Description = 'SM MAZDA13.3';
        }
        field(50036;"Payment Status";Option)
        {
            Caption = 'Statut Paiemant';
            Description = 'SM MAZDA856';
            Editable = false;
            OptionCaption = 'Non Soldé,Soldé,Soldé Encaissé,Soldé Certifié';
            OptionMembers = "Non Soldé","Soldé","Soldé Encaissé","Soldé Certifié";
        }
        field(50037;"Date Heure Depôt";DateTime)
        {
            Description = 'SM MAZDA856';
        }
        field(50038;"Date Bordereau CG";Date)
        {
            CalcFormula = Lookup("Carte Grise Entete"."Date Création" WHERE (N° Bordereau=FIELD(N° Bordereau)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50039;"Heure Bordereau CG";Time)
        {
            CalcFormula = Lookup("Carte Grise Entete"."Time Création" WHERE (N° Bordereau=FIELD(N° Bordereau)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50040;"Date Lancement Bordereau";Date)
        {
            CalcFormula = Lookup("Carte Grise Entete"."Date Emission" WHERE (N° Bordereau=FIELD(N° Bordereau)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50041;"Heure Lancement Bordereau";Time)
        {
            CalcFormula = Lookup("Carte Grise Entete"."Time Emission" WHERE (N° Bordereau=FIELD(N° Bordereau)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50042;"Autorisé Envoie CG";Boolean)
        {
            Description = 'KK autorisation envoie ligne carte grise';

            trigger OnValidate();
            begin
                // ADD KK 11042106
                RecUserSetup.GET(USERID);
                IF NOT RecUserSetup."Autorisé Envoie CG" THEN
                  ERROR(TXT50003);

                IF "Autorisé Envoie CG" THEN
                  "Autorisé par" := USERID;
            end;
        }
        field(50043;"Autorisé par";Text[100])
        {
            Description = 'KK autorisation envoie ligne carte grise';
            Editable = false;
        }
        field(50044;"Date borderea PVN";Date)
        {
            CalcFormula = Lookup("Bordereau PVN"."Date Création" WHERE (N° Bordereau=FIELD(N° Bordereau)));
            FieldClass = FlowField;
        }
        field(50045;"Date réception carte grise";DateTime)
        {
            CalcFormula = Lookup("Carte Grise Ligne"."Date Reception" WHERE (VIN=FIELD(VIN)));
            FieldClass = FlowField;
        }
        field(50046;"Date préparation";DateTime)
        {
            CalcFormula = Lookup("Preparation VN"."Date acceptation PVN" WHERE (VIN=FIELD(VIN)));
            FieldClass = FlowField;
        }
        field(50047;"Date Livraison";DateTime)
        {
            CalcFormula = Lookup("Service Item"."Date Livraison" WHERE (Serial No.=FIELD(VIN)));
            FieldClass = FlowField;
        }
        field(50048;"Date RDV";DateTime)
        {
            CalcFormula = Lookup("Preparation VN"."Date rendez vous" WHERE (VIN=FIELD(VIN)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"N° Bordereau","N° Ligne")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        IF Statut <> 0 THEN
          ERROR(TXT50001);

        //ADD KK Update service item PVN Statut
        ServiceItem.RESET;
        ServiceItem.SETRANGE("Serial No.",VIN);
        ServiceItem.FINDFIRST;
        ServiceItem."Statut PVN":=ServiceItem."Statut PVN"::" ";
        ServiceItem."No. Bord. PVN":='';
        ServiceItem.MODIFY;
        //END KK
    end;

    trigger OnInsert();
    var
        LRecServiceItem : Record "5940";
        LRecSalesReceivablesSetup : Record "311";
    begin
        //SM 280817 Compagne
        LRecSalesReceivablesSetup.GET;
        /*LRecServiceItem.RESET;
        LRecServiceItem.SETRANGE("Serial No.",VIN);
        IF LRecServiceItem.FINDFIRST THEN BEGIN
          LRecServiceItem.CALCFIELDS("Compagne Bloquant");
          IF LRecServiceItem."Compagne Bloquant" THEN
            ERROR('Le VIN %1 est en compagne SAV !',VIN);
        END;*/
        ListVINCompagne.RESET;
        ListVINCompagne.SETRANGE(VIN,VIN);
        ListVINCompagne.SETRANGE("Compagne Bloquant",TRUE);
        ListVINCompagne.SETRANGE(Traiter,FALSE);
        IF ListVINCompagne.FINDFIRST THEN
            ERROR('Le VIN %1 est en campagne SAV !',VIN);
        //END SM
        //KT 310717
        LRecSalesReceivablesSetup.GET;
        LRecServiceItem.RESET;
        LRecServiceItem.SETRANGE("Serial No.",VIN);
        IF LRecServiceItem.FINDFIRST THEN BEGIN
          //TMPLRecServiceItem.TESTFIELD("Date Recep Dossier");
          //KT 180817
          LRecServiceItem.CALCFIELDS(Avarie);
          //MESSAGE(FORMAT(LRecServiceItem.Avarie));
          IF LRecServiceItem.Avarie THEN
            IF LRecSalesReceivablesSetup."PVN sur VIN avarie"=LRecSalesReceivablesSetup."PVN sur VIN avarie"::Bloquer THEN
              ERROR('VIN constaté avarie')
            ELSE IF LRecSalesReceivablesSetup."PVN sur VIN avarie"=LRecSalesReceivablesSetup."PVN sur VIN avarie"::Alerter THEN
              MESSAGE('Alerte: VIN constaté avarie');
          //END 180817
        
          //END 180817
         // LRecServiceItem.TESTFIELD("Reception Dossier",TRUE);
         //SM 060917
          LRecServiceItem.TESTFIELD("Dossier Validé",TRUE);
          //END SM
        END;
        //END KT

    end;

    var
        ItemTrackingDataCollection : Codeunit "6501";
        TXT50000 : Label 'Existe dans Bordereau %1';
        TXT50001 : Label 'Status doit être encours.';
        TXT50002 : Label 'Il n''existe pas d''article de service pour le VIN %1.';
        RecUserSetup : Record "91";
        TXT50003 : Label 'Vous n''avez pas le droit, veuillez contacter votre administrateur !';
        ServiceItem : Record "5940";
        ListVINCompagne : Record "50076";

    procedure UpdateCustomerPaymentStatus();
    var
        RecPaymentHeader : Record "10865";
        RecPaymentLine : Record "10866";
        RecCustLedgerEntry : Record "21";
        DtldCustLedgEntry1 : Record "379";
        RecGCustLE : Record "21";
        DtldCustLedgEntry2 : Record "379";
        CHQCertifie : Boolean;
        CHQEncaisse : Boolean;
        CHQNonEncaisse : Boolean;
        RecSalesInvoiceHeader : Record "112";
        RecSalesReceivablesSetup : Record "311";
    begin
        //SM MAZDA856
        RecSalesReceivablesSetup.GET;
        //TO VIREMENT    ////////////////////////////////////////////////////////

        CHQCertifie    := FALSE;
        CHQEncaisse    := FALSE;
        CHQNonEncaisse := FALSE;


        IF ("Type Paiement" <> 'LEAS')  AND ("Type Paiement" <> 'AO') AND ("Type Paiement" <> 'FRS')  THEN BEGIN  //AUTRE QUE LEASING

          RecCustLedgerEntry.RESET;
          RecCustLedgerEntry.SETCURRENTKEY("Document No.");
          RecCustLedgerEntry.SETRANGE("Document No.","Source ID");
          IF RecCustLedgerEntry.FINDFIRST THEN BEGIN  //FACTURE VENTE ENREGISTREE
            RecSalesInvoiceHeader.GET(RecCustLedgerEntry."Document No.");
            RecCustLedgerEntry.CALCFIELDS(Amount,"Remaining Amount");
            IF (("Type Paiement" = 'BANK') OR ("Type Paiement" = 'CAISS')) AND (((RecCustLedgerEntry.Amount - RecCustLedgerEntry."Remaining Amount") =0)
             OR ((RecCustLedgerEntry.Amount - RecCustLedgerEntry."Remaining Amount") > (RecSalesInvoiceHeader."Engagement Lettre Amount"
             -RecSalesReceivablesSetup."Marge Contrôle Carte Grise"))) THEN BEGIN //NON LETTRE
              VALIDATE("Payment Status","Payment Status"::"Non Soldé");
              EXIT;
            END;
            //SM MAZDA1011
            IF (("Type Paiement" = 'BANK') OR ("Type Paiement" = 'CAISS')) AND (((RecCustLedgerEntry.Amount) < (RecSalesInvoiceHeader."Engagement Lettre Amount"
             +RecSalesReceivablesSetup."Marge Contrôle Carte Grise"))) THEN BEGIN //NON LETTRE
              VALIDATE("Payment Status","Payment Status"::Soldé);
              EXIT;
            END;
            //END MAZDA1011

            IF (("Type Paiement" <> 'BANK') AND ("Type Paiement" <> 'CAISS')) AND ((RecCustLedgerEntry."Remaining Amount"-RecSalesReceivablesSetup."Marge Contrôle Carte Grise") > 0) THEN BEGIN//RecCustLedgerEntry.Open THEN     //NON LETTRE
              VALIDATE("Payment Status","Payment Status"::"Non Soldé");
              EXIT;
            END;
            //LETTRE

              //VALIDATE("Payment Status","Payment Status"::"Soldé");
              //****************************
              DtldCustLedgEntry1.SETCURRENTKEY("Cust. Ledger Entry No.");
              DtldCustLedgEntry1.SETRANGE("Cust. Ledger Entry No.",RecCustLedgerEntry."Entry No.");
              DtldCustLedgEntry1.SETRANGE(Unapplied,FALSE);
              IF DtldCustLedgEntry1.FIND('-') THEN
                REPEAT
                  IF DtldCustLedgEntry1."Cust. Ledger Entry No." =
                     DtldCustLedgEntry1."Applied Cust. Ledger Entry No."
                  THEN BEGIN
                    DtldCustLedgEntry2.INIT;
                    DtldCustLedgEntry2.SETCURRENTKEY("Applied Cust. Ledger Entry No.","Entry Type");
                    DtldCustLedgEntry2.SETRANGE(
                      "Applied Cust. Ledger Entry No.",DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                    DtldCustLedgEntry2.SETRANGE("Entry Type",DtldCustLedgEntry2."Entry Type"::Application);
                    DtldCustLedgEntry2.SETRANGE(Unapplied,FALSE);
                    IF DtldCustLedgEntry2.FIND('-') THEN
                      REPEAT
                        IF DtldCustLedgEntry2."Cust. Ledger Entry No." <>
                           DtldCustLedgEntry2."Applied Cust. Ledger Entry No."
                        THEN BEGIN
                          RecGCustLE.SETCURRENTKEY("Entry No.");
                          RecGCustLE.SETRANGE("Entry No.",DtldCustLedgEntry2."Cust. Ledger Entry No.");
                          IF RecGCustLE.FIND('-') THEN
                            BEGIN
                            //TODO
                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                               AND (RecPaymentHeader.Certified) THEN BEGIN
                                CHQCertifie := TRUE;
                              END;

                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                               AND (NOT RecPaymentHeader.Certified)
                               //OLD AND (RecPaymentHeader."Status No." = 95000) THEN BEGIN
                               AND (CheckLastPaymentStatus(RecPaymentHeader,"Sell-to Customer No.",95000)) THEN BEGIN
                                 CHQEncaisse := TRUE;
                              END;

                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                               AND (NOT RecPaymentHeader.Certified)
                               //OLD AND (RecPaymentHeader."Status No." <> 95000) THEN BEGIN
                               AND NOT((CheckLastPaymentStatus(RecPaymentHeader,"Sell-to Customer No.",95000))) THEN BEGIN
                                CHQNonEncaisse := TRUE;
                              END;
                              //SM ADD 300316
                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-VIR')
                               AND (CheckLastPaymentStatus(RecPaymentHeader,"Sell-to Customer No.",80000)) THEN BEGIN
                                CHQEncaisse := TRUE;
                              END;

                              //END SM

                              IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                               AND (RecPaymentHeader."Payment Class" = 'ENC-ESP') THEN BEGIN
                                CHQEncaisse := TRUE;
                              END;

                           END;
                            //END TODO
                        END;
                      UNTIL DtldCustLedgEntry2.NEXT = 0;
                  END ELSE BEGIN
                    RecGCustLE.SETCURRENTKEY("Entry No.");
                    RecGCustLE.SETRANGE("Entry No.",DtldCustLedgEntry1."Applied Cust. Ledger Entry No.");
                    IF RecGCustLE.FIND('-') THEN
                      //TODO
                      BEGIN
                      //TODO
                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                         AND (RecPaymentHeader.Certified) THEN BEGIN
                          CHQCertifie := TRUE;
                        END;

                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                         AND (NOT RecPaymentHeader.Certified)
                         // OLD AND (RecPaymentHeader."Status No." = 95000) THEN BEGIN
                         AND (CheckLastPaymentStatus(RecPaymentHeader,"Sell-to Customer No.",95000)) THEN BEGIN
                           CHQEncaisse := TRUE;
                        END;

                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-CHQ')
                         AND (NOT RecPaymentHeader.Certified)
                         // OLD AND (RecPaymentHeader."Status No." <> 95000) THEN BEGIN
                         AND NOT((CheckLastPaymentStatus(RecPaymentHeader,"Sell-to Customer No.",95000))) THEN BEGIN
                           CHQNonEncaisse := TRUE;
                        END;
                        //SM ADD 30032016
                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-VIR')
                         AND (CheckLastPaymentStatus(RecPaymentHeader,"Sell-to Customer No.",80000)) THEN BEGIN
                           CHQEncaisse := TRUE;
                        END;

                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-RS') THEN BEGIN
                           CHQEncaisse := TRUE;

                        END;

                        //END SM

                        IF RecPaymentHeader.GET(RecGCustLE."Document No.")
                         AND (RecPaymentHeader."Payment Class" = 'ENC-ESP') THEN BEGIN
                          CHQEncaisse := TRUE;
                        END;
                      //END TODO
                      END;
                      //END TODO
                   END;
                UNTIL DtldCustLedgEntry1.NEXT = 0;
              //**************************
            END;
             //TODO
             // CHQCertifie CHQNonEncaisse CHQEncaisse
             IF CHQNonEncaisse THEN BEGIN
               VALIDATE("Payment Status","Payment Status"::Soldé)
             END ELSE BEGIN
               IF (NOT CHQEncaisse) AND (CHQCertifie) THEN BEGIN
                 VALIDATE("Payment Status","Payment Status"::"Soldé Certifié")
               END ELSE BEGIN
                 VALIDATE("Payment Status","Payment Status"::"Soldé Encaissé")
               END;
             END;
             //END TODO
        END ELSE BEGIN //LEASING SANS CONTROLE
          VALIDATE("Payment Status","Payment Status"::"Soldé Encaissé")
        END;
    end;

    procedure CheckLastPaymentStatus(var RecPaymentHeader : Record "10865";var CustomerNo : Code[20];StatutNo : Integer) : Boolean;
    var
        RecPaymentLine : Record "10866";
        RecPaymentLine2 : Record "10866";
        PaymentCheked : Boolean;
    begin
        PaymentCheked := FALSE;
        RecPaymentLine.RESET;
        RecPaymentLine.SETRANGE("No.",RecPaymentHeader."No.");
        RecPaymentLine.SETRANGE("Account Type",RecPaymentLine."Account Type"::Customer);
        RecPaymentLine.SETRANGE("Account No.",CustomerNo);
        IF RecPaymentLine.FINDFIRST THEN
          REPEAT
            RecPaymentLine2.GET(RecPaymentLine."No.",RecPaymentLine."Line No.");
            WHILE RecPaymentLine2."Copied To No." <> '' DO BEGIN
              RecPaymentLine2.GET(RecPaymentLine2."Copied To No.",RecPaymentLine2."Copied To Line");
            END;
            IF RecPaymentLine2."Status No." = StatutNo THEN BEGIN
              PaymentCheked := TRUE;
            END ELSE BEGIN
              EXIT(FALSE);
            END;
          UNTIL RecPaymentLine.NEXT=0;
        EXIT(PaymentCheked);
    end;
}

