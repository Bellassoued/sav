table 60004 "Emissions Test Category"
{
    // version RAD AUTO

    CaptionML = ENU='Emissions Test Category',
                FRA='Catégorie de tests d''émission';
    DrillDownPageID = 60004;
    LookupPageID = 60004;

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

