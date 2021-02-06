table 70021 "Bordereau PVN"
{
    // version MAZDA13,MAZDA13.3

    DrillDownPageID = 70035;
    LookupPageID = 70035;

    fields
    {
        field(1;"N° Bordereau";Code[20])
        {
        }
        field(2;"Date Création";Date)
        {
            Editable = false;
        }
        field(3;"Date Emission";Date)
        {
        }
        field(4;"Nbre Véhicule";Integer)
        {
            CalcFormula = Count("Ligne bordereau PVN" WHERE (N° Bordereau=FIELD(N° Bordereau)));
            FieldClass = FlowField;
        }
        field(5;Statut;Option)
        {
            Editable = false;
            OptionCaption = 'Ouvert,Encours de préparation,Terminé';
            OptionMembers = Ouvert,"Encours de préparation","Terminé";
        }
        field(6;"Time Création";Time)
        {
        }
        field(7;"Time Emission";Time)
        {
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
        LigneBordPVN.RESET;
        LigneBordPVN.SETRANGE("N° Bordereau","N° Bordereau");
        IF LigneBordPVN.FINDSET THEN BEGIN
          LigneBordPVN.DELETEALL(TRUE);
        END;
    end;

    trigger OnInsert();
    begin
        IF "N° Bordereau" = '' THEN BEGIN
          SalesSetup.GET;
          SalesSetup.TESTFIELD("No. Bord. PVN");
          NoSeriesMgt.InitSeries(SalesSetup."No. Bord. PVN",SalesSetup."No. Bord. PVN",0D,"N° Bordereau",SalesSetup."No. Bord. PVN");
        END;

        "Date Création" := WORKDATE;
        //SM MAZDA13.3
        "Time Création" := TIME;
        //END SM
    end;

    trigger OnRename();
    begin
        ERROR('No Rename');
    end;

    var
        SalesSetup : Record "311";
        NoSeriesMgt : Codeunit "396";
        LigneBordPVN : Record "70022";
}

