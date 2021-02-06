page 60004 "Emissions Test Category List"
{
    // version Automobile @Discovery 2013

    CaptionML = ENU='Emissions Test Category List',
                FRA='Liste Catégorie de tests d''émission';
    PageType = List;
    SourceTable = Table60004;

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

