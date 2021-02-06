page 50031 "Output Subform"
{
    // version DOC STOCK

    AutoSplitKey = true;
    CaptionML = ENU='Item Journal',
                FRA='Feuille article';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = ListPart;
    SaveValues = true;
    SourceTable = Table83;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Item No.";"Item No.")
                {

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupItemNo;
                        ItemJnlMgt.GetItem("Item No.",ItemDescription);
                        //ShowShortcutDimCode(ShortcutDimCode);
                    end;

                    trigger OnValidate();
                    begin
                        ItemJnlMgt.GetItem("Item No.",ItemDescription);
                        //ShowShortcutDimCode(ShortcutDimCode);
                        //ControleExistenceArticle;
                    end;
                }
                field(Description;Description)
                {
                    Editable = true;
                }
                field(Quantity;Quantity)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                action(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='A&xes analytiques';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        /*
                        RecLJournalLineDimensions.SETRANGE(RecLJournalLineDimensions."Table ID",83);
                        RecLJournalLineDimensions.SETRANGE("Journal Template Name","Journal Template Name");
                        RecLJournalLineDimensions.SETRANGE("Journal Batch Name","Journal Batch Name")  ;
                        RecLJournalLineDimensions.SETRANGE("Journal Line No.","Line No.");
                        PAGE.RUNMODAL(PAGE::"Journal Line Dimensions",RecLJournalLineDimensions);
                        {}{}*/

                    end;
                }
                action("Item &Tracking Lines")
                {
                    CaptionML = ENU='Item &Tracking Lines',
                                FRA='Lignes traçabilité';
                    Image = ItemTrackingLines;

                    trigger OnAction();
                    begin
                        OpenItemTrackingLines(FALSE);
                    end;
                }
                action("Bin Contents")
                {
                    CaptionML = ENU='Bin Contents',
                                FRA='Contenu emplacement';
                    Image = BinContent;
                    RunObject = Page 7305;
                    RunPageLink = Location Code=FIELD(Location Code),
                                  Item No.=FIELD(Item No.),
                                  Variant Code=FIELD(Variant Code);
                    RunPageView = SORTING(Location Code,Item No.,Variant Code);
                }
                separator("-")
                {
                    CaptionML = ENU='-',
                                FRA='-';
                }
                action("&Recalculate Unit Amount")
                {
                    CaptionML = ENU='&Recalculate Unit Amount',
                                FRA='&Recalculer le montant unitaire';

                    trigger OnAction();
                    begin
                        RecalculateUnitAmount;
                        CurrPage.SAVERECORD;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        //ShowShortcutDimCode(ShortcutDimCode);
        OnAfterGetCurrRecord;
    end;

    trigger OnDeleteRecord() : Boolean;
    var
        ReserveItemJnlLine : Codeunit "99000835";
    begin
        COMMIT;
        IF NOT ReserveItemJnlLine.DeleteLineConfirm(Rec) THEN
          EXIT(FALSE);
        ReserveItemJnlLine.DeleteLine(Rec);
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        IF "Entry Type" > "Entry Type"::Transfer THEN
          ERROR(Text000,"Entry Type");
    end;

    trigger OnModifyRecord() : Boolean;
    begin
        IF RecGStockDocument.GET("Journal Batch Name") THEN
        BEGIN
          "Location Code":=RecGStockDocument."Transfer-from Code";
        END;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    var
        RecLStockDocument : Record "50009";
    begin
        RecGInventorySetup.GET;
        IF OptGTypeMvt<>OptGTypeMvt::Transfert THEN
          "Journal Template Name":=RecGInventorySetup."Modele Feuille"
        ELSE
          "Journal Template Name":=RecGInventorySetup."Modele Feuille Transfert";

        IF CodGNomFeuille <> '' THEN
          "Journal Batch Name":=CodGNomFeuille
        ELSE
            "Journal Batch Name":='';
        IF NOT RecLStockDocument.GET(CodGNomFeuille) THEN
            "Journal Batch Name":='';
        "Document No.":="Journal Batch Name";

        IF "Journal Batch Name" <> '' THEN
        BEGIN
          SetUpNewLine(xRec);
          IF OptGTypeMvt=OptGTypeMvt::Entrée THEN
            "Entry Type":= "Entry Type"::"Positive Adjmt."
          ELSE
            IF OptGTypeMvt=OptGTypeMvt::Sortie THEN
            "Entry Type":= "Entry Type"::"Negative Adjmt."
            ELSE
              IF OptGTypeMvt=OptGTypeMvt::Transfert THEN
                "Entry Type":= "Entry Type"::Transfer
              ELSE
                ERROR(Error001);
        END;
        IF RecGStockDocument.GET("Journal Batch Name") THEN
          "Location Code":=RecGStockDocument."Transfer-from Code";

        //<<MYC 170908
        "Source Type":="Source Type"::Customer;
        "Source No." := RecLStockDocument."N° Client";

        //>>MYC 170908

        CLEAR(ShortcutDimCode);
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage();
    var
        JnlSelected : Boolean;
    begin
        RecGInventorySetup.GET;
        SETRANGE("Journal Template Name",RecGInventorySetup."Modele Feuille");
    end;

    var
        Text000 : TextConst ENU='You cannot use entry type %1 in this journal.',FRA='Vous ne pouvez pas utiliser le type %1 dans cette feuille.';
        ItemJnlMgt : Codeunit "240";
        ReportPrint : Codeunit "228";
        CalcWhseAdjmt : Report "7315";
        CurrentJnlBatchName : Code[10];
        ItemDescription : Text[50];
        ShortcutDimCode : array [8] of Code[20];
        Text001 : TextConst ENU='Item Journal lines have been successfully inserted from Standard Item Journal %1.',FRA='Les lignes feuille article ont été insérées à partir de la feuille article standard %1.';
        Text002 : TextConst ENU='Standard Item Journal %1 has been successfully created.',FRA='La création de la feuille article standard %1 a réussi.';
        RecGInventorySetup : Record "313";
        CodGNomFeuille : Code[10];
        RecGStockDocument : Record "50009";
        OptGTypeMvt : Option "Entrée",Sortie,Transfert;
        Error001 : Label 'Type mouvement incorrect';
        RecGItemJournalLine : Record "83";

    procedure InitTemplate(OptTypeMvt : Option "Entrée",Sortie,Transfert);
    begin
        RecGInventorySetup.GET;
        SETRANGE("Journal Template Name",RecGInventorySetup."Modele Feuille");
        SETRANGE("Journal Batch Name",CodGNomFeuille);
    end;

    procedure SetBatchName(NomFeuille : Code[10]);
    begin
        CodGNomFeuille:=NomFeuille;
    end;

    procedure SetTypeMvt(OptLTypeMvt : Option "Entrée",Sortie);
    begin
        OptGTypeMvt:=OptLTypeMvt;
    end;

    procedure ArchivrDocument(RecLStockHeader : Record "50009");
    var
        RecLRecStockHeader : Record "50010";
    begin
        RecLRecStockHeader.INIT;
        RecLRecStockHeader.TRANSFERFIELDS(RecLStockHeader);
        RecLRecStockHeader.INSERT;
        RecLStockHeader.DELETE;
    end;

    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        ItemJnlMgt.GetItem("Item No.",ItemDescription);
    end;
}

