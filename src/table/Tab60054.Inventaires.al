table 60054 "Inventaires"
{
    DrillDownPageID = 69070;
    LookupPageID = 69070;

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"Location Code";Code[20])
        {
            Caption = 'Code Magasin';
        }
        field(3;"Bin Filter";Text[30])
        {
            Caption = 'Filtre Emplacement';
        }
        field(4;"Date Création";DateTime)
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }
}

