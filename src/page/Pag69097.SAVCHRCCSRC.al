page 69097 "SAV & CHR-CCS RC"
{
    // version SAV Automobile

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part("CCS Réception Chrono : Conseiller Commercial Service";69004)
                {
                    Caption = 'CCS Réception Chrono : Conseiller Commercial Service';
                }
            }
            group()
            {
                part("CCS Réception Atelier : Conseiller Commercial Service";69003)
                {
                    Caption = 'CCS Réception Atelier : Conseiller Commercial Service';
                }
                group()
                {
                    part(;9150)
                    {
                    }
                    part(;9152)
                    {
                    }
                    systempart(;MyNotes)
                    {
                    }
                    systempart(;Notes)
                    {
                    }
                }
            }
        }
    }

    actions
    {
        area(embedding)
        {
            action("Liste des Article ")
            {
                RunObject = Page 31;
            }
            action("Liste des Clients ")
            {
                Image = Customer;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 22;
                RunPageMode = View;
            }
            action("Liste des Modèles")
            {
                RunObject = Page 31;
                RunPageView = WHERE(Item type=CONST(Vehicule));
            }
            action("Liste des véhicules ")
            {
                CaptionML = ENU='Liste des véhicules ',
                            FRA='Liste des Véhicules';
                RunObject = Page 5981;
                Visible = true;
            }
            action("Historique Services")
            {
                RunObject = Page 5912;
            }
            action("List Art Sur Cmd Récept. SAV")
            {
                RunObject = Page 50148;
            }
            action("Ventes Ratées")
            {
                RunObject = Page 50152;
            }
            action("Archive Devis")
            {
                RunObject = Page 50157;
            }
            action("Archive Commande Service")
            {
                RunObject = Page 50159;
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
                RunObject = Page 60014;
                RunPageMode = Create;
            }
            action("Créer Réception ATELIER")
            {
                Caption = 'Créer OR ATELIER';
                Image = ServiceAccessories;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 60018;
                RunPageMode = Create;
            }
            action("Journée Commerciale Atelier")
            {
                Image = Sales;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 70057;
            }
            action("Journée Commerciale Chrono")
            {
                Image = sales;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Report 70059;
            }
            action("CA Assurances Conventionnées")
            {
                Image = Balance;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 70062;
            }
            action("CA SAV")
            {
                Image = Sales;
                RunObject = Report 50032;
                Visible = false;
            }
            action("Statistique des OR\CS SAV")
            {
                CaptionML = ENU='Statistique des OR\CCS SAV',
                            FRA='Statistique des OR\CCS SAV';
                Image = statistics;
                RunObject = Report 60183;
            }
            action("Statistique des OR\CS.")
            {
                Caption = 'Statistique des OR\CCS CHR';
                Image = statistics;
                RunObject = Report 60181;
            }
            action("Liste Des Devis SAV")
            {
                Image = statistics;
                RunObject = Report 60184;
            }
            action("Suivi Lignes Services")
            {
                RunObject = Page 70256;
                Visible = false;
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
            action("Liste des travaux ateliers")
            {
                RunObject = Page 70210;
                RunPageView = WHERE(Type Effet CLT=FILTER(LDT));
            }
            action("CA HT MAGASIN PR")
            {
                RunObject = Report 60171;
            }
            action("Etat Affectation Ressource")
            {
                RunObject = Report 50117;
                Visible = false;
            }
            action("Etat affectation ressources")
            {
                RunObject = Report 50142;
            }
            action("Etat de stock Mag. Transit")
            {
                Image = "Report";
                RunObject = Report 60294;
            }
            action("Situation OR en cours")
            {
                RunObject = Report 50143;
            }
        }
        area(sections)
        {
            group("RDV ")
            {
                action("Liste Rendez-vous Crées")
                {
                    RunObject = Page 60365;
                }
                action("Liste Rendez-vous Confirmée/OR")
                {
                    RunObject = Page 60389;
                }
            }
            group("Acceuil CHR-CS")
            {
                Image = ResourcePlanning;
                action("Liste des fiches CHRONO")
                {
                    CaptionML = ENU='<List des Ordres de Réparation CHR>',
                                FRA='List des Ordres de Réparation CHR';
                    RunObject = Page 60015;
                }
                action("Liste des Devis Service CHR")
                {
                    CaptionML = ENU='Service Quotes CHR',
                                FRA='Liste des Devis Service CHR';
                    RunObject = Page 9317;
                    RunPageView = WHERE(Type Reception=CONST(Reception Rapide));
                }
                action("Liste des Commandes Services CHR")
                {
                    RunObject = Page 9318;
                    RunPageView = WHERE(Type Reception=CONST(Reception Rapide));
                }
                action("Commandes Achats Sous-Traitance CHR")
                {
                    Caption = 'Commandes Achats Sous-Traitance CHR';
                    RunObject = Page 9307;
                    RunPageView = WHERE(Document Type=CONST(Order),
                                        Order Type=CONST(Service),
                                        Service Type=CONST(Rapid Service));
                }
                action("Retours achat sous-traitance CHR")
                {
                    RunObject = Page 9311;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Rapid Service));
                }
                action("Liste des Ordres de Transfert CHR")
                {
                    RunObject = Page 5742;
                    RunPageView = WHERE(Source Type=CONST(Service Rapide));
                }
                action("Liste des Avoirs Service CHRONO")
                {
                    CaptionML = ENU='Liste des Avoirs Service CHRONO',
                                FRA='Liste des Avoirs Service Chrono';
                    RunObject = Page 9320;
                    RunPageView = WHERE(Type Reception=CONST(Reception Rapide));
                }
                action("Historique Ancien Dossiers CHR")
                {
                    RunObject = Page 60118;
                }
            }
            group("Acceuil SAV-CS")
            {
                Image = ResourcePlanning;
                action("Liste des fiches SAV")
                {
                    CaptionML = ENU='<Liste des Ordres de Réparation SAV>',
                                FRA='Liste des Ordres de Réparation SAV';
                    RunObject = Page 60019;
                    RunPageView = WHERE(Service Type=CONST(Big Service));
                }
                action("Liste des Véhicules SAV")
                {
                    CaptionML = ENU='<Liste des Véhicules SAV>',
                                FRA='Liste des Véhicules SAV';
                    RunObject = Page 60066;
                    RunPageMode = View;
                    Visible = false;
                }
                action("Liste des devis service SAV")
                {
                    CaptionML = ENU='Service Quotes SAV',
                                FRA='Liste des Devis Service  SAV';
                    RunObject = Page 9317;
                    RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
                }
                action("Liste des commandes Service SAV")
                {
                    CaptionML = ENU='Liste des commandes Service SAV',
                                FRA='List des Commandes Service SAV';
                    RunObject = Page 69082;
                    RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
                }
                action("Liste des Commandes Achats Sous-Traitance SAV")
                {
                    CaptionML = ENU='Liste des Commandes Achats Sous-Traitance SAV',
                                FRA='Liste des Commandes Achats Sous-Traitance SAV';
                    RunObject = Page 9307;
                    RunPageView = WHERE(Document Type=CONST(Order),
                                        Order Type=CONST(Service),
                                        Service Type=CONST(Big Service));
                }
                action("Retour Achat Sous-Traitance SAV")
                {
                    CaptionML = ENU='<Liste des Retours Achat Sous-Traitance SAV>',
                                FRA='Liste des Retours Achat Sous-Traitance SAV';
                    RunObject = Page 9311;
                    RunPageView = WHERE(Order Type=CONST(Service));
                }
                action("Liste des Avoirs Achat  Sous-Traitance SAV")
                {
                    CaptionML = ENU='Liste des Avoirs Achat  Sous-Traitance SAV',
                                FRA='Liste des Avoirs Achat  Sous-Traitance SAV';
                    RunObject = Page 9309;
                    RunPageView = WHERE(Document Type=CONST(Credit Memo),
                                        Order Type=CONST(Service),
                                        Service Type=CONST(Big Service));
                }
                action("Liste Ordres de Transfert SAV")
                {
                    RunObject = Page 5742;
                    RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
                }
                action("Liste des Avoirs Service SAV")
                {
                    Caption = 'Liste des Avoirs Service SAV';
                    RunObject = Page 9320;
                    RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
                }
                action("Liste Avoirs SAV")
                {
                    RunObject = Page 9320;
                    RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
                    Visible = false;
                }
            }
            group("Documents validés CHR-CS")
            {
                CaptionML = ENU='Posted Documents CHR-CCS',
                            FRA='Documents validés CHR-CCS';
                Image = FiledPosted;
                action("Liste des Réceptions Lancées CHR")
                {
                    CaptionML = ENU='<Réceptions lancées CHR>',
                                FRA='Réceptions lancées';
                    RunObject = Page 60015;
                    RunPageView = WHERE(Service Type=CONST(Rapid Service),
                                        Status SR=CONST(Lancée));
                    Visible = false;
                }
                action("Expéditions services eng CHR")
                {
                    CaptionML = ENU='Posted Service Shipments CHR',
                                FRA='Expéditions Service Enregistrées CHR';
                    RunObject = Page 5974;
                    RunPageView = WHERE(Type Reception=CONST(Reception Rapide));
                }
                action("Liste des Factures Services Enrg. CHR")
                {
                    CaptionML = ENU=' Liste des Factures Services Enrg. CHR',
                                FRA='Liste des Factures Services Enrg.  CHR';
                    RunObject = Page 5977;
                    RunPageView = WHERE(Type Reception=CONST(Reception Rapide));
                }
                action("Liste des Avoirs Service Enreg. CHR")
                {
                    CaptionML = ENU='Liste des Avoirs Service Enreg. CHR',
                                FRA='Liste des Avoirs Service Enreg. CHR';
                    RunObject = Page 5971;
                    RunPageView = WHERE(Type Reception=CONST(Reception Rapide));
                }
                action("Liste des Receptions ST CHR")
                {
                    Caption = 'Liste des receptions ST CHR';
                    RunObject = Page 145;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Rapid Service));
                }
                action("Expéditions Retour ST  Enreg. CHR")
                {
                    RunObject = Page 6652;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Rapid Service));
                }
                action("Expéditions Transfert Enreg. CHR")
                {
                    RunObject = Page 5753;
                    RunPageView = WHERE(Source Type=CONST(Service Rapide));
                }
                action("Réceptions Transfert Enreg. CHR")
                {
                    RunObject = Page 5753;
                    RunPageView = WHERE(Source Type=CONST(Service Rapide));
                }
            }
            group("Documents validés SAV-CS")
            {
                CaptionML = ENU='Posted Documents SAV-CCS',
                            FRA='Documents validés SAV-CCS';
                Image = FiledPosted;
                action("Historique Ancien dossiers SAV")
                {
                    RunObject = Page 60118;
                }
                action("Liste des Réceptions Lancées SAV")
                {
                    CaptionML = ENU='<Réceptions lancées SAV>',
                                FRA='Réceptions lancées';
                    RunObject = Page 60015;
                    RunPageView = WHERE(Service Type=CONST(Big Service),
                                        Status SR=CONST(Lancée));
                    Visible = false;
                }
                action("Expéditions services eng SAV")
                {
                    CaptionML = ENU='Posted Service Shipments SAV',
                                FRA='Expéditions Service Enregistrées SAV';
                    RunObject = Page 5974;
                    RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
                }
                action("Liste des factures services SAV")
                {
                    CaptionML = ENU='Posted service invoices SAV',
                                FRA='Liste des factures services SAV';
                    RunObject = Page 5977;
                    RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
                }
                action("Lignes factures Services")
                {
                    RunObject = Page 50174;
                }
                action("Liste des avoirs service enregistrés SAV")
                {
                    CaptionML = ENU='Liste des avoirs service enregistrés SAV',
                                FRA='Liste des avoirs service enregistrés SAV';
                    RunObject = Page 5971;
                    RunPageView = WHERE(Type Reception=CONST(Reception Grand Reparation));
                }
                action("Liste des receptions Sous-Traitance SAV")
                {
                    CaptionML = ENU='Liste des receptions Sous-Traitance SAV',
                                FRA='Liste des receptions Sous-Traitance SAV';
                    RunObject = Page 145;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Big Service));
                }
                action("Réceptions Transfert Enreg. SAV")
                {
                    RunObject = Page 5753;
                    RunPageView = WHERE(Source Type=CONST(Grande réparation));
                }
                action("Expédions Transfert  enreg. SAV")
                {
                    CaptionML = ENU='<Expédions Transfert  enreg. SAV>',
                                FRA='Expédions Transfert  enreg. SAV';
                    RunObject = Page 5752;
                    RunPageView = WHERE(Source Type=CONST(Grande réparation));
                }
                action("Liste des factures Achat Sous-Traitance SAV")
                {
                    CaptionML = ENU='Liste des factures Achat Sous-Traitance SAV',
                                FRA='Liste des factures Achat Sous-Traitance SAv';
                    RunObject = Page 146;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Big Service));
                }
                action("Expéditions Retour Sous-Traitance Enreg. SAV")
                {
                    CaptionML = ENU='Expéditions Retour Sous-Traitance Enreg. SAV',
                                FRA='Expéditions Retour Sous-Traitance Enreg. SAV';
                    RunObject = Page 6652;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Big Service));
                }
                action("Avoirs Achat Sous-Traitance Enreg. SAV")
                {
                    CaptionML = ENU='Avoirs Achat Sous-Traitance Enreg. SAV',
                                FRA='Avoirs Achat Sous-Traitance Enreg. SAV';
                    RunObject = Page 147;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Big Service));
                }
            }
        }
    }
}

