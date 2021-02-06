page 69029 "VN - COMMERCIAL RC"
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
                part(;69030)
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
            action("VN arrivage")
            {
                Caption = 'VN arrivage';
                RunObject = Page 70280;
            }
            action("Sales Quotes")
            {
                CaptionML = ENU='Sales Quotes',
                            FRA='Devis Vente';
                Image = Quote;
                RunObject = Page 60080;
                Visible = true;
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
            action("Voitures populaire")
            {
                RunObject = Page 50177;
            }
            action(Customers)
            {
                CaptionML = ENU='Customers',
                            FRA='Liste Des Clients';
                Image = Customer;
                RunObject = Page 22;
            }
            action("Liste Des Contacts")
            {
                RunObject = Page 5052;
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
        }
        area(sections)
        {
            group("Véhicules")
            {
                CaptionML = ENU='Véhicules',
                            FRA='Véhicules';
                action("vehicules list")
                {
                    CaptionML = ENU='Items',
                                FRA='Modèle des Véhicules';
                    Image = Item;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page 60017;
                    RunPageMode = View;
                }
                action("Liste des VIN en stock ")
                {
                    RunObject = Page 70283;
                }
                action("List Véhicules")
                {
                    RunObject = Page 5981;
                }
                action("Accessoires VN")
                {
                    RunObject = Page 60377;
                }
            }
            group("Carte Grise & PVN")
            {
                Caption = 'Carte Grise & PVN';
                action("Bordereaux Carte Grise")
                {
                    RunObject = Page 60074;
                }
                action("Liste Carte Grise")
                {
                    CaptionML = ENU='Liste Carte Grise',
                                FRA='Ligne Carte Grise';
                    RunObject = Page 69054;
                }
                action("Bordereaux PVN")
                {
                    RunObject = Page 60309;
                }
            }
            group("Documents Enregistrés")
            {
                action("Factures Ventes Enregistrées")
                {
                    RunObject = Page 60104;
                }
                action("Avoirs Ventes Enregistrés")
                {
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
            action("Commissions VN")
            {
                RunObject = Report 70099;
            }
            action("Vente VN par vendeur/Model")
            {
                Image = Sales;
                RunObject = Report 60121;
            }
            action("Vehicules disponible et réservées")
            {
                Image = AvailableToPromise;
                RunObject = Report 50129;
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
            action("Statistiques arrivage VN")
            {
                RunObject = Report 60247;
            }
            action("60246")
            {
                Caption = 'Etat de stock par couleur';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Report 60246;
                Visible = false;
            }
            action("60252")
            {
                CaptionML = ENU='Etat des ventes leasing',
                            FRA='Etat des ventes leasing';
                RunObject = Report 60252;
            }
            action("50138")
            {
                CaptionML = ENU='Détails client par facture',
                            FRA='Détails client par facture';
                Image = Customer;
                RunObject = Report 50138;
            }
        }
    }
}

