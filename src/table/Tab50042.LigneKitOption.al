table 50042 "Ligne Kit Option"
{
    // version VNF001

    DrillDownPageID = 69092;
    LookupPageID = 69092;

    fields
    {
        field(1;"Code Groupement Option";Code[20])
        {
            TableRelation = Option;
        }
        field(2;"Code Option";Code[20])
        {
            TableRelation = Option;
        }
        field(3;"Code version";Code[20])
        {
            TableRelation = "Version Article";
        }
    }

    keys
    {
        key(Key1;"Code version","Code Groupement Option","Code Option")
        {
        }
    }

    fieldgroups
    {
    }
}

