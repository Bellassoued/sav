table 60052 "Marge Par Groupe Pièce"
{
    // version SM MAZDA77.1


    fields
    {
        field(1;"Posting Group";Code[10])
        {
            CaptionML = ENU='Posting Group',
                        FRA='Groupe comptabilisation';
            Editable = false;
        }
        field(2;"Marge en %";Decimal)
        {
        }
        field(3;"Document No.";Code[20])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Posting Group","Document No.")
        {
        }
    }

    fieldgroups
    {
    }
}

