table 70043 "Entête Financement"
{

    fields
    {
        field(1;"No. Financement";Code[20])
        {
        }
        field(3;"No. Arrivage";Code[20])
        {
        }
        field(6;"No. L.C";Code[20])
        {
        }
        field(7;"No. série";Code[20])
        {
        }
        field(8;"Date de création";Date)
        {
        }
        field(9;"No. Fournisseur";Code[20])
        {
        }
        field(10;"Créer par";Code[50])
        {
        }
        field(11;Statut;Option)
        {
            OptionCaption = 'Ouvert,Lancer';
            OptionMembers = Ouvert,Lancer;
        }
    }

    keys
    {
        key(Key1;"No. Financement")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        SetupAutomobile.GET;
        IF "No. Financement" = '' THEN
          NoSeriesManagement.InitSeries(SetupAutomobile."No. Financement",xRec."No. série","Date de création","No. Financement","No. série");
    end;

    var
        SetupAutomobile : Record "70029";
        NoSeriesManagement : Codeunit "396";
}

