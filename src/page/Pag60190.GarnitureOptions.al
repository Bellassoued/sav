page 60190 "Garniture Options"
{
    PageType = Document;
    SourceTable = Table50036;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("Code Garanissage";"Code Garanissage")
                {
                }
                field(Description;Description)
                {
                }
            }
            part(;60188)
            {
                SubPageLink = Code=FIELD(Code Garanissage),
                              Option Type=FILTER(Garnissage);
            }
        }
    }

    actions
    {
    }
}

