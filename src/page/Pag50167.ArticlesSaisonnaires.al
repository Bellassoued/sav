page 50167 "Articles Saisonnaires"
{
    PageType = List;
    SourceTable = Table50108;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Article";"No. Article")
                {
                }
                field(Janvier;Janvier)
                {
                }
                field(Fevrier;Fevrier)
                {
                }
                field(Mars;Mars)
                {
                }
                field(Avril;Avril)
                {
                }
                field(Mai;Mai)
                {
                }
                field(Juin;Juin)
                {
                }
                field(Juillet;Juillet)
                {
                }
                field(Aout;Aout)
                {
                }
                field(Septembre;Septembre)
                {
                }
                field(Octobre;Octobre)
                {
                }
                field(Novembre;Novembre)
                {
                }
                field(Decembre;Decembre)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Import Article Saisonnaire")
            {
                Image = XMLFile;
                RunObject = XMLport 50065;
            }
        }
    }
}

