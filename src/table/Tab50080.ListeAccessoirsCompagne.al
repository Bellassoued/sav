table 50080 "Liste Accessoirs Compagne"
{
    // version AURES.VN


    fields
    {
        field(1;"Code Compagne";Code[20])
        {
        }
        field(2;"Code Accessoirs";Code[20])
        {
            TableRelation = Item WHERE (No.=FILTER(*-M-VN));
        }
    }

    keys
    {
        key(Key1;"Code Compagne","Code Accessoirs")
        {
        }
    }

    fieldgroups
    {
    }
}

