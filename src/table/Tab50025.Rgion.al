table 50025 "Région"
{
    DrillDownPageID = 70172;
    LookupPageID = 70172;

    fields
    {
        field(1;"Code";Code[10])
        {
        }
        field(2;"Désignation";Code[50])
        {
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
        fieldgroup(DropDown;"Code","Désignation")
        {
        }
    }
}

