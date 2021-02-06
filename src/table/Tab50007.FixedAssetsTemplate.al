table 50007 "Fixed Assets Template"
{
    // version DEM ACHAT

    CaptionML = ENU = 'Fixed Assets Template',
                FRA = 'Modèle immobilisation';
    LookupPageID = 50010;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Designation; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
        }
    }

    fieldgroups
    {
    }
}

