table 50084 "Type Compagne"
{
    // version SAVCompagne

    DrillDownPageID = 50108;
    LookupPageID = 50108;

    fields
    {
        field(1;"Type Compagne";Option)
        {
            OptionCaptionML = ENU='<  ,4KET,5KET,15OSD>',
                              FRA=' ,4KET,5KET,15OSD';
            OptionMembers = " ","4KET","5KET","15OSD";
        }
        field(2;Blocage;Option)
        {
            OptionCaption = 'Oui,Non,Avis garantie';
            OptionMembers = Oui,Non,"Avis garantie";
        }
    }

    keys
    {
        key(Key1;"Type Compagne")
        {
        }
    }

    fieldgroups
    {
    }
}

