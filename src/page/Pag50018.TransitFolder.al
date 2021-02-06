page 50018 "Transit Folder"
{
    // version ETRANGER

    CaptionML = ENU='Transit Folder',
                FRA='Dossier d''import';
    PageType = Document;
    SourceTable = 50000;
    SourceTableView = SORTING("No Dossier" );

    layout
    {
        area(content)
        {
            group("Général")
            {
                Caption = 'Général';
                field("No Dossier";"No Dossier")
                {
                    Editable = false;
                }
                field("N° Titre d'importation";"No Titre d'importation")
                {
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
                field("Adresse Fournisseur 2";"Adresse Fournisseur 2")
                {
                }
                field("Code Post Fournisseur";"Code Post Fournisseur")
                {
                }
                field("Ville Fournisseur";"Ville Fournisseur")
                {
                }
                field("N° Transitaire";"N° Transitaire")
                {
                    CaptionML = ENU='Freight Forworder No.',
                                FRA='N° Transitaire';
                }
                field("Nom Transitaire";"Nom Transitaire")
                {
                    CaptionML = ENU='Freight Forworder Name',
                                FRA='Nom du Transitaire';
                }
                field(TxtGWindowToShow;TxtGWindowToShow)
                {

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
                }
                field("Date d'ouverture";"Date d'ouverture")
                {
                }
                field("Date de clôture";"Date de clôture")
                {
                }
                field(statut;statut)
                {
                    OptionCaptionML = ENU=',Waiting for Invoice,Invoiced,Closed',
                                      FRA=' ,En attente de facturation,Facturé,Clôturé';
                }
                field("No Arrivage PR";"No Arrivage PR")
                {
                }
                field("Nombre des Colis";"Nombre des Colis")
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
                    SubPageLink = N° dossier=FIELD(N° Dossier);
                    SubPageView = SORTING(Document No.,Line No.)
                                  WHERE(Type=CONST("Charge (Item)"));
                    Visible = true;
                }
                part("Purchase Lines";50022)
                {
                    CaptionML = ENU='Purchase Lines',
                                FRA='Frais en attente';
                    Editable = false;
                    SubPageLink = No dossier=FIELD(N° Dossier);
                    SubPageView = SORTING(Document Type,Document No.,Line No.)
                                  WHERE(Type=CONST("Charge (Item)"));
                    Visible = true;
                }
                part("Purchase Recep. Lines";50020)
                {
                    CaptionML = ENU='Purchase Recep. Lines',
                                FRA='Articles réceptionnés';
                    Editable = false;
                    SubPageLink = N° dossier=FIELD(N° Dossier);
                    SubPageView = SORTING(Document No.,Line No.)
                                  WHERE(Type=FILTER(Item|Fixed Asset));
                    Visible = true;
                }
                part("Purchase CR. Lines";50023)
                {
                    CaptionML = ENU='Purchase CR. Lines',
                                FRA='Avoirs enregistrés';
                    Editable = false;
                    SubPageLink = N° dossier=FIELD(N° Dossier);
                    SubPageView = SORTING(Document No.,Line No.);
                    Visible = true;
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
                            FRA='Impression';
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

