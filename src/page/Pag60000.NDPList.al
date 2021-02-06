page 60000 "NDP List"
{
    // version Automobile @Discovery 2013

    CaptionML = ENU='NDP List',
                FRA='Liste NDP';
    PageType = List;
    SourceTable = Table60000;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code NDP";"Code NDP")
                {
                }
                field(Désignation;Désignation)
                {
                }
                field(Origine;Origine)
                {
                }
                field(Taxes;Taxes)
                {
                }
                field(Pièce;Pièce)
                {
                }
                field(Véhicules;Véhicules)
                {
                }
                field(Complément;Complément)
                {
                }
                field("Code article";"Code article")
                {
                }
                field(QCS;QCS)
                {
                }
            }
        }
    }

    actions
    {
    }
}

