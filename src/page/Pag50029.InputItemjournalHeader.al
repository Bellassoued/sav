page 50029 "Input Item journal Header"
{
    // version DOC STOCK

    CaptionML = ENU='Inventory Inbound Movement',
                FRA='Document d''entrée en stock';
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
                    Editable = false;
                }
                field("N° Client";"N° Client")
                {

                    trigger OnValidate();
                    begin
                        IF ZCustomer.GET("N° Client")  THEN
                           NomClient := ZCustomer.Name;
                    end;
                }
                field(NomClient;NomClient)
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
        "Global Dimension 1 Code":=UserMngt.GetSalesFilter;

        "Type Mvt":="Type Mvt"::Entrée;
        //"Global Dimension 1 Code":=UserMngt.GetSalesFilter;
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
}

