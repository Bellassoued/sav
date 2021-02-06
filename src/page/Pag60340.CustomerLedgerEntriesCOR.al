page 60340 "Customer Ledger EntriesCOR"
{
    // version CORRECTION

    // CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Customer Ledger Entries',
                FRA='Écritures comptables client';
    DataCaptionFields = "Customer No.";
    DeleteAllowed = true;
    InsertAllowed = true;
    PageType = List;
    Permissions = TableData 21=rimd;
    SourceTable = Table21;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Entry No.";"Entry No.")
                {
                }
                field("Customer No.";"Customer No.")
                {
                    Editable = true;
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Type";"Document Type")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Remaining Amount";"Remaining Amount")
                {
                }
                field("Original Amt. (LCY)";"Original Amt. (LCY)")
                {
                }
                field("Remaining Amt. (LCY)";"Remaining Amt. (LCY)")
                {
                }
                field("Amount (LCY)";"Amount (LCY)")
                {
                }
                field("Sales (LCY)";"Sales (LCY)")
                {
                }
                field("Profit (LCY)";"Profit (LCY)")
                {
                }
                field("Inv. Discount (LCY)";"Inv. Discount (LCY)")
                {
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field("Customer Posting Group";"Customer Posting Group")
                {
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("User ID";"User ID")
                {
                }
                field("Source Code";"Source Code")
                {
                }
                field("On Hold";"On Hold")
                {
                }
                field("Applies-to Doc. Type";"Applies-to Doc. Type")
                {
                }
                field("Applies-to Doc. No.";"Applies-to Doc. No.")
                {
                }
                field(Open;Open)
                {
                }
                field("Due Date";"Due Date")
                {
                }
                field("Pmt. Discount Date";"Pmt. Discount Date")
                {
                }
                field("Original Pmt. Disc. Possible";"Original Pmt. Disc. Possible")
                {
                }
                field("Pmt. Disc. Given (LCY)";"Pmt. Disc. Given (LCY)")
                {
                }
                field(Positive;Positive)
                {
                }
                field("Closed by Entry No.";"Closed by Entry No.")
                {
                }
                field("Closed at Date";"Closed at Date")
                {
                }
                field("Closed by Amount";"Closed by Amount")
                {
                }
                field("Applies-to ID";"Applies-to ID")
                {
                }
                field("Journal Batch Name";"Journal Batch Name")
                {
                }
                field("Reason Code";"Reason Code")
                {
                }
                field("Bal. Account Type";"Bal. Account Type")
                {
                }
                field("Bal. Account No.";"Bal. Account No.")
                {
                }
                field("Transaction No.";"Transaction No.")
                {
                }
                field("Closed by Amount (LCY)";"Closed by Amount (LCY)")
                {
                }
                field("Debit Amount";"Debit Amount")
                {
                }
                field("Credit Amount";"Credit Amount")
                {
                }
                field("Debit Amount (LCY)";"Debit Amount (LCY)")
                {
                }
                field("Credit Amount (LCY)";"Credit Amount (LCY)")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Calculate Interest";"Calculate Interest")
                {
                }
                field("Closing Interest Calculated";"Closing Interest Calculated")
                {
                }
                field("No. Series";"No. Series")
                {
                }
                field("Closed by Currency Code";"Closed by Currency Code")
                {
                }
                field("Closed by Currency Amount";"Closed by Currency Amount")
                {
                }
                field("Adjusted Currency Factor";"Adjusted Currency Factor")
                {
                }
                field("Original Currency Factor";"Original Currency Factor")
                {
                }
                field("Original Amount";"Original Amount")
                {
                }
                field("Date Filter";"Date Filter")
                {
                }
                field("Remaining Pmt. Disc. Possible";"Remaining Pmt. Disc. Possible")
                {
                }
                field("Pmt. Disc. Tolerance Date";"Pmt. Disc. Tolerance Date")
                {
                }
                field("Max. Payment Tolerance";"Max. Payment Tolerance")
                {
                }
                field("Last Issued Reminder Level";"Last Issued Reminder Level")
                {
                }
                field("Accepted Payment Tolerance";"Accepted Payment Tolerance")
                {
                }
                field("Accepted Pmt. Disc. Tolerance";"Accepted Pmt. Disc. Tolerance")
                {
                }
                field("Pmt. Tolerance (LCY)";"Pmt. Tolerance (LCY)")
                {
                }
                field("Amount to Apply";"Amount to Apply")
                {
                }
                field("IC Partner Code";"IC Partner Code")
                {
                }
                field("Applying Entry";"Applying Entry")
                {
                }
                field(Reversed;Reversed)
                {
                }
                field("Reversed by Entry No.";"Reversed by Entry No.")
                {
                }
                field("Reversed Entry No.";"Reversed Entry No.")
                {
                }
                field(Prepayment;Prepayment)
                {
                }
                field("Payment Method Code";"Payment Method Code")
                {
                }
                field("Applies-to Ext. Doc. No.";"Applies-to Ext. Doc. No.")
                {
                }
                field("Recipient Bank Account";"Recipient Bank Account")
                {
                }
                field("Message to Recipient";"Message to Recipient")
                {
                }
                field("Exported to Payment File";"Exported to Payment File")
                {
                }
                field("Dimension Set ID";"Dimension Set ID")
                {
                }
                field("Direct Debit Mandate ID";"Direct Debit Mandate ID")
                {
                }
                field("Cpte Générale";"Cpte Générale")
                {
                }
                field(Name;Name)
                {
                }
                field("Remaining Amt. (LCY) Today";"Remaining Amt. (LCY) Today")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("V.I.N";"V.I.N")
                {
                }
                field("Groupe Client";"Groupe Client")
                {
                }
                field(Recouvrer;Recouvrer)
                {
                }
                field("Order Type";"Order Type")
                {
                }
                field("Type de réglement";"Type de réglement")
                {
                }
                field("Ancien Seq. Ecr. Lettrage";"Ancien Seq. Ecr. Lettrage")
                {
                }
                field("Ancien Seq. Ecr. Lettrage.";"Ancien Seq. Ecr. Lettrage.")
                {
                }
                field("Exclure Lettrage ancien";"Exclure Lettrage ancien")
                {
                }
                field("Centre de gestion";"Centre de gestion")
                {
                }
                field("No. 2";"No. 2")
                {
                }
                field("Code Activité";"Code Activité")
                {
                }
                field("Ancien Numéro Pièce.";"Ancien Numéro Pièce.")
                {
                }
                field("No. Bordereau";"No. Bordereau")
                {
                }
                field("Existe Recouvrement";"Existe Recouvrement")
                {
                }
            }
            group()
            {
                field("Total Séléction";TotalSelect)
                {
                }
            }
        }
        area(factboxes)
        {
            part(;9106)
            {
                SubPageLink = Entry No.=FIELD(Entry No.);
                Visible = true;
            }
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
                action("Reminder/Fin. Charge Entries")
                {
                    CaptionML = ENU='Reminder/Fin. Charge Entries',
                                FRA='Écr. relance/fact. intérêts';
                    Image = Reminder;
                    RunObject = Page 444;
                    RunPageLink = Customer Entry No.=FIELD(Entry No.);
                    RunPageView = SORTING(Customer Entry No.);
                    Scope = Repeater;
                }
                action("Applied E&ntries")
                {
                    CaptionML = ENU='Applied E&ntries',
                                FRA='É&critures lettrées';
                    Image = Approve;
                    RunObject = Page 61;
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
                    RunObject = Page 573;
                    RunPageLink = Cust. Ledger Entry No.=FIELD(Entry No.),
                                  Customer No.=FIELD(Customer No.);
                    RunPageView = SORTING(Cust. Ledger Entry No.,Posting Date);
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
                action("Apply Entries")
                {
                    CaptionML = ENU='Apply Entries',
                                FRA='Ecritures ouvertes';
                    Image = ApplyEntries;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+F11';

                    trigger OnAction();
                    var
                        CustLedgEntry : Record "21";
                        CustEntryApplyPostEntries : Codeunit "226";
                    begin
                        CustLedgEntry.COPY(Rec);
                        CustEntryApplyPostEntries.ApplyCustEntryFormEntry(CustLedgEntry);
                        Rec := CustLedgEntry;
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
                        CustEntryApplyPostedEntries : Codeunit "226";
                    begin
                        CustEntryApplyPostedEntries.UnApplyCustLedgEntry("Entry No.");
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
            action("Calcule Montant Sélection")
            {
                ShortCutKey = 'Ctrl+K';

                trigger OnAction();
                var
                    RecCustLedgerEntry : Record "21";
                begin
                    //SM 28/02/2015
                    CurrPage.SETSELECTIONFILTER(RecCustLedgerEntry);
                    IF RecCustLedgerEntry.FINDSET THEN BEGIN
                      TotalSelect := 0;
                      REPEAT
                        RecCustLedgerEntry.CALCFIELDS("Amount (LCY)");
                        TotalSelect += RecCustLedgerEntry."Amount (LCY)";
                      UNTIL RecCustLedgerEntry.NEXT = 0;
                    END;
                    CurrPage.UPDATE(FALSE)
                    //END SM
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
        //CODEUNIT.RUN(CODEUNIT::"Cust. Entry-Edit",Rec);
        //EXIT(FALSE);
    end;

    var
        Navigate : Page "344";
        StyleTxt : Text;
        TotalSelect : Decimal;
        HasIncomingDocument : Boolean;
}

