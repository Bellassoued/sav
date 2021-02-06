page 60120 "document Entré en stock démont"
{
    // version Prelevement

    CaptionML = ENU='Inventory Inbound Movement',
                FRA='document Entré en stock démontage';
    DeleteAllowed = false;
    PageType = Document;
    SourceTable = Table50009;
    SourceTableView = WHERE(Type Mvt=FILTER(Entrée));

    layout
    {
        area(content)
        {
            group("Général")
            {
                Caption = 'Général';
                field("N°";"N°")
                {
                    Editable = false;
                }
                field("Type Mvt";"Type Mvt")
                {
                    CaptionML = ENU='Type',
                                FRA='Type Mouvement';
                    Editable = false;
                }
                field("Type origine";"Type origine")
                {
                    Editable = false;
                }
                field("Sourec Doc Type";"Sourec Doc Type")
                {
                }
                field("Source No.";"Source No.")
                {
                }
                field("Numero de Chassis";"Numero de Chassis")
                {

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        //<< TRIUM RAD 11/03/2014 - Sélection des Num Chassis disponibles

                        CLEAR(RecGItemLedgentry);
                        RecGItemLedgentry.SETCURRENTKEY("Item No.","Location Code","Serial No.","Lot No.","Posting Date");
                        RecGItemLedgentry.FILTERGROUP(2);
                        RecGItemLedgentry.SETFILTER("Serial No.",'<>%1','');
                        RecGItemLedgentry.SETRANGE("Location Code","Transfer-from Code");
                        RecGItemLedgentry.SETRANGE(Open, TRUE);
                        RecGItemLedgentry.FILTERGROUP(0);
                        IF RecGItemLedgentry.FINDSET THEN
                          BEGIN
                          CLEAR(PgeEcrArticle);
                          PgeEcrArticle.SETTABLEVIEW(RecGItemLedgentry);
                          PgeEcrArticle.SETRECORD(RecGItemLedgentry);
                          PgeEcrArticle.LOOKUPMODE(TRUE);
                          IF PgeEcrArticle.RUNMODAL = ACTION::LookupOK THEN
                            BEGIN
                              PgeEcrArticle.GETRECORD(RecGItemLedgentry);
                              "Numero de Chassis" := RecGItemLedgentry."Serial No.";
                              "Modèle Vehicule"   := RecGItemLedgentry."Item No." ;
                              "Code Variante"     := RecGItemLedgentry."Variant Code" ;
                              "Description Véhicule"  := RecGItemLedgentry.Description ;
                            END;
                          END;

                        //>> End TRIUM RAd Addin
                    end;
                }
                field("Modèle Vehicule";"Modèle Vehicule")
                {
                    Editable = false;
                }
                field("Code Variante";"Code Variante")
                {
                    Editable = false;
                }
                field("Description Véhicule";"Description Véhicule")
                {
                    Editable = false;
                }
                field("Date comptabilisation";"Date comptabilisation")
                {
                }
                field("Transfer-from Code";"Transfer-from Code")
                {

                    trigger OnValidate();
                    var
                        RecLItemJournalLine : Record "83";
                    begin
                        RecGInventorySetup.GET;
                        RecLItemJournalLine.SETRANGE(RecLItemJournalLine."Journal Template Name",RecGInventorySetup."Modele Feuille");
                        RecLItemJournalLine.SETRANGE(RecLItemJournalLine."Journal Batch Name","N°");
                        IF RecLItemJournalLine.FINDFIRST THEN
                          RecLItemJournalLine.MODIFYALL(RecLItemJournalLine."Location Code","Transfer-from Code");

                        CurrPage.UPDATE;
                    end;
                }
                field(LibelleOrigine;LibelleOrigine)
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
            }
            part(SubPage1;50028)
            {
                SubPageLink = Journal Batch Name=FIELD(N°);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Posting)
            {
                CaptionML = ENU='Posting',
                            FRA='Validation';
                action("Post + Print")
                {
                    CaptionML = ENU='Post + Print',
                                FRA='Valider et imprimer';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CDUStockFunction.EntreeStock(Rec,TRUE);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action(Post)
                {
                    CaptionML = ENU='Post',
                                FRA='Valider';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        CDUStockFunction.EntreeStock(Rec,FALSE);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin

        CurrPage.SubPage1.PAGE.SetBatchName("N°") ;
        CurrPage.SubPage1.PAGE.InitTemplate("Type Mvt");
        CurrPage.SubPage1.PAGE.SetTypeMvt("Type Mvt") ;


        IF RecLocation.GET("Transfer-from Code") THEN
           LibelleOrigine := RecLocation.Name;
        IF RecLocation.GET("Transfer-to Code") THEN
           LibelleDestinataire := RecLocation.Name;
        IF ZCustomer.GET("N° Client")  THEN
            NomClient := ZCustomer.Name
           ELSE
            NomClient:='';
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    var
        IntLSelection : Integer;
        Text001 : Label 'Entrée,Sortie';
    begin

        //AssistEditEntree(Rec);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin


        CurrPage.SubPage1.PAGE.SetBatchName("N°");
        "Type Mvt":="Type Mvt"::Entrée;
        "Type origine" := "Type origine"::Démontage ;
        //"Global Dimension 1 Code":=UserMngt.GetSalesFilter;
        //"Type Mvt":="Type Mvt"::Entrée;
        //"Global Dimension 1 Code":=UserMngt.GetSalesFilter;
        RecGServiceSetup.GET ;
        IF RecGServiceSetup."Magasin Prelevement defaut" <> '' THEN
          "Transfer-from Code" := RecGServiceSetup."Magasin Prelevement defaut";

        CurrPage.SubPage1.PAGE.InitTemplate("Type Mvt");
    end;

    trigger OnOpenPage();
    begin
        CompanyInfo.GET;
    end;

    var
        OptGTypeMvt : Option "0","1";
        UserMngt : Codeunit "5700";
        RecDocStockValide : Record "50010";
        RecItemLedgerEntry : Record "32";
        "RecItemJourna Line" : Record "83";
        RecGInventorySetup : Record "313";
        RecGClient : Record "18";
        RecDocStockValideTemp : Record "50010" temporary;
        RecDocStockVal : Record "50010";
        DocN : Code[20];
        RecEcritArt : Record "32";
        "DateDéclaration-V" : Date;
        "NumeroDéclaration-V" : Code[20];
        Erreur001 : Label 'Erreur de Numéro de Déclaration';
        NomClient : Text[50];
        ZCustomer : Record "18";
        LibelleOrigine : Text[30];
        LibelleDestinataire : Text[30];
        RecLocation : Record "14";
        RecItemJournalLine : Record "83";
        CompanyInfo : Record "79";
        CDUStockFunction : Codeunit "50000";
        RecGItemLedgentry : Record "32";
        PgeEcrArticle : Page "60078";
        RecGServiceSetup : Record "5911";
}

