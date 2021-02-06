page 50028 "Input Subform"
{
    // version DOC STOCK

    AutoSplitKey = true;
    CaptionML = ENU='Item Journal',
                FRA='Item Journal Entree Stock';
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
                    Editable = true;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupItemNo;
                        ItemJnlMgt.GetItem("Item No.",ItemDescription);
                        ShowShortcutDimCode(ShortcutDimCode);
                    end;

                    trigger OnValidate();
                    begin
                        ItemJnlMgt.GetItem("Item No.",ItemDescription);
                        ShowShortcutDimCode(ShortcutDimCode);
                        //ControleExistenceArticle;
                    end;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    Editable = true;
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
        //<<Ajouté MYC 220908
        IF RecGStockDocument.GET("Journal Batch Name") THEN
        BEGIN
          "Location Code":=RecGStockDocument."Transfer-from Code";
           //MHM 070710 "Shortcut Dimension 1 Code":=RecGStockDocument."Global Dimension 1 Code";
           //MHM 070710 "Shortcut Dimension 2 Code":=RecGStockDocument."Global Dimension 2 Code";
        END;
        //>>Ajouté MYC 220908
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
        IF RecGStockDocument.GET("Document No.") THEN
        BEGIN
          "Location Code" := RecGStockDocument."Transfer-from Code";
         //<<Ajouté MYC 220908
          //MHM 070710 "Shortcut Dimension 1 Code":=RecGStockDocument."Global Dimension 1 Code";
          //MHM 070710 "Shortcut Dimension 2 Code":=RecGStockDocument."Global Dimension 2 Code";
          //>> Ajouté MYC 220908
        END;
        //<<MYC 170908
        "Source Type":="Source Type"::Customer;
        "Source No." := RecLStockDocument."N° Client";
        //>>MYC 170908

        CLEAR(ShortcutDimCode);
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
        Text003 : Label 'Il n''existe aucun approbateur pour ce compte.';
        Text004 : Label 'La demande d''approbation a été lancée avec succès.';
        Text005 : Label 'La demande d''approbation a déjà été lancée.';
        Text006 : Label 'Cette demande a été déjà approvée.';
        RecGArticle : Record "27";
        RecGSalesPrice : Record "7002";
        RecGClient : Record "18";

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

    procedure InitReservationEntry(LocationCode : Code[10];Lot : Code[20];NewLot : Code[20];RecLFeuilleArticle : Record "83";Signe : Integer;BoolPositive : Boolean;IntLType : Integer;IntLSousType : Integer;DatePrep : Date;DateRecep : Date;Quantite : Decimal);
    var
        RecLReservationEntry : Record "337";
        IntLSeq : Integer;
    begin

        RecLReservationEntry.INIT;

        IF RecLReservationEntry.FINDLAST THEN
          IntLSeq:=RecLReservationEntry."Entry No." +1
        ELSE
          IntLSeq:=1;

        RecLReservationEntry."Entry No.":=IntLSeq;
        RecLReservationEntry.Positive:=BoolPositive;
        RecLReservationEntry."Item No.":=  RecLFeuilleArticle."Item No.";
        RecLReservationEntry."Variant Code":=RecLFeuilleArticle."Variant Code";
        RecLReservationEntry."Location Code":= LocationCode;
        RecLReservationEntry."Quantity (Base)":=Signe*Quantite;
        RecLReservationEntry."Reservation Status":= RecLReservationEntry."Reservation Status"::Prospect;
        RecLReservationEntry."Creation Date":=RecLFeuilleArticle."Posting Date";
        RecLReservationEntry."Source Type":=IntLType;
        RecLReservationEntry."Source Subtype":=IntLSousType;
        RecLReservationEntry."Source ID":=RecLFeuilleArticle."Journal Template Name";
        RecLReservationEntry."Source Batch Name":= RecLFeuilleArticle."Journal Batch Name";
        RecLReservationEntry."Source Ref. No.":=RecLFeuilleArticle."Line No.";
        RecLReservationEntry."Shipment Date" := DatePrep;
        RecLReservationEntry."Expected Receipt Date":=DateRecep;
        RecLReservationEntry."Created By":=USERID;
        RecLReservationEntry."Qty. per Unit of Measure":=1;
        RecLReservationEntry.Quantity:= Signe * Quantite;
        RecLReservationEntry."Qty. to Handle (Base)":=Signe* Quantite;
        RecLReservationEntry."Qty. to Invoice (Base)" := Signe* Quantite;
        RecLReservationEntry."New Lot No.":= NewLot;
        RecLReservationEntry."Lot No." :=Lot;
        RecLReservationEntry."Item Tracking":= RecLReservationEntry."Item Tracking"::"Lot No.";
        RecLReservationEntry."Transferred from Entry No.":=0;
        //RecLReservationEntry."Variant Code":=Variant;
        RecLReservationEntry.INSERT;
    end;
}

