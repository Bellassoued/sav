table 60007 "Make"
{
    // version RAD AUTO

    CaptionML = ENU='Make',
                FRA='Marque';
    DrillDownPageID = 60007;
    LookupPageID = 60007;

    fields
    {
        field(1;"Code";Code[20])
        {
            CaptionML = ENU='Code',
                        FRA='Code';
        }
        field(2;Name;Text[100])
        {
            CaptionML = ENU='Name',
                        FRA='Nom';
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

