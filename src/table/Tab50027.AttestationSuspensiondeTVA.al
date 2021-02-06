table 50027 "Attestation Suspension de TVA"
{
    // version ATTESTATION


    fields
    {
        field(1;"Code Client";Code[20])
        {
        }
        field(2;"Date Début";Date)
        {
        }
        field(3;"Date Fin";Date)
        {
        }
        field(4;"No Attestation";Code[50])
        {
        }
        field(5;"Créer Par";Code[100])
        {
        }
        field(6;"Date Création";DateTime)
        {
        }
        field(7;"Modifié Par";Code[100])
        {
        }
        field(8;"Date Modification";DateTime)
        {
        }
    }

    keys
    {
        key(Key1;"Code Client","Date Début","Date Fin")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        ERROR('Non autorisé');
    end;

    trigger OnInsert();
    begin
        "Créer Par" := USERID;
        "Date Création" := CURRENTDATETIME;
        UserSetup.GET(USERID);
        IF NOT UserSetup."Agent comptable" THEN
          ERROR('Vous n''avez pas le droit');
    end;

    trigger OnModify();
    begin
        "Modifié Par" := USERID;
        "Date Modification" := CURRENTDATETIME;
        UserSetup.GET(USERID);
        IF NOT UserSetup."Agent comptable" THEN
          ERROR('Vous n''avez pas le droit');
    end;

    var
        UserSetup : Record "91";
}

