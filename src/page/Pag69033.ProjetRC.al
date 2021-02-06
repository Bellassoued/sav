page 69033 "Projet RC"
{
    // version NAVW17.10,MAZDA307

    CaptionML = ENU='Role Center',
                FRA='Tableau de bord';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;50091)
                {
                }
            }
            group()
            {
                part(;9150)
                {
                }
                part(;9152)
                {
                }
                systempart(;MyNotes)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
        }
        area(embedding)
        {
            action("Liste Projets")
            {
                RunObject = Page 50091;
            }
            action("Commandes Achat Projets")
            {
                RunObject = Page 9307;
            }
            action("Factures Achat")
            {
                RunObject = Page 146;
            }
            action("Liste Articles")
            {
                RunObject = Page 50094;
            }
        }
        area(creation)
        {
        }
        area(processing)
        {
        }
    }
}

