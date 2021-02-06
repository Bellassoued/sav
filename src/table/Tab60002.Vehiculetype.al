table 60002 "Vehicule type"
{
    // version RAD AUTO

    CaptionML = ENU='Vehicule type',
                FRA='Type Vehicule';
    DataPerCompany = false;
    DrillDownPageID = 60003;
    LookupPageID = 60003;

    fields
    {
        field(1;"Code";Code[20])
        {
            CaptionML = ENU='Code',
                        FRA='Code';
        }
        field(2;Name;Text[100])
        {
            CaptionML = ENU='Name',
                        FRA='Nom';
        }
        field(3;Category;Option)
        {
            CaptionML = ENU='Category',
                        FRA='Catégorie';
            OptionCaptionML = ENU=' ,Motorbike,Car,Truck,Motor Home,Bus',
                              FRA=' ,Motocyclette,Véhicule,Camion,Camping-car,Autobus';
            OptionMembers = " ",Motocyclette,"Véhicule",Camion,"Camping-car",Autobus;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
        key(Key2;Name)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DROPDOWN;"Code",Category)
        {
        }
    }
}

