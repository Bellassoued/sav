page 69078 "VN - Appro."
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
                    Visible = false;
                }
                part(;9150)
                {
                    Visible = false;
                }
                part(;9152)
                {
                    Visible = false;
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
            action("Suivi d'activité VN")
            {
                RunObject = Report 50078;
            }
            action("Etat journalier des commandes")
            {
                RunObject = Report 60093;
                Visible = false;
            }
            action("Dossiers deposes pour immat./J")
            {
                CaptionML = ENU='Dossiers deposes pour immat./J',
                            FRA='Dossiers deposés pour immatriculation';
                RunObject = Report 50072;
                Visible = false;
            }
            action("Report Suivi activité VN DG")
            {
                Caption = 'Report Suivi activité VN DG';
                RunObject = Report 60195;
            }
            action("Vehicules disponible et réservées")
            {
                Image = AvailableToPromise;
                RunObject = Report 60115;
            }
            action("Etat des réservations")
            {
                RunObject = Report 60272;
            }
        }
        area(embedding)
        {
            action("VN arrivage")
            {
                RunObject = Page 70041;
            }
            action("Liste des arrivages archivées")
            {
                RunObject = Page 70058;
            }
            action("Sales Orders")
            {
                CaptionML = ENU='Sales Orders',
                            FRA='Commandes vente';
                Image = "Order";
                RunObject = Page 60083;
                Visible = false;
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
                Visible = false;
            }
            action("Sales Return Orders")
            {
                CaptionML = ENU='Sales Return Orders',
                            FRA='Retours vente';
                Image = ReturnOrder;
                RunObject = Page 60086;
                Visible = false;
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
            action("Véhicules Stock")
            {
                RunObject = Page 70298;
            }
            action(Customers)
            {
                CaptionML = ENU='Customers',
                            FRA='Clients';
                Image = Customer;
                RunObject = Page 22;
            }
            action("Contact list")
            {
                CaptionML = ENU='Contact list',
                            FRA='Liste des Contacts';
                RunObject = Page 5052;
                Visible = false;
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
            action("Liste des couleurs Int.")
            {
                RunObject = Page 60184;
            }
            action("Liste Option")
            {
                RunObject = Page 69093;
                Visible = false;
            }
            action("Liste Ligne Kit Option")
            {
                RunObject = Page 69092;
                Visible = false;
            }
            action("Approbation des devis")
            {
                RunObject = Page 658;
                Visible = false;
            }
            action("Historique Approbation")
            {
                RunObject = Page 662;
                Visible = false;
            }
            action("Liste des accesoirs")
            {
                Caption = 'Liste des accesoirs';
                RunObject = Page 60128;
                Visible = false;
            }
            action("Accessoires VN")
            {
                RunObject = Page 60377;
                Visible = false;
            }
            action("Taux de change")
            {
                RunObject = Page 483;
                RunPageMode = View;
            }
            action("Arrivage VN SS Statistique")
            {
                RunObject = Page 50200;
            }
        }
        area(sections)
        {
            group("Process Achat")
            {
                action("Liste Expéditions")
                {
                    RunObject = Page 70039;
                }
                action("Commande Achat VN")
                {
                    CaptionML = ENU='Commande Achat VN',
                                FRA='Commande Achat VN';
                    RunObject = Page 60075;
                }
                action("Liste Réceptions Achat")
                {
                    RunObject = Page 7332;
                }
                action("Arrivage VN SS Statistique 2")
                {
                    RunObject = Page 50200;
                }
                action("Arrivage VN")
                {
                    RunObject = Page 70241;
                }
            }
            group("Carte Grise")
            {
                CaptionML = ENU='Carte Grise',
                            FRA='Carte Grise';
                Image = FiledPosted;
                Visible = false;
                action("Page Carte Grises List")
                {
                    CaptionML = ENU=' Carte Grises List',
                                FRA='Carte grises';
                    RunObject = Page 60074;
                }
                action("Liste Carte Grise")
                {
                    RunObject = Page 69054;
                }
            }
            group(PVN)
            {
                CaptionML = ENU='PVN',
                            FRA='PVN';
                Image = FiledPosted;
                Visible = false;
                action("Bordereaux PVN")
                {
                    RunObject = Page 70035;
                }
                action("Lignes Bordereaux PVN")
                {
                    RunObject = Page 60309;
                }
            }
            group("Documents validés")
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
                Visible = false;
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
                Visible = false;
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
                Visible = false;
            }
            action("Analyse Activité VN")
            {
                Image = StatisticsDocument;
                RunObject = Page 60150;
                Visible = false;
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
            action("Import VIN+CAF")
            {
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = XMLport 70003;
                Visible = false;
            }
            action("60016")
            {
                Caption = 'Détails arrivage VN';
                RunObject = Report 60016;
            }
        }
    }
}

