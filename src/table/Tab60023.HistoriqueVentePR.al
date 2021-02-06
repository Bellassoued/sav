table 60023 "Historique Vente PR"
{
    DataPerCompany = true;

    fields
    {
        field(1;"Entry No";Integer)
        {
            CaptionML = ENU='Entry No.',
                        FRA='N° séquence';
        }
        field(2;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='N° article';
        }
        field(4;"Location Code";Code[20])
        {
            CaptionML = ENU='Location Code',
                        FRA='Code magasin';
        }
        field(5;"Posting Date";Date)
        {
            CaptionML = ENU='Posting Date',
                        FRA='Date comptabilisation';
        }
        field(6;"Costumer No.";Code[20])
        {
            CaptionML = ENU='Costumer No.',
                        FRA='Code Client';
        }
        field(7;"Sales Price";Decimal)
        {
        }
        field(8;Quantity;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
        }
        key(Key2;"Item No.","Location Code","Posting Date")
        {
            SumIndexFields = Quantity;
        }
    }

    fieldgroups
    {
    }
}

