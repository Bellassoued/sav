page 69015 "Marketting RC"
{
    // version NAVW17.10

    CaptionML = ENU='Role Center',
                FRA='Tableau de bord';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;5087)
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
            action("CA SAV")
            {
                RunObject = Report 50032;
            }
            action("Etat chiffre d'affaires PR")
            {
                Image = Sales;
                RunObject = Report 50024;
            }
            action("Etat chiffre d'affaires SAV")
            {
                Image = ServiceLedger;
                RunObject = Report 50032;
            }
            action("Réalisation Comptoir PR/ Site")
            {
                Image = Sales;
                RunObject = Report 50031;
            }
            action("Chiffre D'affaire par Client")
            {
                Image = Customer;
                RunObject = Report 50030;
            }
            action("Etat de stock Mag. Transit")
            {
                Image = "report";
                RunObject = Report 60294;
            }
        }
        area(processing)
        {
            action("Chiffre d'affaires mensuel SAV")
            {
                RunObject = Report 60107;
            }
            action("Situation mensuelle des OR")
            {
                RunObject = Report 60108;
            }
            action("CA Atelier Citroen France")
            {
                RunObject = Report 60109;
            }
            action("CA HT MAGASIN PR")
            {
                RunObject = Report 60171;
            }
            action("Chiffre d'affaires par client/Centre de gestion")
            {
                CaptionML = ENU='Chiffre d''affaires par client/Centre de gestion',
                            FRA='Chiffre d''affaires par client/Centre de gestion';
                RunObject = Report 60175;
            }
        }
        area(embedding)
        {
            action("Liste Compagnes")
            {
                RunObject = Page 5087;
            }
            action("Commandes Achat Marketing")
            {
                RunObject = Page 9307;
            }
            action("Factures Achat")
            {
                RunObject = Page 146;
            }
            action("Liste Articles")
            {
                RunObject = Page 60177;
            }
        }
        area(creation)
        {
        }
    }
}

