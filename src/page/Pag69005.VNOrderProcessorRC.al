page 69005 "VN - Order Processor RC"
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
            action("Vehicules disponible et réservées")
            {
                Image = AvailableToPromise;
                RunObject = Report 60115;
            }
            action("Commissions VN")
            {
                RunObject = Report 70099;
                Visible = false;
            }
            action("Vente VN par vendeur/Model")
            {
                Image = Sales;
                RunObject = Report 60121;
            }
            action("Vehicules Stock disponible et réservées")
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
            action("Etat Arrivage")
            {
                Image = PeriodEntries;
                RunObject = Report 60016;
            }
            action("Statistiques arrivage VN")
            {
                Image = "Report";
                RunObject = Report 60247;
            }
            action("60246")
            {
                Caption = 'Etat de stock par couleur';
                RunObject = Report 60246;
            }
            action("Report Suivi activité VN ")
            {
                Caption = '"Report Suivi activité VN "';
                RunObject = Report 60195;
            }
            action("Etat des ventes Leasing")
            {
                RunObject = Report 60252;
            }
            action("Liste Voitures Populaire")
            {
                RunObject = Page 50177;
            }
        }
        area(embedding)
        {
            action("VN arrivage")
            {
                RunObject = Page 70280;
            }
            action("Liste des VIN+CAF archivés")
            {
                RunObject = Page 70058;
                Visible = false;
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
            }
            action("Sales Return Orders")
            {
                CaptionML = ENU='Sales Return Orders',
                            FRA='Retours vente';
                Image = ReturnOrder;
                RunObject = Page 60086;
                Visible = false;
            }
            action("Avoir Vente VN")
            {
                RunObject = Page 60092;
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
            action("Accessoires VN")
            {
                CaptionML = ENU='List des Accessoires',
                            FRA='List des Accessoires';
                RunObject = Page 60377;
            }
            action("Véhicules Stock")
            {
                RunObject = Page 50187;
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
            }
            action("Liste des versions")
            {
                RunObject = Page 60181;
                Visible = false;
            }
            action("Liste des pers")
            {
                RunObject = Page 60182;
                Visible = false;
            }
            action("Liste des couleurs")
            {
                RunObject = Page 60183;
                Visible = false;
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
            action("Liste des garnissages")
            {
                RunObject = Page 60184;
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
            action("Liste des accessoirs vendus")
            {
                CaptionML = ENU='Liste des accessoires Vendus',
                            FRA='Liste des accessoires Vendus';
                RunObject = Page 60128;
            }
            action("Liste des campagnes")
            {
                RunObject = Page 5087;
                Visible = false;
            }
            action("Cartes Carburant Non Livrées")
            {
                RunObject = Page 60319;
                RunPageView = WHERE(Carte Carburant livrée=CONST(No));
                Visible = false;
            }
            action("Voitures Populaire VPP")
            {
                RunObject = Page 50177;
            }
            action("VIN Facturé Non Livré")
            {
                RunObject = Page 60333;
            }
            action("Liste Livraison")
            {
                RunObject = Page 70274;
            }
        }
        area(sections)
        {
            group("Carte Grise")
            {
                CaptionML = ENU='Carte Grise',
                            FRA='Carte Grise';
                Image = FiledPosted;
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
                action("Bordereaux PVN")
                {
                    RunObject = Page 70035;
                }
                action("Lignes Bordereaux PVN")
                {
                    RunObject = Page 60309;
                }
            }
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
                    Visible = false;
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
            action("Import VIN+CAF")
            {
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = XMLport 70003;
                Visible = false;
            }
            action("Import Facture Cpl.")
            {
                RunObject = Report 60187;
                Visible = false;
            }
        }
    }
}

