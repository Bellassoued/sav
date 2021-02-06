page 69082 "Service Orders-ATELIER"
{
    // version SAV

    // CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Service Orders',
                FRA='Commandes service';
    CardPageID = "Service Order";
    Editable = false;
    PageType = List;
    PromotedActionCategoriesML = ENU='New,Process,Report,Warehouse',
                                 FRA='Nouveau,Traitement,État,Entrepôt';
    SourceTable = Table5900;
    SourceTableView = WHERE(Document Type=CONST(Order),
                            Type Reception=CONST(Reception Grand Reparation));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Reception No";"Reception No")
                {
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Type Reception";"Type Reception")
                {
                    Caption = 'Type OR';
                    Visible = false;
                }
                field(Matricule;Matricule)
                {
                }
                field(Kilométrage;Kilométrage)
                {
                }
                field("Release Status";"Release Status")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Status SR";"Status SR")
                {
                    Caption = 'Statut';
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field(Priority;Priority)
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
                field(Name;Name)
                {
                }
                field("Created By";"Created By")
                {
                }
                field("VAT Registration No.";"VAT Registration No.")
                {
                    CaptionML = ENU='VAT Registration No.',
                                FRA='MF';
                }
                field(Status;Status)
                {
                    Visible = false;
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Country/Region Code";"Country/Region Code")
                {
                }
                field("Ship-to County";"Ship-to County")
                {
                }
                field("Payment Method Code";"Payment Method Code")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Notify Customer";"Notify Customer")
                {
                    Visible = false;
                }
                field("Response Date";"Response Date")
                {
                }
                field("Response Time";"Response Time")
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
                field("Type de garantie";"Type de garantie")
                {
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
                field("Code Entretien";"Code Entretien")
                {
                }
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                }
                field("Bill-to Name";"Bill-to Name")
                {
                }
                field("Bill-to Name 2";"Bill-to Name 2")
                {
                }
                field("Bill-to Address";"Bill-to Address")
                {
                }
                field("Bill-to Address 2";"Bill-to Address 2")
                {
                }
                field("Bill-to City";"Bill-to City")
                {
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                }
                field("Total Montant PR";"Total Montant PR")
                {
                }
                field("Total Montant MO";"Total Montant MO")
                {
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
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
                    AccessByPermission = TableData 348=R;
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
                    Visible = false;

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
                        IF "Appliquer Frais Dossier" THEN
                          IF "Payment Method Code"<>'CPT' THEN
                            IF "Your Reference"<>'' THEN
                              ERROR('N° bon de commande client doit avoir une valeur');
                        ServHeader.GET("Document Type","No.");
                        ServPostYesNo.PostDocument(ServHeader);
                    end;
                }
                action(Preview)
                {
                    CaptionML = ENU='Preview Posting',
                                FRA='Aperçu compta.';
                    Image = ViewPostedOrder;

                    trigger OnAction();
                    var
                        ServPostYesNo : Codeunit "5981";
                    begin
                        ServHeader.GET("Document Type","No.");
                        ServPostYesNo.PreviewDocument(ServHeader);
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
                        IF "Appliquer Frais Dossier" THEN
                          IF "Payment Method Code"<>'CPT' THEN
                            IF "Your Reference"<>'' THEN
                              ERROR('N° bon de commande client doit avoir une valeur');
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
                        IF "Appliquer Frais Dossier" THEN
                          IF "Payment Method Code"<>'CPT' THEN
                            IF "Your Reference"<>'' THEN
                              ERROR('N° bon de commande client doit avoir une valeur');
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
                    Visible = false;

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
                        //Ak260419
                        ValidationControleQualité.RESET;
                        ValidationControleQualité.GET("Reception No");
                        IF ValidationControleQualité."Confirmation SQ"  THEN
                         ReleaseServiceDocument.PerformManualRelease(Rec)
                        ELSE
                          MESSAGE('En Attente de Validation Controle Qualité');
                        //END_AK
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
                    AccessByPermission = TableData 7320=R;
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
        RecGUserSetup.GET(USERID);
        IF NOT RecGUserSetup."Service Compta." THEN
         BEGIN
            SetSecurityFilterOnRespCenter;
            //<<CT16V001 ZM 15/05/2016
            FILTERGROUP(2);
            SETFILTER("Type Reception",'Reception Grand Reparation');
            FILTERGROUP(0);
            //>>CT16V001 ZM 15/05/2016
        END;
    end;

    var
        DimMgt : Codeunit "408";
        ServHeader : Record "5900";
        "ValidationControleQualité" : Record "50094";
        RecGUserSetup : Record "91";
}

