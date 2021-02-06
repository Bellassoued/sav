table 50049 "Challenge"
{
    DrillDownPageID = 60343;
    LookupPageID = 60343;

    fields
    {
        field(1;"Challenge No.";Code[20])
        {
            CaptionML = ENU='Challenge No.',
                        FRA='Code Défi';
        }
        field(2;"Date début";Date)
        {
        }
        field(3;"Date Fin";Date)
        {
        }
        field(5;"Libellé challenge";Text[30])
        {
        }
        field(7;"Critère";Option)
        {
            OptionMembers = Facturation,Livraison,"Réception Dossier","Validation Dossier","Dépôt CG","Réception CG";
        }
    }

    keys
    {
        key(Key1;"Challenge No.")
        {
        }
        key(Key2;"Libellé challenge","Challenge No.")
        {
        }
    }

    fieldgroups
    {
    }
}

