table 50021 "Autorisation Types Réglement"
{
    // version ETRANGER


    fields
    {
        field(1;Utilisateur;Code[20])
        {
            TableRelation = User;
        }
        field(2;"Type réglement";Text[30])
        {
        }
    }

    keys
    {
        key(Key1;Utilisateur,"Type réglement")
        {
        }
    }

    fieldgroups
    {
    }
}

