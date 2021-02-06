page 60143 "Fiche Parametre Control"
{
    // version Preparation VN

    PageType = Card;
    SourceTable = Table60027;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("Group No";"Group No")
                {
                }
                field(Description;Description)
                {
                }
                field("Type Control";"Type Control")
                {
                }
            }
            part(;60144)
            {
                SubPageLink = Group=FIELD(Group No);
            }
        }
    }

    actions
    {
    }
}

