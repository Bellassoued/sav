table 50037 "Sous activity"
{
    DrillDownPageID = 60185;
    LookupPageID = 60185;

    fields
    {
        field(1;"Code Sous activity";Code[20])
        {
        }
        field(2;"Code Activity";Option)
        {
            OptionCaptionML = ENU=' ,PR,VN,Service,Frais Généraux,Marketing,Projet',
                              FRA=' ,PR,VN,Service,Frais Généraux,Marketing,Projet';
            OptionMembers = " ",PR,VN,Service,"Frais Généraux",Marketing,Projet;
        }
        field(3;Description;Text[80])
        {
        }
    }

    keys
    {
        key(Key1;"Code Sous activity","Code Activity")
        {
        }
    }

    fieldgroups
    {
    }
}

