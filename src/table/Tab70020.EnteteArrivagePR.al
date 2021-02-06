table 70020 "Entete Arrivage PR"
{
    DrillDownPageID = 70026;
    LookupPageID = 70026;

    fields
    {
        field(1;"No. Arrivage";Code[20])
        {
        }
        field(2;Description;Text[250])
        {
        }
        field(3;"Créer par";Code[50])
        {
        }
        field(4;"Date Creation";Date)
        {
        }
        field(5;"Modifier Par";Code[50])
        {
        }
        field(6;"Date Modification";Date)
        {
        }
        field(7;Statut;Option)
        {
            Editable = false;
            OptionCaptionML = ENU=' ,En Cours,Lancer,Cloturer',
                              FRA=' ,En Cours,Lancer,Cloturer';
            OptionMembers = " ","En Cours",Lancer,Cloturer;
        }
        field(8;"Total Poid Brut";Decimal)
        {
            CalcFormula = Sum("Dossier Import Fact. Four."."Poid Brut" WHERE (No. Arrivage PR=FIELD(No. Arrivage)));
            FieldClass = FlowField;
        }
        field(9;"Total Volume";Decimal)
        {
            CalcFormula = Sum("Dossier Import Fact. Four.".Volume WHERE (No. Arrivage PR=FIELD(No. Arrivage)));
            FieldClass = FlowField;
        }
        field(10;"Montant Total";Decimal)
        {
            CalcFormula = Sum("Arrivage PR"."Total Line Montant" WHERE (No. Arrivage=FIELD(No. Arrivage)));
            FieldClass = FlowField;
        }
        field(11;"Code Magasin de réception";Code[10])
        {
            TableRelation = Location;
        }
        field(12;"Total Poid Net";Decimal)
        {
            CalcFormula = Sum("Dossier Import Fact. Four."."Poid Net" WHERE (No. Arrivage PR=FIELD(No. Arrivage)));
            FieldClass = FlowField;
        }
        field(13;"Nbre Des Factures";Decimal)
        {
            FieldClass = Normal;
        }
        field(14;"Vérifier";Boolean)
        {
            Editable = true;
        }
        field(15;"Total Montant en Devise";Decimal)
        {
        }
        field(16;"Shipment date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;GES;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18;GEIS;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Estimated time of arrival";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20;Device;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(21;Coeficient;Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No. Arrivage")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //ERROR('vous ne pouvez pas supprimer un Dossier DFC');
        RecArrivagePR.SETRANGE(RecArrivagePR."No. Arrivage","No. Arrivage");
        IF RecArrivagePR.FINDSET  THEN
          REPEAT
             RecArrivagePR.DELETE;
          UNTIL RecArrivagePR.NEXT =0;
        //<<ZMN 12/04/2017
        RecDossierImportFactFour.SETRANGE("No. Arrivage PR","No. Arrivage");
        IF RecDossierImportFactFour.FINDSET THEN
          REPEAT
            RecDossierImportColis.SETRANGE("No. Arrivage PR",RecDossierImportFactFour."No. Arrivage PR");
            IF RecDossierImportColis.FINDSET THEN
              REPEAT
                RecDossierImportColis.DELETE;
              UNTIL RecDossierImportColis.NEXT = 0;
              RecDossierImportFactFour.DELETE;
          UNTIL RecDossierImportFactFour.NEXT =0;
        //>>ZMN 12/04/2017
    end;

    trigger OnInsert();
    begin
        IF "No. Arrivage" = '' THEN BEGIN
          RecPurchasesPayablesSetup.GET;
          RecPurchasesPayablesSetup.TESTFIELD("Arrivage Nos.");
          NoSeriesMgt.InitSeries(RecPurchasesPayablesSetup."Arrivage Nos.",RecPurchasesPayablesSetup."Arrivage Nos.",0D,"No. Arrivage",RecPurchasesPayablesSetup."Arrivage Nos.");
        END;

        "Créer par" := USERID;
        "Date Creation":= WORKDATE;

        RecPurchasesPayablesSetup.GET;
        RecPurchasesPayablesSetup.TESTFIELD("Magazin Reception Arrivage");
        VALIDATE("Code Magasin de réception" ,RecPurchasesPayablesSetup."Magazin Reception Arrivage")
    end;

    trigger OnModify();
    begin
        "Modifier Par" := USERID;
        "Date Modification":= WORKDATE;
    end;

    var
        RecPurchasesPayablesSetup : Record "312";
        NoSeriesMgt : Codeunit "396";
        RecArrivagePR : Record "70017";
        RecDossierImportFactFour : Record "70025";
        RecDossierImportColis : Record "70072";
}

