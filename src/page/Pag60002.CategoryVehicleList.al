page 60002 "Category Vehicle List"
{
    // version Automobile @Discovery 2013

    CaptionML = ENU='Category Vehicle List',
                FRA='Liste Catégorie Véhicule';
    PageType = List;
    SourceTable = Table60003;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Make Code";"Make Code")
                {
                }
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

