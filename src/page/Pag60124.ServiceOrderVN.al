page 60124 "Service Order VN"
{
    // version NAVW17.00

    CaptionML = ENU='Service Order',
                FRA='Commande service';
    PageType = Document;
    PromotedActionCategoriesML = ENU='New,Process,Report,Warehouse',
                                 FRA='Nouveau,Traitement,État,Entrepôt';
    RefreshOnActivate = true;
    SourceTable = Table5900;
    SourceTableView = WHERE(Document Type=FILTER(Order));

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
                field(Description;Description)
                {
                }
                field("Customer No.";"Customer No.")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        CustomerNoOnAfterValidate;
                    end;
                }
                field("Contact No.";"Contact No.")
                {

                    trigger OnValidate();
                    begin
                        IF GETFILTER("Contact No.") = xRec."Contact No." THEN
                          IF "Contact No." <> xRec."Contact No." THEN
                            SETRANGE("Contact No.");
                    end;
                }
                field(Name;Name)
                {
                }
                field(Address;Address)
                {
                }
                field("Address 2";"Address 2")
                {
                    Importance = Additional;
                }
                field("Post Code";"Post Code")
                {
                }
                field("Contact Name";"Contact Name")
                {
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("E-Mail";"E-Mail")
                {
                    Importance = Additional;
                }
                field(City;City)
                {
                }
                field("Phone No. 2";"Phone No. 2")
                {
                    Importance = Additional;
                }
                field("Notify Customer";"Notify Customer")
                {
                    Importance = Additional;
                }
                field("Service Order Type";"Service Order Type")
                {
                }
                field("Contract No.";"Contract No.")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field("Your Reference";"Your Reference")
                {
                    CaptionML = ENU='Your Reference',
                                FRA='Bon de Commande Client';
                    Importance = Standard;
                }
                field("Response Date";"Response Date")
                {
                    Importance = Additional;
                }
                field("Response Time";"Response Time")
                {
                    Importance = Additional;
                }
                field(Priority;Priority)
                {
                    Importance = Promoted;
                }
                field(Status;Status)
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    Importance = Additional;
                }
                field("Assigned User ID";"Assigned User ID")
                {
                    Importance = Additional;
                }
                field("Release Status";"Release Status")
                {
                    Importance = Promoted;
                }
                field("Reception No";"Reception No")
                {
                }
                field(Matricule;Matricule)
                {
                    Editable = true;
                }
                field(Timbre;Timbre)
                {
                    Editable = true;
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                }
            }
            part(ServItemLines;5902)
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
                }
                field("Bill-to Address 2";"Bill-to Address 2")
                {
                    Importance = Additional;
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                }
                field("Bill-to City";"Bill-to City")
                {
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("Max. Labor Unit Price";"Max. Labor Unit Price")
                {
                    Importance = Additional;

                    trigger OnValidate();
                    begin
                        MaxLaborUnitPriceOnAfterValida;
                    end;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
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
            }
            group(Shipping)
            {
                CaptionML = ENU='Shipping',
                            FRA='Livraison';
                field("Ship-to Code";"Ship-to Code")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        ShiptoCodeOnAfterValidate;
                    end;
                }
                field("Ship-to Name";"Ship-to Name")
                {
                }
                field("Ship-to Address";"Ship-to Address")
                {
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
                    Importance = Promoted;
                }
                field("Ship-to Phone";"Ship-to Phone")
                {
                    CaptionML = ENU='Ship-to Phone',
                                FRA='Tél. destinataire';
                }
                field("Ship-to Phone 2";"Ship-to Phone 2")
                {
                    Importance = Additional;
                }
                field("Ship-to E-Mail";"Ship-to E-Mail")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Shipping Advice";"Shipping Advice")
                {
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                }
                field("Shipping Agent Service Code";"Shipping Agent Service Code")
                {
                }
                field("Shipping Time";"Shipping Time")
                {
                }
            }
            group(Details)
            {
                CaptionML = ENU='Details',
                            FRA='Détails';
                field("Warning Status";"Warning Status")
                {
                    Importance = Promoted;
                }
                field("Link Service to Service Item";"Link Service to Service Item")
                {
                }
                field("Allocated Hours";"Allocated Hours")
                {
                }
                field("No. of Allocations";"No. of Allocations")
                {
                }
                field("No. of Unallocated Items";"No. of Unallocated Items")
                {
                }
                field("Service Zone Code";"Service Zone Code")
                {
                }
                field("Order Date";"Order Date")
                {

                    trigger OnValidate();
                    begin
                        OrderDateOnAfterValidate;
                    end;
                }
                field("Order Time";"Order Time")
                {

                    trigger OnValidate();
                    begin
                        OrderTimeOnAfterValidate;
                    end;
                }
                field("Expected Finishing Date";"Expected Finishing Date")
                {
                }
                field("Starting Date";"Starting Date")
                {
                    Importance = Promoted;
                }
                field("Starting Time";"Starting Time")
                {
                }
                field("Actual Response Time (Hours)";"Actual Response Time (Hours)")
                {
                }
                field("Finishing Date";"Finishing Date")
                {
                }
                field("Finishing Time";"Finishing Time")
                {

                    trigger OnValidate();
                    begin
                        FinishingTimeOnAfterValidate;
                    end;
                }
                field("Service Time (Hours)";"Service Time (Hours)")
                {
                }
            }
            group(" Foreign Trade")
            {
                CaptionML = ENU=' Foreign Trade',
                            FRA=' International';
                field("Currency Code";"Currency Code")
                {
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        CLEAR(ChangeExchangeRate);
                        ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date");
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
            part(;9082)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.);
                Visible = false;
            }
            part(;9084)
            {
                SubPageLink = No.=FIELD(Customer No.);
                Visible = false;
            }
            part(;9085)
            {
                SubPageLink = No.=FIELD(Customer No.);
                Visible = true;
            }
            part(;9086)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.);
                Visible = false;
            }
            part(;9088)
            {
                Provider = ServItemLines;
                SubPageLink = Document Type=FIELD(Document Type),
                              Document No.=FIELD(Document No.),
                              Line No.=FIELD(Line No.);
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
                            FRA='&Commande';
                Image = "Order";
                separator()
                {
                }
                action("Demand Overview")
                {
                    CaptionML = ENU='Demand Overview',
                                FRA='Aperçu demande';
                    Image = Forecast;

                    trigger OnAction();
                    var
                        DemandOverview : Page "5830";
                    begin
                        DemandOverview.SetCalculationParameter(TRUE);
                        DemandOverview.Initialize(0D,4,"No.",'','');
                        DemandOverview.RUNMODAL;
                    end;
                }
                separator()
                {
                }
                action("<Action7>")
                {
                    CaptionML = ENU='Order Promising',
                                FRA='Promesse de livraison';
                    Image = OrderPromising;

                    trigger OnAction();
                    var
                        OrderPromisingLine : Record "99000880";
                        OrderPromisingLines : Page "99000959";
                    begin
                        CLEAR(OrderPromisingLines);
                        OrderPromisingLines.SetSourceType(12); // Service order
                        CLEAR(OrderPromisingLine);
                        OrderPromisingLine.SETRANGE("Source Type",OrderPromisingLine."Source Type"::"Service Order");
                        OrderPromisingLine.SETRANGE("Source ID","No.");
                        OrderPromisingLines.SETTABLEVIEW(OrderPromisingLine);
                        OrderPromisingLines.RUNMODAL;
                    end;
                }
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
                                FRA='A&xes analytiques';
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
            group("<Action36>")
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
                    Promoted = true;
                    PromotedCategory = Process;
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
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("Create Customer")
                {
                    CaptionML = ENU='&Create Customer',
                                FRA='&Créer client';
                    Image = NewCustomer;

                    trigger OnAction();
                    begin
                        CLEAR(ServOrderMgt);
                        ServOrderMgt.CreateNewCustomer(Rec);
                        CurrPage.UPDATE(TRUE);
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
            group("P&osting")
            {
                CaptionML = ENU='P&osting',
                            FRA='&Validation';
                Image = Post;
                action(TestReport)
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

                        //<< TRIUM RAD 20/02/2014 - Forcer la date de comptabilisation

                        ServHeader."Posting Date" := TODAY;
                        ServHeader.MODIFY;

                        //>> End TRIUM RAD Addin

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

                        //<< TRIUM RAD 20/02/2014 - Forcer la date de comptabilisation

                        ServHeader."Posting Date" := TODAY;
                        ServHeader.MODIFY;

                        //>> End TRIUM RAD Addin


                        ServPostPrint.PostDocument(ServHeader);
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
                        CLEAR(ServHeader);
                        ServHeader.SETRANGE(Status,ServHeader.Status::Finished);
                        REPORT.RUNMODAL(REPORT::"Batch Post Service Orders",TRUE,TRUE,ServHeader);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
            }
            action("&Print")
            {
                CaptionML = ENU='&Print',
                            FRA='&Imprimer Devis';
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
    }

    trigger OnDeleteRecord() : Boolean;
    begin
        CurrPage.SAVERECORD;
        CLEAR(ServLogMgt);
        ServLogMgt.ServHeaderManualDelete(Rec);
        EXIT(ConfirmDeletion);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Document Type" := "Document Type"::Order;
        "Responsibility Center" := UserMgt.GetServiceFilter;
        "Type Reception" := "Type Reception"::VN;
    end;

    trigger OnOpenPage();
    begin
        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;
    end;

    var
        ServHeader : Record "5900";
        ChangeExchangeRate : Page "511";
        ServOrderMgt : Codeunit "5900";
        ServLogMgt : Codeunit "5906";
        UserMgt : Codeunit "5700";

    local procedure CustomerNoOnAfterValidate();
    begin
        IF GETFILTER("Customer No.") = xRec."Customer No." THEN
          IF "Customer No." <> xRec."Customer No." THEN
            SETRANGE("Customer No.");
        CurrPage.UPDATE;
    end;

    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    local procedure MaxLaborUnitPriceOnAfterValida();
    begin
        CurrPage.SAVERECORD;
    end;

    local procedure PricesIncludingVATOnAfterValid();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShiptoCodeOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    local procedure OrderTimeOnAfterValidate();
    begin
        UpdateResponseDateTime;
        CurrPage.UPDATE;
    end;

    local procedure OrderDateOnAfterValidate();
    begin
        UpdateResponseDateTime;
        CurrPage.UPDATE;
    end;

    local procedure FinishingTimeOnAfterValidate();
    begin
        CurrPage.UPDATE(TRUE);
    end;
}

