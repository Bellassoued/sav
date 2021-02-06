table 70010 "Remise"
{
    // version PR00011

    DrillDownPageID = 70013;
    LookupPageID = 70013;

    fields
    {
        field(1;"Code Remise";Code[10])
        {
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"% Marge";Decimal)
        {
        }
        field(4;"Code Famille";Code[10])
        {
        }
        field(5;"Code Segment";Code[10])
        {
        }
        field(6;"Code Index";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"Code Remise")
        {
        }
    }

    fieldgroups
    {
    }
}

