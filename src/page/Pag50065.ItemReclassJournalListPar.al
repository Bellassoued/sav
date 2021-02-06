page 50065 "Item Reclass. Journal List Par"
{
    // version NAVW17.10,MAZDA70,MAZDA456

    AutoSplitKey = true;
    CaptionML = ENU='Item Reclass. Journal',
                FRA='Feuille reclassement article';
    DataCaptionFields = "Journal Batch Name";
    PageType = ListPart;
    SourceTable = Table83;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Journal Batch Name";"Journal Batch Name")
                {
                    Editable = false;
                }
                field("Journal Template Name";"Journal Template Name")
                {
                    Editable = false;
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                }
                field("Item No.";"Item No.")
                {

                    trigger OnValidate();
                    begin
                        ItemJnlMgt.GetItem("Item No.",ItemDescription);
                        ShowShortcutDimCode(ShortcutDimCode);
                        ShowNewShortcutDimCode(NewShortcutDimCode);
                    end;
                }
                field("Variant Code";"Variant Code")
                {
                }
                field(Description;Description)
                {
                }
                field("Location Code";"Location Code")
                {
                    Visible = true;

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
                field("New Location Code";"New Location Code")
                {

                    trigger OnValidate();
                    var
                        WMSManagement : Codeunit "7302";
                    begin
                        WMSManagement.CheckItemJnlLineLocation(Rec,xRec);
                    end;
                }
                field("New Bin Code";"New Bin Code")
                {
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
            action("Traçabilité")
            {

                trigger OnAction();
                begin
                    OpenItemTrackingLines(TRUE);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        ItemJnlMgt.GetItem("Item No.",ItemDescription);
    end;

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        ShowNewShortcutDimCode(NewShortcutDimCode);
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

    trigger OnNewRecord(BelowxRec : Boolean);
    var
        RecItemJournalLine : Record "83";
    begin
        "Journal Batch Name"    := 'TRANSVN';
        "Journal Template Name" := 'RECLASS';
        RecItemJournalLine.RESET;
        RecItemJournalLine.SETRANGE("Journal Template Name",'RECLASS');
        RecItemJournalLine.SETRANGE("Journal Batch Name",'TRANSVN');
        IF RecItemJournalLine.FINDLAST THEN
        //  SetUpNewLine(RecItemJournalLine);
        //
          "Line No." := RecItemJournalLine."Line No." + 10000
        ELSE
          "Line No." := 10000;
        "Entry Type" := "Entry Type"::Transfer;
        "Posting Date" := TODAY;
        "Document No."  := GlobalTransfertNo;
        "From Transfert VN" := GlobalTransfertNo;
    end;

    trigger OnOpenPage();
    var
        JnlSelected : Boolean;
    begin
        "Journal Batch Name"    := 'TRANSVN';
        "Journal Template Name" := 'RECLASS';
    end;

    var
        Text000 : TextConst ENU='1,2,3,New ',FRA='1,2,3,Nouveau ';
        Text001 : TextConst ENU='1,2,4,New ',FRA='1,2,4,Nouveau ';
        Text002 : TextConst ENU='1,2,5,New ',FRA='1,2,5,Nouveau ';
        Text003 : TextConst ENU='1,2,6,New ',FRA='1,2,6,Nouveau ';
        Text004 : TextConst ENU='1,2,7,New ',FRA='1,2,7,Nouveau ';
        Text005 : TextConst ENU='1,2,8,New ',FRA='1,2,8,Nouveau ';
        ItemJnlMgt : Codeunit "240";
        ReportPrint : Codeunit "228";
        ItemAvailFormsMgt : Codeunit "353";
        CurrentJnlBatchName : Code[10];
        ItemDescription : Text[50];
        ShortcutDimCode : array [8] of Code[20];
        NewShortcutDimCode : array [8] of Code[20];
        OpenedFromBatch : Boolean;
        RptExtractcptLines : Report "60100";
        RecUserSetup : Record "91";
        TXT50000 : Label 'Vous n''avez pas le droit de sélélectionner une autres feuilles.';
        GlobalTransfertNo : Code[20];

    local procedure CurrentJnlBatchNameOnAfterVali();
    begin
        CurrPage.SAVERECORD;
        ItemJnlMgt.SetName(CurrentJnlBatchName,Rec);
        CurrPage.UPDATE(FALSE);
    end;

    procedure InitTransfertNo(TransfertNo : Code[20]);
    begin
        GlobalTransfertNo := TransfertNo;
    end;
}

