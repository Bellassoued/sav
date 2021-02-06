table 70028 "Famille"
{
    DrillDownPageID = 70066;
    LookupPageID = 70066;

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"Code Index";Code[10])
        {
            TableRelation = Index;
        }
        field(4;"Code Segment";Code[10])
        {
            TableRelation = Segment;
        }
    }

    keys
    {
        key(Key1;"Code","Code Index","Code Segment")
        {
        }
    }

    fieldgroups
    {
    }
}

