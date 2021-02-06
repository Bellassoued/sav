page 69014 "Chefatelier SAV RC"
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
                chart()
                {
                    ChartPartID = 'RCT-GRD1';
                    ShowFilter = true;
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
                Caption = 'Créer Réception CHRONO';
                Image = Resource;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page 60014;
                RunPageMode = Create;
            }
            action("Créer Réception ATELIER")
            {
                Caption = 'Créer Réception ATELIER';
                Image = ServiceAccessories;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 60018;
                RunPageMode = Create;
            }
            action("Analyse Réception Service")
            {
                Image = AnalysisView;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 60135;
            }
            action("Nouvelle commande achat")
            {
                Image = DepreciationBooks;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page 50;
                RunPageMode = Create;
            }
            action("Purchase &Quote")
            {
                CaptionML = ENU='Purchase &Quote',
                            FRA='&Demande de prix';
                Image = Quote;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page 49;
                RunPageMode = Create;
            }
        }
        area(reporting)
        {
            action("CA par Centre de Gestion SAV")
            {
                CaptionML = ENU='CA par Centre de Gestion SAV',
                            FRA='CA par Centre de Gestion SAV';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60039;
            }
            action("<Report CA par Centre de Gestion")
            {
                CaptionML = ENU='CA par Centre de Gestion SAV',
                            FRA='CA par C.Gestion SAV +FInterne';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60072;
            }
            action("Analyse MO")
            {
                Caption = 'Analyse MO';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60138;
            }
            action("journee commercial SAV")
            {
                CaptionML = ENU='journee commercial SAV',
                            FRA='CA / Client';
                Image = AnalysisViewDimension;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60039;
            }
            action("Report journee commercial SAV")
            {
                Caption = 'journee commercial SAV';
                Image = AnalysisViewDimension;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60045;
            }
            action()
            {
                Image = AnalysisViewDimension;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60070;
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
            action("Liste entrée stock Démontage")
            {
                RunObject = Page 50033;
            }
            action("Liste sortie stock Montage")
            {
                RunObject = Page 50011;
            }
            action("Historique Ancien dossiers")
            {
                RunObject = Page 60118;
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
            action("Liste des modèles véhicule")
            {
                RunObject = Page 31;
                RunPageView = WHERE(Item type=CONST(Vehicule));
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
                action("Liste Entrée démontage Enregistré")
                {
                    RunObject = Page 50038;
                }
                action("Liste sortie montage enregistré")
                {
                    RunObject = Page 50012;
                }
                separator()
                {
                }
                action("Réception Achat")
                {
                    RunObject = Page 145;
                }
                action("Expédition Achat")
                {
                    RunObject = Page 6652;
                }
                separator()
                {
                }
            }
        }
    }
}

