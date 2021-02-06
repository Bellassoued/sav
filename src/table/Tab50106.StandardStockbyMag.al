table 50106 "Standard Stock by Mag"
{
    DrillDownPageID = 50165;
    LookupPageID = 50165;

    fields
    {
        field(1;"No. Article";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Centre De Gestion";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(3;"Standard Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No. Article","Centre De Gestion")
        {
        }
    }

    fieldgroups
    {
    }
}

