table 50079 "Liste Modèles Compagne"
{
    // version AURES.VN


    fields
    {
        field(1;"Code Compagne";Code[20])
        {
        }
        field(2;"Code Modèle";Code[20])
        {
            TableRelation = Item WHERE (Inventory Posting Group=CONST(VEHICULES));
        }
        field(3;"Type Carte Carburant";Code[20])
        {
            TableRelation = Item WHERE (No.=FILTER(*-M-VN));
        }
    }

    keys
    {
        key(Key1;"Code Compagne","Code Modèle")
        {
        }
    }

    fieldgroups
    {
    }
}

