table 50060 "Sou-Famille frais."
{
    DrillDownPageID = 50064;
    LookupPageID = 50064;

    fields
    {
        field(1;"Code Famille";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Sous-Famille";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Désignation";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code Famille","Sous-Famille")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Sous-Famille","Désignation")
        {
        }
    }
}

