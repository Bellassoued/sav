table 50033 "Version Article"
{
    // version CT16V002

    DrillDownPageID = 60181;
    LookupPageID = 60181;

    fields
    {
        field(1;"Code version";Code[20])
        {
        }
        field(2;Description;Text[80])
        {
        }
        field(3;Biton;Boolean)
        {
            Description = 'SM VNF001 160217';
        }
        field(4;"Biton Par Défaut";Text[50])
        {
            Description = 'SM VNF001 160217';
        }
        field(5;"Code devise";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(6;"Pays de provenance";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Formule mois de production";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 24122018';
            OptionMembers = "<+0M>","<+1M>","<+2M>";
        }
        field(8;"Durée Transit (Jour)";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 25122018';
        }
        field(9;"Durée de livraison stock";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 25122018';
        }
        field(10;"Format VIN";Code[17])
        {
            DataClassification = ToBeClassified;
            Description = 'KT 16012019';
        }
    }

    keys
    {
        key(Key1;"Code version")
        {
        }
    }

    fieldgroups
    {
    }
}

