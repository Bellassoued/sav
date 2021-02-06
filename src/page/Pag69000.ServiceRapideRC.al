page 69000 "Service Rapide RC"
{
    // version SAV Automobile

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;69004)
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
        area(embedding)
        {
            action("Liste des fiches")
            {
                Caption = 'List des Ordres de Réparation';
                RunObject = Page 60015;
            }
            action("SAV - Liste des Véhicules")
            {
                RunObject = Page 60066;
                RunPageMode = View;
            }
            action("Liste des Clients")
            {
                Image = Customer;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 22;
                RunPageMode = View;
            }
            action("Liste des véhicules")
            {
                Caption = '<Liste des Véhicules>';
                RunObject = Page 5981;
                Visible = false;
            }
            action("Liste des Article")
            {
                RunObject = Page 31;
            }
            action("Liste des Modèles")
            {
                RunObject = Page 31;
                RunPageView = WHERE(Item type=CONST(Vehicule));
            }
            action("Liste des Devis Service")
            {
                CaptionML = ENU='Service Quotes',
                            FRA='Liste des Devis Service';
                RunObject = Page 9317;
                RunPageView = WHERE(Type Reception=CONST(Reception Rapide));
            }
            action("Liste des Commandes Services")
            {
                RunObject = Page 9318;
                RunPageView = WHERE(Type Reception=CONST(Reception Rapide));
            }
            action("Commandes Achats Sous-Traitance")
            {
                RunObject = Page 9307;
                RunPageView = WHERE(Document Type=CONST(Order),
                                    Order Type=CONST(Service),
                                    Service Type=CONST(Rapid Service));
            }
            action("Retours achat sous-traitance")
            {
                RunObject = Page 9311;
                RunPageView = WHERE(Order Type=CONST(Service),
                                    Service Type=CONST(Rapid Service));
            }
            action("Avoirs services")
            {
                RunObject = Page 9320;
            }
            action("Liste des Ordres de Transfert")
            {
                RunObject = Page 5742;
                RunPageView = WHERE(Source Type=CONST(Service Rapide));
            }
            action("Campagnes de rappel")
            {
                RunObject = Page 50105;
            }
            action("Liste véhicules campagne")
            {
                RunObject = Page 70285;
                RunPageView = WHERE(Traiter=CONST(No));
            }
            action("Liste des Tranferts Retour")
            {
                RunObject = Page 60321;
            }
            action("Transferts (vers) Sur commande")
            {
                RunObject = Page 50024;
                RunPageView = WHERE(Sur Commande=CONST(Yes));
            }
            action("Transferts (de) Sur commande")
            {
                RunObject = Page 60149;
                RunPageView = WHERE(Sur Commande=CONST(Yes));
            }
        }
        area(creation)
        {
            action("Créer Réception CHRONO")
            {
                Caption = 'Créer OR CHRONO';
                Image = Tools;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page 70295;
                RunPageMode = Create;
            }
            action("Journée Commerciale CHRONO")
            {
                Image = Sales;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 70059;
            }
            action("Statistique des OR\CCS ")
            {
                Caption = 'Statistique des OR\CCS';
                Image = statistics;
                RunObject = Report 60181;
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                CaptionML = ENU='Posted Documents',
                            FRA='Documents validés';
                Image = FiledPosted;
                action("Historique Ancien Dossiers")
                {
                    RunObject = Page 60118;
                }
                action("Liste des Réceptions Lancées")
                {
                    Caption = 'Réceptions lancées';
                    RunObject = Page 60015;
                    RunPageView = WHERE(Service Type=CONST(Rapid Service),
                                        Status SR=CONST(Lancée));
                    Visible = false;
                }
                action("Expéditions services eng")
                {
                    CaptionML = ENU='Posted Service Shipments ',
                                FRA='Expéditions Service Enregistrées';
                    RunObject = Page 5974;
                    RunPageView = WHERE(Type Reception=CONST(Reception Rapide));
                }
                action("Liste des Factures Services Enrg.")
                {
                    CaptionML = ENU='Posted service invoices',
                                FRA='Liste des Factures Services Enrg.';
                    RunObject = Page 5977;
                    RunPageView = WHERE(Type Reception=CONST(Reception Rapide));
                }
                action("Liste des Avoirs Service Enreg.")
                {
                    CaptionML = ENU='Posted Service Credit Memos',
                                FRA='Liste des Avoirs Service Enreg.';
                    RunObject = Page 5971;
                    RunPageView = WHERE(Type Reception=CONST(Reception Rapide));
                }
                action("Liste des Receptions ST")
                {
                    Caption = 'Liste des receptions ST';
                    RunObject = Page 145;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Rapid Service));
                }
                action("Expéditions Retour ST  Enreg.")
                {
                    RunObject = Page 6652;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Rapid Service));
                }
                action("Expéditions Transfert Enreg.")
                {
                    RunObject = Page 5753;
                    RunPageView = WHERE(Source Type=CONST(Service Rapide));
                }
                action("Réceptions Transfert Enreg.")
                {
                    RunObject = Page 5753;
                    RunPageView = WHERE(Source Type=CONST(Service Rapide));
                }
                action("Rcpt transfert  Sur Commande")
                {
                    RunObject = Page 5753;
                    RunPageView = WHERE(Sur Commande=CONST(Yes));
                }
                action("Exp Transfert  Sur Commande")
                {
                    RunObject = Page 5752;
                    RunPageView = WHERE(Sur Commande=CONST(Yes));
                }
            }
        }
    }
}

