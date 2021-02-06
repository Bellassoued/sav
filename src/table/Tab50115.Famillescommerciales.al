table 50115 "Familles commerciales"
{

    fields
    {
        field(1;"Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Commission sur vente";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Calculer bonus/malus";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Commission sur vente en devise";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
    }

    fieldgroups
    {
    }
}

