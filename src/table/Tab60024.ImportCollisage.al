table 60024 "ImportCollisage"
{
    // version Collisage VN


    fields
    {
        field(1;Commande;Code[20])
        {
            TableRelation = "Purchase Header".No. WHERE (Document Type=CONST(Order),
                                                         Order Type=CONST(PR));
        }
    }

    keys
    {
        key(Key1;Commande)
        {
        }
    }

    fieldgroups
    {
    }
}

