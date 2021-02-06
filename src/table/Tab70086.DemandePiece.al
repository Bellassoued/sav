table 70086 "Demande Piece"
{

    fields
    {
        field(1;"No. Article";Code[20])
        {
        }
        field(2;CompanyName;Text[30])
        {
        }
        field(3;Qty;Decimal)
        {
        }
        field(4;"Variante Code";Code[10])
        {
        }
        field(5;"Line No.";Integer)
        {
        }
        field(6;"Sell to customer No.";Code[20])
        {
        }
        field(7;"Unit of Mesure";Code[10])
        {
        }
        field(8;"Item Categorie cide";Code[10])
        {
        }
        field(9;"Prodect Group Code";Code[10])
        {
        }
        field(10;"Gen. Prod. Posting Group";Code[10])
        {
        }
        field(11;"Posting Group";Code[10])
        {
        }
        field(12;"Document Type";Text[30])
        {
        }
        field(13;"Document No.";Code[20])
        {
        }
        field(14;"Recept Date";Date)
        {
        }
        field(15;"Shipment Date";Date)
        {
        }
        field(16;"Affecter sur";Code[50])
        {
        }
        field(17;"Qty To Order";Decimal)
        {
        }
        field(18;"Service Item Line No.";Integer)
        {
        }
        field(19;"Code Famille";Code[20])
        {
            TableRelation = Famille;
        }
        field(20;"Code Index";Code[20])
        {
        }
        field(21;"Code Segment";Code[20])
        {
        }
        field(22;Poids;Decimal)
        {
            Description = 'PR0017';
        }
        field(23;Volume;Decimal)
        {
            Description = 'PR0017';
        }
        field(24;Monquant;Decimal)
        {
        }
        field(25;Promotion;Boolean)
        {
            Description = 'RA004';
        }
    }

    keys
    {
        key(Key1;"No. Article",CompanyName)
        {
        }
    }

    fieldgroups
    {
    }
}

