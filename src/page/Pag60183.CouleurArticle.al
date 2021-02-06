page 60183 "Couleur Article"
{
    // version CT16V002

    CardPageID = "Couleur Options";
    PageType = List;
    SourceTable = Table50035;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Couleur";"Code Couleur")
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
            action("Liste des couleurs")
            {
                RunObject = Page 60188;
                RunPageLink = Code=FIELD(Code Couleur),
                              Option Type=FILTER(Couleur);
            }
        }
    }
}

