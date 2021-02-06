page 60330 "Vendor Ledger EntriesCOR"
{
    // version CORRECTION

    //  CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Vendor Ledger Entries',
                FRA='Écritures comptables fournisseur';
    DataCaptionFields = "Vendor No.";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData 25=rm;
    SourceTable = Table25;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Type";"Document Type")
                {
                    Editable = false;
                    StyleExpr = StyleTxt;
                }
                field("Document No.";"Document No.")
                {
                    Editable = false;
                    StyleExpr = StyleTxt;
                }
                field("External Document No.";"External Document No.")
                {
                    Editable = false;
                }
                field("Vendor No.";"Vendor No.")
                {
                    Editable = false;
                }
                field("Message to Recipient";"Message to Recipient")
                {
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("IC Partner Code";"IC Partner Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Purchaser Code";"Purchaser Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Currency Code";"Currency Code")
                {
                    Editable = false;
                }
                field("Payment Method Code";"Payment Method Code")
                {
                }
                field("Payment Reference";"Payment Reference")
                {
                }
                field("Creditor No.";"Creditor No.")
                {
                }
                field("Original Amount";"Original Amount")
                {
                    Editable = false;
                }
                field("Original Amt. (LCY)";"Original Amt. (LCY)")
                {
                    Editable = false;
                    Visible = false;
                }
                field(Amount;Amount)
                {
                    Editable = false;
                }
                field("Amount (LCY)";"Amount (LCY)")
                {
                    Editable = false;
                }
                field("Remaining Amount";"Remaining Amount")
                {
                    Editable = false;
                }
                field("Remaining Amt. (LCY)";"Remaining Amt. (LCY)")
                {
                    Editable = false;
                }
                field("Bal. Account Type";"Bal. Account Type")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Bal. Account No.";"Bal. Account No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Due Date";"Due Date")
                {
                    StyleExpr = StyleTxt;
                }
                field("Pmt. Discount Date";"Pmt. Discount Date")
                {
                }
                field("Pmt. Disc. Tolerance Date";"Pmt. Disc. Tolerance Date")
                {
                }
                field("Original Pmt. Disc. Possible";"Original Pmt. Disc. Possible")
                {
                }
                field("Remaining Pmt. Disc. Possible";"Remaining Pmt. Disc. Possible")
                {
                }
                field("Max. Payment Tolerance";"Max. Payment Tolerance")
                {
                }
                field(Open;Open)
                {
                    Editable = false;
                }
                field("On Hold";"On Hold")
                {
                }
                field("User ID";"User ID")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Source Code";"Source Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Reason Code";"Reason Code")
                {
                    Editable = false;
                    Visible = false;
                }
                field(Reversed;Reversed)
                {
                    Visible = false;
                }
                field("Reversed by Entry No.";"Reversed by Entry No.")
                {
                    Visible = false;
                }
                field("Reversed Entry No.";"Reversed Entry No.")
                {
                    Visible = false;
                }
                field("Entry No.";"Entry No.")
                {
                    Editable = false;
                }
                field("Exported to Payment File";"Exported to Payment File")
                {
                }
                field("Vendor Order No.";"Vendor Order No.")
                {
                    Editable = false;
                }
                field("Cpte Générale";"Cpte Générale")
                {
                }
                field("No dossier VN";"No dossier VN")
                {
                }
            }
        }
        area(factboxes)
        {
            part(IncomingDocAttachFactBox;193)
            {
                ShowFilter = false;
            }
            systempart(;Links)
            {
                Visible = false;
            }
            systempart(;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                CaptionML = ENU='Ent&ry',
                            FRA='É&criture';
                Image = Entry;
                action("Applied E&ntries")
                {
                    CaptionML = ENU='Applied E&ntries',
                                FRA='É&critures lettrées';
                    Image = Approve;
                    RunObject = Page 62;
                    RunPageOnRec = true;
                    Scope = Repeater;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348=R;
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                    end;
                }
                action("Detailed &Ledger Entries")
                {
                    CaptionML = ENU='Detailed &Ledger Entries',
                                FRA='Écritures comptables &détaillées';
                    Image = View;
                    RunObject = Page 574;
                    RunPageLink = Vendor Ledger Entry No.=FIELD(Entry No.),
                                  Vendor No.=FIELD(Vendor No.);
                    RunPageView = SORTING(Vendor Ledger Entry No.,Posting Date);
                    Scope = Repeater;
                    ShortCutKey = 'Ctrl+F7';
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action(ActionApplyEntries)
                {
                    CaptionML = ENU='Apply Entries',
                                FRA='Ecritures ouvertes';
                    Image = ApplyEntries;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+F11';

                    trigger OnAction();
                    var
                        VendLedgEntry : Record "25";
                        VendEntryApplyPostEntries : Codeunit "227";
                    begin
                        VendLedgEntry.COPY(Rec);
                        VendEntryApplyPostEntries.ApplyVendEntryFormEntry(VendLedgEntry);
                        Rec := VendLedgEntry;
                        CurrPage.UPDATE;
                    end;
                }
                separator()
                {
                }
                action(UnapplyEntries)
                {
                    CaptionML = ENU='Unapply Entries',
                                FRA='Délettrer les écritures';
                    Ellipsis = true;
                    Image = UnApply;
                    Scope = Repeater;

                    trigger OnAction();
                    var
                        VendEntryApplyPostedEntries : Codeunit "227";
                    begin
                        VendEntryApplyPostedEntries.UnApplyVendLedgEntry("Entry No.");
                    end;
                }
                separator()
                {
                }
                action(ReverseTransaction)
                {
                    CaptionML = ENU='Reverse Transaction',
                                FRA='Transaction contre-passée';
                    Ellipsis = true;
                    Image = ReverseRegister;
                    Scope = Repeater;

                    trigger OnAction();
                    var
                        ReversalEntry : Record "179";
                    begin
                        CLEAR(ReversalEntry);
                        IF Reversed THEN
                          ReversalEntry.AlreadyReversedEntry(TABLECAPTION,"Entry No.");
                        IF "Journal Batch Name" = '' THEN
                          ReversalEntry.TestFieldError;
                        TESTFIELD("Transaction No.");
                        ReversalEntry.ReverseTransaction("Transaction No.");
                    end;
                }
                group(IncomingDocument)
                {
                    CaptionML = ENU='Incoming Document',
                                FRA='Document entrant';
                    Image = Documents;
                    action(IncomingDocCard)
                    {
                        CaptionML = ENU='View Incoming Document',
                                    FRA='Afficher le document entrant';
                        Enabled = HasIncomingDocument;
                        Image = ViewOrder;
                        ToolTipML = ;

                        trigger OnAction();
                        var
                            IncomingDocument : Record "130";
                        begin
                            IncomingDocument.ShowCard("Document No.","Posting Date");
                        end;
                    }
                    action(SelectIncomingDoc)
                    {
                        AccessByPermission = TableData 130=R;
                        CaptionML = ENU='Select Incoming Document',
                                    FRA='Sélectionner le document entrant';
                        Enabled = NOT HasIncomingDocument;
                        Image = SelectLineToApply;
                        ToolTipML = ;

                        trigger OnAction();
                        var
                            IncomingDocument : Record "130";
                        begin
                            IncomingDocument.SelectIncomingDocumentForPostedDocument("Document No.","Posting Date",RECORDID);
                        end;
                    }
                    action(IncomingDocAttachFile)
                    {
                        CaptionML = ENU='Create Incoming Document from File',
                                    FRA='Créer un document entrant à partir d''un fichier';
                        Ellipsis = true;
                        Enabled = NOT HasIncomingDocument;
                        Image = Attach;
                        ToolTipML = ;

                        trigger OnAction();
                        var
                            IncomingDocumentAttachment : Record "133";
                        begin
                            IncomingDocumentAttachment.NewAttachmentFromPostedDocument("Document No.","Posting Date");
                        end;
                    }
                }
            }
            action("&Navigate")
            {
                CaptionML = ENU='&Navigate',
                            FRA='Na&viguer';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                Scope = Repeater;

                trigger OnAction();
                begin
                    Navigate.SetDoc("Posting Date","Document No.");
                    Navigate.RUN;
                end;
            }
            action("Show Posted Document")
            {
                CaptionML = ENU='Show Posted Document',
                            FRA='Afficher doc. enreg.';
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ShortCutKey = 'Return';

                trigger OnAction();
                begin
                    ShowDoc
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        IncomingDocument : Record "130";
    begin
        HasIncomingDocument := IncomingDocument.PostedDocExists("Document No.","Posting Date");
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

    trigger OnAfterGetRecord();
    begin
        StyleTxt := SetStyle;
    end;

    trigger OnModifyRecord() : Boolean;
    begin
        //CODEUNIT.RUN(CODEUNIT::"Vend. Entry-Edit",Rec);
        //EXIT(FALSE);
    end;

    var
        Navigate : Page "344";
        StyleTxt : Text;
        HasIncomingDocument : Boolean;
}

