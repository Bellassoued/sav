table 50099 "Item Equivalant"
{
    DrillDownPageID = 50137;
    LookupPageID = 50137;

    fields
    {
        field(1;"Item No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        field(2;"Equivalant Item No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
    }

    keys
    {
        key(Key1;"Item No.","Equivalant Item No.")
        {
        }
    }

    fieldgroups
    {
    }
}

