page 69031 "RC - Garantie"
{
    // version MAZDA307

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;69032)
                {
                }
                part(;50091)
                {
                }
            }
            group()
            {
                part(;69003)
                {
                }
                part(;69001)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Etat des vente VN  par Chassis")
            {
                Image = Statistics;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 60025;
            }
        }
        area(embedding)
        {
            action("SAV - Liste des Véhicules")
            {
                RunObject = Page 60066;
                RunPageMode = View;
            }
            action("Liste des clients")
            {
                Image = Customer;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 22;
                RunPageMode = View;
            }
            action("Liste des article")
            {
                RunObject = Page 31;
            }
            action("Liste des commandes de service")
            {
                Image = ServiceMan;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 9318;
                RunPageMode = View;
            }
            action("Liste des devis de service")
            {
                Image = ServiceMan;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 9317;
                RunPageMode = View;
            }
            action("Historique Ancien dossiers")
            {
                RunObject = Page 60118;
            }
            action("Posted Sales Shipments")
            {
                CaptionML = ENU='Posted Sales Shipments',
                            FRA='Expéditions SAV enregistrées';
                Image = PostedShipment;
                RunObject = Page 5974;
            }
            action("Posted Sales Invoices")
            {
                CaptionML = ENU='Posted Sales Invoices',
                            FRA='Factures SAV enregistrées';
                Image = PostedOrder;
                RunObject = Page 5977;
            }
            action("Écritures garantie")
            {
                Caption = 'Écritures garantie';
                RunObject = Page 5913;
            }
        }
        area(sections)
        {
            group("Gestion Projets")
            {
                Caption = 'Gestion Projets';
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
        }
    }
}

