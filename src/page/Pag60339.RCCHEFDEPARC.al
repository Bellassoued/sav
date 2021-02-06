page 60339 "RC CHEF DE PARC"
{
    // version PARC

    CaptionML = ENU='Role Center',
                FRA='Tableau de bord';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;69021)
                {
                }
            }
            group()
            {
                chart("Livraison par jour")
                {
                    Caption = 'Livraison par jour';
                    ChartPartID = 'LIVRAISON VN';
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
            action("Liste des modèles véhicules")
            {
                RunObject = Page 60017;
            }
            action("Liste des véhicules")
            {
                RunObject = Page 5981;
                Visible = false;
            }
            action("Liste véhicules à préparer")
            {
                RunObject = Page 60133;
                Visible = false;
            }
            action("Liste des  VIN")
            {
                RunObject = Page 70048;
            }
            action("VIN Bordereau PVN  lancés")
            {
                RunObject = Page 70059;
                Visible = false;
            }
            action("VIN à envoyer PVN")
            {
                RunObject = Page 70181;
                Visible = false;
            }
            action("VIN à Recevoir PVN")
            {
                RunObject = Page 70183;
                Visible = false;
            }
            action("VIN à préparer")
            {
                RunObject = Page 70270;
                Visible = false;
            }
            action("VIN encours de préparation")
            {
                RunObject = Page 70060;
                Visible = false;
            }
            action("VIN préparés")
            {
                RunObject = Page 70068;
                Visible = false;
            }
            action("VIN à livrer")
            {
                RunObject = Page 70069;
                Visible = false;
            }
            action("Liste des livraisons")
            {
                RunObject = Page 70274;
                Visible = false;
            }
            action("VIN livrés")
            {
                RunObject = Page 70075;
                Visible = false;
            }
            action("Liste bordereau PVN Préparer")
            {
                RunObject = Page 70266;
                Visible = false;
            }
            action("List Ligne Borderaux")
            {
                RunObject = Page 70264;
                Visible = false;
            }
            action("List Commande Travaux PVN")
            {
                RunObject = Page 70265;
                RunPageView = WHERE(Type Reception=CONST(VN));
                Visible = false;
            }
            action("List Réception Véhicule")
            {
                RunObject = Page 60019;
                Visible = false;
            }
            action("List Ligne Cmd Vente VN")
            {
                RunObject = Page 70268;
                Visible = false;
            }
            action("List Cmd Vente Enrg. VN")
            {
                RunObject = Page 70269;
                Visible = false;
            }
            action("Carte Grise")
            {
                RunObject = Page 60074;
                Visible = false;
            }
            action("Liste Des Carte Grises")
            {
                RunObject = Page 69054;
                Visible = false;
            }
            action("Liste des RDVs")
            {
                RunObject = Page 70277;
                Visible = false;
            }
            action("Liste des manquants")
            {
                RunObject = Page 50109;
                RunPageLink = Livrée=CONST(No);
                Visible = false;
            }
            action("Vehicule En Stock")
            {
                RunObject = Page 60334;
            }
            action("Véhicules Facturée Non Livrés")
            {
                RunObject = Page 60333;
            }
            action("Liste des ORs Avarie")
            {
                RunObject = Page 60335;
                Visible = false;
            }
            action("Liste des Avoirs Service")
            {
                Caption = 'Liste des Avoirs Service';
                RunObject = Page 9320;
                RunPageView = WHERE(Type Reception=CONST(VN));
                Visible = false;
            }
            action("Livraisons VN")
            {
                RunObject = Page 60107;
                Visible = false;
            }
            action("Cartes Carburant Non Livrées")
            {
                RunObject = Page 60319;
                RunPageView = WHERE(Carte Carburant livrée=CONST(No));
                Visible = false;
            }
            action("Liste des OR PVN")
            {
                RunObject = Page 60019;
                Visible = false;
            }
            action("Liste des manquants campagne")
            {
                RunObject = Page 50109;
                RunPageLink = Livrée=CONST(No);
                Visible = false;
            }
            action("Ancient manquant PVN")
            {
                RunObject = Page 60382;
                Visible = false;
            }
        }
        area(processing)
        {
            action("Etat des livraisons")
            {
                Image = SalesShipment;
                RunObject = Report 50098;
                Visible = false;
            }
            action("Accessoires facturés par période")
            {
                RunObject = Report 60220;
            }
            action("Indicateurs Logistiques")
            {
                RunObject = Report 60226;
            }
            action("Ind Performance PVN")
            {
                Image = "Report";
                RunObject = Report 60256;
            }
            action(Indicateur1)
            {
                Image = "report";
                RunObject = Report 60261;
            }
            action(Indicateur2)
            {
                Image = "report";
                RunObject = Report 60262;
            }
            action(Indicateur3)
            {
                Image = "report";
                RunObject = Report 60263;
            }
            action(Indicateur4)
            {
                Image = "report";
                RunObject = Report 60264;
            }
            action(Indicateur5)
            {
                Image = "report";
                RunObject = Report 60265;
            }
            action(Indicateur6)
            {
                Image = "report";
                RunObject = Report 60266;
            }
            action(Indicateur7)
            {
                Image = "report";
                RunObject = Report 60267;
            }
            action("Nomenclature Preparation/Modèl")
            {
                RunObject = Report 50106;
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                CaptionML = ENU='Posted Documents',
                            FRA='Documents validés';
                Image = FiledPosted;
                action("Expéditions services eng")
                {
                    CaptionML = ENU='Posted Service Shipments ',
                                FRA='Expéditions Service Enregistrées';
                    RunObject = Page 5974;
                    RunPageView = WHERE(Type Reception=CONST(VN));
                }
                action("Liste des factures services")
                {
                    CaptionML = ENU='Posted service invoices',
                                FRA='Liste des factures services';
                    RunObject = Page 5977;
                    RunPageView = WHERE(Type Reception=CONST(VN));
                }
                action("Liste des avoirs service enregistrés")
                {
                    CaptionML = ENU='Posted Service Credit Memos',
                                FRA='Liste des avoirs service enregistrés';
                    RunObject = Page 5971;
                    RunPageView = WHERE(Type Reception=CONST(VN));
                }
                action("Liste des receptions Sous-Traitance")
                {
                    Caption = 'Liste des receptions Sous-Traitance';
                    RunObject = Page 145;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Big Service));
                }
                action("Liste des factures Achat Sous-Traitance")
                {
                    CaptionML = ENU='Posted service invoices',
                                FRA='Liste des factures Achat Sous-Traitance';
                    RunObject = Page 146;
                    RunPageView = WHERE(Order Type=CONST(Service),
                                        Service Type=CONST(Big Service));
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
            }
        }
    }
}

