table 60015 "Carte Grise Entete"
{
    // version MAZDA13,MAZDA13.3

    DrillDownPageID = 60074;
    LookupPageID = 60074;

    fields
    {
        field(1;"N° Bordereau";Code[20])
        {
        }
        field(2;"Date Création";Date)
        {
        }
        field(3;"Date Emission";Date)
        {
        }
        field(4;"Nbre Carte Grise";Integer)
        {
            CalcFormula = Count("Carte Grise Ligne" WHERE (N° Bordereau=FIELD(N° Bordereau)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5;Statut;Option)
        {
            OptionMembers = Encours,"Envoyé","Soldé";
        }
        field(6;"Time Création";Time)
        {
        }
        field(7;"Time Emission";Time)
        {
        }
        field(50000;"Purchase Request No.";Code[20])
        {
            CaptionML = ENU='Purchase request No.',
                        FRA='N° demande d''achat';
            DataClassification = ToBeClassified;
        }
        field(50001;"Purchase request line No.";Integer)
        {
            CaptionML = ENU='Purchase request line No.',
                        FRA='N° ligne demande achat';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"N° Bordereau")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        TESTFIELD(Statut,Statut::Encours);
        RecCarteGriseLigne.RESET;
        RecCarteGriseLigne.SETRANGE("N° Bordereau","N° Bordereau");
        IF RecCarteGriseLigne.FINDSET THEN
        BEGIN
          RecCarteGriseLigne.TESTFIELD(RecCarteGriseLigne."Payment No.",'');
          RecCarteGriseLigne.DELETEALL;
        END;
    end;

    trigger OnInsert();
    begin

        IF "N° Bordereau" = '' THEN BEGIN
          SalesSetup.GET;
          SalesSetup.TESTFIELD("No. Souche Bord. Carte Grise");
          NoSeriesMgt.InitSeries(SalesSetup."No. Souche Bord. Carte Grise",SalesSetup."No. Souche Bord. Carte Grise",0D,"N° Bordereau",SalesSetup."No. Souche Bord. Carte Grise");
        END;

        "Date Création" := WORKDATE;
        //SM MAZDA13.3
        "Time Création" := TIME;
        //END SM
    end;

    trigger OnRename();
    begin
        ERROR('No Rename')
    end;

    var
        SalesSetup : Record "311";
        NoSeriesMgt : Codeunit "396";
        RecCarteGriseLigne : Record "60016";
}

