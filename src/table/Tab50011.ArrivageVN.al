table 50011 "Arrivage VN"
{
    // version ETRANGER

    DrillDownPageID = 50059;
    LookupPageID = 50059;

    fields
    {
        field(1; "No. Titre D'importation"; Code[20])
        {
        }
        field(2; "Date Titre D'importation"; Date)
        {

            trigger OnValidate();
            begin
                IF "Delai Reglement" <> '' THEN BEGIN
                    PaymentTerms.GET("Delai Reglement");
                    "Echéance Prox." := CALCDATE(PaymentTerms."Due Date Calculation", "Date Titre D'importation");
                END;
            end;
        }
        field(3; "No. Fournisseur"; Code[10])
        {
            TableRelation = Vendor;

            trigger OnValidate();
            begin
                Vendor.GET("No. Fournisseur");
                "Nom Fournisseur" := Vendor.Name;
                "Adresse Fournisseur" := Vendor.Address + ' ' + Vendor."Address 2";
                Pays := Vendor."Country/Region Code";
                company.FIND('-');
                "Code en Douane" := company."Code en douane";
                //ZMN MIG "Compte bancaire" := Vendor."Preferred Bank Account";
                "Mode Reglement" := Vendor."Payment Method Code";
                Devise := Vendor."Currency Code";
                VALIDATE("Delai Reglement", Vendor."Payment Terms Code");
            end;
        }
        field(4; "Nom Fournisseur"; Code[50])
        {
        }
        field(5; "Adresse Fournisseur"; Code[50])
        {
        }
        field(6; "N° Facture Proforma"; Code[20])
        {
        }
        field(7; "Date Facrure Proforma"; Date)
        {
        }
        field(8; "Modal. Liv"; Option)
        {
            OptionCaption = '" ,A l Usine,FOB,CFR,CIF,CF,EX WORKS"';
            OptionMembers = " ","A l Usine",FOB,CFR,CIF,CF,"EX WORKS";
        }
        field(9; Banque; Code[10])
        {
            TableRelation = "Bank Account";

            trigger OnValidate();
            begin
                BankAccount.GET(Banque);
                "Nom de la banque" := BankAccount.Name;
            end;
        }
        field(10; Devise; Code[10])
        {
            TableRelation = Currency.Code;
        }
        field(11; "Cours douane"; Decimal)
        {
            DecimalPlaces = 0 : 15;

            trigger OnValidate();
            begin
                IF NOT CONFIRM('Voulez vous mettre à jour les lines  ?', FALSE) THEN
                    EXIT
                ELSE
                    FctUpdateLine;
            end;
        }
        field(12; "Mode Reglement"; Code[10])
        {
            TableRelation = "Payment Method".Code;
        }
        field(13; "Delai Reglement"; Code[10])
        {
            TableRelation = "Payment Terms".Code;

            trigger OnValidate();
            begin
                PaymentTerms.GET("Delai Reglement");
                "Echéance Prox." := CALCDATE(PaymentTerms."Due Date Calculation", "Date Titre D'importation");
            end;
        }
        field(14; "N° Domiciliation"; Code[30])
        {
        }
        field(15; "Date Domiciliation"; Date)
        {
        }
        field(16; Pays; Code[10])
        {
            TableRelation = Country/Region.Code;
        }
        field(17;"Nom Transitaire";Code[50])
        {
        }
        field(18;"No. Transitaire";Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate();
            begin
                Vendor.GET("No. Transitaire");
                "Nom Transitaire" := Vendor.Name;
            end;
        }
        field(19;"Code en Douane";Code[20])
        {
        }
        field(20;"Echéance Prox.";Date)
        {
        }
        field(21;"No. SWIFT";Code[20])
        {
        }
        field(22;"Date SWIFT";Date)
        {
        }
        field(23;"FOB DEV.";Decimal)
        {
        }
        field(24;"No. Bon de Commande";Code[20])
        {
            TableRelation = "Purchase Header".No. WHERE (Document Type=CONST(Order),
                                                         Buy-from Vendor No.=FIELD(No. Fournisseur));
            ValidateTableRelation = true;

            trigger OnValidate();
            begin

                CLEAR(PurchOrder);

                PurchOrder.SETRANGE("Document Type",1);
                PurchOrder.SETRANGE("No." ,"No. Bon de Commande");
                IF PurchOrder.FIND('-')  THEN
                BEGIN
                  "Date Bon de Commande" := PurchOrder."Order Date";
                  "Mois B.C"  :=  FORMAT(DATE2DMY(PurchOrder."Order Date",2));
                  "Année B.C" :=  FORMAT(DATE2DMY(PurchOrder."Order Date",3));
                  "No. Dossier d'import" := PurchOrder."No dossier";
                  Devise := PurchOrder."Currency Code";
                  //IF PurchOrder."Currency Factor" <> 0 THEN
                   // "Cours douane" := 1/PurchOrder."Currency Factor";
                END;
            end;
        }
        field(25;"Date Bon de Commande";Date)
        {
        }
        field(26;"Mois B.C";Code[10])
        {
            Editable = true;
        }
        field(27;"Année B.C";Code[10])
        {
            Editable = true;
        }
        field(28;"No. Series";Code[10])
        {
            CaptionML = ENU='No. Series',
                        FRA='Souches de n°';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(29;"Posting No. Series";Code[10])
        {
            CaptionML = ENU='Posting No. Series',
                        FRA='Souches de n° validation';
            TableRelation = "No. Series";
        }
        field(30;Statut;Option)
        {
            Editable = false;
            OptionCaption = 'en Attente,Lancé,Valider,Refusé,Annulé,Clôturé';
            OptionMembers = "en Attente","Lancé",Valider,"Refusé","Annulé","Clôturé";
        }
        field(31;"Crée par";Code[30])
        {
            Editable = false;
        }
        field(32;"Crée le";Date)
        {
            Editable = false;
        }
        field(33;"Modifier par";Code[30])
        {
            Editable = false;
        }
        field(34;"Modifier le";Date)
        {
            Editable = false;
        }
        field(35;"Total devise";Decimal)
        {
            CalcFormula = Sum("Ligne Arrivage VN"."Montant Devise" WHERE (No. Titre d'importation=FIELD(No. Titre D'importation)));
            FieldClass = FlowField;
        }
        field(36;"Total en Dinar";Decimal)
        {
            CalcFormula = Sum("Ligne Arrivage VN"."Montant TND" WHERE (No. Titre d'importation=FIELD(No. Titre D'importation)));
            DecimalPlaces = 3:3;
            FieldClass = FlowField;
        }
        field(37;Commentaire;Text[250])
        {
        }
        field(38;"No. Dossier d'import";Code[20])
        {
            Editable = true;
            TableRelation = "Dossiers Transit";
        }
        field(39;"Nom de la banque";Code[100])
        {
        }
        field(40;"Valable au";Date)
        {
            Description = 'MEDCOM Report';
        }
        field(41;"Nombre exemplaires";Integer)
        {
            Description = 'MEDCOM Report';
            InitValue = 4;
        }
        field(42;"Source Expédition";Text[30])
        {
            Description = 'MEDCOM Report';
        }
        field(43;"Destination Expédition";Text[30])
        {
            Description = 'MEDCOM Report';
            InitValue = 'Aéroport Tunis Carthage';
        }
        field(44;"Limite jours";Integer)
        {
            Description = 'MEDCOM Report';
        }
        field(45;"Compte bancaire";Code[10])
        {
            CaptionML = ENU='Preferred Bank Account',
                        FRA='Compte bancaire préféré';
            TableRelation = "Vendor Bank Account".Code WHERE (Vendor No.=FIELD(No. Fournisseur));
        }
        field(46;"Date réception Prévisionnelle";Date)
        {
            Description = 'SM LC';

            trigger OnValidate();
            begin
                  PaymentTerms.GET("Delai Reglement");
                  "Echéance Prox." := CALCDATE(PaymentTerms."Due Date Calculation","Date réception Prévisionnelle");
            end;
        }
        field(49;"Date réception Confirmée";Date)
        {
            Description = 'SM LC';

            trigger OnValidate();
            begin
                  PaymentTerms.GET("Delai Reglement");
                  "Date échéance Confirmée" := CALCDATE(PaymentTerms."Due Date Calculation","Date réception Confirmée");
            end;
        }
        field(50;"Date échéance Confirmée";Date)
        {
            Description = 'SM LC';
        }
        field(51;Relicat;Boolean)
        {
            Description = 'SM LC';
        }
        field(52;"Total Expédition Consommé";Decimal)
        {
            CalcFormula = Sum("Expédition par Titre"."Total en Devise" WHERE (No. Titre D'importation=FIELD(No. Titre D'importation)));
            Description = 'SM LC';
            FieldClass = FlowField;
        }
        field(53;"No. Expedition";Code[20])
        {
            Description = 'ZMN';
        }
        field(54;"No. L.C";Code[20])
        {
            TableRelation = "Lettre de crédit L.C";
        }
        field(55;"Court négocié";Decimal)
        {
        }
        field(56;"No. Bord. Reg. Frs";Code[20])
        {
            TableRelation = "Payment Header";
        }
        field(57;"No. réception achat /cmd";Code[20])
        {
            TableRelation = "Purch. Rcpt. Header".No. WHERE (Buy-from Vendor No.=FIELD(No. Fournisseur),
                                                             Order No.=FIELD(No. Bon de Commande));

            trigger OnValidate();
            begin
                IF CONFIRM('Voulez vous insérer les ligne réceptions enregistrées pour cet arrivage',TRUE,FALSE) THEN
                  BEGIN
                    CLEAR(PurchRcptHeader); //Suppprimer ligne déja importer
                    PurchRcptHeader.GET("No. réception achat /cmd");
                    CLEAR(RecLineArrivageVN2);
                    RecLineArrivageVN2.SETRANGE("No. commande achat",PurchRcptHeader."Order No.");
                    RecLineArrivageVN2.SETRANGE("No. bon de réception achat","No. réception achat /cmd");
                     RecLineArrivageVN2.DELETEALL;

                    CLEAR(PurchRcptLine);  //import lignes réceptions achats
                    PurchRcptLine.SETFILTER("Document No.",'%1',"No. réception achat /cmd");
                    PurchRcptLine.FIND('-');
                    REPEAT
                      MgtAures.CreateEngegment(PurchRcptLine,Rec);
                    UNTIL PurchRcptLine.NEXT = 0;
                  END
            end;
        }
        field(58;"No. réception achat Multiple";Code[20])
        {
            TableRelation = "Purch. Rcpt. Header".No. WHERE (Buy-from Vendor No.=FIELD(No. Fournisseur));

            trigger OnValidate();
            begin
                COMMIT;
                IF CONFIRM('Voulez vous insérer les ligne réceptions enregistrées pour cet arrivage',TRUE,FALSE) THEN
                  BEGIN

                    //MESSAGE('"No. réception achat /cmd"%1',"No. réception achat Multiple");
                    CLEAR(PurchRcptHeader); //Suppprimer ligne déja importer et MAJ qté récu L.C (on delete ligne Tab : arrivage VN)
                    PurchRcptHeader.GET("No. réception achat Multiple");
                    CLEAR(RecLineArrivageVN2);
                    RecLineArrivageVN2.SETRANGE("No. commande achat",PurchRcptHeader."Order No.");
                    RecLineArrivageVN2.SETRANGE("No. bon de réception achat","No. réception achat Multiple");
                     IF RecLineArrivageVN2.FIND('-') THEN
                       REPEAT
                           RecLineArrivageVN2.DELETE(TRUE);
                         UNTIL RecLineArrivageVN2.NEXT = 0;

                    CLEAR(PurchRcptLine);  //import lignes réceptions achats
                    PurchRcptLine.SETFILTER("Document No.",'%1',"No. réception achat Multiple");
                    PurchRcptLine.FIND('-');
                    REPEAT
                      MgtAures.CreateEngegment(PurchRcptLine,Rec);
                    UNTIL PurchRcptLine.NEXT = 0;
                  END
            end;
        }
    }

    keys
    {
        key(Key1;"No. Titre D'importation")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"No. Titre D'importation","N° Domiciliation","No. Dossier d'import","No. Bon de Commande",Banque)
        {
        }
    }

    trigger OnDelete();
    begin
        ExpéditionparTitre.SETRANGE(ExpéditionparTitre."No. Titre D'importation","No. Titre D'importation");
        IF ExpéditionparTitre.FIND('-') THEN
        ERROR(Txt0001);
        EntêteAssurance.SETRANGE(EntêteAssurance."No. Titre D'importation","No. Titre D'importation");
        IF EntêteAssurance.FIND('-') THEN
        ERROR(Txt0002);
        EntêteObligation.SETRANGE(EntêteObligation."No. Titre D'importation","No. Titre D'importation");
        IF EntêteObligation.FIND('-') THEN
        ERROR(Txt0003);
    end;

    trigger OnInsert();
    begin

        PurchasesPayablesSetup.GET;
        PurchasesPayablesSetup.TESTFIELD(PurchasesPayablesSetup."No. Titre d'importation");
        IF "No. Titre D'importation" = '' THEN
         NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series","Date Titre D'importation","No. Titre D'importation","No. Series");


        "Crée par" := USERID;
        "Crée le"  := WORKDATE;
        "Date Titre D'importation" := WORKDATE;
    end;

    trigger OnModify();
    begin
        "Modifier par":= USERID;
        "Modifier le"   := WORKDATE;
    end;

    var
        PurchasesPayablesSetup : Record "312";
        NoSeriesMgt : Codeunit "396";
        Vendor : Record "23";
        PurchOrder : Record "38";
        "ExpéditionparTitre" : Record "50013";
        "EntêteAssurance" : Record "50014";
        "EntêteObligation" : Record "50015";
        Txt0001 : Label 'Suppression Impossible : il existe des expéditions rattachées a ce Titre';
        Txt0002 : Label 'Suppression Impossible : il existe des Assurances rattachées a ce Titre';
        Txt0003 : Label 'Suppression Impossible : il existe des Obligations rattachées a ce Titre';
        BankAccount : Record "270";
        company : Record "79";
        PaymentTerms : Record "3";
        PurchSetup : Record "312";
        PurchRcptLine : Record "121";
        MgtAures : Codeunit "70003";
        RecLineArrivageVN2 : Record "50012";
        PurchRcptHeader : Record "120";

    local procedure GetNoSeriesCode() : Code[10];
    begin
        EXIT(PurchasesPayablesSetup."No. Titre d'importation");
    end;

    procedure AssistEdit1(OldTitreDimportation : Record "50011") : Boolean;
    begin
        PurchSetup.GET;
        TestNoSeries;
        IF NoSeriesMgt.SelectSeries(GetNoSeriesCode,OldTitreDimportation."No. Series","No. Series") THEN BEGIN
          PurchSetup.GET;
          TestNoSeries;
          NoSeriesMgt.SetSeries("No. Titre D'importation");
          EXIT(TRUE);
        END;
    end;

    local procedure TestNoSeries() : Boolean;
    begin
         /*
        PurchSetup.GET;
        CASE "Document Type" OF
          "Document Type"::Quote:
            PurchSetup.TESTFIELD("Quote Nos.");
          "Document Type"::Order:
            PurchSetup.TESTFIELD("Order Nos.");
          "Document Type"::Invoice:
            BEGIN
              PurchSetup.TESTFIELD("Invoice Nos.");
              PurchSetup.TESTFIELD("Posted Invoice Nos.");
            END;
          "Document Type"::"Return Order":
            PurchSetup.TESTFIELD("Return Order Nos.");
          "Document Type"::"Credit Memo":
            BEGIN
              PurchSetup.TESTFIELD("Credit Memo Nos.");
              PurchSetup.TESTFIELD("Posted Credit Memo Nos.");
            END;
          "Document Type"::"Blanket Order":
            PurchSetup.TESTFIELD("Blanket Order Nos.");
        END;
        */

    end;

    procedure AssistEdit(OldTitredimport : Record "50011") : Boolean;
    var
        Titredimport : Record "50011";
        ServiceZone : Record "5957";
    begin
        // ADD MED 21/09/2013
        WITH Titredimport DO BEGIN
          Titredimport := Rec;
          IF NoSeriesMgt.SelectSeries(PurchasesPayablesSetup."No. Titre d'importation",OldTitredimport."No. Series","No. Series") THEN BEGIN
            NoSeriesMgt.SetSeries("No. Titre D'importation");
            Rec := Titredimport;
            EXIT(TRUE);
          END;
        END;
        // END ADD MED
    end;

    local procedure FctUpdateLine();
    var
        RecLigneTitredimportation : Record "50012";
        Currency : Record "4";
        CurrencyExchangeRate : Record "330";
    begin
        RecLigneTitredimportation.SETRANGE("No. Titre d'importation","No. Titre D'importation");
        IF RecLigneTitredimportation.FINDSET THEN
          REPEAT
            Currency.InitRoundingPrecision;
            IF Devise <> '' THEN
              BEGIN
                RecLigneTitredimportation."Prix Unitaire TND" :=
                  ROUND(
                      (RecLigneTitredimportation."Prix Unitaire Devise"*"Cours douane"),
                    Currency."Amount Rounding Precision");

                    RecLigneTitredimportation."Montant TND" :=
                  ROUND(
                      (RecLigneTitredimportation."Montant Devise"*"Cours douane"),
                    Currency."Amount Rounding Precision");
              END ELSE
               BEGIN
                 RecLigneTitredimportation."Prix Unitaire TND" :=
                  ROUND(RecLigneTitredimportation."Prix Unitaire Devise",Currency."Amount Rounding Precision");

                 RecLigneTitredimportation."Montant TND" :=
                   ROUND(RecLigneTitredimportation."Montant Devise",Currency."Amount Rounding Precision");

               END;
               RecLigneTitredimportation.MODIFY;
          UNTIL  RecLigneTitredimportation.NEXT = 0;
    end;
}

