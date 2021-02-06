page 69010 "Receptionnaire General RC"
{
    // version SAV Automobile

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;69009)
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
        area(creation)
        {
            action("Créer Réception CHRONO")
            {
                Caption = 'Créer Réception Service Rapide';
                Image = Resource;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page 60014;
                RunPageMode = Create;
            }
            action("Page Change Status Reception")
            {
                Image = Quote;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page 60172;
                RunPageMode = Create;
                Visible = false;
            }
            action("Créer Réception ATELIER")
            {
                Caption = 'Créer Réception Grandes Réparation';
                Image = ServiceAccessories;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 60018;
                RunPageMode = Create;
            }
            action("Report journee commercial SAV")
            {
                Image = Quote;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Report 60045;
                RunPageMode = Create;
            }
            action("Créer Devis")
            {
                Image = Quote;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page 5964;
                RunPageMode = Create;
            }
            group()
            {
                action("Journée Commercial SAV")
                {
                    Image = "Report";
                    Promoted = true;
                    PromotedIsBig = true;
                }
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
                action("Expéditions transfer de ")
                {
                    CaptionML = ENU='Posted Transfer Shipments from',
                                FRA='Expéditions transfer de';
                    RunObject = Page 50025;
                }
                action("Expéditions transfer vers")
                {
                    RunObject = Page 50039;
                }
            }
        }
        area(reporting)
        {
            action(TEST)
            {
                RunObject = Report 60138;
            }
        }
    }
}

