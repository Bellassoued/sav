table 60006 "Transmission Type"
{
    // version RAD AUTO

    CaptionML = ENU='Transmission Type',
                FRA='Type de Transmission';
    DataPerCompany = false;
    DrillDownPageID = 60006;
    LookupPageID = 60006;

    fields
    {
        field(1;"Code";Code[20])
        {
            CaptionML = ENU='Code',
                        FRA='Code';
        }
        field(2;Description;Text[100])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
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

