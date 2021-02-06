page 60003 "Vehicule type List"
{
    // version Automobile @Discovery 2013

    CaptionML = ENU='Vehicule type List',
                FRA='Liste Type Véhicule';
    PageType = List;
    SourceTable = Table60002;

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
                field(Category;Category)
                {
                }
            }
        }
    }

    actions
    {
    }
}

