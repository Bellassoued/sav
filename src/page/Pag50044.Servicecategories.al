page 50044 "Service categories"
{
    CaptionML = ENU='Service categories',
                FRA='Categorie de Service';
    PageType = List;
    SourceTable = Table60030;

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

