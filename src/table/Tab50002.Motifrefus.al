table 50002 "Motif refus"
{
    // version DEM ACHAT

    CaptionML = ENU = 'Refusal Reason',
                FRA = 'Motif refus';
    LookupPageID = 50008;

    fields
    {
        field(2; "Code Motif"; Code[20])
        {
            CaptionML = ENU = 'Reason Code',
                        FRA = 'Code Motif';
        }
        field(3; Description; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Code Motif")
        {
        }
    }

    fieldgroups
    {
    }
}

