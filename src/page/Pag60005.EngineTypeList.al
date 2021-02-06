page 60005 "Engine Type List"
{
    // version Automobile @Discovery 2013

    CaptionML = ENU='Engine Type list',
                FRA='Liste Type de Mouteur';
    PageType = List;
    SourceTable = Table60005;

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
                field("Fuel Type";"Fuel Type")
                {
                }
            }
        }
    }

    actions
    {
    }
}

