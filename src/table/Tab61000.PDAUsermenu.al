table 61000 "PDA - User menu"
{

    fields
    {
        field(1;"User ID";Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(2;"Menu List";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;"User ID")
        {
        }
    }

    fieldgroups
    {
    }
}

