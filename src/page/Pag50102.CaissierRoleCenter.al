page 50102 "Caissier Role Center"
{
    // version RC Caissier

    PageType = RoleCenter;
    PopulateAllFields = true;
    RefreshOnActivate = true;

    layout
    {
        area(rolecenter)
        {
            part(;50103)
            {
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
            ToolTipML = ENU='View and process vendor payments, and approve incoming documents.',
                        FRA='Afficher et traiter les paiements fournisseur et approuver les documents entrants.';
            action("Liste bordereau de paiement")
            {
                RunObject = Page 10870;
            }
            action("Liste des Clients")
            {
                RunObject = Page 22;
            }
            action("Commande OR")
            {
                RunObject = Page 9318;
                RunPageView = WHERE(Release Status=CONST(Released to Ship));
            }
            action("Liste demande Achat")
            {
                RunObject = Page 50006;
            }
            action("Liste demande Achat Clôturer")
            {
                Caption = 'Liste demande Achat Clôturer';
                RunObject = Page 50118;
            }
            action("Liste Commande Achat")
            {
                RunObject = Page 50114;
            }
            action("List Facture PR/SAV")
            {
                RunObject = Page 70250;
                Visible = false;
            }
            action("Afficher détail bordereaux")
            {
                RunObject = Page 10862;
            }
            action("Liste commande VN")
            {
                RunObject = Page 70232;
            }
            action("Liste voitures populaires")
            {
                RunObject = Page 50177;
            }
        }
        area(processing)
        {
        }
        area(reporting)
        {
            group("Général")
            {
                Caption = 'Général';
                action("Balance clients")
                {
                    Image = Print;
                    RunObject = Report 10805;
                }
                action("Grand livre clients")
                {
                    Image = Print;
                    RunObject = Report 10806;
                }
                action("Ligne bordereau de réglement")
                {
                    RunObject = Page 50110;
                }
                action("Factures leasig")
                {
                    RunObject = Report 60252;
                }
            }
            group(Caisse)
            {
                Caption = 'Caisse';
                action("Journale Caisse")
                {
                    Image = CashReceiptJournal;
                    RunObject = Report 60021;
                    Visible = false;
                }
                action("Journale de caisse")
                {
                    Image = CashReceiptJournal;
                    RunObject = Report 70078;
                    Visible = false;
                }
                action("Journale Caisse Admin")
                {
                    Image = CashReceiptJournal;
                    RunObject = Report 70079;
                    Visible = false;
                }
                action("Journale de Caisse V2")
                {
                    Image = CashReceiptJournal;
                    RunObject = Report 70083;
                }
                action("Journée Commercial Admin")
                {
                    Image = PrintReport;
                    RunObject = Report 70067;
                    Visible = false;
                }
                action("Test-report")
                {
                    RunObject = Report 60160;
                    Visible = false;
                }
                action("Journée commerciale")
                {
                    RunObject = Report 60199;
                }
                group("Journée commerciale")
                {
                    Caption = 'Journée commerciale';
                    Visible = false;
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
        }
        area(creation)
        {
            action("Saisie Bordereau de Paiement")
            {
                Image = ReceivablesPayables;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page 10868;
                RunPageMode = Create;
            }
            action("Créer bordereau paiement")
            {
                Image = NewDocument;
                RunObject = Codeunit 10860;
            }
            action("Changer Profil")
            {
                Image = Change;
                RunObject = Codeunit 70006;
                Visible = false;
            }
        }
        area(sections)
        {
            group(Recouvrement)
            {
                Caption = 'Recouvrement';
                action("Liste bordereau recouvrement")
                {
                    RunObject = Page 70002;
                }
            }
            group("Documents validés")
            {
                Caption = 'Documents validés';
                action("Page Posted Sales Shipments VN")
                {
                    Caption = 'Expéditions vente enregistrées VN';
                    Image = PostedShipment;
                    RunObject = Page 60107;
                }
                action("Page Posted Sales Invoices VN")
                {
                    Caption = 'Factures vente enregistrées VN';
                    Image = PostedOrder;
                    RunObject = Page 60104;
                }
                action("Page Posted Return Receipts VN")
                {
                    Caption = 'Réceptions retour enregistrées VN';
                    Image = PostedReturnReceipt;
                    RunObject = Page 60113;
                }
                action("Page Posted Sales Credit Memos")
                {
                    Caption = 'Avoirs vente enregistrés  VN';
                    Image = PostedOrder;
                    RunObject = Page 60110;
                }
                action("Expéditions SAV enregistrées")
                {
                    Image = PostedShipment;
                    RunObject = Page 5974;
                }
                action("Factures SAV enregistrées")
                {
                    Image = PostedOrder;
                    RunObject = Page 5977;
                }
                action("Expéditions vente enregistrées PR")
                {
                    Image = PostedShipment;
                    RunObject = Page 60052;
                }
                action("Factures vente enregistrées PR")
                {
                    Image = PostedOrder;
                    RunObject = Page 60049;
                }
                action("Réceptions retour enregistrées PR")
                {
                    Image = PostedReturnReceipt;
                    RunObject = Page 60058;
                }
                action("Avoirs vente enregistrés PR")
                {
                    Image = PostedOrder;
                    RunObject = Page 60055;
                }
                action("Avoir enregistrés SAV")
                {
                    RunObject = Page 5971;
                }
            }
        }
    }
}

