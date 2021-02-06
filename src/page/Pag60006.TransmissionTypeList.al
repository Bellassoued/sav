page 60006 "Transmission Type List"
{
    // version Automobile @Discovery 2013

    CaptionML = ENU='Transmission Type List',
                FRA='Liste Type de Transmission';
    PageType = List;
    SourceTable = Table60006;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code;Code)
                {
                }
                field(Description;Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

