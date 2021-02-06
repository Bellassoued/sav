page 50027 "Transfert Subform"
{
    // version DOC STOCK

    AutoSplitKey = true;
    CaptionML = ENU='Item Journal',
                FRA='Subform Transfert';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
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
                        ShowShortcutDimCode(ShortcutDimCode);
                        RechArticle;
                    end;

                    trigger OnValidate();
                    begin

                        //RechArticle;

                        ItemJnlMgt.GetItem("Item No.",ItemDescription);
                          ItemNoOnAfterValidate;
                    end;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                }
                field("Location Code";"Location Code")
                {
                    Editable = true;
                    Visible = false;

                    trigger OnValidate();
                    var
                        WMSManagement : Codeunit "7302";
                    begin
                        WMSManagement.CheckItemJnlLineLocation(Rec,xRec);
                    end;
                }
                field("Bin Code";"Bin Code")
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                }
                field("New Shortcut Dimension 1 Code";"New Shortcut Dimension 1 Code")
                {
                }
                field("New Location Code";"New Location Code")
                {
                    Editable = true;
                    Visible = "New Location CodeVisible";
                }
                field("New Bin Code";"New Bin Code")
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
                        /*RecLJournalLineDimensions.SETRANGE(RecLJournalLineDimensions."Table ID",83);
                        RecLJournalLineDimensions.SETRANGE("Journal Template Name","Journal Template Name");
                        RecLJournalLineDimensions.SETRANGE("Journal Batch Name","Journal Batch Name")  ;
                        RecLJournalLineDimensions.SETRANGE("Journal Line No.","Line No.");
                        PAGE.RUNMODAL(PAGE::"Reclass. Jnl. Line Dimensions",RecLJournalLineDimensions);
                        */

                    end;
                }
                action("Item &Tracking Lines")
                {
                    CaptionML = ENU='Item &Tracking Lines',
                                FRA='Lignes traçabilité';
                    Image = ItemTrackingLines;

                    trigger OnAction();
                    begin
                        OpenItemTrackingLines(TRUE);
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
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        OnAfterGetCurrRecord;
    end;

    trigger OnDeleteRecord() : Boolean;
    var
        ReserveItemJnlLine : Codeunit "99000835";
        RecLStockDocument : Record "50009";
    begin




        IF NOT ReserveItemJnlLine.DeleteLineConfirm(Rec) THEN
          EXIT(FALSE);
        ReserveItemJnlLine.DeleteLine(Rec);
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    var
        RecLStockDocument : Record "50009";
    begin
        IF "Entry Type" > "Entry Type"::Transfer THEN
          ERROR(Text000,"Entry Type");
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

        CLEAR(ShortcutDimCode);

        RecGStockDocument.SETRANGE(RecGStockDocument."N°","Document No.");
        IF RecGStockDocument.FINDFIRST THEN
        BEGIN
          "Location Code":= RecGStockDocument."Transfer-from Code" ;
         "New Location Code":= RecGStockDocument."Transfer-to Code";
          "Shortcut Dimension 1 Code":= RecGStockDocument."Global Dimension 1 Code";


        END;
        OnAfterGetCurrRecord;
    end;

    trigger OnOpenPage();
    var
        JnlSelected : Boolean;
    begin
        RecGInventorySetup.GET;
        SETRANGE("Journal Template Name",RecGInventorySetup."Modele Feuille Transfert");
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
        Text003 : Label 'Il n''existe aucun approbateur pour ce compte.';
        Text004 : Label 'La demande d''approbation a été lancée avec succès.';
        Text005 : Label 'La demande d''approbation a déjà été lancée.';
        Text006 : Label 'Cette demande a été déjà approuvée.';
        Text007 : Label 'Impossible de modifier un document validé';
        Erreur001 : TextConst ENU='Item already choosen',FRA='Article déjà saisie';
        RecItemJournalLine : Record "83";
        [InDataSet]
        "New Location CodeVisible" : Boolean;

    procedure InitTemplate(OptTypeMvt : Option "Entrée",Sortie,Transfert);
    begin
        RecGInventorySetup.GET;
        SETRANGE("Journal Template Name",RecGInventorySetup."Modele Feuille Transfert");
        SETRANGE("Journal Batch Name",CodGNomFeuille);
        "New Location CodeVisible" :=OptTypeMvt=OptTypeMvt::Transfert;
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
        RecLRecStockHeader : Record "50009";
    begin
        RecLRecStockHeader.INIT;
        RecLRecStockHeader.TRANSFERFIELDS(RecLStockHeader);
        RecLRecStockHeader.INSERT;
        RecLStockHeader.DELETE;
    end;

    procedure RechArticle();
    begin
        RecItemJournalLine.SETRANGE(RecItemJournalLine."Journal Template Name","Journal Template Name" );
        RecItemJournalLine.SETRANGE(RecItemJournalLine."Journal Batch Name", "Journal Batch Name");
        RecItemJournalLine.SETRANGE(RecItemJournalLine."Item No.","Item No.");
        IF RecItemJournalLine.FINDFIRST THEN BEGIN
           ERROR(Erreur001);
         END;
    end;

    local procedure ItemNoOnAfterValidate();
    begin

        RecGStockDocument.SETRANGE(RecGStockDocument."N°","Document No.");
        IF RecGStockDocument.FINDFIRST THEN
        BEGIN
          VALIDATE("Location Code", RecGStockDocument."Transfer-from Code") ;
         VALIDATE("New Location Code", RecGStockDocument."Transfer-to Code");
          "Shortcut Dimension 1 Code":= RecGStockDocument."Global Dimension 1 Code";


        END;
    end;

    local procedure OnAfterGetCurrRecord();
    begin
        xRec := Rec;
        ItemJnlMgt.GetItem("Item No.",ItemDescription);
    end;
}

