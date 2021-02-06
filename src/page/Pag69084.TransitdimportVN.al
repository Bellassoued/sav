page 69084 "Transit d'import VN"
{
    // version ETRANGER

    CaptionML = ENU='Transit Folder',
                FRA='Dossier d''import';
    DeleteAllowed = false;
    PageType = Document;
    SourceTable = Table50000;
    SourceTableView = SORTING(N° Dossier);

    layout
    {
        area(content)
        {
            group("Général")
            {
                Caption = 'Général';
                field("N° Dossier";"N° Dossier")
                {
                    Editable = false;
                }
                field("N° Titre d'importation";"N° Titre d'importation")
                {
                    Visible = false;
                }
                field("N° Fournisseur";"N° Fournisseur")
                {
                }
                field("Nom fournisseur";"Nom fournisseur")
                {
                }
                field("Adresse Fournisseur";"Adresse Fournisseur")
                {
                }
                field("Date d'ouverture";"Date d'ouverture")
                {
                }
                field("No. Réception Achat VN";"No. Réception Achat VN")
                {
                    Editable = false;
                }
                field("No. Production";"No. Projet d'expédition")
                {
                    Editable = false;
                }
                field("No.L.C";"No.L.C")
                {
                    Editable = false;
                }
                field("N° Transitaire";"N° Transitaire")
                {
                    CaptionML = ENU='Freight Forworder No.',
                                FRA='N° Transitaire';
                }
                field("Date Déclaration";"Date Déclaration")
                {
                    Importance = Promoted;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Total Qté.";"Total Qté.")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Total en Devise";"Total en Devise")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Taux de change déclaration";"Taux de change déclaration")
                {
                }
                field("Taux change estimatif";"Taux change estimatif")
                {
                }
                field("Taux change Prévisionel";"Taux change Prévisionel")
                {
                }
                field("Nom Transitaire";"Nom Transitaire")
                {
                    CaptionML = ENU='Freight Forworder Name',
                                FRA='Nom du Transitaire';
                    Visible = false;
                }
                field(TxtGWindowToShow;TxtGWindowToShow)
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        /*IF TxtGWindowToShow = TxtGWindowToShow::"AVCompta" THEN
                          AVComptaTxtGWindowToShowOnValidate;
                        IF TxtGWindowToShow = TxtGWindowToShow::"REArticle" THEN
                          REArticleTxtGWindowToShowOnValidate;
                        IF TxtGWindowToShow = TxtGWindowToShow::"FAAttente" THEN
                          FAAttenteTxtGWindowToShowOnValidate;
                        IF TxtGWindowToShow = TxtGWindowToShow::"FACompta" THEN
                          FAComptaTxtGWindowToShowOnValidate;
                         */

                    end;
                }
                field("N° Transit Externe";"N° Transit Externe")
                {
                    Caption = 'N° Externe/N° Répertoire';
                    Visible = false;
                }
                field("No. Bord-Obligation";"No. Bord-Obligation")
                {
                }
                field("No. Borodereau L.C";"No. Borodereau L.C")
                {
                }
                field("No. Bor. Cont Finan/Bqe";"No. Bor. Cont Finan/Bqe")
                {
                }
                field("Date de clôture";"Date de clôture")
                {
                }
                field("Date Embarquement";"Date B.L")
                {
                }
                field("Date Echéance";"Date Echéance")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Date débarquement";"Date débarquement")
                {
                }
                field("Date d'enlevement port";"Date d'enlevement port")
                {
                }
                field(statut;statut)
                {
                    OptionCaptionML = ENU=',Waiting for Invoice,Invoiced,Closed',
                                      FRA=' ,En attente de facturation,Facturé,Clôturé';
                }
                field("Cour à Terme";"Dernier cours négocié")
                {
                    Caption = 'Cour de règlement';
                }
                field("Date Achat à Terme";"Date Achat à Terme")
                {
                    Caption = 'Date de règlement';
                }
                field("Nbr Obligation";"Nbr Obligation")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("Nbr Déclaration";"Nbr Déclaration")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field(Commentaire;Commentaire)
                {
                }
            }
            part(;70063)
            {
                SubPageLink = No. Dossier Import=FIELD(N° Dossier);
                UpdatePropagation = Both;
                Visible = false;
            }
            part(;70111)
            {
                SubPageLink = No. Dossier Import=FIELD(N° Dossier);
                UpdatePropagation = Both;
                Visible = false;
            }
            group("Détail")
            {
                part("Purchase Inv. Lines";50021)
                {
                    CaptionML = ENU='Purchase Inv. Lines',
                                FRA='Frais comptabilisés';
                    Editable = false;
                    SubPageLink = No dossier VN=FIELD(N° Dossier);
                    SubPageView = SORTING(Document No.,Line No.)
                                  WHERE(Type=CONST("Charge (Item)"));
                    Visible = true;
                }
                part("Purchase Lines";50022)
                {
                    CaptionML = ENU='Purchase Lines',
                                FRA='Frais en attente';
                    Editable = false;
                    SubPageLink = No dossier VN=FIELD(N° Dossier);
                    SubPageView = SORTING(Document Type,Document No.,Line No.)
                                  WHERE(Type=CONST("Charge (Item)"));
                    Visible = true;
                }
                part("Purchase Recep. Lines";50020)
                {
                    CaptionML = ENU='Purchase Recep. Lines',
                                FRA='Articles réceptionnés';
                    Editable = false;
                    SubPageLink = No dossier VN=FIELD(N° Dossier);
                    SubPageView = SORTING(Document No.,Line No.)
                                  WHERE(Type=FILTER(Item|Fixed Asset));
                    Visible = true;
                }
                part("Purchase CR. Lines";50023)
                {
                    CaptionML = ENU='Purchase CR. Lines',
                                FRA='Avoirs enregistrés';
                    Editable = false;
                    SubPageLink = No dossier VN=FIELD(N° Dossier);
                    SubPageView = SORTING(Document No.,Line No.);
                    Visible = true;
                }
                part(;70046)
                {
                    SubPageLink = No. Dossier VN=FIELD(N° Dossier);
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Print)
            {
                CaptionML = ENU='Print',
                            FRA='Fonction';
                action("Folder contents")
                {
                    CaptionML = ENU='Folder contents',
                                FRA='&Contenu dossier';

                    trigger OnAction();
                    var
                        NDossier : Record "50000";
                    begin
                        NDossier.RESET;
                        NDossier.SETFILTER("N° Dossier","N° Dossier");
                        IF NDossier.FIND('-') THEN
                          REPORT.RUNMODAL(50092,TRUE,FALSE,NDossier);
                          // OLD KK REPORT.RUNMODAL(60076,TRUE,FALSE,NDossier);
                    end;
                }
                action("Folder synthesis")
                {
                    CaptionML = ENU='Folder synthesis',
                                FRA='Synthèse dossier';
                    Visible = false;

                    trigger OnAction();
                    var
                        NDossier : Record "50000";
                    begin
                        NDossier.RESET;
                        NDossier.SETFILTER("N° Dossier","N° Dossier");
                        IF NDossier.FIND('-') THEN
                          REPORT.RUNMODAL(50002,TRUE,FALSE,NDossier);
                    end;
                }
                separator()
                {
                }
                action("Actualiser Taux de Change")
                {
                    Caption = 'Actualiser Taux de Change';
                    Visible = false;

                    trigger OnAction();
                    begin
                        recalculercout;
                    end;
                }
                action("Selectionner Liste des Factures Fournisseur")
                {
                    Caption = 'Selectionner Liste des Factures Fournisseur';
                    Image = SelectLineToApply;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        LPagLineArrivagePR : Page "70021";
                        LRecArrivagePR : Record "70017";
                    begin
                        //TESTFIELD("No Arrivage PR");
                        //LRecArrivagePR.SETRANGE(LRecArrivagePR."No. Arrivage","No Arrivage PR");
                        LRecArrivagePR.SETFILTER(LRecArrivagePR."No. Dossier Import",'%1','');
                        IF LRecArrivagePR.FINDFIRST THEN
                        BEGIN
                          LPagLineArrivagePR.SETTABLEVIEW(LRecArrivagePR);
                          LPagLineArrivagePR.LOOKUPMODE := TRUE;
                          LPagLineArrivagePR.FctSetDocArrivage(LRecArrivagePR."No. Arrivage","N° Dossier");
                          LPagLineArrivagePR.RUNMODAL;
                        END;
                    end;
                }
            }
            action("&Navigate")
            {
                CaptionML = ENU='&Navigate',
                            FRA='Na&viguer';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Navigate;
                end;
            }
            action("Proposer commission sur arrivage")
            {
                Image = Suggest;

                trigger OnAction();
                var
                    LettredecreditLC : Record "70036";
                    PageCommissionparbanque : Page "70034";
                    RecCommisionparbanque : Record "70005";
                    op : Option LC,Arrivage,Financement;
                begin
                    op := op::Arrivage;
                    LettredecreditLC.GET("No.L.C");
                    CLEAR(PageCommissionparbanque);
                    RecCommisionparbanque.SETFILTER(Banque,'%1',LettredecreditLC.Banque);
                    PageCommissionparbanque.SETTABLEVIEW(RecCommisionparbanque);
                    PageCommissionparbanque.LOOKUPMODE := TRUE;
                    PageCommissionparbanque.GetLettredeCredit(LettredecreditLC,"N° Dossier",op,'');  //Op : Commission sur LC ou Commission sur arrivage
                    //,"N° Dossier"
                    IF PageCommissionparbanque.RUNMODAL <> ACTION::Cancel THEN;
                end;
            }
            action("Insérer Commission / Feuille compta.")
            {
                Caption = 'Insérer Commission / Feuille compta.';
                Image = InsertAccount;

                trigger OnAction();
                begin
                     CLEAR(LettredecreditLC);
                     LettredecreditLC.GET("No.L.C");
                     MgtAures.InsererCommLC(LettredecreditLC,"N° Dossier");
                end;
            }
            action("Créer Bor. Paiement D.Douane")
            {
                Image = Payment;

                trigger OnAction();
                begin
                    MgtAuresFinance.CreerBordRegObligation(Rec);
                end;
            }
            action("Créer Bor.reglement L.C")
            {
                CaptionML = ENU='Créer Bor.reglement L.C',
                            FRA='Créer Bor.reglement L.C';
                Image = PaymentPeriod;

                trigger OnAction();
                begin
                    MgtAuresFinance.CreerBordRegFrsFinacementDevi(Rec);
                end;
            }
            action("Créer Bor.Const(Fin-en BQE)")
            {
                Image = PaymentPeriod;
                Visible = false;

                trigger OnAction();
                begin
                    MgtAuresFinance.CreerBordRegFinacementDeviEnBQE(Rec);
                end;
            }
            action("Proposer Financement")
            {
                Image = SuggestPayment;
                Visible = false;

                trigger OnAction();
                begin
                    MgtAures.ProposerFinancement(Rec);
                end;
            }
            action("Négociation à terme")
            {
                Image = BankAccountStatement;

                trigger OnAction();
                begin
                    MgtAures.NegociationATermeArrivage(Rec);
                end;
            }
            action("Déclaration Douane")
            {

                trigger OnAction();
                begin
                    MgtAures.DeclarationDouane(Rec);
                end;
            }
        }
        area(navigation)
        {
            Caption = 'Consultation';
            action("Consulter financement")
            {
                Image = Check;
                RunObject = Page 70052;
                RunPageLink = No. Arrivage=FIELD(N° Dossier);
                Visible = false;
            }
            action("Consulter Négociation")
            {
                Image = CheckList;
                RunObject = Page 70051;
                RunPageLink = No. Document=FIELD(N° Dossier);
            }
            action("Consulter Liste des Obligations")
            {
                Image = Check;
                RunObject = Page 10870;
                RunPageLink = No. Arrivage=FIELD(N° Dossier);
            }
        }
    }

    trigger OnInit();
    begin
        "Purchase CR. LinesVisible" := TRUE;
        "Purchase Recep. LinesVisible" := TRUE;
        "Purchase LinesVisible" := TRUE;
        "Purchase Inv. LinesVisible" := TRUE;
    end;

    trigger OnOpenPage();
    begin
        TxtGWindowToShow := 'FACompta';
        ShowWindow;

        AutreDate := FALSE;
        Commentaire  := '';
        CLEAR(PaymentHeader);
        PaymentHeader.SETFILTER("No. Arrivage",'%1',"N° Dossier");
        PaymentHeader.SETFILTER("Date Déclaration Douane",'<>%1',0D);
        IF PaymentHeader.FIND('-') THEN
        REPEAT
          IF PaymentHeader."Date Déclaration Douane" <> "Date Déclaration" THEN
            BEGIN
             AutreDate := TRUE;
              Commentaire  := 'Pls Date Déclarations, a consulter les bordereaux D.Douane';

            END;
        UNTIL PaymentHeader.NEXT = 0;
          MODIFY;
    end;

    var
        DescGTotFraisEnIns : Decimal;
        DescGTotFrais : Decimal;
        TxtGWindowToShow : Text[30];
        [InDataSet]
        "Purchase Inv. LinesVisible" : Boolean;
        [InDataSet]
        "Purchase LinesVisible" : Boolean;
        [InDataSet]
        "Purchase Recep. LinesVisible" : Boolean;
        [InDataSet]
        "Purchase CR. LinesVisible" : Boolean;
        MgtAures : Codeunit "70006";
        LettredecreditLC : Record "70036";
        MgtAuresFinance : Codeunit "70006";
        PaymentHeader : Record "10865";
        AutreDate : Boolean;

    procedure ShowWindow();
    begin
        CASE TxtGWindowToShow OF
          'FACompta' : BEGIN
                         "Purchase Inv. LinesVisible" := TRUE;
                         "Purchase LinesVisible" := FALSE;
                         "Purchase Recep. LinesVisible" := FALSE;
                         "Purchase CR. LinesVisible" := FALSE;
                       END;
          'FAAttente' : BEGIN
                          "Purchase Inv. LinesVisible" := FALSE;
                          "Purchase LinesVisible" := TRUE;
                          "Purchase Recep. LinesVisible" := FALSE;
                          "Purchase CR. LinesVisible" := FALSE;
                        END;
          'REArticle' : BEGIN
                          "Purchase Inv. LinesVisible" := FALSE;
                          "Purchase LinesVisible" := FALSE;
                          "Purchase Recep. LinesVisible" := TRUE;
                          "Purchase CR. LinesVisible" := FALSE;
                        END;
          'AVCompta' : BEGIN
                          "Purchase Inv. LinesVisible" := FALSE;
                          "Purchase LinesVisible" := FALSE;
                          "Purchase Recep. LinesVisible" := FALSE;
                          "Purchase CR. LinesVisible" := TRUE;
                        END;

        END;
    end;

    local procedure FAComptaTxtGWindowToShowOnVali();
    begin
        ShowWindow;
    end;

    local procedure FAAttenteTxtGWindowToShowOnVal();
    begin
        ShowWindow;
    end;

    local procedure REArticleTxtGWindowToShowOnVal();
    begin
        ShowWindow;
    end;

    local procedure AVComptaTxtGWindowToShowOnVali();
    begin
        ShowWindow;
    end;
}

