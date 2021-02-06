page 60123 "Service Orders VN"
{
    // version NAVW17.10

    CaptionML = ENU='Service Orders',
                FRA='Commandes service';
    CardPageID = "Service Order";
    Editable = false;
    PageType = List;
    PromotedActionCategoriesML = ENU='New,Process,Report,Warehouse',
                                 FRA='Nouveau,Traitement,État,Entrepôt';
    SourceTable = Table5900;
    SourceTableView = WHERE(Document Type=CONST(Order),
                            Type Reception=CONST(VN));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field("Reception No";"Reception No")
                {
                }
                field(Status;Status)
                {
                }
                field("Order Date";"Order Date")
                {
                }
                field("Order Time";"Order Time")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Ship-to Code";"Ship-to Code")
                {
                }
                field(Name;Name)
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Response Date";"Response Date")
                {
                }
                field("Response Time";"Response Time")
                {
                }
                field(Priority;Priority)
                {
                }
                field("Release Status";"Release Status")
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(1);
                    end;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(2);
                    end;
                }
                field("Assigned User ID";"Assigned User ID")
                {
                }
                field("Notify Customer";"Notify Customer")
                {
                    Visible = false;
                }
                field("Service Order Type";"Service Order Type")
                {
                    Visible = false;
                }
                field("Contract No.";"Contract No.")
                {
                    Visible = false;
                }
                field("Document Date";"Document Date")
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
                field("Payment Discount %";"Payment Discount %")
                {
                    Visible = false;
                }
                field("Payment Method Code";"Payment Method Code")
                {
                    Visible = false;
                }
                field("Shipping Advice";"Shipping Advice")
                {
                    Visible = false;
                }
                field("Warning Status";"Warning Status")
                {
                    Visible = false;
                }
                field("Allocated Hours";"Allocated Hours")
                {
                    Visible = false;
                }
                field("Expected Finishing Date";"Expected Finishing Date")
                {
                    Visible = false;
                }
                field("Starting Date";"Starting Date")
                {
                    Visible = false;
                }
                field("Finishing Date";"Finishing Date")
                {
                    Visible = false;
                }
                field("Service Time (Hours)";"Service Time (Hours)")
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
                SubPageLink = No.=FIELD(Customer No.),
                              Date Filter=FIELD(Date Filter);
                Visible = true;
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
            group("O&rder")
            {
                CaptionML = ENU='O&rder',
                            FRA='C&ommande';
                Image = "Order";
                separator()
                {
                    CaptionML = ENU='',
                                FRA='';
                }
                action("&Customer Card")
                {
                    CaptionML = ENU='&Customer Card',
                                FRA='&Fiche client';
                    Image = Customer;
                    RunObject = Page 21;
                    RunPageLink = No.=FIELD(Customer No.);
                    ShortCutKey = 'Shift+F7';
                }
                action("&Dimensions")
                {
                    CaptionML = ENU='&Dimensions',
                                FRA='&Axes analytiques';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDocDim;
                    end;
                }
                separator()
                {
                    CaptionML = ENU='',
                                FRA='';
                }
                action("Service Ledger E&ntries")
                {
                    CaptionML = ENU='Service Ledger E&ntries',
                                FRA='Écritures comptables se&rvice';
                    Image = ServiceLedger;
                    RunObject = Page 5912;
                    RunPageLink = Service Order No.=FIELD(No.);
                    RunPageView = SORTING(Service Order No.,Service Item No. (Serviced),Entry Type,Moved from Prepaid Acc.,Posting Date,Open,Type);
                    ShortCutKey = 'Ctrl+F7';
                }
                action("E-Mail &Queue")
                {
                    CaptionML = ENU='E-Mail &Queue',
                                FRA='File d''a&ttente e-mails';
                    Image = Email;
                    RunObject = Page 5961;
                    RunPageLink = Document Type=CONST(Service Order),
                                  Document No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Document No.);
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 5911;
                    RunPageLink = Table Name=CONST(Service Header),
                                  Table Subtype=FIELD(Document Type),
                                  No.=FIELD(No.),
                                  Type=CONST(General);
                }
            }
            group(Statistics)
            {
                CaptionML = ENU='Statistics',
                            FRA='Statistiques';
                Image = Statistics;
                separator()
                {
                    CaptionML = ENU='',
                                FRA='';
                }
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';

                    trigger OnAction();
                    var
                        SalesSetup : Record "311";
                        ServLine : Record "5902";
                        ServLines : Page "5905";
                    begin
                        SalesSetup.GET;
                        IF SalesSetup."Calc. Inv. Discount" THEN BEGIN
                          ServLine.RESET;
                          ServLine.SETRANGE("Document Type","Document Type");
                          ServLine.SETRANGE("Document No.","No.");
                          IF ServLine.FINDFIRST THEN BEGIN
                            ServLines.SETTABLEVIEW(ServLine);
                            ServLines.CalcInvDisc(ServLine);
                            COMMIT
                          END;
                        END;
                        PAGE.RUNMODAL(PAGE::"Service Order Statistics",Rec);
                    end;
                }
                separator()
                {
                    CaptionML = ENU='',
                                FRA='';
                }
            }
            group(Documents)
            {
                CaptionML = ENU='Documents',
                            FRA='Documents';
                Image = Documents;
                action("S&hipments")
                {
                    CaptionML = ENU='S&hipments',
                                FRA='E&xpéditions';
                    Image = Shipment;
                    RunObject = Page 5974;
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                }
                action(Invoices)
                {
                    CaptionML = ENU='Invoices',
                                FRA='Factures';
                    Image = Invoice;
                    RunObject = Page 5977;
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                }
            }
            group("W&arehouse")
            {
                CaptionML = ENU='W&arehouse',
                            FRA='Entr&epôt';
                Image = Warehouse;
                action("Whse. Shipment Lines")
                {
                    CaptionML = ENU='Whse. Shipment Lines',
                                FRA='Lignes expédition entrepôt';
                    Image = ShipmentLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page 7341;
                    RunPageLink = Source Type=CONST(5902),
                                  Source Subtype=FIELD(Document Type),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.);
                }
            }
            group(History)
            {
                CaptionML = ENU='History',
                            FRA='Historique';
                Image = History;
                action("Service Document Lo&g")
                {
                    CaptionML = ENU='Service Document Lo&g',
                                FRA='&Journal document service';
                    Image = Log;

                    trigger OnAction();
                    var
                        ServDocLog : Record "5912";
                    begin
                        ServDocLog.ShowServDocLog(Rec);
                    end;
                }
                action("&Warranty Ledger Entries")
                {
                    CaptionML = ENU='&Warranty Ledger Entries',
                                FRA='Écritures comptables &garantie';
                    Image = WarrantyLedger;
                    RunObject = Page 5913;
                    RunPageLink = Service Order No.=FIELD(No.);
                    RunPageView = SORTING(Service Order No.,Posting Date,Document No.);
                }
                action("&Job Ledger Entries")
                {
                    CaptionML = ENU='&Job Ledger Entries',
                                FRA='Écritures comptables &projet';
                    Image = JobLedger;
                    RunObject = Page 92;
                    RunPageLink = Service Order No.=FIELD(No.);
                    RunPageView = SORTING(Service Order No.,Posting Date)
                                  WHERE(Entry Type=CONST(Usage));
                }
            }
        }
        area(processing)
        {
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
                    var
                        ReportPrint : Codeunit "228";
                    begin
                        ReportPrint.PrintServiceHeader(Rec);
                    end;
                }
                action(Post)
                {
                    CaptionML = ENU='P&ost',
                                FRA='&Valider';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    var
                        ServPostYesNo : Codeunit "5981";
                    begin
                        ServHeader.GET("Document Type","No.");
                        ServPostYesNo.PostDocument(ServHeader);
                    end;
                }
                action("Post and &Print")
                {
                    CaptionML = ENU='Post and &Print',
                                FRA='Valider et i&mprimer';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction();
                    var
                        ServPostPrint : Codeunit "5982";
                    begin
                        ServHeader.GET("Document Type","No.");
                        ServPostPrint.PostDocument(ServHeader);
                    end;
                }
                action(PostBatch)
                {
                    CaptionML = ENU='Post &Batch',
                                FRA='Valider par l&ot';
                    Ellipsis = true;
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CLEAR(ServHeader);
                        ServHeader.SETRANGE(Status,ServHeader.Status::Finished);
                        REPORT.RUNMODAL(REPORT::"Batch Post Service Orders",TRUE,TRUE,ServHeader);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("&Print")
                {
                    CaptionML = ENU='&Print',
                                FRA='&Imprimer';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        DocPrint : Codeunit "229";
                    begin
                        CurrPage.UPDATE(TRUE);
                        DocPrint.PrintServiceHeader(Rec);
                    end;
                }
            }
            group("W&arehouse")
            {
                CaptionML = ENU='W&arehouse',
                            FRA='Entr&epôt';
                Image = Warehouse;
                action("Release to Ship")
                {
                    CaptionML = ENU='Release to Ship',
                                FRA='Lancer pour expédition';
                    Image = ReleaseShipment;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    var
                        ReleaseServiceDocument : Codeunit "416";
                    begin
                        ReleaseServiceDocument.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    CaptionML = ENU='Reopen',
                                FRA='Rouvrir';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction();
                    var
                        ReleaseServiceDocument : Codeunit "416";
                    begin
                        ReleaseServiceDocument.PerformManualReopen(Rec);
                    end;
                }
                action("Create Whse Shipment")
                {
                    CaptionML = ENU='Create Whse. Shipment',
                                FRA='Créer expédition entrepôt';
                    Image = NewShipment;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction();
                    var
                        GetSourceDocOutbound : Codeunit "5752";
                    begin
                        GetSourceDocOutbound.CreateFromServiceOrder(Rec);
                        IF NOT FIND('=><') THEN
                          INIT;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        SetSecurityFilterOnRespCenter;
    end;

    var
        DimMgt : Codeunit "408";
        ServHeader : Record "5900";
}

