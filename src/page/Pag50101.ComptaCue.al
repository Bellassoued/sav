page 50101 "Compta. Cue"
{
    Caption = 'Tableau de bord';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(;70134)
            {
            }
            part(;70135)
            {
            }
            part(;70141)
            {
            }
            part(;70140)
            {
            }
            part(;70142)
            {
            }
            part(;9150)
            {
            }
            part(;9151)
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

    actions
    {
        area(embedding)
        {
            ToolTipML = ENU='View and process vendor payments, and approve incoming documents.',
                        FRA='Afficher et traiter les paiements fournisseur et approuver les documents entrants.';
            action("Plan comptable")
            {
                RunObject = Page 16;
            }
            action("Comptes bancaires")
            {
                RunObject = Page 371;
                Visible = false;
            }
            action("Liste bordereau de paiement")
            {
                RunObject = Page 10870;
            }
            action("Liste des cautions")
            {
                Image = List;
                RunObject = Page 70006;
            }
            action("Bordereaux de recouvrement")
            {
                RunObject = Page 70002;
            }
            action("Bordereaux recouvreurs")
            {
                RunObject = Page 50199;
            }
            action("Lignes de recouvrement")
            {
                RunObject = Page 70136;
            }
            action("Liste demande Achat")
            {
                RunObject = Page 50006;
                RunPageView = WHERE(D.A réglé=CONST(No));
            }
            action("Liste Commande Achat")
            {
                Caption = 'Liste Commande Achat/DA';
                RunObject = Page 50114;
            }
            action("Liste demande Achat Clôturer")
            {
                Caption = 'DA en cours de réglement';
                RunObject = Page 50118;
            }
            action("Liste des Clients")
            {
                RunObject = Page 22;
            }
            action("Liste des Fournisseurs ")
            {
                RunObject = Page 27;
                Visible = false;
            }
            action("Liste des véhicules")
            {
                RunObject = Page 60066;
            }
            action("Liste des VIN en stock ")
            {
                RunObject = Page 70283;
            }
            action("Liste des livraisons")
            {
                RunObject = Page 70274;
            }
            action("VIN livrés")
            {
                RunObject = Page 70075;
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
            action("Liste des ordres de réparation Atelier")
            {
                Caption = 'Liste des ordres de réparation Atelier';
                RunObject = Page 60019;
                Visible = false;
            }
            action("Liste des OR CHRONO")
            {
                Caption = 'Liste des ordres de réparation CHRONO';
                RunObject = Page 60015;
                Visible = false;
            }
            action("Liste des articles")
            {
                RunObject = Page 31;
                Visible = false;
            }
            action("Liste Commande VN")
            {
                RunObject = Page 60083;
                Visible = false;
            }
            action("Liste devis ")
            {
                RunObject = Page 9300;
                Visible = false;
            }
            action("Liste des Clients En Cours ")
            {
                RunObject = Page 60322;
            }
        }
        area(processing)
        {
            action("Nouveau bordereau de recouvrement")
            {
                Image = NewDocument;
                RunObject = Page 70000;
                RunPageMode = Create;
                RunPageOnRec = true;
            }
            action("Nouvelle caution")
            {
                Image = CreateLedgerBudget;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page 70007;
                RunPageMode = Create;
            }
            action("Créer client")
            {
                Image = NewCustomer;
                RunObject = Page 21;
                RunPageMode = Create;
            }
            action("Feuille comptabilité")
            {
                RunObject = Page 39;
            }
        }
        area(reporting)
        {
            group("Général")
            {
                Caption = 'Général';
                action("Balance comptes généraux")
                {
                    Image = Print;
                    RunObject = Report 10803;
                }
                action("Grand livre comptes généraux")
                {
                    Image = Print;
                    RunObject = Report 10804;
                }
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
                action("Balance fournisseurs")
                {
                    Image = Print;
                    RunObject = Report 10807;
                }
                action("Grand livre fournisseurs")
                {
                    Image = Print;
                    RunObject = Report 10808;
                }
                action("Balance comptes bancaires")
                {
                    Image = Print;
                    RunObject = Report 10809;
                }
                action("Grand livre comptes bancaires")
                {
                    Image = Print;
                    RunObject = Report 10810;
                }
                action("Situation Leasing")
                {
                    Image = Print;
                    RunObject = Report 60170;
                }
                action("Détail Factures LEASING")
                {
                    Caption = 'Détail Factures LEASING';
                    Image = print;
                    RunObject = Report 60180;
                }
            }
            group(Caisse)
            {
                Caption = 'Caisse';
                action("Journale Caisse")
                {
                    Image = CashReceiptJournal;
                    RunObject = Report 70083;
                }
                action("Test-report")
                {
                    RunObject = Report 60160;
                }
                action("Journée Commercial Chrono")
                {
                    Image = PrintReport;
                    RunObject = Report 70059;
                }
                action("Journée commerciale atelier.")
                {
                    Image = PrintReport;
                    RunObject = Report 70057;
                }
                action("Journée Comercial PR")
                {
                    Image = PrintReport;
                    RunObject = Report 60061;
                }
                action("Attestation de paiement (Reconst.)")
                {
                    Caption = 'Attestation de paiement (Reconst.)';
                    RunObject = Report 60191;
                }
                action(Feuilles)
                {
                    Caption = 'Feuilles';
                    Image = "Report";
                    RunObject = Report 10801;
                }
            }
            group(Journal)
            {
                Caption = 'Journal';
                action("Journal Général")
                {
                    Caption = 'Journal Général';
                    Image = "Report";
                    RunObject = Report 10800;
                }
                action("Journal Compte Clients")
                {
                    Caption = 'Journal Compte Clients';
                    Image = "Report";
                    RunObject = Report 10813;
                }
                action("Journal Comptes Fournisseurs")
                {
                    Caption = 'Journal Comptes Fournisseurs';
                    Image = "Report";
                    RunObject = Report 10814;
                }
                action("Journal Comptes Bancaires")
                {
                    Caption = 'Journal Comptes Bancaires';
                    Image = "Report";
                    RunObject = Report 10815;
                }
                action("Rapprochement cpta. gén./Client")
                {
                    Caption = 'Rapprochement cpta. gén./Client';
                    Image = "Report";
                    RunObject = Report 10861;
                }
                action("Rapprochement Cpta. gén./Fourn.")
                {
                    Caption = 'Rapprochement Cpta. gén./Fourn.';
                    Image = "Report";
                    RunObject = Report 10863;
                }
                action("Relevé de Compte Général")
                {
                    Caption = 'Relevé de Compte Général';
                    Image = "Report";
                    RunObject = Report 10842;
                }
            }
            group("Etats Finance")
            {
                Caption = 'Etats Finance';
                action("Engagement par Signatures")
                {
                    RunObject = Report 50047;
                }
                action("Engagement /Banque")
                {
                    RunObject = Report 50041;
                }
            }
        }
        area(creation)
        {
            action("Feuilles comptabilité")
            {
                Image = Journal;
                RunObject = Page 39;
            }
            action("Feuille abonnement")
            {
                Image = Journals;
                RunObject = Page 283;
            }
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
                action("Afficher/Éditer lignes paiement")
                {
                    Caption = 'Afficher/Éditer lignes paiement';
                    RunObject = Page 10862;
                }
            }
        }
    }

    var
        EnteteRecouvrement : Record "70000";
}

