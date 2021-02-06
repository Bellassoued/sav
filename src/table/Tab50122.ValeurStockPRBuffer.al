table 50122 "Valeur Stock PR Buffer"
{
    // version STK


    fields
    {
        field(1;"Item No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Valeur à date";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Filtre Date";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Item No")
        {
        }
    }

    fieldgroups
    {
    }
}

