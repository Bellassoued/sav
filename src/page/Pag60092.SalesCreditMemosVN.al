page 60092 "Sales Credit Memos VN"
{
    // version SAV Automobile

    CaptionML = ENU='Sales Credit Memos PR',
                FRA='Avoirs vente';
    CardPageID = "Sales Credit Memo VN";
    Editable = false;
    PageType = List;
    SourceTable = Table36;
    SourceTableView = SORTING(Document Type,No.)
                      WHERE(Document Type=CONST(Credit Memo),
                            Order Type=CONST(VN));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Sell-to Post Code";"Sell-to Post Code")
                {
                    Visible = false;
                }
                field("Sell-to Country/Region Code";"Sell-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Sell-to Contact";"Sell-to Contact")
                {
                    Visible = false;
                }
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                    Visible = false;
                }
                field("Bill-to Name";"Bill-to Name")
                {
                    Visible = false;
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                    Visible = false;
                }
                field("Bill-to Country/Region Code";"Bill-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                    Visible = false;
                }
                field("Ship-to Code";"Ship-to Code")
                {
                    Visible = false;
                }
                field("Ship-to Name";"Ship-to Name")
                {
                    Visible = false;
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                    Visible = false;
                }
                field("Ship-to Country/Region Code";"Ship-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                    Visible = false;
                }
                field("Posting Date";"Posting Date")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                    Visible = true;
                }
                field("Salesperson Code";"Salesperson Code")
                {
                    Visible = false;
                }
                field("Assigned User ID";"Assigned User ID")
                {
                }
                field("Currency Code";"Currency Code")
                {
                    Visible = false;
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Campaign No.";"Campaign No.")
                {
                    Visible = false;
                }
                field(Status;Status)
                {
                    Visible = false;
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    Visible = false;
                }
                field("Due Date";"Due Date")
                {
                    Visible = false;
                }
                field("Shipment Date";"Shipment Date")
                {
                    Visible = false;
                }
                field("Applies-to Doc. Type";"Applies-to Doc. Type")
                {
                    Visible = false;
                }
                field("Job Queue Status";"Job Queue Status")
                {
                    Visible = JobQueueActive;
                }
                field("Type Paiement";"Type Paiement")
                {
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part(;9082)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.),
                              Date Filter=FIELD(Date Filter);
                Visible = true;
            }
            part(;9084)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.),
                              Date Filter=FIELD(Date Filter);
                Visible = true;
            }
            part(IncomingDocAttachFactBox;193)
            {
                ShowFilter = false;
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
            group("&Cr. Memo")
            {
                CaptionML = ENU='&Cr. Memo',
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
                    end;
                }
                action(Approvals)
                {
                    CaptionML = ENU='Approvals',
                                FRA='Approbations';
                    Image = Approvals;
                    Visible = false;

                    trigger OnAction();
                    var
                        ApprovalEntries : Page "658";
                    begin
                        ApprovalEntries.Setfilters(DATABASE::"Sales Header","Document Type","No.");
                        ApprovalEntries.RUN;
                    end;
                }
            }
        }
        area(processing)
        {
            group(Release)
            {
                CaptionML = ENU='Release',
                            FRA='Lancer';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    CaptionML = ENU='Re&lease',
                                FRA='&Lancer';
                    Image = ReleaseDoc;
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
            group("Request Approval")
            {
                CaptionML = ENU='Request Approval',
                            FRA='Approbation demande achat';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    CaptionML = ENU='Send A&pproval Request',
                                FRA='Envoyer demande d''a&pprobation';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Visible = false;

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
                    Visible = false;

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
                action("P&ost")
                {
                    CaptionML = ENU='P&ost',
                                FRA='&Valider';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        IF "Order Type" = "Order Type"::VN THEN BEGIN
                           RecUserSetup.GET(USERID);
                          IF NOT RecUserSetup."Valider Avoir VN" THEN ERROR(Text000001);
                          END;
                        SendToPosting(CODEUNIT::"Sales-Post (Yes/No)");
                    end;
                }
                action("Preview Posting")
                {
                    CaptionML = ENU='Preview Posting',
                                FRA='Aperçu compta.';
                    Image = ViewPostedOrder;

                    trigger OnAction();
                    var
                        SalesPostYesNo : Codeunit "81";
                    begin
                        SalesPostYesNo.Preview(Rec);
                    end;
                }
                action(PostAndSend)
                {
                    CaptionML = ENU='Post and &Send',
                                FRA='Valider et en&voyer';
                    Ellipsis = true;
                    Image = PostSendTo;
                    Promoted = true;
                    PromotedCategory = Category5;
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
                    //PromotedCategory = Process;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction();
                    begin
                        SendToPosting(CODEUNIT::"Sales-Post + Print");
                    end;
                }
                action("Post and Email")
                {
                    CaptionML = ENU='Post and Email',
                                FRA='Valider et envoyer par e-mail';
                    Ellipsis = true;
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
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = false;

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
                    Visible = false;

                    trigger OnAction();
                    begin
                        CancelBackgroundPosting;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        SetControlAppearance;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

    trigger OnOpenPage();
    var
        SalesSetup : Record "311";
    begin
        SetSecurityFilterOnRespCenter;
        JobQueueActive := SalesSetup.JobQueueActive;
    end;

    var
        ReportPrint : Codeunit "228";
        [InDataSet]
        JobQueueActive : Boolean;
        OpenApprovalEntriesExist : Boolean;
        RecUserSetup : Record "91";
        Text000001 : Label 'Vous n''etes pas autorisez à Valider une Facture AVOIR VN , Veuillez Contacter DCG ou DAF';

    local procedure SetControlAppearance();
    var
        ApprovalsMgmt : Codeunit "1535";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;
}

