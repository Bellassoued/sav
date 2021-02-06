table 50127 "CORREC PRIX ARRIVAGE"
{

    fields
    {
        field(1;"Comm achat";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;PRIX;Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Comm achat")
        {
        }
    }

    fieldgroups
    {
    }
}

