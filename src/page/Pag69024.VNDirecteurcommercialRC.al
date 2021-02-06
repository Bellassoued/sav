page 69024 "VN - Directeur commercial RC"
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
                    Visible = false;
                }
                part(;69025)
                {
                    Visible = false;
                }
                part(;69061)
                {
                }
            }
            group()
            {
                part(;69021)
                {
                    Visible = false;
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
            action("Véhicules Stock Global")
            {
                RunObject = Page 50187;
            }
            action("Véhicules Stock Sans AO")
            {
                Caption = 'Véhicules Stock Sans AO';
                RunObject = Page 70283;
            }
            action("VN Arrivage")
            {
                RunObject = Page 50186;
            }
            action("Sales Orders")
            {
                CaptionML = ENU='Sales Orders',
                            FRA='Commandes vente';
                Image = "Order";
                RunObject = Page 60083;
            }
            action("Sales Quotes")
            {
                CaptionML = ENU='Sales Quotes',
                            FRA='Devis Vente';
                Image = Quote;
                RunObject = Page 60080;
                Visible = true;
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
                            FRA='Bordereau Carte grises';
                RunObject = Page 60074;
            }
            action("Sales Quotes")
            {
                CaptionML = ENU='Sales Quotes',
                            FRA='Devis';
                Image = Quote;
                RunObject = Page 60080;
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
            action("Liste de véhicules")
            {
                RunObject = Page 5981;
            }
            action("Liste Carte Grise")
            {
                RunObject = Page 69054;
            }
            action("Sales &Prices")
            {
                CaptionML = ENU='Sales &Prices',
                            FRA='Prix vente';
                Image = SalesPrices;
                RunObject = Page 60117;
                RunPageView = WHERE(Groupe compta stock=FILTER(ACCESSOIRE|VEHICULES));
            }
            action("Bordereaux PVN")
            {
                RunObject = Page 60309;
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
            action("Objectif Livraison VN")
            {
                RunObject = Page 60345;
            }
            action("Accessoires VN")
            {
                RunObject = Page 60377;
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
            action(UpdateSalesPrice)
            {
                Caption = 'Mise à jour prix de vente';
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 69028;
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
            action("Etat de réservation VN")
            {
                Image = Reserve;
                RunObject = Report 50064;
                Visible = false;
            }
            action("Commission VN ")
            {
                Image = CashFlow;
                RunObject = Report 70099;
                Visible = false;
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
                Image = AvailableToPromise;
                RunObject = Report 50063;
                Visible = false;
            }
            action("Reporting journalier")
            {
                Image = Report2;
                RunObject = Report 50051;
                Visible = false;
            }
            action("Véhicules disponibles réserv")
            {
                Image = AvailableToPromise;
                RunObject = Report 60114;
                Visible = false;
            }
            action("Suivi VN par chassis/periode")
            {
                Image = History;
                RunObject = Report 60163;
            }
            action("Vente par centre de gestion/date")
            {
                Image = Sales;
                RunObject = Report 60127;
                Visible = false;
            }
            action("Reporting journalier VN")
            {
                Image = "Report";
                RunObject = Report 60116;
            }
            action("Vente VN par vendeur par mois")
            {
                Image = Sales;
                RunObject = Report 50056;
            }
            action("Etude de rentabilité globale")
            {
                Image = ResourcePrice;
                RunObject = Report 50068;
                Visible = false;
            }
            action("Livraison VN par Vendeur/Mois")
            {
                Image = Sales;
                RunObject = Report 50067;
                Visible = false;
            }
            action("Etat journalier des commandes")
            {
                Image = "Order";
                RunObject = Report 60093;
            }
            action("Etat de ventes leasing")
            {
                RunObject = Report 60252;
            }
            action("Etat des livraisons VN")
            {
                Image = Sales;
                RunObject = Report 60106;
                Visible = false;
            }
            action("Suivi des dossiers en immatriculation")
            {
                Caption = 'Suivi des dossiers en immatriculation';
                Image = History;
                RunObject = Report 50065;
                Visible = false;
            }
            action("Livraison par CG/Vendeur")
            {
                Image = Reserve;
                RunObject = Report 50066;
                Visible = false;
            }
            action("Dossiers deposes pour immat./J")
            {
                CaptionML = ENU='Dossiers deposes pour immat./J',
                            FRA='Dossiers deposés pour immatriculation';
                Image = History;
                RunObject = Report 50072;
                Visible = false;
            }
            action("Reporting journalier Livraisons")
            {
                Image = Hierarchy;
                RunObject = Report 50073;
                Visible = false;
            }
            action("Commissions Agents VN")
            {
                Image = CashFlow;
                RunObject = Report 50076;
                Visible = false;
            }
            action("Reporting Global")
            {
                Image = Report2;
                RunObject = Report 50078;
                Visible = false;
            }
            action("Suivi Challenge")
            {
                Image = SalesPerson;
                RunObject = Report 60188;
                Visible = false;
            }
            action("Livraisons mensuelles vendeur")
            {
                Caption = 'Objectifs Vendeurs';
                Image = History;
                RunObject = Report 60189;
                Visible = false;
            }
            action("Ventes Leasing")
            {
                Image = Sales;
                RunObject = Report 60194;
            }
            action("Suivi d'activité VN")
            {
                Image = "Action";
                RunObject = Report 50078;
                Visible = false;
            }
            action("Suivi-activités VN Détails")
            {
                Caption = 'Suivi-activités VN Détails';
                Image = "Action";
                RunObject = Report 60195;
            }
            action("Ventes Leasing Par Mois  Par Centre de Gestion")
            {
                Caption = 'Ventes Leasing Par Mois  Par Centre de Gestion';
                Image = Hierarchy;
                RunObject = Report 50053;
                Visible = false;
            }
            action("Ventes Leasing Par Famille Par Centre de Gestion")
            {
                Image = Hierarchy;
                RunObject = Report 60194;
                Visible = false;
            }
            action("Age de stock VN")
            {
                Image = Aging;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60221;
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
                Visible = false;
            }
            action("Etat J Comm/Portefeuille")
            {
                CaptionML = ENU='Etat journalier des commandes/Portefueille',
                            FRA='Etat journalier des commandes/Portefueille';
                RunObject = Report 70086;
                Visible = false;
            }
            action("Véhicules immatriculés/J")
            {
                RunObject = Report 60258;
                Visible = false;
            }
            action("VU VP Selon les Canaux")
            {
                RunObject = Report 60259;
                Visible = false;
            }
            action("VU VP Selon CG")
            {
                RunObject = Report 60260;
                Visible = false;
            }
            action("69050")
            {
                Caption = 'Evolution des résultats VN';
                Image = SalesPerson;
                RunObject = Report 60216;
            }
            action("60286")
            {
                CaptionML = ENU='Dossiers déposés pour immatriculation',
                            FRA='Challenge dossiers déposés pour immatriculation';
                RunObject = Report 60286;
                Visible = false;
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
            action("Report 60245")
            {
                Caption = 'Etat global détaillé (stock+arrivage)';
                Image = Report2;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60245;
            }
            action("Report 60261")
            {
                Caption = 'Etat de ventes VN détaillé';
                Image = Sales;
                RunObject = Report 60261;
            }
            action("Report 60256")
            {
                Caption = 'Véhicules exposés';
                RunObject = Report 60256;
            }
            action("Report 60246")
            {
                CaptionML = ENU='Inventory statistics',
                            FRA='Etat de stock détaillé';
                RunObject = Report 60246;
            }
            action("Etat Stock Dir.VN")
            {
                RunObject = Report 60295;
            }
            action(Commissions)
            {
                CaptionML = ENU='Commissions',
                            FRA='Commission mensuelle commerciaux';
                RunObject = Report 50132;
            }
        }
    }
}

