table 70083 "Transfer Simple"
{
    DrillDownPageID = 70171;
    LookupPageID = 70171;

    fields
    {
        field(1;USERID;Code[50])
        {
        }
        field(2;"No. Article";Code[20])
        {
            TableRelation = Item;
        }
        field(3;Magasin;Code[10])
        {
            TableRelation = Location;
        }
        field(4;"Ancien Emplacement";Code[10])
        {
        }
        field(5;"Quantité";Decimal)
        {
        }
        field(6;"Nouveau Emplacement";Code[10])
        {
        }
        field(7;"Par Défaut";Boolean)
        {
        }
        field(8;Traiter;Boolean)
        {
        }
        field(9;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(10;"Qty Traiter";Decimal)
        {
        }
        field(11;"date creation";DateTime)
        {
        }
        field(12;"Traiter Partiellement";Boolean)
        {
        }
        field(13;"Qty abondonné";Decimal)
        {
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

