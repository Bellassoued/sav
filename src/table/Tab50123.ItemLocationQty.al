table 50123 "Item Location Qty"
{
    // version STK


    fields
    {
        field(1;"Item No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Location Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Unit Cost";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Qty;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Total Cost";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Responsability Center";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Filtre Date";Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Item No","Location Code")
        {
        }
    }

    fieldgroups
    {
    }
}

