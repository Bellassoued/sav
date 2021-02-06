table 60028 "Line Control"
{
    // version Preparation VN


    fields
    {
        field(1;"Line No";Integer)
        {
        }
        field(2;Group;Code[50])
        {
        }
        field(3;Description;Text[250])
        {
        }
        field(4;"Titre Principale";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;Group,"Line No")
        {
        }
    }

    fieldgroups
    {
    }
}

