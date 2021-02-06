page 69017 "Responsable Multiactivité"
{
    // version SAV Automobile

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Services)
            {
                Caption = 'Services';
                part(;69009)
                {
                }
            }
            group("Activité")
            {
                Caption = 'Activité';
                part(CaissierActivity;69011)
                {
                }
            }
            group(Vente)
            {
                Caption = 'Vente';
                part(;69060)
                {
                }
            }
            systempart(;MyNotes)
            {
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
        }
        area(reporting)
        {
            action("CA par Centre de Gestion SAV")
            {
                CaptionML = ENU='CA par Centre de Gestion SAV',
                            FRA='CA par Centre de Gestion SAV';
                Image = "Report";
                RunObject = Report 60039;
            }
            action("Suivie Stock Magasin")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60034;
            }
            action("Journée Commercial PR")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60061;
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
            action("Journée Commercial SAV")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60045;
            }
            action("CA Pr Par Centre de Gestion")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60052;
            }
            action("CA Service Par Type")
            {
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Report 60051;
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
            action("liste des prix")
            {
                RunObject = Page 60117;
            }
            action("Liste entrée stock Démontage")
            {
                RunObject = Page 50033;
            }
            action("Liste sortie stock Montage")
            {
                RunObject = Page 50011;
            }
            action("Facture PR")
            {
                RunObject = Page 60034;
            }
            action("Commandes Vente")
            {
                RunObject = Page 60025;
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
                action("Posted Sales Shipments")
                {
                    CaptionML = ENU='Posted Sales Shipments',
                                FRA='Expéditions vente PR enregistrées';
                    Image = PostedShipment;
                    RunObject = Page 60052;
                }
                action("Posted Sales Invoices")
                {
                    CaptionML = ENU='Posted Sales Invoices',
                                FRA='Factures vente PR enregistrées';
                    Image = PostedOrder;
                    RunObject = Page 60049;
                }
                action("Posted Return Receipts")
                {
                    CaptionML = ENU='Posted Return Receipts',
                                FRA='Réceptions retour PR enregistrées';
                    Image = PostedReturnReceipt;
                    RunObject = Page 60058;
                }
                action("Posted Sales Credit Memos")
                {
                    CaptionML = ENU='Posted Sales Credit Memos',
                                FRA='Avoirs vente PR enregistrés';
                    Image = PostedOrder;
                    RunObject = Page 60055;
                }
            }
        }
    }
}

