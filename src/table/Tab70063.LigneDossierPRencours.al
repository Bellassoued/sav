table 70063 "Ligne Dossier PR en cours"
{

    fields
    {
        field(1;"No. Document";Code[20])
        {
        }
        field(2;"No. Dossier d'arivage";Code[20])
        {
            TableRelation = "Entête Facture P.R / Colis".No.;
        }
        field(3;"Nbr. Colis";Date)
        {
        }
        field(4;"Valeur FOB";Code[50])
        {
        }
        field(5;Volume;Decimal)
        {
        }
        field(6;"Départ Marseille";Date)
        {
        }
        field(7;"Date d'arrivée GEFCO";Date)
        {
        }
        field(8;Type;Option)
        {
            OptionMembers = " ",Remorque,Groupage;
        }
        field(9;Observation;Text[100])
        {
        }
        field(10;"Date Souhaitée Dep.Ch";Date)
        {
        }
    }

    keys
    {
        key(Key1;"No. Document")
        {
        }
    }

    fieldgroups
    {
    }
}

