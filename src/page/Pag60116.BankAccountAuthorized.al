page 60116 "Bank Account Authorized"
{
    CaptionML = ENU='Bank Account List',
                FRA='Liste des comptes bancaires autorisés';
    Editable = true;
    PageType = ListPart;
    SourceTable = Table60018;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No. Article";"No. Article")
                {
                }
                field(Désignation;Désignation)
                {
                }
            }
        }
    }

    actions
    {
    }
}

