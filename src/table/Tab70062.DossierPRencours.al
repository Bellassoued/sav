table 70062 "Dossier PR en cours"
{

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"No. Dossier";Code[20])
        {
            TableRelation = "Entête Facture P.R / Colis".No.;
        }
        field(3;"Date Création";Date)
        {
        }
        field(4;"Créer par";Code[50])
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }
}

