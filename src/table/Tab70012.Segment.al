table 70012 "Segment"
{
    // version PR00011

    DrillDownPageID = 70015;
    LookupPageID = 70015;

    fields
    {
        field(1;"Code Segment";Code[10])
        {
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"Code Index";Code[10])
        {
            TableRelation = Index."Code Index" WHERE (Code Index=FIELD(Code Index));
        }
        field(4;"% Cancel";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code Segment","Code Index")
        {
        }
    }

    fieldgroups
    {
    }
}

