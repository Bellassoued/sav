page 60007 "Marke List"
{
    // version Automobile @Discovery 2013

    CaptionML = ENU='Marke List',
                FRA='Liste Marque';
    PageType = List;
    SourceTable = Table60007;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code;Code)
                {
                }
                field(Name;Name)
                {
                }
            }
        }
    }

    actions
    {
    }
}

