page 69019 "Directeur technique"
{
    // version SAV Automobile

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                part("Service après vente";69009)
                {
                    Caption = 'Service après vente';
                }
                part("VN Assembly";50076)
                {
                    CaptionML = ENU='VN Assembly',
                                FRA='Préparation VN';
                }
            }
            group()
            {
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                chart("Service Rapide")
                {
                    ChartPartID = 'RCT-RPD';
                }
                chart("Grandes Réparations")
                {
                    Caption = 'Grandes Réparations';
                    ChartPartID = 'RCT-GRD';
                }
                part("Vente Pièces de Rechange";69060)
                {
                    Caption = 'Vente Pièces de Rechange';
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
            action("Créer Réception Service Rapide")
            {
                Caption = 'Créer Réception Service Rapide';
                Image = Resource;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page 60014;
                RunPageMode = Create;
            }
            action("Créer Réception Grandes Réparation")
            {
                Caption = 'Créer Réception Grandes Réparation';
                Image = ServiceAccessories;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 60018;
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
            action("Analyse Réception Service")
            {
                Image = AnalysisView;
                RunObject = Page 60135;
            }
            action("Temps standard Service")
            {
                Image = Timesheet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 50042;
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
            action("Liste des transfert")
            {
                RunObject = Page 5742;
            }
            action("Page Main d'oeuvre")
            {
                RunObject = Page 60165;
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
                action("Posted Transfer Shipments")
                {
                    CaptionML = ENU='Posted Transfer Shipments',
                                FRA='Expéditions transfert enreg.';
                    RunObject = Page 5752;
                }
                action("Posted Transfer Receipts")
                {
                    CaptionML = ENU='Posted Transfer Receipts',
                                FRA='Réceptions transfert enreg.';
                    RunObject = Page 5753;
                }
            }
        }
        area(reporting)
        {
            action("Chiffre d'affaires mensuel SAV")
            {
                RunObject = Report 60107;
            }
            action("Situation mensuelle des OR")
            {
                RunObject = Report 60108;
            }
            action("CA Atelier Citroen France")
            {
                RunObject = Report 60109;
            }
            action("Chiffre d'affaires par client/Centre de gestion")
            {
                CaptionML = ENU='Chiffre d''affaires par client/Centre de gestion',
                            FRA='Chiffre d''affaires par client/Centre de gestion';
                RunObject = Report 60175;
            }
            action("CA HT MAGASIN PR")
            {
                RunObject = Report 60171;
            }
        }
    }
}

