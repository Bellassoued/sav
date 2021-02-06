table 50073 "Document injection Log"
{

    fields
    {
        field(1;"Document No";Code[20])
        {
        }
        field(2;"Error Type";Text[30])
        {
        }
        field(3;Sujet;Text[30])
        {
        }
        field(4;NLigne;Code[20])
        {
        }
        field(5;LineNo;BigInteger)
        {
        }
    }

    keys
    {
        key(Key1;"Document No",LineNo)
        {
        }
    }

    fieldgroups
    {
    }
}

