table 60005 "Engine Type"
{
    // version RAD AUTO

    CaptionML = ENU='Engine Type',
                FRA='Type de Moteur';
    DataPerCompany = false;
    DrillDownPageID = 60005;
    LookupPageID = 60005;

    fields
    {
        field(1;"Code";Code[20])
        {
            CaptionML = ENU='Code',
                        FRA='Code';
        }
        field(2;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
        }
        field(3;"Fuel Type";Option)
        {
            CaptionML = ENU='Fuel Type',
                        FRA='Type Carburant';
            OptionCaptionML = ENU=' ,Gas,Diesel,Natural Gas,Hydrogen,Electric',
                              FRA=' ,Essence,Diesel,GPL,Hydrogène,Électrique';
            OptionMembers = " ",Gas,Diesel,"Natural Gas",Hydrogen,Electric;
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
    }
}

