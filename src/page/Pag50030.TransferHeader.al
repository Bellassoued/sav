page 50030 "Transfer Header"
{
    // version DOC STOCK

    CaptionML = ENU='Internal Transfer',
                FRA='Transfert interne';
    DeleteAllowed = false;
    PageType = Document;
    SourceTable = Table50009;
    SourceTableView = WHERE(Type Mvt=FILTER(Transfert));

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
                field("Transfer-from Code";"Transfer-from Code")
                {
                    CaptionML = ENU='Source Location code',
                                FRA='Magasin Origine';

                    trigger OnValidate();
                    begin
                        RecGInventorySetup.GET;
                        RecItemJournalLine.SETRANGE(RecItemJournalLine."Journal Template Name",RecGInventorySetup."Modele Feuille Transfert");
                        RecItemJournalLine.SETRANGE(RecItemJournalLine."Journal Batch Name","N°");
                        RecItemJournalLine.SETRANGE(RecItemJournalLine."Document No.", "N°" );
                        IF RecItemJournalLine.FINDFIRST THEN
                        BEGIN
                         RecItemJournalLine.MODIFYALL(RecItemJournalLine."Location Code","Transfer-from Code");
                         RecItemJournalLine.VALIDATE("Location Code");
                         RecItemJournalLine.MODIFYALL( RecItemJournalLine."Shortcut Dimension 1 Code","Global Dimension 1 Code");
                        END;

                        IF RecLocation.GET("Transfer-from Code") THEN
                           LibelleOrigine := RecLocation.Name;

                          TransferfromCodeOnAfterValidate ;
                    end;
                }
                field(LibelleOrigine;LibelleOrigine)
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                    CaptionML = ENU='Destination Location Code',
                                FRA='Magasin Destinataire';

                    trigger OnValidate();
                    begin
                        RecGInventorySetup.GET;
                        RecItemJournalLine.SETRANGE(RecItemJournalLine."Journal Template Name",RecGInventorySetup."Modele Feuille Transfert");
                        RecItemJournalLine.SETRANGE(RecItemJournalLine."Journal Batch Name","N°");
                        IF RecItemJournalLine.FINDFIRST THEN
                        BEGIN
                         RecItemJournalLine.MODIFYALL( RecItemJournalLine."New Location Code","Transfer-to Code");
                          RecItemJournalLine.VALIDATE("New Location Code");
                          //RecItemJournalLine.MODIFYALL(RecItemJournalLine."New Shortcut Dimension 1 Code", "Global Dimension 1 Code Dest");
                        END;

                        IF RecLocation.GET("Transfer-to Code") THEN
                           LibelleDestinataire := RecLocation.Name;

                          TransfertoCodeOnAfterValidate;
                    end;
                }
                field(LibelleDestinataire;LibelleDestinataire)
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(Commentaire;Commentaire)
                {
                }
                field("Date comptabilisation";"Date comptabilisation")
                {
                }
                field("N° Client";"N° Client")
                {
                }
            }
            part(SubPage1;50027)
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
                        CDUStockFunction.TransfertStock(Rec,TRUE);
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
                        CDUStockFunction.TransfertStock(Rec,FALSE);
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
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    var
        IntLSelection : Integer;
        Text001 : Label 'Entrée,Sortie,Transfert';
    begin
        "Type Mvt":="Type Mvt"::Transfert;
        CurrPage.SubPage1.PAGE.InitTemplate("Type Mvt");

        //AssistEditTransfert(Rec);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        CurrPage.SubPage1.PAGE.SetBatchName("N°");
        "Global Dimension 1 Code":=UserMngt.GetSalesFilter;
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
        RecGInventorySetup : Record "313";
        RecItemJournalLine : Record "83";
        LibelleOrigine : Text[30];
        LibelleDestinataire : Text[30];
        RecLocation : Record "14";
        RecGClient : Record "18";
        Text001 : Label 'Attention vous allez effectuer une transaction sur le magasin casse, Etes vous sûre de vouloir continuer?';
        RecGUSERSetup : Record "91";
        CDUStockFunction : Codeunit "50000";

    local procedure TransferfromCodeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    local procedure TransfertoCodeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;
}

