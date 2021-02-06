table 50040 "Prix version"
{
    // version CT16V002

    DrillDownPageID = 70078;
    LookupPageID = 70078;

    fields
    {
        field(3;"Code version";Code[20])
        {
            TableRelation = "Version Article";
        }
        field(5;Description;Text[50])
        {
        }
        field(6;Description1;Text[50])
        {
        }
        field(7;"Prix Achat";Decimal)
        {
        }
        field(70000;"Prix de positionnement";Decimal)
        {
        }
        field(70001;"Date Début";Date)
        {
            Description = 'à traiter';
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

