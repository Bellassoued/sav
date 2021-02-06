page 69058 "Chef Service Recouvrement"
{
    // version Caissier RC

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group("Activité")
            {
                Caption = 'Activité';
            }
            part(;70135)
            {
            }
            part(;70134)
            {
            }
            part(CaissierActivity;69011)
            {
            }
            group()
            {
                part(;9150)
                {
                }
                systempart(;Notes)
                {
                }
            }
        }
    }

    actions
    {
        area(embedding)
        {
            action("Liste des Bordereaux")
            {
                Caption = 'Liste des Bordereaux';
                RunObject = Page 10870;
                RunPageMode = View;
            }
            action("Liste des demande d'achat")
            {
                Caption = 'Liste des demande d''achat';
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 9306;
            }
            action("Facture Achat")
            {
                RunObject = Page 9308;
            }
            action("Commande Achat")
            {
                RunObject = Page 9307;
            }
            action("Livraison Véhicule Encours")
            {
                RunObject = Page 60140;
                RunPageView = WHERE(Service Type=CONST(Livraison),
                                    Status Livraison=CONST(Fiche Crée));
            }
            action("Fiche Réception Rapide")
            {
                RunObject = Page 60015;
            }
            action("Fiche Grand Service")
            {
                RunObject = Page 60019;
            }
            action("Bordereau Recouvrement")
            {
                RunObject = Page 70002;
            }
            action(Clients)
            {
                RunObject = Page 22;
            }
            action("Bordereaux recouvreurs")
            {
                RunObject = Page 50199;
            }
        }
        area(processing)
        {
            action("Nouveau Borderau de Payment")
            {
                Caption = 'Nouveau Borderau de Payment';
                Image = CreateFinanceChargememo;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 10868;
                RunPageMode = View;
            }
            action("Relevé client")
            {
                RunObject = Report 116;
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
            action("Créer Borderau de Payment")
            {
                Caption = 'Créer Borderau de Payment';
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Codeunit 10860;
            }
            action("Calcule Ristourne Revendeurs")
            {
                RunObject = Page 50081;
            }
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
        }
        area(sections)
        {
            group(Banque)
            {
                Caption = 'Banque';
                Image = Bank;
                action("Liste des banques")
                {
                    Caption = 'Liste des banques';
                    RunObject = Page 371;
                    RunPageMode = View;
                }
                action("Liste des clients")
                {
                    Caption = 'Liste des clients';
                    RunObject = Page 22;
                    RunPageMode = View;
                }
                action("Liste des factures enregistrées")
                {
                    Caption = 'Liste des factures enregistrées';
                    RunObject = Page 143;
                    RunPageMode = View;
                }
                action("Liste des factures services enregistrées")
                {
                    Caption = 'Liste des factures services enregistrées';
                    RunObject = Page 5977;
                    RunPageMode = View;
                }
            }
            group(DocValider)
            {
                Caption = 'Document Validé';
                Image = History;
                separator()
                {
                }
                action("Expeditions PR enregistrées")
                {
                    RunObject = Report 60052;
                }
                action("Factures PR enregistrées")
                {
                    RunObject = Report 60049;
                }
                action("Avoir PR enregistrées")
                {
                    RunObject = Report 60055;
                }
                action("Expedition enregistrées CHR")
                {
                    RunObject = Report 5974;
                }
                action("Factures enregistrées CHR")
                {
                    RunObject = Report 5977;
                }
                action("Avoir enregistrées CHR")
                {
                    RunObject = Report 5971;
                }
                action("Expédition Achat")
                {
                    RunObject = Page 6652;
                }
                action("Factures VN")
                {
                    RunObject = Page 60104;
                }
            }
        }
        area(reporting)
        {
            action("Journal de Caisse")
            {
                Caption = 'Journal de Caisse';
                Image = CashFlow;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 60021;
            }
            action("Imprimer Bord. versement")
            {
                Image = PrintReport;
                RunObject = Report 60003;
            }
            action("Balance Client (Facture)")
            {
                Image = CustomerLedger;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60064;
            }
            action("Balance Agée Client")
            {
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 50016;
            }
            action("Etat Leasing")
            {
                RunObject = Report 60252;
            }
            action("Détails factures client/période")
            {
                RunObject = Report 60257;
            }
        }
    }
}

