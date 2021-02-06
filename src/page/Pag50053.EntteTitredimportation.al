page 50053 "Entête Titre d'importation"
{
    // version ETRANGER

    Caption = 'Titre d''importation';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table50011;

    layout
    {
        area(content)
        {
            group("Général")
            {
                Caption = 'Général';
                field("No. Titre D'importation";"No. Titre D'importation")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit1(Rec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field("Date Titre D'importation";"Date Titre D'importation")
                {
                }
                field("No. Fournisseur";"No. Fournisseur")
                {
                }
                field("Nom Fournisseur";"Nom Fournisseur")
                {
                }
                field("Adresse Fournisseur";"Adresse Fournisseur")
                {
                }
                field("Compte bancaire";"Compte bancaire")
                {
                }
                field("N° Facture Proforma";"N° Facture Proforma")
                {
                }
                field("Date Facrure Proforma";"Date Facrure Proforma")
                {
                }
                field(Pays;Pays)
                {
                }
                field("No. Bon de Commande";"No. Bon de Commande")
                {
                }
                field(Relicat;Relicat)
                {
                }
                field("Date Bon de Commande";"Date Bon de Commande")
                {
                }
                field("Mois B.C";"Mois B.C")
                {
                }
                field("Année B.C";"Année B.C")
                {
                }
                field(Statut;Statut)
                {
                }
                field(Devise;Devise)
                {
                }
                field("Cours douane";"Cours douane")
                {
                }
                field("Total devise";"Total devise")
                {
                }
                field("Total en Dinar";"Total en Dinar")
                {
                }
                field("No. Expedition";"No. Expedition")
                {
                }
                field("No. L.C";"No. L.C")
                {
                }
                field("No. Bord. Reg. Frs";"No. Bord. Reg. Frs")
                {
                    Editable = false;
                }
                field("Court négocié";"Court négocié")
                {
                    Editable = false;
                }
                field("No. réception achat /cmd";"No. réception achat /cmd")
                {
                }
                field("No. réception achat Multiple";"No. réception achat Multiple")
                {
                }
            }
            part(;50063)
            {
                SubPageLink = No Titre=FIELD(No. Titre D'importation);
            }
            part("Ligne Titre D'importation";50054)
            {
                Caption = 'Ligne Titre D''importation';
                SubPageLink = No. Titre d'importation=FIELD(No. Titre D'importation);
            }
            part(;70054)
            {
                SubPageLink = No. Arrivage=FIELD(No. Titre D'importation);
            }
            group(Banque)
            {
                Caption = 'Banque';
                field("No. SWIFT";"No. SWIFT")
                {
                }
                field("Date SWIFT";"Date SWIFT")
                {
                }
                field("N° Domiciliation";"N° Domiciliation")
                {
                }
                field("Date Domiciliation";"Date Domiciliation")
                {
                }
                field("Delai Reglement";"Delai Reglement")
                {
                }
                field("Mode Reglement";"Mode Reglement")
                {
                }
            }
            group(International)
            {
                Caption = 'International';
                field("Modal. Liv";"Modal. Liv")
                {
                }
                field(Banque;Banque)
                {
                }
                field("Nom de la banque";"Nom de la banque")
                {
                }
                field("No. Transitaire";"No. Transitaire")
                {
                }
                field("Nom Transitaire";"Nom Transitaire")
                {
                    Editable = false;
                }
                field("Code en Douane";"Code en Douane")
                {
                }
                field("FOB DEV.";"FOB DEV.")
                {
                }
            }
            group("Traçabilité")
            {
                Caption = 'Traçabilité';
                field("Crée par";"Crée par")
                {
                }
                field("Crée le";"Crée le")
                {
                }
                field("Modifier par";"Modifier par")
                {
                }
                field("Modifier le";"Modifier le")
                {
                }
            }
            group(Reliquat)
            {
                field("Date réception Prévisionnelle";"Date réception Prévisionnelle")
                {
                }
                field("Montant Titre";"Total devise")
                {
                }
                field("Echéance Prox.";"Echéance Prox.")
                {
                }
                field("Total Expédition Consommé";"Total Expédition Consommé")
                {
                }
                field("Montant Reclicat";"Total devise"- "Total Expédition Consommé")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Fonction)
            {
                Caption = 'Fonction';
                action(Lancer)
                {
                    Image = ReleaseDoc;

                    trigger OnAction();
                    begin
                        //TESTFIELD(Statut,0);
                        TESTFIELD("No. Bon de Commande");
                        TESTFIELD("No. Fournisseur");
                        IF CONFIRM('Ëtes vous sûre de vouloir Lancer ce Document ?',TRUE,FALSE) THEN
                        BEGIN
                         Statut := 1;
                        "FOB DEV." := "Total devise"*0.95;
                         MODIFY;

                        RecLigneTitredimportation.SETRANGE("No. Titre d'importation","No. Titre D'importation");
                         RecLigneTitredimportation.SETFILTER(Quantité,'<>%1',0);
                         IF RecLigneTitredimportation.FINDSET THEN
                           REPEAT
                              RecDétailLC.SETRANGE(RecDétailLC."No. Expédition",RecLigneTitredimportation."No. Expédition");
                              RecDétailLC.SETRANGE(RecDétailLC."No. Ligne Expédition",RecLigneTitredimportation."No. Line Expédition");
                              IF RecDétailLC.FINDSET THEN
                                REPEAT
                                  RecDétailLC."Qty Reçu" := 0;
                                  RecDétailLC."Montant arrivage Devise" += 0;
                                  RecDétailLC.MODIFY
                                UNTIL RecDétailLC.NEXT = 0;

                           UNTIL RecLigneTitredimportation.NEXT = 0;

                         RecLigneTitredimportation.SETRANGE("No. Titre d'importation","No. Titre D'importation");
                         RecLigneTitredimportation.SETFILTER(Quantité,'<>%1',0);
                         IF RecLigneTitredimportation.FINDSET THEN
                           REPEAT
                              RecDétailLC.SETRANGE(RecDétailLC."No. Expédition",RecLigneTitredimportation."No. Expédition");
                              RecDétailLC.SETRANGE(RecDétailLC."No. Ligne Expédition",RecLigneTitredimportation."No. Line Expédition");
                              IF RecDétailLC.FINDSET THEN
                                REPEAT
                                  RecDétailLC."Qty Reçu" += RecLigneTitredimportation.Quantité;
                                  RecDétailLC."Montant arrivage Devise" += RecLigneTitredimportation."Montant TND";
                                  RecDétailLC.MODIFY
                                UNTIL RecDétailLC.NEXT = 0;

                           UNTIL RecLigneTitredimportation.NEXT = 0;
                           CLEAR(LettredecreditLC);
                           LettredecreditLC.SETRANGE(LettredecreditLC."Code L.C","No. L.C");
                           LettredecreditLC.FIND('-');
                           BEGIN
                             LettredecreditLC.CALCFIELDS("Montant L.C Tnd");
                             LettredecreditLC."Montant ouvert" := LettredecreditLC."Montant L.C Tnd" - RecDétailLC."Montant arrivage Devise";
                             LettredecreditLC.MODIFY;
                             END;
                        END;
                    end;
                }
                action("Réouvrir")
                {
                    Image = ReOpen;

                    trigger OnAction();
                    begin
                        //TESTFIELD(Statut,1);

                        IF CONFIRM('Ëtes vous sûre de vouloir Réouvrir ce Document ?',TRUE,FALSE) THEN
                        BEGIN
                        Statut := 0;
                        MODIFY
                        END;
                    end;
                }
            }
            group("Négos")
            {
                Caption = 'Négos';
                action("Proposer Financement")
                {
                    Image = SuggestPayment;

                    trigger OnAction();
                    begin
                        MgtAures."ProposerFinancement:Asupp"(Rec);
                    end;
                }
                action("Négociation à terme")
                {
                    Image = BankAccountStatement;

                    trigger OnAction();
                    begin
                        MgtAures."NegociationATermeArrivage:Asupp"(Rec);
                    end;
                }
            }
            group(Paiement)
            {
                Caption = 'Paiement';
                action("Créer bordereau")
                {
                    Image = PaymentForecast;

                    trigger OnAction();
                    begin
                        MgtAures.CreateBordRegFrs(Rec);
                    end;
                }
            }
        }
    }

    var
        PurchOrder : Record "38";
        LigneTitredimportation : Record "50012";
        PurchLine : Record "39";
        Item : Record "27";
        "ExpéditionparTitre" : Record "50013";
        "ExpéditionparTitreTmp" : Record "50013";
        NextExpedNo : Integer;
        PurchasesPayablesSetup : Record "312";
        NbrExped : Integer;
        TitreDimportationTmp : Record "50011";
        RecPaymentHeader : Record "10865";
        RecPaymentLine : Record "10866";
        RecPaymentClass : Record "10860";
        NoSeriesMgt : Codeunit "396";
        "RecLettredecréditLC" : Record "70036";
        "RecDétailLC" : Record "70037";
        RecLigneTitredimportation : Record "50012";
        MgtAures : Codeunit "70003";
        LettredecreditLC : Record "70036";
}

