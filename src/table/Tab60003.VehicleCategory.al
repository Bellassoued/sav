table 60003 "Vehicle Category"
{
    // version RAD AUTO

    CaptionML = ENU='Vehicle Category',
                FRA='Catégorie véhicule';
    DataPerCompany = false;
    DrillDownPageID = 60002;
    LookupPageID = 60002;

    fields
    {
        field(1;"Make Code";Code[10])
        {
            CaptionML = ENU='Make Code',
                        FRA='Code Marque';
            TableRelation = Make.Code;
        }
        field(2;"Code";Code[20])
        {
            CaptionML = ENU='Code',
                        FRA='Code';
        }
        field(3;Name;Text[50])
        {
            CaptionML = ENU='Name',
                        FRA='Nom';
        }
    }

    keys
    {
        key(Key1;"Make Code","Code")
        {
        }
    }

    fieldgroups
    {
    }
}

