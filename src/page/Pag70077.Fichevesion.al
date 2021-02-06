page 70077 "Fiche vesion"
{
    PageType = Card;
    SourceTable = Table50033;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("Code version";"Code version")
                {
                }
                field(Description;Description)
                {
                }
                field(Biton;Biton)
                {
                }
                field("Biton Par Défaut";"Biton Par Défaut")
                {
                }
            }
            part(;70076)
            {
                SubPageLink = Code version=FIELD(Code version);
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Prix Version")
            {
                Image = price;
                RunObject = Page 70078;
                RunPageLink = Code version=FIELD(Code version);
            }
            action("Import Version")
            {
                Image = XMLFile;

                trigger OnAction();
                var
                    LXmlImportListVersion : XMLport "50015";
                begin
                    //SM 060917OLD LXmlImportListVersion.FctSetDocVersionNo("Code version");
                    LXmlImportListVersion.RUN;
                end;
            }
        }
    }
}

