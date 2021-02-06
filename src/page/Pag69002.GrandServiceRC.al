page 69002 "Grand ServiceRC"
{
    DataCaptionExpression = rrrr;
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;69003)
                {
                }
                systempart(;Notes)
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
            action("Liste des fiches")
            {
                Caption = 'Liste des Ordres de Réparation';
                RunObject = Page 60019;
                RunPageView = WHERE(Service Type=CONST(Big Service));
            }
            action("SAV - Liste des Véhicules")
            {
                Caption = 'Liste des Véhicules';
                RunObject = Page 60066;
                RunPageMode = View;
            }
            action("Liste des Clients")
            {
                Caption = 'Liste des Clients';
                Image = Customer;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 22;
                RunPageMode = View;
            }
            action("Liste des véhicules")
            {
                Caption = 'Liste des Véhicules';
                RunObject = Page 5981;
                Visible = false;
            }
            action("Liste des Article")
            {
                Caption = 'Liste des Articles';
                RunObject = Page 31;
            }
            action("Liste des Modèles")
            {
                RunObject = Page 31;
                RunPageView = WHERE(Item type=CONST(Vehicule));
            }
            action("Liste des devis service")
            {
                CaptionML = ENU='Service Quotes',
                            FRA='Liste des Devis Service';
                RunObject = Page 9317;
                RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
            }
            action("Liste des commandes Service")
            {
                CaptionML = ENU='Created orders',
                            FRA='List des Commandes Service';
                RunObject = Page 69082;
                RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
            }
            action("Liste des Commandes Achats Sous-Traitance")
            {
                Caption = 'Liste des Commandes Achats Sous-Traitance';
                RunObject = Page 9307;
                RunPageView = WHERE(Document Type=CONST(Order),
                                    Order Type=CONST(Service),
                                    Service Type=CONST(Big Service));
            }
            action("Retour Achat Sous-Traitance")
            {
                Caption = 'Liste des Retours Achat Sous-Traitance';
                RunObject = Page 9311;
                RunPageView = WHERE(Order Type=CONST(Service));
            }
            action("Liste des Avoirs Achat  Sous-Traitance")
            {
                Caption = 'Liste des Avoirs Achat  Sous-Traitance';
                RunObject = Page 9309;
                RunPageView = WHERE(Document Type=CONST(Credit Memo),
                                    Order Type=CONST(Service),
                                    Service Type=CONST(Big Service));
            }
            action("Liste des Ordres de Transfert")
            {
                RunObject = Page 5742;
            }
            action("Liste des Avoirs Service")
            {
                Caption = 'Liste des Avoirs Service';
                RunObject = Page 9320;
                RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
            }
            action("Liste des Tranferts Retour")
            {
                RunObject = Page 60321;
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
            action("Assurances conventionnées")
            {
                RunObject = Page 60198;
            }
            action("Import OR en cours ")
            {
                RunObject = Page 70255;
            }
            action("<Facture Achat>")
            {
                Caption = 'Facture Achat';
                RunObject = Page 9308;
                Visible = false;
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
            action("Créer Réception ATELIER")
            {
                Caption = 'Créer OR ATELIER';
                Image = ServiceAccessories;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 60018;
                RunPageMode = Create;
            }
            action("Journée commerciale atelier")
            {
                Image = Sales;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 70057;
            }
            action("CA assureurs conventionnés")
            {
                Image = Insurance;
                RunObject = Report 70062;
            }
            action("CA SAV")
            {
                Image = Sales;
                RunObject = Report 50032;
                Visible = false;
            }
            action("Statistique des OR\CCS ")
            {
                Caption = 'Statistique des OR\CCS';
                Image = statistics;
                RunObject = Report 60183;
            }
            action("Liste Des Devis SAV")
            {
                Image = statistics;
                RunObject = Report 60184;
            }
            action("Suivi Lignes Services")
            {
                RunObject = Page 70256;
            }
            action("Import châssis en campagne")
            {
                Image = Import;
                RunObject = XMLport 50014;
            }
        }
        area(reporting)
        {
            action("CA Mensuel SAV")
            {
                RunObject = Report 60107;
            }
            action("CA atelier CITROËN France")
            {
                RunObject = Report 60109;
                Visible = false;
            }
            action("Stock à date")
            {
                RunObject = Report 70044;
            }
            action("Suivi campagnes de rappel")
            {
                RunObject = Report 60285;
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                CaptionML = ENU='Posted Documents',
                            FRA='Documents validés';
                Image = FiledPosted;
                action("Historique Ancien dossiers")
                {
                    RunObject = Page 60118;
                }
                action("Liste des Réceptions Lancées")
                {
                    Caption = 'Réceptions lancées';
                    RunObject = Page 60015;
                    RunPageView = WHERE(Service Type=CONST(Big Service),
                                        Status SR=CONST(Lancée));
                    Visible = false;
                }
                action("Expéditions services eng")
                {
                    CaptionML = ENU='Posted Service Shipments ',
                                FRA='Expéditions Service Enregistrées';
                    RunObject = Page 5974;
                    RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
                }
                action("Liste des factures services")
                {
                    CaptionML = ENU='Posted service invoices',
                                FRA='Liste des factures services';
                    RunObject = Page 5977;
                }
                action("Liste des avoirs service enregistrés")
                {
                    CaptionML = ENU='Posted Service Credit Memos',
                                FRA='Liste des avoirs service enregistrés';
                    RunObject = Page 5971;
                    RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
                }
                action("Liste des receptions Sous-Traitance")
                {
                    Caption = 'Liste des receptions Sous-Traitance';
                    RunObject = Page 145;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Big Service));
                }
                action("Réceptions Transfert Enreg.")
                {
                    RunObject = Page 5753;
                    RunPageView = WHERE(Source Type=CONST(Grande réparation));
                }
                action("Expédions Transfert  enreg.")
                {
                    Caption = 'Expédions Transfert  enreg.';
                    RunObject = Page 5752;
                    RunPageView = WHERE(Source Type=CONST(Grande réparation));
                }
                action("Liste des factures Achat Sous-Traitance")
                {
                    CaptionML = ENU='Posted service invoices',
                                FRA='Liste des factures Achat Sous-Traitance';
                    RunObject = Page 146;
                    RunPageView = WHERE(Order Type=CONST(Service));
                }
                action("Expéditions Retour Sous-Traitance Enreg.")
                {
                    Caption = 'Expéditions Retour Sous-Traitance Enreg.';
                    RunObject = Page 6652;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Big Service));
                }
                action("Avoirs Achat Sous-Traitance Enreg.")
                {
                    Caption = 'Avoirs Achat Sous-Traitance Enreg.';
                    RunObject = Page 147;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Big Service));
                }
                action("Import OR en cours")
                {
                    RunObject = Report 70064;
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

    var
        rrrr : Label 'rrrrrrrrrr';
        IsKeyUserSAV : Boolean;
        UserSetup : Record "91";
}

