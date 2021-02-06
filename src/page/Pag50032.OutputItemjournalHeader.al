page 50032 "Output Item journal Header"
{
    // version DOC STOCK

    CaptionML = ENU='Inventory Outbound Movement',
                FRA='Document de sortie stock';
    DeleteAllowed = false;
    PageType = Document;
    SourceTable = Table50009;
    SourceTableView = WHERE(Type Mvt=FILTER(Sortie));

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
                field(Commentaire;Commentaire)
                {
                }
                field("Date comptabilisation";"Date comptabilisation")
                {
                }
                field("Transfer-from Code";"Transfer-from Code")
                {

                    trigger OnValidate();
                    begin

                        RecGInventorySetup.GET;
                        RecItemJournalLine.SETRANGE("Journal Template Name",RecGInventorySetup."Modele Feuille");
                        RecItemJournalLine.SETRANGE("Journal Batch Name","N°");
                        RecItemJournalLine.SETRANGE("Document No.", "N°" );
                        IF RecItemJournalLine.FINDFIRST THEN
                        BEGIN
                         RecItemJournalLine.MODIFYALL(RecItemJournalLine."Location Code","Transfer-from Code");
                         RecItemJournalLine.VALIDATE("Location Code");
                         RecItemJournalLine.MODIFYALL( RecItemJournalLine."Shortcut Dimension 1 Code","Global Dimension 1 Code");
                        END;

                        IF RecLocation.GET("Transfer-from Code") THEN
                           LibelleOrigine := RecLocation.Name;
                          TransferfromCodeOnAfterValidate;
                    end;
                }
                field(LibelleOrigine;LibelleOrigine)
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
            }
            part(SubPage1;50031)
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
                        CDUStockFunction.SortieStock(Rec,TRUE);
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
                        CDUStockFunction.SortieStock(Rec,FALSE);
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



        IF ZCustomer.GET("N° Client")  THEN
           NomClient := ZCustomer.Name;
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    var
        IntLSelection : Integer;
        Text001 : Label 'Entrée,Sortie';
    begin
        RecGCompanyInf.GET;
        "Type Mvt":="Type Mvt"::Sortie;
        CurrPage.SubPage1.PAGE.InitTemplate("Type Mvt");

        //AssistEditSortie(Rec);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        CurrPage.SubPage1.PAGE.SetBatchName("N°");
        "Type Mvt":="Type Mvt"::Sortie;
        "Global Dimension 1 Code":=UserMngt.GetSalesFilter;
        IF RecLocation.GET("Transfer-from Code") THEN
           LibelleOrigine := RecLocation.Name;
        IF RecLocation.GET("Transfer-to Code") THEN
           LibelleDestinataire := RecLocation.Name;
    end;

    trigger OnOpenPage();
    begin
        IF (UserMngt.GetSalesFilter() <> '')  THEN
        BEGIN
          FILTERGROUP(2);
          SETRANGE("Global Dimension 1 Code",UserMngt.GetSalesFilter());
          FILTERGROUP(0);
        END;
    end;

    var
        OptGTypeMvt : Option "0","1";
        UserMngt : Codeunit "5700";
        RecDocStockValide : Record "50010";
        RecItemLedgerEntry : Record "32";
        RecGCompanyInf : Record "79";
        RecGInventorySetup : Record "313";
        RecDocStockVal : Record "50010";
        DocN : Code[20];
        RecEcritArt : Record "32";
        NomClient : Text[50];
        ZCustomer : Record "18";
        LibelleOrigine : Text[30];
        LibelleDestinataire : Text[30];
        RecLocation : Record "14";
        RecItemJournalLine : Record "83";
        CDUStockFunction : Codeunit "50000";

    local procedure TransferfromCodeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;
}

