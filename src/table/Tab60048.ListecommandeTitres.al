table 60048 "Liste commande Titres"
{
    // version ETRANGER


    fields
    {
        field(1;"No Titre";Code[20])
        {
        }
        field(2;"No Proformat";Code[20])
        {
            TableRelation = "Purchase Header".No. WHERE (Document Type=CONST(Order));
        }
    }

    keys
    {
        key(Key1;"No Titre")
        {
        }
        key(Key2;"No Proformat")
        {
        }
    }

    fieldgroups
    {
    }
}

