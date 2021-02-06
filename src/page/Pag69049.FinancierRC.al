page 69049 "Financier RC"
{
    // version Caissier RC,FIN01

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group("Activité")
            {
                Caption = 'Activité';
                part(CaissierActivity;69011)
                {
                }
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
            action("Détail Bordereau Activité VN")
            {
                RunObject = Page 50099;
            }
            action("Facture Achat")
            {
                RunObject = Page 9308;
            }
            action("Commande Achat")
            {
                RunObject = Page 9307;
            }
            action("Crédits bancaires")
            {
                RunObject = Page 69046;
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
                action("Expédition Achat")
                {
                    RunObject = Page 6652;
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
        }
    }
}

