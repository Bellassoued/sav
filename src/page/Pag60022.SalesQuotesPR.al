page 60022 "Sales Quotes PR"
{
    // version SAV Automobile

    CaptionML = ENU='Sales Quotes PR',
                FRA='Devis';
    CardPageID = "Sales Quote PR";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = Table36;
    SourceTableView = SORTING(Document Type,No.)
                      WHERE(Document Type=CONST(Quote),
                            Order Type=CONST(PR));

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
                field(PRANET;PRANET)
                {
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Campaign No.";"Campaign No.")
                {
                    Visible = false;
                }
                field("Opportunity No.";"Opportunity No.")
                {
                    Visible = false;
                }
                field(Status;Status)
                {
                    Visible = false;
                }
                field(Amount;Amount)
                {
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("Estimated Time For Delivery";"Estimated Time For Delivery")
                {
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
            group("&Quote")
            {
                CaptionML = ENU='&Quote',
                            FRA='&Devis';
                Image = Quote;
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
                action("Customer Card")
                {
                    CaptionML = ENU='Customer Card',
                                FRA='Fiche client';
                    Image = Customer;
                    RunObject = Page 21;
                    RunPageLink = No.=FIELD(Sell-to Customer No.);
                    ShortCutKey = 'Shift+F7';
                }
                action("C&ontact Card")
                {
                    CaptionML = ENU='C&ontact Card',
                                FRA='Fiche c&ontact';
                    Image = Card;
                    RunObject = Page 5050;
                    RunPageLink = No.=FIELD(Sell-to Contact No.);
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
            action("&Print")
            {
                CaptionML = ENU='&Print',
                            FRA='&Imprimer';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    DocPrint.PrintSalesHeader(Rec);
                end;
            }
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
                separator()
                {
                }
            }
            group(Create)
            {
                CaptionML = ENU='Create',
                            FRA='Créer';
                action("Make &Order")
                {
                    CaptionML = ENU='Make &Order',
                                FRA='&Créer commande';
                    Image = MakeOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    var
                        PurchaseHeader : Record "38";
                        ApprovalsMgmt : Codeunit "1535";
                    begin

                        //<< TRIUM RAD 15/04/2014 - Commenter ancien code
                        //IF ApprovalMgt.PrePostApprovalCheck(Rec,PurchaseHeader) THEN
                        //  CODEUNIT.RUN(CODEUNIT::"Sales-Quote to Order (Yes/No)",Rec);
                        // Add new Code
                        IF RecGUserSetup.GET(USERID) THEN
                          IF RecGUserSetup."User Activity" =  RecGUserSetup."User Activity"::PR THEN
                              CODEUNIT.RUN(CODEUNIT::"Sales-Quote to Order (Yes/No)",Rec)
                            ELSE
                              IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                              CODEUNIT.RUN(CODEUNIT::"Sales-Quote to Order (Yes/No)",Rec);

                        //>> End TRIUM RAD addin
                    end;
                }
                action("C&reate Customer")
                {
                    CaptionML = ENU='C&reate Customer',
                                FRA='C&réer client';
                    Image = NewCustomer;

                    trigger OnAction();
                    begin
                        IF CheckCustomerCreated(FALSE) THEN
                          CurrPage.UPDATE(TRUE);
                    end;
                }
                action("Create &To-do")
                {
                    CaptionML = ENU='Create &To-do',
                                FRA='Créer ac&tion';
                    Image = NewToDo;

                    trigger OnAction();
                    begin
                        //KT MIG 90 TO 110 Fonction n'existe pas STD CreateTodo;
                    end;
                }
                separator()
                {
                }
            }
            group(Approval)
            {
                CaptionML = ENU='Approval',
                            FRA='Approbation';
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
                separator()
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        SetControlAppearance;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        CALCFIELDS("Estimated Time For Delivery");
    end;

    trigger OnOpenPage();
    begin
        SetSecurityFilterOnRespCenter;
    end;

    var
        DocPrint : Codeunit "229";
        RecGUserSetup : Record "91";
        OpenApprovalEntriesExist : Boolean;

    local procedure SetControlAppearance();
    var
        ApprovalsMgmt : Codeunit "1535";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;
}

