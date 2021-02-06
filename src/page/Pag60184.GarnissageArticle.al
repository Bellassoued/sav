page 60184 "Garnissage Article"
{
    // version CT16V002

    CardPageID = "Garniture Options";
    PageType = List;
    SourceTable = Table50036;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Garanissage";"Code Garanissage")
                {
                }
                field(Description;Description)
                {
                }
                field("Description Toyota";"Description Toyota")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Liste des garnitures")
            {
                RunObject = Page 60188;
                RunPageLink = Code=FIELD(Code Garanissage),
                              Option Type=FILTER(Garnissage);
            }
        }
    }
}

