table 60071 "Type Garantie"
{

    fields
    {
        field(1;"Warranty Code";Code[3])
        {
            CaptionML = ENU='Warranty Code',
                        FRA='Code Garantie';
        }
        field(2;Description;Text[30])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
        }
    }

    keys
    {
        key(Key1;"Warranty Code")
        {
        }
    }

    fieldgroups
    {
    }
}

