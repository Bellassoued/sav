table 70097 "Mapping Magasin 2"
{
    DrillDownPageID = 90001;
    LookupPageID = 90001;

    fields
    {
        field(1;"OLD Magasin";Code[10])
        {
        }
        field(2;"OLD Bin";Code[10])
        {
        }
        field(3;"New Magasin";Code[10])
        {
        }
    }

    keys
    {
        key(Key1;"OLD Magasin","OLD Bin")
        {
        }
    }

    fieldgroups
    {
    }
}

