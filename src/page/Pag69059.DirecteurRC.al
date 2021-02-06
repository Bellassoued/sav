page 69059 "Directeur - RC"
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
                part(;69023)
                {
                }
                part(;69025)
                {
                }
            }
            group()
            {
                chart("Devis VN ouvert Par Jours")
                {
                    Caption = 'Devis VN ouvert Par Jours';
                    ChartPartID = 'DEVIS/MOIS';
                }
                chart("Nombre de Vehicules Vendues par Jour")
                {
                    Caption = 'Nombre de Vehicules Vendues par Jour';
                    ChartPartID = 'FACTUREVN';
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
        area(embedding)
        {
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
            }
            action("Completely Shipped Not Invoiced")
            {
                CaptionML = ENU='Completely Shipped Not Invoiced',
                            FRA='Complètement livré non facturé';
                RunObject = Page 60083;
                RunPageView = WHERE(Completely Shipped=CONST(Yes),
                                    Invoice=CONST(No));
            }
            action("Sales Quotes")
            {
                CaptionML = ENU='Sales Quotes',
                            FRA='Devis';
                Image = Quote;
                RunObject = Page 60080;
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
            }
            action("Navi&gate")
            {
                CaptionML = ENU='Navi&gate',
                            FRA='Navi&guer';
                Image = Navigate;
                RunObject = Page 344;
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
                action("Réceptions transfer de")
                {
                    Caption = 'Réceptions transfer de';
                    RunObject = Page 50040;
                }
                action("Réceptions transfer vers")
                {
                    Caption = 'Réceptions transfer vers';
                    RunObject = Page 50041;
                }
            }
        }
        area(reporting)
        {
            action("Etat des vente VN  par Chassis")
            {
                Image = Statistics;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 60025;
            }
            action("Etat disponibilités des véhicules")
            {
                Image = Allocations;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60113;
            }
            action("Etat disp. des véhicules Global")
            {
                Image = "report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60114;
            }
            action("Etat des ventes VN par Centre de gestion")
            {
                Caption = 'ventes VN par Centre de gestion';
                Image = WorkCenter;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60096;
            }
            action("Report CA par Client VN")
            {
                Caption = 'CA par Client VN';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60036;
            }
            action("Report etat vente PS sur VN")
            {
                Caption = 'vente PS sur VN';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60042;
            }
            action("Report Vehicules par emplacement")
            {
                Caption = 'Vehicules par emplacement';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60059;
            }
            action("Report VENTE VN par vendeur")
            {
                Caption = 'VENTE VN par vendeur';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60081;
            }
            action("Report VENTE VN par vendeur par mois")
            {
                Caption = 'VENTE VN par vendeur par mois';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60126;
            }
            action("Report VENTE VN par centre de gestion par mois")
            {
                Caption = 'VENTE VN par centre de gestion par mois';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60127;
            }
            action("Report CA VN par client centre gst")
            {
                Caption = 'CA VN par client centre gst';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60038;
            }
            action("Tracabilité Chassi VN")
            {
                Caption = 'Traçabilité Chassis';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60097;
            }
            action()
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60098;
            }
        }
    }
}

