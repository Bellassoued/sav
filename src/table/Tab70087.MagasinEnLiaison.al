table 70087 "Magasin En Liaison"
{
    DrillDownPageID = 70185;
    LookupPageID = 70185;

    fields
    {
        field(1;"Code Magasin CT";Code[10])
        {
            TableRelation = Location;
        }
        field(2;"Code Magasin El Liaison CT";Code[10])
        {
            TableRelation = Location;
        }
        field(3;Description;Text[80])
        {
        }
    }

    keys
    {
        key(Key1;"Code Magasin CT","Code Magasin El Liaison CT")
        {
        }
    }

    fieldgroups
    {
    }
}

