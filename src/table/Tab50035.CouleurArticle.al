table 50035 "Couleur Article"
{
    // version CT16V002

    DrillDownPageID = 60183;
    LookupPageID = 60183;

    fields
    {
        field(1;"Code Couleur";Code[10])
        {
        }
        field(2;Description;Text[80])
        {
        }
        field(3;"Description Toyota";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code Couleur")
        {
        }
    }

    fieldgroups
    {
    }
}

