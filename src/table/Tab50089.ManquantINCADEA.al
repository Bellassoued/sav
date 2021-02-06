table 50089 "Manquant INCADEA"
{

    fields
    {
        field(1;VIN;Code[17])
        {
        }
        field(2;Article;Code[20])
        {
            TableRelation = Item WHERE (Gen. Prod. Posting Group=CONST(ACCESS_VN));
        }
        field(3;"Quantité";Decimal)
        {
        }
        field(4;"No Préparation";Code[20])
        {
        }
        field(5;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;VIN,Article)
        {
        }
    }

    fieldgroups
    {
    }
}

