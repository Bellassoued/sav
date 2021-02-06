page 69094 "Appro VN RC"
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
                part(;69061)
                {
                }
            }
            group()
            {
                part(;760)
                {
                }
                part(;9150)
                {
                }
                part(;9152)
                {
                }
                systempart(MyNotes;MyNotes)
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
            action("Etat des vente Leasing")
            {
                RunObject = Report 60252;
            }
            action("Suivi-activités VN DG")
            {
                RunObject = Report 60195;
            }
            action("Etat disponibilités des véhicules")
            {
                Image = Allocations;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60114;
            }
            action("Etat disp. des véhicules Global")
            {
                Image = "report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60115;
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
                RunObject = Report 60121;
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
            action("Report VENTE VN par modele/date")
            {
                Caption = 'Report VENTE VN par modele/date';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 60139;
            }
            action("Report VENTE VN par centre gest/model")
            {
                Caption = 'Report VENTE VN par centre gest/model';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 60122;
            }
            action("Evolution Ventes")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60102;
            }
            action("Etat de réservation")
            {
                Caption = 'Etat de réservation';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60117;
            }
            action("Suivie des arrivages")
            {
                Caption = 'Suivie des arrivages';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 60118;
            }
            action("Salesperson - Sales &Statistics")
            {
                CaptionML = ENU='Salesperson - Sales &Statistics',
                            FRA='Vendeurs : &Statistiques ventes';
                Image = "Report";
                RunObject = Report 114;
            }
            action("Price &List")
            {
                CaptionML = ENU='Price &List',
                            FRA='CA VN par Client';
                Image = "Report";
                RunObject = Report 60036;
            }
            action("CA VN par Centre de Gestion")
            {
                CaptionML = ENU='CA VN par Centre de Gestion',
                            FRA='CA VN par Centre de Gestion';
                Image = "Report";
                RunObject = Report 60038;
            }
            action("Reporting Journalier")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60116;
            }
            action("Etat des vente VN Par Chassis")
            {
                Image = Statistics;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 60025;
            }
        }
        area(embedding)
        {
            action("VN arrivage")
            {
                RunObject = Page 70041;
            }
            action("Liste des VIN+CAF archivés")
            {
                RunObject = Page 70058;
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
            action("Sales Return Orders")
            {
                CaptionML = ENU='Sales Return Orders',
                            FRA='Retours vente';
                Image = ReturnOrder;
                RunObject = Page 60086;
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
            action("Liste des vehicules")
            {
                RunObject = Page 5981;
            }
            action(Customers)
            {
                CaptionML = ENU='Customers',
                            FRA='Clients';
                Image = Customer;
                RunObject = Page 22;
            }
            action("Page Carte Grises List")
            {
                CaptionML = ENU=' Carte Grises List',
                            FRA='Carte grises';
                RunObject = Page 60074;
            }
            action("Bordereau PVN")
            {
                RunObject = Page 70035;
            }
            action("Contact list")
            {
                CaptionML = ENU='Contact list',
                            FRA='Liste des Contacts';
                RunObject = Page 5052;
            }
            action("Liste des KATASHIKI")
            {
                RunObject = Page 60181;
            }
            action("Liste des SFX")
            {
                RunObject = Page 60182;
            }
            action("Liste des couleurs Ext.")
            {
                RunObject = Page 60183;
            }
            action("Liste Option")
            {
                RunObject = Page 69093;
            }
            action("Liste Ligne Kit Option")
            {
                RunObject = Page 69092;
            }
            action("Liste des couleurs Int.")
            {
                RunObject = Page 60184;
            }
            action("Approbation des devis")
            {
                RunObject = Page 658;
            }
            action("commande achat")
            {
                CaptionML = ENU='commande achat',
                            FRA='commande achat vn';
                RunObject = Page 60075;
            }
            action("Historique Approbation")
            {
                RunObject = Page 662;
            }
            action("Liste des accesoirs")
            {
                Caption = 'Liste des accesoirs';
                RunObject = Page 60128;
            }
            action("Véhicules Stock")
            {
                RunObject = Page 70298;
            }
            action("Liste Carte Grise")
            {
                RunObject = Page 50112;
            }
            action("Liste Réception Achat")
            {
                RunObject = Page 7332;
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
                action("Réceptions Achat Enregistrées")
                {
                    RunObject = Page 7333;
                }
            }
        }
        area(creation)
        {
            action("Feuile Véhicule")
            {
                Image = TransferOrder;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 393;
            }
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
            action("Sales &Return Order")
            {
                CaptionML = ENU='Sales &Return Order',
                            FRA='&Retour vente';
                Image = ReturnOrder;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 60087;
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
                RunObject = Page 7002;
            }
            action("Navi&gate")
            {
                CaptionML = ENU='Navi&gate',
                            FRA='Navi&guer';
                Image = Navigate;
                RunObject = Page 344;
            }
            action("Attestation de vente")
            {
                Image = Certificate;
                RunObject = Report 50057;
            }
        }
    }
}

