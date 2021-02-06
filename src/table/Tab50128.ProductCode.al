table 50128 "Product Code"
{

    fields
    {
        field(1;"Product Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Product Code")
        {
        }
    }

    fieldgroups
    {
    }
}

