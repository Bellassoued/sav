page 69026 "VN - RESPONSABLE SHOWROOM RC"
{
    // version NAVW17.10,MAZDA15

    CaptionML = ENU='Role Center',
                FRA='Tableau de bord';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;69027)
                {
                }
            }
            group()
            {
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
        area(embedding)
        {
            action("VN Arrivage")
            {
                RunObject = Page 70280;
            }
            action("Sales Orders")
            {
                CaptionML = ENU='Sales Orders',
                            FRA='Commandes vente';
                Image = "Order";
                RunObject = Page 60083;
            }
            action("Shipped Not Invoiced")
            {
                CaptionML = ENU='Shipped Not Invoiced',
                            FRA='Livré non facturé';
                RunObject = Page 60083;
                RunPageView = WHERE(Shipped Not Invoiced=CONST(Yes));
                Visible = false;
            }
            action("Completely Shipped Not Invoiced")
            {
                CaptionML = ENU='Completely Shipped Not Invoiced',
                            FRA='Complètement livré non facturé';
                RunObject = Page 60083;
                RunPageView = WHERE(Completely Shipped=CONST(Yes),
                                    Invoice=CONST(No));
                Visible = false;
            }
            action("Sales Quotes")
            {
                CaptionML = ENU='Sales Quotes',
                            FRA='Devis';
                Image = Quote;
                RunObject = Page 60080;
                Visible = true;
            }
            action("vehicules list")
            {
                CaptionML = ENU='Items',
                            FRA='Modèle de Véhicule';
                Image = Item;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 60017;
                RunPageMode = View;
            }
            action(Customers)
            {
                CaptionML = ENU='Customers',
                            FRA='Clients';
                Image = Customer;
                RunObject = Page 22;
            }
            action("Sales &Prices")
            {
                CaptionML = ENU='Sales &Prices',
                            FRA='Prix vente';
                Image = SalesPrices;
                RunObject = Page 60117;
                RunPageView = WHERE(Groupe compta stock=FILTER(ACCESSOIRE|VEHICULES));
                Visible = false;
            }
            action("Liste des accesoirs")
            {
                Caption = 'Liste des accesoirs';
                RunObject = Page 60128;
                Visible = false;
            }
            action("Bordereaux PVN")
            {
                RunObject = Page 60309;
            }
            action("Bordereau carte grise")
            {
                RunObject = Page 60074;
                Visible = false;
            }
            action("Liste Carte Grise")
            {
                RunObject = Page 69054;
            }
            action("Liste des VIN en STOCK")
            {
                RunObject = Page 70283;
            }
            action("List Véhicules")
            {
                RunObject = Page 60311;
            }
            action("Accessoires VN")
            {
                RunObject = Page 60377;
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
                                FRA='Expéditions vente enregistrées';
                    Image = PostedShipment;
                    RunObject = Page 60107;
                }
                action("Posted Sales Invoices")
                {
                    CaptionML = ENU='Posted Sales Invoices',
                                FRA='Factures vente enregistrées';
                    Image = PostedOrder;
                    RunObject = Page 60104;
                }
                action("Posted Return Receipts")
                {
                    CaptionML = ENU='Posted Return Receipts',
                                FRA='Réceptions retour enregistrées';
                    Image = PostedReturnReceipt;
                    RunObject = Page 60113;
                }
                action("Posted Sales Credit Memos")
                {
                    CaptionML = ENU='Posted Sales Credit Memos',
                                FRA='Avoirs vente enregistrés';
                    Image = PostedOrder;
                    RunObject = Page 60110;
                }
            }
        }
        area(creation)
        {
            action("<Page Sales Quote>")
            {
                CaptionML = ENU='Sales &Quote',
                            FRA='&Devis';
                Image = Quote;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 60081;
                RunPageMode = Create;
            }
            action("Sales &Order")
            {
                CaptionML = ENU='Sales &Order',
                            FRA='&Commande vente';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 60084;
                RunPageMode = Create;
            }
            action("Analyse Activité VN")
            {
                Image = StatisticsDocument;
                RunObject = Page 60150;
            }
        }
        area(processing)
        {
            action("Sales &Prices")
            {
                CaptionML = ENU='Sales &Prices',
                            FRA='&Prix vente';
                Image = SalesPrices;
                RunObject = Page 60117;
                RunPageView = WHERE(Groupe compta stock=FILTER(ACCESSOIRE|VEHICULES));
                Visible = false;
            }
            action("Navi&gate")
            {
                CaptionML = ENU='Navi&gate',
                            FRA='Navi&guer';
                Image = Navigate;
                RunObject = Page 344;
            }
        }
        area(reporting)
        {
            action("Vente VN par vendeur/Model")
            {
                Image = Sales;
                RunObject = Report 60121;
            }
            action("Vehicules disponible et réservées")
            {
                Image = AvailableToPromise;
                RunObject = Report 60115;
            }
            action("Devis émis par commercial")
            {
                Image = Quote;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Report 50077;
            }
            action("Age de Stock VN Détail")
            {
                Image = "Report";
                RunObject = Report 60249;
            }
        }
    }
}

