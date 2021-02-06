table 50087 "Commande PSA"
{
    // version WH


    fields
    {
        field(1;"N° séquence";Integer)
        {
        }
        field(2;"Type commende";Code[10])
        {
        }
        field(3;"N° Client";Code[2])
        {
        }
        field(4;"Date Commende";Code[10])
        {
        }
        field(5;"N° De commende";Code[10])
        {
        }
        field(6;"N° Pièce";Code[30])
        {
        }
        field(7;"Quantité";Code[10])
        {
        }
        field(8;"Mag MD";Code[10])
        {
        }
        field(9;"Casier MD";Code[10])
        {
        }
        field(10;"Niveau Casier MD";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"N° séquence")
        {
        }
    }

    fieldgroups
    {
    }
}

