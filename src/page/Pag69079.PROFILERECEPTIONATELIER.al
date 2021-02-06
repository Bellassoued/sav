page 69079 "PROFILE RECEPTION ATELIER"
{
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;69003)
                {
                }
                systempart(;Notes)
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
            action("Liste entrée stock Démontage")
            {
                RunObject = Page 50033;
            }
            action("Liste sortie stock Montage")
            {
                RunObject = Page 50011;
            }
            action("Liste commande Achat")
            {
                RunObject = Page 9307;
            }
            action("Liste des demande d'achat")
            {
                Caption = 'Liste des demande d''achat';
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 9306;
            }
            action("Liste des réparations interne")
            {
                RunObject = Page 60158;
            }
            action("Historique Ancien dossiers")
            {
                RunObject = Page 60118;
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                CaptionML = ENU='Posted Documents',
                            FRA='Documents validés';
                Image = FiledPosted;
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
                separator()
                {
                }
                action("Liste Entrée démontage Enregistré")
                {
                    RunObject = Page 50038;
                }
                action("Liste sortie montage enregistré")
                {
                    RunObject = Page 50012;
                }
            }
        }
    }
}

