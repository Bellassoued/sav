page 69050 "DG - RC"
{
    // version Company Statistics,FIN01

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;69025)
                {
                    Editable = false;
                    Visible = false;
                }
            }
            group()
            {
                part(;69061)
                {
                }
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
                part(;69051)
                {
                }
                part(;69052)
                {
                }
                part(;69053)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Etat de réservation VN")
            {
                Image = Reserve;
                RunObject = Report 50064;
            }
            action("Commission VN ")
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
                RunObject = Report 60115;
            }
            action("Vehicules disponibles")
            {
                RunObject = Report 50063;
                Visible = false;
            }
            action("Reporting journalier")
            {
                Image = Report2;
                RunObject = Report 50051;
            }
            action("Véhicules disponibles réserv")
            {
                RunObject = Report 60114;
            }
            action("Suivi VN par chassis/periode")
            {
                RunObject = Report 60163;
            }
            action("Vente par centre de gestion/date")
            {
                RunObject = Report 60127;
                Visible = false;
            }
            action("Reporting journalier VN")
            {
                RunObject = Report 60116;
            }
            action("Vente VN par vendeur par mois")
            {
                RunObject = Report 50056;
            }
            action("Etude de rentabilité globale")
            {
                RunObject = Report 50068;
            }
            action("Suivi activité avec type moteur")
            {
                RunObject = Report 60195;
            }
            action("Livraison VN par Vendeur/Mois")
            {
                RunObject = Report 50067;
            }
            action("Etat journalier des commandes")
            {
                RunObject = Report 60093;
            }
            action("Etat des livraisons VN")
            {
                RunObject = Report 60106;
            }
            action("Suivi des dossiers en immatriculation")
            {
                Caption = 'Suivi des dossiers en immatriculation';
                RunObject = Report 50065;
            }
            action("Livraison par CG/Vendeur")
            {
                RunObject = Report 50066;
            }
            action("Dossiers deposes pour immat./J")
            {
                CaptionML = ENU='Dossiers deposes pour immat./J',
                            FRA='Dossiers deposés pour immatriculation';
                RunObject = Report 50072;
            }
            action("Suivi Challenge")
            {
                RunObject = Report 60188;
            }
            action("Livraisons mensuelles vendeur")
            {
                RunObject = Report 60189;
            }
            action("Ventes VN Leasing")
            {
                RunObject = Report 60194;
            }
            action("Fiche Stock")
            {
                Image = InventoryJournal;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60074;
            }
            action("Age de stock VN")
            {
                Image = Aging;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 69024;
            }
            action("Ventes/Livraisons par nature d'activité")
            {
                Caption = 'Ventes/Livraisons par nature d''activité';
                Image = SalesShipment;
                RunObject = Report 60230;
            }
            action("Indicateurs logistique VN")
            {
                RunObject = Report 60226;
            }
            action("Stock Total valorisé V3")
            {
                RunObject = Report 60241;
            }
            action("Etat J Comm/Portefeuille")
            {
                CaptionML = ENU='Etat journalier des commandes/Portefueille',
                            FRA='Etat journalier des commandes/Portefueille';
                RunObject = Report 70086;
            }
            action("Véhicules immatriculés/J")
            {
                RunObject = Report 60258;
            }
            action("VU VP Selon les Canaux")
            {
                RunObject = Report 60259;
            }
            action("VU VP Selon CG")
            {
                RunObject = Report 60260;
            }
            action("69050")
            {
                Caption = 'Evolution des résultats VN';
                RunObject = Report 60216;
            }
            action("60286")
            {
                CaptionML = ENU='Dossiers déposés pour immatriculation',
                            FRA='Dossiers déposés pour immatriculation';
                RunObject = Report 60286;
            }
            action("Affectation Ressource Par OR")
            {
                RunObject = Report 50117;
            }
            group("Etat PR")
            {
                Caption = 'Etat PR';
                Visible = false;
                action("Etat chiffre d'affaires PR")
                {
                    Image = Sales;
                    RunObject = Report 50024;
                }
                action("Réalisation Comptoir PR/ Site")
                {
                    Image = Sales;
                    RunObject = Report 50031;
                }
                action("Etat chiffre d'affaires SAV")
                {
                    Image = ServiceLedger;
                    RunObject = Report 50032;
                }
                action("Chiffre D'affaire par Client")
                {
                    Image = Customer;
                    RunObject = Report 50030;
                }
            }
        }
        area(processing)
        {
            action("Reporting journalier Livraisons")
            {
                RunObject = Report 50073;
            }
            action("Commissions Agents VN")
            {
                RunObject = Report 50076;
            }
            action("Reporting Global")
            {
                RunObject = Report 50078;
            }
            action("Chiffre d'affaires par client/Centre de gestion")
            {
                CaptionML = ENU='Chiffre d''affaires par client/Centre de gestion',
                            FRA='Chiffre d''affaires par client/Centre de gestion';
                RunObject = Report 60175;
            }
            action("Suivi activité VN")
            {
                RunObject = Report 60193;
            }
            action("Chiffre d'affaires mensuel SAV")
            {
                RunObject = Report 60107;
            }
            action("Situation mensuelle des OR")
            {
                RunObject = Report 60108;
            }
            action("CA HT MAGASIN PR")
            {
                RunObject = Report 60171;
            }
            action("CA Atelier Citroen France")
            {
                RunObject = Report 60109;
            }
            action("Articles demandés par commande")
            {
                RunObject = Report 60218;
            }
            group("Journée commercial")
            {
                Caption = 'Journée commercial';
                Visible = false;
                group("Journée commerciale")
                {
                    Caption = 'Journée commerciale';
                    action("Journée Commerciale VN")
                    {
                        Caption = 'VN';
                        Image = PrintReport;
                        RunObject = Report 70077;
                    }
                    action("Journée Comercial PR")
                    {
                        Caption = 'PR';
                        Image = PrintReport;
                        RunObject = Report 60061;
                    }
                    action("Journée commerciale atelier.")
                    {
                        Caption = 'SAV';
                        Image = PrintReport;
                        RunObject = Report 70057;
                    }
                    action("Journée Commercial Chrono")
                    {
                        Caption = 'Chrono';
                        Image = PrintReport;
                        RunObject = Report 70059;
                    }
                }
                action("Suivi Châssis/Période")
                {
                    RunObject = Report 60163;
                }
            }
            group(Engagements)
            {
                Visible = false;
                action("Engagement par banque")
                {
                    Caption = 'Engagement par banque';
                    Image = "report";
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report 50041;
                }
                action("Engagement par signature")
                {
                    Caption = 'Engagement par signature';
                    Image = "report";
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Report 50047;
                }
            }
        }
        area(embedding)
        {
            action("Page Reservation Entries VN")
            {
                Caption = 'Reservation VN';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Page 60164;
            }
            action("Conditions bancaires")
            {
                RunObject = Page 69045;
            }
            action("Crédits bancaires")
            {
                RunObject = Page 69046;
            }
            action("Budget charges")
            {
                RunObject = Page 121;
            }
            action("Budget Ventes")
            {
                RunObject = Page 9374;
            }
        }
        area(sections)
        {
            group("Process Achat VN")
            {
                action("Arrivage VN")
                {
                    RunObject = Page 70241;
                }
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
            }
            group("Vente VN")
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
    }
}

