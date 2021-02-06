table 50111 "test a supp"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Item No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Serial No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Cout Total";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

