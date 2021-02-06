page 60038 "Sales Credit Memo PR"
{
    // version SAV Automobile

    CaptionML = ENU='Sales Credit Memo PR',
                FRA='Avoir vente';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table36;
    SourceTableView = SORTING(Document Type,No.)
                      WHERE(Document Type=FILTER(Credit Memo),
                            Order Type=CONST(PR));

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            FRA='Général';
                field("No.";"No.")
                {
                    Importance = Promoted;
                    Visible = DocNoVisible;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        SelltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Sell-to Contact No.";"Sell-to Contact No.")
                {

                    trigger OnValidate();
                    begin
                        IF GETFILTER("Sell-to Contact No.") = xRec."Sell-to Contact No." THEN
                          IF "Sell-to Contact No." <> xRec."Sell-to Contact No." THEN
                            SETRANGE("Sell-to Contact No.");
                    end;
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                }
                field("Sell-to Address";"Sell-to Address")
                {
                    Importance = Additional;
                }
                field("Sell-to Address 2";"Sell-to Address 2")
                {
                    Importance = Additional;
                }
                field("Sell-to Post Code";"Sell-to Post Code")
                {
                    Importance = Additional;
                }
                field("Sell-to City";"Sell-to City")
                {
                }
                field("Sell-to Contact";"Sell-to Contact")
                {
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Document Date";"Document Date")
                {
                    Editable = false;
                }
                field("Incoming Document Entry No.";"Incoming Document Entry No.")
                {
                    Visible = false;
                }
                field("External Document No.";"External Document No.")
                {
                    Importance = Promoted;
                }
                field("Salesperson Code";"Salesperson Code")
                {

                    trigger OnValidate();
                    begin
                        SalespersonCodeOnAfterValidate;
                    end;
                }
                field("Campaign No.";"Campaign No.")
                {
                    Importance = Additional;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    Importance = Additional;
                }
                field("Assigned User ID";"Assigned User ID")
                {
                    Importance = Additional;
                }
                field("Job Queue Status";"Job Queue Status")
                {
                    Importance = Additional;
                }
                field(Status;Status)
                {
                    Importance = Promoted;
                }
                field("Apply Stamp fiscal";"Apply Stamp fiscal")
                {
                }
                field(Reason;Reason)
                {
                }
            }
            part(SalesLines;60039)
            {
                SubPageLink = Document No.=FIELD(No.);
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No.";"Bill-to Contact No.")
                {
                }
                field("Bill-to Name";"Bill-to Name")
                {
                }
                field("Bill-to Address";"Bill-to Address")
                {
                    Importance = Additional;
                }
                field("Bill-to Address 2";"Bill-to Address 2")
                {
                    Importance = Additional;
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                    Importance = Additional;
                }
                field("Bill-to City";"Bill-to City")
                {
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                    Importance = Additional;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    Importance = Promoted;
                }
                field("Due Date";"Due Date")
                {
                    Importance = Promoted;
                }
                field("Payment Discount %";"Payment Discount %")
                {
                }
                field("Pmt. Discount Date";"Pmt. Discount Date")
                {
                    Importance = Additional;
                }
                field("Payment Method Code";"Payment Method Code")
                {
                }
                field("Prices Including VAT";"Prices Including VAT")
                {

                    trigger OnValidate();
                    begin
                        PricesIncludingVATOnAfterValid;
                    end;
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                }
            }
            group(Shipping)
            {
                CaptionML = ENU='Shipping',
                            FRA='Livraison';
                field("Ship-to Name";"Ship-to Name")
                {
                    Importance = Promoted;
                }
                field("Ship-to Address";"Ship-to Address")
                {
                    Importance = Additional;
                }
                field("Ship-to Address 2";"Ship-to Address 2")
                {
                    Importance = Additional;
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                    Importance = Promoted;
                }
                field("Ship-to City";"Ship-to City")
                {
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                    Importance = Additional;
                }
                field("Location Code";"Location Code")
                {
                }
                field("Shipment Date";"Shipment Date")
                {
                    Importance = Promoted;
                }
            }
            group("Foreign Trade")
            {
                CaptionML = ENU='Foreign Trade',
                            FRA='International';
                field("Currency Code";"Currency Code")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        CLEAR(ChangeExchangeRate);
                        IF "Posting Date" <> 0D THEN
                          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date")
                        ELSE
                          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor",WORKDATE);
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                          VALIDATE("Currency Factor",ChangeExchangeRate.GetParameter);
                          CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;
                }
                field("EU 3-Party Trade";"EU 3-Party Trade")
                {
                }
                field("Transaction Type";"Transaction Type")
                {
                }
                field("Transaction Specification";"Transaction Specification")
                {
                }
                field("Transport Method";"Transport Method")
                {
                }
                field("Exit Point";"Exit Point")
                {
                }
                field(Area;Area)
                {
                }
            }
            group(Application)
            {
                CaptionML = ENU='Application',
                            FRA='Lettrage';
                field("Applies-to Doc. Type";"Applies-to Doc. Type")
                {
                }
                field("Applies-to Doc. No.";"Applies-to Doc. No.")
                {
                }
                field("Applies-to ID";"Applies-to ID")
                {
                }
            }
        }
        area(factboxes)
        {
            part(;9080)
            {
                SubPageLink = No.=FIELD(Sell-to Customer No.);
                Visible = false;
            }
            part(;9081)
            {
                SubPageLink = No.=FIELD(Sell-to Customer No.);
                Visible = false;
            }
            part(;9082)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.);
                Visible = true;
            }
            part(;9084)
            {
                SubPageLink = No.=FIELD(Sell-to Customer No.);
                Visible = true;
            }
            part(;9087)
            {
                Provider = SalesLines;
                SubPageLink = Document Type=FIELD(Document Type),
                              Document No.=FIELD(Document No.),
                              Line No.=FIELD(Line No.);
                Visible = false;
            }
            part(;9092)
            {
                SubPageLink = Table ID=CONST(36),
                              Document Type=FIELD(Document Type),
                              Document No.=FIELD(No.);
                Visible = false;
            }
            part(;9108)
            {
                Provider = SalesLines;
                SubPageLink = No.=FIELD(No.);
                Visible = false;
            }
            systempart(;Links)
            {
                Visible = false;
            }
            systempart(;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Credit Memo")
            {
                CaptionML = ENU='&Credit Memo',
                            FRA='Avoi&r';
                Image = CreditMemo;
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';

                    trigger OnAction();
                    begin
                        CalcInvDiscForHeader;
                        COMMIT;
                        PAGE.RUNMODAL(PAGE::"Sales Statistics",Rec);
                    end;
                }
                action(Customer)
                {
                    CaptionML = ENU='Customer',
                                FRA='Client';
                    Image = EditLines;
                    RunObject = Page 21;
                    RunPageLink = No.=FIELD(Sell-to Customer No.);
                    ShortCutKey = 'Shift+F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 67;
                    RunPageLink = Document Type=FIELD(Document Type),
                                  No.=FIELD(No.),
                                  Document Line No.=CONST(0);
                }
                action(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDocDim;
                        CurrPage.SAVERECORD;
                    end;
                }
                action(Approvals)
                {
                    CaptionML = ENU='Approvals',
                                FRA='Approbations';
                    Image = Approvals;

                    trigger OnAction();
                    var
                        ApprovalEntries : Page "658";
                    begin
                        ApprovalEntries.Setfilters(DATABASE::"Sales Header","Document Type","No.");
                        ApprovalEntries.RUN;
                    end;
                }
            }
            group("Credit Card")
            {
                CaptionML = ENU='Credit Card',
                            FRA='Carte de crédit';
                Image = CreditCardLog;
            }
        }
        area(processing)
        {
            group(Release)
            {
                CaptionML = ENU='Release',
                            FRA='Lancer';
                Image = ReleaseDoc;
                action(Release)
                {
                    CaptionML = ENU='Re&lease',
                                FRA='&Lancer';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    var
                        ReleaseSalesDoc : Codeunit "414";
                    begin
                        ReleaseSalesDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    CaptionML = ENU='Re&open',
                                FRA='R&ouvrir';
                    Image = ReOpen;

                    trigger OnAction();
                    var
                        ReleaseSalesDoc : Codeunit "414";
                    begin
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action(GetPostedDocumentLinesToReverse)
                {
                    CaptionML = ENU='Get Posted Doc&ument Lines to Reverse',
                                FRA='Extraire lignes doc&ument enreg. à contrepasser';
                    Ellipsis = true;
                    Image = ReverseLines;

                    trigger OnAction();
                    begin
                        GetPstdDocLinesToRevere;
                    end;
                }
                action("Calculate &Invoice Discount")
                {
                    CaptionML = ENU='Calculate &Invoice Discount',
                                FRA='C&alculer remise facture';
                    Image = CalculateInvoiceDiscount;

                    trigger OnAction();
                    begin
                        ApproveCalcInvDisc;
                    end;
                }
                separator()
                {
                }
                action(ApplyEntries)
                {
                    CaptionML = ENU='Apply Entries',
                                FRA='Lettrer écritures';
                    Ellipsis = true;
                    Image = ApplyEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Shift+F11';

                    trigger OnAction();
                    begin
                        CODEUNIT.RUN(CODEUNIT::"Sales Header Apply",Rec);
                    end;
                }
                separator()
                {
                }
                action("Get St&d. Cust. Sales Codes")
                {
                    CaptionML = ENU='Get St&d. Cust. Sales Codes',
                                FRA='Extraire &codes vente client std';
                    Ellipsis = true;
                    Image = CustomerCode;

                    trigger OnAction();
                    var
                        StdCustSalesCode : Record "172";
                    begin
                        StdCustSalesCode.InsertSalesLines(Rec);
                    end;
                }
                separator()
                {
                }
                action(CopyDocument)
                {
                    CaptionML = ENU='Copy Document',
                                FRA='Copier document';
                    Ellipsis = true;
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CopySalesDoc.SetSalesHeader(Rec);
                        CopySalesDoc.RUNMODAL;
                        CLEAR(CopySalesDoc);
                    end;
                }
                action("Disponibilité article")
                {
                    Caption = 'Disponibilité article';
                    Image = Accounts;
                    Promoted = true;

                    trigger OnAction();
                    var
                        LCUItemavailability : Codeunit "70000";
                        LRecAvailibilityItem : Record "70006";
                        LPagItemAvailability : Page "70009";
                        RecSalesLine : Record "37";
                    begin
                        //<< CT16V0002 ZMN 28/07/2016
                        RecSalesLine.RESET;
                        RecSalesLine.SETRANGE("Document No.","No.");
                        RecSalesLine.SETRANGE(Type,RecSalesLine.Type::Item);
                        IF RecSalesLine.FINDFIRST THEN
                          REPEAT
                            RecSalesLine.TESTFIELD("Location Code");
                            RecSalesLine.TESTFIELD(Quantity);
                            IF RecSalesLine."Ordered Qty" < RecSalesLine.Quantity THEN BEGIN
                              LCUItemavailability.SetSalesOrderInfo(RecSalesLine.Quantity-RecSalesLine."Ordered Qty",RecSalesLine."Line No.",
                                              RecSalesLine."Document No.",RecSalesLine."Location Code");
                              LCUItemavailability.FctStartSearchForItem(RecSalesLine."No.");
                            END;
                          UNTIL RecSalesLine.NEXT=0;
                        // "Remaining Qty to Order"
                        CLEAR(LPagItemAvailability);
                        LPagItemAvailability.SETTABLEVIEW(LRecAvailibilityItem);
                        LPagItemAvailability.SETRECORD(LRecAvailibilityItem);
                        IF LPagItemAvailability.RUNMODAL = ACTION::LookupOK THEN;
                        //>> CT16V0002 ZMN 28/07/2016
                    end;
                }
                action("Move Negative Lines")
                {
                    CaptionML = ENU='Move Negative Lines',
                                FRA='Déplacer lignes négatives';
                    Ellipsis = true;
                    Image = MoveNegativeLines;

                    trigger OnAction();
                    begin
                        CLEAR(MoveNegSalesLines);
                        MoveNegSalesLines.SetSalesHeader(Rec);
                        MoveNegSalesLines.RUNMODAL;
                        MoveNegSalesLines.ShowDocument;
                    end;
                }
                separator()
                {
                }
            }
            group("Request Approval")
            {
                CaptionML = ENU='Request Approval',
                            FRA='Approbation demande achat';
                Image = Approval;
                action(SendApprovalRequest)
                {
                    CaptionML = ENU='Send A&pproval Request',
                                FRA='Envoyer demande d''a&pprobation';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        IF ApprovalsMgmt.CheckSalesApprovalPossible(Rec) THEN
                          ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    CaptionML = ENU='Cancel Approval Re&quest',
                                FRA='Annuler demande d''appro&bation';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
                    end;
                }
            }
            group("P&osting")
            {
                CaptionML = ENU='P&osting',
                            FRA='&Validation';
                Image = Post;
                action("P&ost")
                {
                    CaptionML = ENU='P&ost',
                                FRA='&Valider';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        Post(CODEUNIT::"Sales-Post (Yes/No)");
                    end;
                }
                action("Test Report")
                {
                    CaptionML = ENU='Test Report',
                                FRA='Impression test';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
                action("Post and &Print")
                {
                    CaptionML = ENU='Post and &Print',
                                FRA='Valider et i&mprimer';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction();
                    begin
                        Post(CODEUNIT::"Sales-Post + Print");
                    end;
                }
                action("Post &Batch")
                {
                    CaptionML = ENU='Post &Batch',
                                FRA='Valider par l&ot';
                    Ellipsis = true;
                    Image = PostBatch;

                    trigger OnAction();
                    begin
                        REPORT.RUNMODAL(REPORT::"Batch Post Sales Credit Memos",TRUE,TRUE,Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Remove From Job Queue")
                {
                    CaptionML = ENU='Remove From Job Queue',
                                FRA='Supprimer de la file d''attente des travaux';
                    Image = RemoveLine;
                    Visible = JobQueueVisible;

                    trigger OnAction();
                    begin
                        CancelBackgroundPosting;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        SetControlAppearance
    end;

    trigger OnDeleteRecord() : Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Responsibility Center" := UserMgt.GetSalesFilter;
        "Order Type" := "Order Type"::PR ;
    end;

    trigger OnOpenPage();
    begin
        IF UserMgt.GetSalesFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);
          FILTERGROUP(0);
        END;
    end;

    var
        ChangeExchangeRate : Page "511";
        CopySalesDoc : Report "292";
        MoveNegSalesLines : Report "6699";
        ReportPrint : Codeunit "228";
        UserMgt : Codeunit "5700";
        [InDataSet]
        JobQueueVisible : Boolean;
        HasIncomingDocument : Boolean;
        ExternalDocNoMandatory : Boolean;
        OpenApprovalEntriesExistForCurrUser : Boolean;
        OpenApprovalEntriesExist : Boolean;
        DocNoVisible : Boolean;

    local procedure Post(PostingCodeunitID : Integer);
    begin
        SendToPosting(PostingCodeunitID);
        IF "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting" THEN
          CurrPage.CLOSE;
        CurrPage.UPDATE(FALSE);
    end;

    local procedure ApproveCalcInvDisc();
    begin
        CurrPage.SalesLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure SelltoCustomerNoOnAfterValidat();
    begin
        IF GETFILTER("Sell-to Customer No.") = xRec."Sell-to Customer No." THEN
          IF "Sell-to Customer No." <> xRec."Sell-to Customer No." THEN
            SETRANGE("Sell-to Customer No.");
        CurrPage.UPDATE;
    end;

    local procedure SalespersonCodeOnAfterValidate();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.UPDATE;
    end;

    local procedure PricesIncludingVATOnAfterValid();
    begin
        CurrPage.UPDATE;
    end;

    local procedure SetControlAppearance();
    var
        ApprovalsMgmt : Codeunit "1535";
    begin
        JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        HasIncomingDocument := "Incoming Document Entry No." <> 0;
        SetExtDocNoMandatoryCondition;

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;

    local procedure SetExtDocNoMandatoryCondition();
    var
        SalesReceivablesSetup : Record "311";
    begin
        SalesReceivablesSetup.GET;
        ExternalDocNoMandatory := SalesReceivablesSetup."Ext. Doc. No. Mandatory"
    end;

    local procedure SetDocNoVisible();
    var
        DocumentNoVisibility : Codeunit "1400";
        DocType : Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.SalesDocumentNoIsVisible(DocType::"Credit Memo","No.");
    end;
}

