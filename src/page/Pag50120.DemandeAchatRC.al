page 50120 "Demande Achat RC"
{
    // version VN TRANSIT

    CaptionML = ENU='Role Center',
                FRA='Tableau de bord';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            Caption = 'Demande Achat';
            group()
            {
                part(;50121)
                {
                }
            }
        }
    }

    actions
    {
        area(embedding)
        {
            action("Liste des demandes achat")
            {
                RunObject = Page 50006;
            }
            action("Liste des commandes achat")
            {
                RunObject = Page 50114;
            }
        }
    }
}

