page 60189 "Couleur Options"
{
    // version CT16V002

    PageType = Document;
    SourceTable = Table50035;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("Code Couleur";"Code Couleur")
                {
                }
                field(Description;Description)
                {
                }
            }
            part(;60188)
            {
                SubPageLink = Code=FIELD(Code Couleur),
                              Option Type=FILTER(Couleur);
            }
        }
    }

    actions
    {
    }
}

