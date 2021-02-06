page 60090 "Sales Invoice VN"
{
    // version SAV Automobile

    CaptionML = ENU='Sales Invoice PR',
                FRA='Facture vente';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table36;
    SourceTableView = WHERE(Document Type=FILTER(Invoice));

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
                    Editable = false;
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
                field("Type Paiement";"Type Paiement")
                {
                }
                field(Commentaire;Commentaire)
                {
                    Editable = false;
                }
            }
            part(SalesLines;60091)
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
                field("Direct Debit Mandate ID";"Direct Debit Mandate ID")
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
                field("Ship-to Code";"Ship-to Code")
                {
                    Importance = Promoted;
                }
                field("Ship-to Name";"Ship-to Name")
                {
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
                field("Shipment Method Code";"Shipment Method Code")
                {
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                }
                field("Package Tracking No.";"Package Tracking No.")
                {
                    Importance = Additional;
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
        }
        area(factboxes)
        {
            part(;9103)
            {
                SubPageLink = Table ID=CONST(36),
                              Document Type=FIELD(Document Type),
                              Document No.=FIELD(No.);
                Visible = OpenApprovalEntriesExistForCurrUser;
            }
            part(;9080)
            {
                SubPageLink = No.=FIELD(Sell-to Customer No.);
                Visible = false;
            }
            part(;9081)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.);
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
            part(;9089)
            {
                Provider = SalesLines;
                SubPageLink = No.=FIELD(No.);
                Visible = true;
            }
            part(IncomingDocAttachFactBox;193)
            {
                ShowFilter = false;
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
            part(WorkflowStatus;1528)
            {
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
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
            group("&Invoice")
            {
                CaptionML = ENU='&Invoice',
                            FRA='Fa&cture';
                Image = Invoice;
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
                action(Customer)
                {
                    CaptionML = ENU='Customer',
                                FRA='Client';
                    Image = Customer;
                    RunObject = Page 21;
                    RunPageLink = No.=FIELD(Sell-to Customer No.);
                    ShortCutKey = 'Shift+F7';
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
                separator()
                {
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
                separator()
                {
                }
            }
            group("Request Approval")
            {
                CaptionML = ENU='Request Approval',
                            FRA='Approbation demande achat';
                action(SendApprovalRequest)
                {
                    CaptionML = ENU='Send A&pproval Request',
                                FRA='Envoyer demande d''a&pprobation';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction();
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
                    begin
                        ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
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
                            IncomingDocument.ShowCardFromEntryNo("Incoming Document Entry No.");
                        end;
                    }
                    action(SelectIncomingDoc)
                    {
                        AccessByPermission = TableData 130=R;
                        CaptionML = ENU='Select Incoming Document',
                                    FRA='Sélectionner le document entrant';
                        Image = SelectLineToApply;
                        ToolTipML = ;

                        trigger OnAction();
                        var
                            IncomingDocument : Record "130";
                        begin
                            VALIDATE("Incoming Document Entry No.",IncomingDocument.SelectIncomingDocument("Incoming Document Entry No.",RECORDID));
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
                            IncomingDocumentAttachment.NewAttachmentFromSalesDocument(Rec);
                        end;
                    }
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
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
                action("Copy Document")
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
                separator()
                {
                }
            }
            group("Credit Card")
            {
                CaptionML = ENU='Credit Card',
                            FRA='Carte de crédit';
                Image = AuthorizeCreditCard;
                action(Authorize)
                {
                    CaptionML = ENU='Authorize',
                                FRA='Autoriser';
                    Image = AuthorizeCreditCard;

                    trigger OnAction();
                    begin
                        //KT MIG 90 TO 110 Fonction n'existe pas STDAuthorize;
                    end;
                }
                action("Void A&uthorize")
                {
                    CaptionML = ENU='Void A&uthorize',
                                FRA='Annuler l''a&utorisation';
                    Image = VoidCreditCard;

                    trigger OnAction();
                    begin
                        //KT MIG 90 TO 110 Fonction n'existe pas STDVoid;
                    end;
                }
            }
            group("P&osting")
            {
                CaptionML = ENU='P&osting',
                            FRA='&Validation';
                Image = Post;
                action(Post)
                {
                    CaptionML = ENU='P&ost',
                                FRA='&Valider';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Category6;
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
                    Promoted = true;
                    PromotedCategory = Category6;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
                action(PostAndSend)
                {
                    CaptionML = ENU='Post and &Send',
                                FRA='Valider et en&voyer';
                    Ellipsis = true;
                    Image = PostSendTo;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        SendToPosting(CODEUNIT::"Sales-Post and Send");
                    end;
                }
                action("Post and &Print")
                {
                    CaptionML = ENU='Post and &Print',
                                FRA='Valider et i&mprimer';
                    Image = PostPrint;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction();
                    begin
                        Post(CODEUNIT::"Sales-Post + Print");
                    end;
                }
                action("Post and Email")
                {
                    CaptionML = ENU='Post and Email',
                                FRA='Valider et envoyer par e-mail';
                    Image = PostMail;

                    trigger OnAction();
                    var
                        SalesPostPrint : Codeunit "82";
                    begin
                        SalesPostPrint.PostAndEmail(Rec);
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
                        REPORT.RUNMODAL(REPORT::"Batch Post Sales Invoices",TRUE,TRUE,Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Remove From Job Queue")
                {
                    CaptionML = ENU='Remove From Job Queue',
                                FRA='Supprimer de la file d''attente des travaux';
                    Image = RemoveLine;
                    Visible = "Job queue Status" = "Job Queue Status"::"Scheduled for Posting";

                    trigger OnAction();
                    begin
                        CancelBackgroundPosting;
                    end;
                }
                action(Preview)
                {
                    CaptionML = ENU='Preview Posting',
                                FRA='Aperçu compta.';
                    Image = ViewPostedOrder;

                    trigger OnAction();
                    begin
                        ShowPreview;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    end;

    trigger OnAfterGetRecord();
    begin
        SetControlAppearance;
    end;

    trigger OnDeleteRecord() : Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnInit();
    begin
        SetExtDocNoMandatoryCondition;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Responsibility Center" := UserMgt.GetSalesFilter;
        "Order Type" := "Order Type"::VN;
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
        ApprovalsMgmt : Codeunit "1535";
        HasIncomingDocument : Boolean;
        DocNoVisible : Boolean;
        ExternalDocNoMandatory : Boolean;
        OpenApprovalEntriesExistForCurrUser : Boolean;
        OpenApprovalEntriesExist : Boolean;
        ShowWorkflowStatus : Boolean;

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

    local procedure SetDocNoVisible();
    var
        DocumentNoVisibility : Codeunit "1400";
        DocType : Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.SalesDocumentNoIsVisible(DocType::Invoice,"No.");
    end;

    local procedure SetExtDocNoMandatoryCondition();
    var
        SalesReceivablesSetup : Record "311";
    begin
        SalesReceivablesSetup.GET;
        ExternalDocNoMandatory := SalesReceivablesSetup."Ext. Doc. No. Mandatory"
    end;

    local procedure ShowPreview();
    var
        SalesPostYesNo : Codeunit "81";
    begin
        SalesPostYesNo.Preview(Rec);
    end;

    local procedure SetControlAppearance();
    var
        ApprovalsMgmt : Codeunit "1535";
    begin
        HasIncomingDocument := "Incoming Document Entry No." <> 0;
        SetExtDocNoMandatoryCondition;

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;
}

