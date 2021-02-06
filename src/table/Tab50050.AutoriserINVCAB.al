table 50050 "Autoriser INV CAB"
{
    DrillDownPageID = 60346;
    LookupPageID = 60346;

    fields
    {
        field(1;"User ID";Code[50])
        {
            TableRelation = "User Setup";
        }
        field(2;Magasin;Code[10])
        {
            TableRelation = Location;
        }
        field(3;"Autoriser Ecran INV";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"User ID",Magasin)
        {
        }
    }

    fieldgroups
    {
    }
}

