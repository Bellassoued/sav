table 50110 "Traduction Description Item"
{

    fields
    {
        field(1;"Part Name Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Description FR";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Description ENU";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Part Name Code")
        {
        }
    }

    fieldgroups
    {
    }
}

