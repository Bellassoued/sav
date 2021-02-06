table 50036 "Garnissage Article"
{
    // version CT16V002

    DrillDownPageID = 60184;
    LookupPageID = 60184;

    fields
    {
        field(1;"Code Garanissage";Code[10])
        {
        }
        field(2;Description;Text[100])
        {
        }
        field(3;"Description Toyota";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code Garanissage")
        {
        }
    }

    fieldgroups
    {
    }
}

