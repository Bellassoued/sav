page 69036 "Caissier Carte Grise RC"
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
                part(CaissierActivity;69037)
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
            action("Commande Achat")
            {
                RunObject = Page 9307;
            }
            action("Liste Cartes Grises")
            {
                Caption = 'Liste Cartes Grises';
                RunObject = Page 60074;
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
                action("Facture Achat")
                {
                    RunObject = Page 146;
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

