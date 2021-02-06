page 60067 "Purchase Order VN"
{
    // version NAVW17.10

    CaptionML = ENU='Purchase Order',
                FRA='Commande achat';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table38;
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
                    Editable = false;
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field("Buy-from Vendor No.";"Buy-from Vendor No.")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        BuyfromVendorNoOnAfterValidate;
                    end;
                }
                field("Buy-from Contact No.";"Buy-from Contact No.")
                {
                }
                field("Buy-from Vendor Name";"Buy-from Vendor Name")
                {
                }
                field("Buy-from Address";"Buy-from Address")
                {
                    Importance = Additional;
                }
                field("Buy-from Address 2";"Buy-from Address 2")
                {
                    Importance = Additional;
                }
                field("Buy-from Post Code";"Buy-from Post Code")
                {
                    Importance = Additional;
                }
                field("Buy-from City";"Buy-from City")
                {
                }
                field("Buy-from Contact";"Buy-from Contact")
                {
                    Importance = Additional;
                }
                field("No. of Archived Versions";"No. of Archived Versions")
                {
                    Importance = Additional;
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Order Date";"Order Date")
                {
                    Importance = Promoted;
                }
                field("Document Date";"Document Date")
                {
                }
                field("Vendor Order No.";"Vendor Order No.")
                {
                }
                field("Ne pas afficher pr commercial";"Ne pas afficher pr commercial")
                {
                }
                field("Date Production";"Date Production")
                {
                }
                field("Pays Origine";"Pays Origine")
                {

                    trigger OnValidate();
                    begin
                        IF "Pays Origine" <> "Pays Origine"::" " THEN
                          IF "Pays Origine" = "Pays Origine"::Japon THEN
                            VALIDATE("Requested Receipt Date",CALCDATE('+'+FORMAT('3M'),"Date Production"))
                           ELSE  VALIDATE("Requested Receipt Date",CALCDATE('+'+FORMAT('2M'),"Date Production"));

                        MODIFY;
                    end;
                }
                field("Requested Receipt Date";"Requested Receipt Date")
                {
                }
                field("Quote No.";"Quote No.")
                {
                    Importance = Additional;
                }
                field("Vendor Shipment No.";"Vendor Shipment No.")
                {
                }
                field("Vendor Invoice No.";"Vendor Invoice No.")
                {
                }
                field("Order Address Code";"Order Address Code")
                {
                    Importance = Additional;
                }
                field("Purchaser Code";"Purchaser Code")
                {
                    Importance = Additional;

                    trigger OnValidate();
                    begin
                        PurchaserCodeOnAfterValidate;
                    end;
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
                field("No dossier";"No dossier")
                {
                }
                field("Apply Stamp fiscal";"Apply Stamp fiscal")
                {
                }
                field("Order Type";"Order Type")
                {
                }
            }
            part(PurchLines;60079)
            {
                SubPageLink = Document No.=FIELD(No.);
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Pay-to Vendor No.";"Pay-to Vendor No.")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        PaytoVendorNoOnAfterValidate;
                    end;
                }
                field("Pay-to Contact No.";"Pay-to Contact No.")
                {
                    Importance = Additional;
                }
                field("Pay-to Name";"Pay-to Name")
                {
                }
                field("Pay-to Address";"Pay-to Address")
                {
                    Importance = Additional;
                }
                field("Pay-to Address 2";"Pay-to Address 2")
                {
                    Importance = Additional;
                }
                field("Pay-to Post Code";"Pay-to Post Code")
                {
                    Importance = Additional;
                }
                field("Pay-to City";"Pay-to City")
                {
                }
                field("Pay-to Contact";"Pay-to Contact")
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
                    Importance = Additional;
                }
                field("Payment Reference";"Payment Reference")
                {
                }
                field("Creditor No.";"Creditor No.")
                {
                }
                field("On Hold";"On Hold")
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
                    Importance = Additional;
                }
                field("Ship-to City";"Ship-to City")
                {
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                }
                field("Location Code";"Location Code")
                {
                    Importance = Promoted;
                }
                field("Inbound Whse. Handling Time";"Inbound Whse. Handling Time")
                {
                    Importance = Additional;
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                }
                field("Lead Time Calculation";"Lead Time Calculation")
                {
                    Importance = Additional;
                }
                field("Promised Receipt Date";"Promised Receipt Date")
                {
                }
                field("Expected Receipt Date";"Expected Receipt Date")
                {
                    Importance = Promoted;
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field("Ship-to Code";"Ship-to Code")
                {
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
                field("Transaction Type";"Transaction Type")
                {
                }
                field("Transaction Specification";"Transaction Specification")
                {
                }
                field("Transport Method";"Transport Method")
                {
                }
                field("Entry Point";"Entry Point")
                {
                }
                field(Area;Area)
                {
                }
            }
            group(Prepayment)
            {
                CaptionML = ENU='Prepayment',
                            FRA='Acompte';
                field("Prepayment %";"Prepayment %")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        Prepayment37OnAfterValidate;
                    end;
                }
                field("Compress Prepayment";"Compress Prepayment")
                {
                }
                field("Prepmt. Payment Terms Code";"Prepmt. Payment Terms Code")
                {
                }
                field("Prepayment Due Date";"Prepayment Due Date")
                {
                    Importance = Promoted;
                }
                field("Prepmt. Payment Discount %";"Prepmt. Payment Discount %")
                {
                }
                field("Prepmt. Pmt. Discount Date";"Prepmt. Pmt. Discount Date")
                {
                }
                field("Vendor Cr. Memo No.";"Vendor Cr. Memo No.")
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
                action("Export VN")
                {
                    Image = Import;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        XmlExportVN.SetDocNo("No.");
                        XmlExportVN.RUN();
                    end;
                }
                action("Import VN")
                {
                    Caption = 'Import VN';
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                         CLEAR(updateNCHASSIS);
                         updateNCHASSIS.SetDocNo("No.");
                         updateNCHASSIS.RUN;
                    end;
                }
                action(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDocDim;
                        CurrPage.SAVERECORD;
                    end;
                }
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F7';

                    trigger OnAction();
                    begin
                        CalcInvDiscForHeader;
                        COMMIT;
                        PAGE.RUNMODAL(PAGE::"Purchase Order Statistics",Rec);
                    end;
                }
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page 26;
                    RunPageLink = No.=FIELD(Buy-from Vendor No.);
                    ShortCutKey = 'Shift+F7';
                }
                action(Approvals)
                {
                    CaptionML = ENU='Approvals',
                                FRA='Approbations';
                    Image = Approvals;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;

                    trigger OnAction();
                    var
                        ApprovalEntries : Page "658";
                    begin
                        ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
                        ApprovalEntries.RUN;
                    end;
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 66;
                    RunPageLink = Document Type=FIELD(Document Type),
                                  No.=FIELD(No.),
                                  Document Line No.=CONST(0);
                }
                action("MAJ VIN à partir du VN ARRIVAGE")
                {

                    trigger OnAction();
                    var
                        MgtAures : Codeunit "70003";
                    begin
                        //SM 300817
                        MgtAures.UpdateVINLigneAchatVN;
                        //END SM
                    end;
                }
            }
            group(Documents)
            {
                CaptionML = ENU='Documents',
                            FRA='Documents';
                Image = Documents;
                action(Receipts)
                {
                    CaptionML = ENU='Receipts',
                                FRA='Bons de réception';
                    Image = PostedReceipts;
                    RunObject = Page 145;
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                }
                action(Invoices)
                {
                    CaptionML = ENU='Invoices',
                                FRA='Factures';
                    Image = Invoice;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page 146;
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                }
                action("Prepa&yment Invoices")
                {
                    CaptionML = ENU='Prepa&yment Invoices',
                                FRA='Factures acom&pte';
                    Image = PrepaymentInvoice;
                    RunObject = Page 146;
                    RunPageLink = Prepayment Order No.=FIELD(No.);
                    RunPageView = SORTING(Prepayment Order No.);
                }
                action("Prepayment Credi&t Memos")
                {
                    CaptionML = ENU='Prepayment Credi&t Memos',
                                FRA='A&voirs acompte';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page 147;
                    RunPageLink = Prepayment Order No.=FIELD(No.);
                    RunPageView = SORTING(Prepayment Order No.);
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
                separator()
                {
                }
                action("In&vt. Put-away/Pick Lines")
                {
                    CaptionML = ENU='In&vt. Put-away/Pick Lines',
                                FRA='Lignes prélè&v./rangement stock';
                    Image = PickLines;
                    RunObject = Page 5774;
                    RunPageLink = Source Document=CONST(Purchase Order),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Document,Source No.,Location Code);
                }
                action("Whse. Receipt Lines")
                {
                    CaptionML = ENU='Whse. Receipt Lines',
                                FRA='Lignes réception entrep.';
                    Image = ReceiptLines;
                    RunObject = Page 7342;
                    RunPageLink = Source Type=CONST(39),
                                  Source Subtype=FIELD(Document Type),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.);
                }
                separator()
                {
                }
                group("Dr&op Shipment")
                {
                    CaptionML = ENU='Dr&op Shipment',
                                FRA='Livraison &directe';
                    Image = Delivery;
                    action("Get &Sales Order")
                    {
                        CaptionML = ENU='Get &Sales Order',
                                    FRA='Ex&traire commande vente';
                        Image = "Order";
                        RunObject = Codeunit 76;
                    }
                }
                group("Speci&al Order")
                {
                    CaptionML = ENU='Speci&al Order',
                                FRA='C&ommande spéciale';
                    Image = SpecialOrder;
                    action("Get &Sales Order")
                    {
                        CaptionML = ENU='Get &Sales Order',
                                    FRA='Ex&traire commande vente';
                        Image = "Order";

                        trigger OnAction();
                        var
                            PurchHeader : Record "38";
                            DistIntegration : Codeunit "5702";
                        begin
                            PurchHeader.COPY(Rec);
                            DistIntegration.GetSpecialOrders(PurchHeader);
                            Rec := PurchHeader;
                        end;
                    }
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
                separator()
                {
                }
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
                        ReleasePurchDoc : Codeunit "415";
                    begin
                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    CaptionML = ENU='Re&open',
                                FRA='R&ouvrir';
                    Image = ReOpen;

                    trigger OnAction();
                    var
                        ReleasePurchDoc : Codeunit "415";
                    begin
                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator()
                {
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
                action("Get St&d. Vend. Purchase Codes")
                {
                    CaptionML = ENU='Get St&d. Vend. Purchase Codes',
                                FRA='Extraire codes &achat fourn. std';
                    Ellipsis = true;
                    Image = VendorCode;

                    trigger OnAction();
                    var
                        StdVendPurchCode : Record "175";
                    begin
                        StdVendPurchCode.InsertPurchLines(Rec);
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
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
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
                        CLEAR(MoveNegPurchLines);
                        MoveNegPurchLines.SetPurchHeader(Rec);
                        MoveNegPurchLines.RUNMODAL;
                        MoveNegPurchLines.ShowDocument;
                    end;
                }
                group("Dr&op Shipment")
                {
                    CaptionML = ENU='Dr&op Shipment',
                                FRA='Livrais&on directe';
                    Image = Delivery;
                    action("Get &Sales Order")
                    {
                        CaptionML = ENU='Get &Sales Order',
                                    FRA='Ex&traire commande vente';
                        Image = "Order";
                        RunObject = Codeunit 76;
                    }
                }
                group("Speci&al Order")
                {
                    CaptionML = ENU='Speci&al Order',
                                FRA='C&ommande spéciale';
                    Image = SpecialOrder;
                    action("Get &Sales Order")
                    {
                        CaptionML = ENU='Get &Sales Order',
                                    FRA='Ex&traire commande vente';
                        Image = "Order";

                        trigger OnAction();
                        var
                            DistIntegration : Codeunit "5702";
                            PurchHeader : Record "38";
                        begin
                            PurchHeader.COPY(Rec);
                            DistIntegration.GetSpecialOrders(PurchHeader);
                            Rec := PurchHeader;
                        end;
                    }
                }
                action("Archive Document")
                {
                    CaptionML = ENU='Archi&ve Document',
                                FRA='Archi&ver document';
                    Image = Archive;

                    trigger OnAction();
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Send IC Purchase Order")
                {
                    AccessByPermission = TableData 410=R;
                    CaptionML = ENU='Send IC Purchase Order',
                                FRA='Envoyer commande achat IC';
                    Image = IntercompanyOrder;

                    trigger OnAction();
                    var
                        ICInOutboxMgt : Codeunit "427";
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                          ICInOutboxMgt.SendPurchDoc(Rec,FALSE);
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
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        IF ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
                          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
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
                        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    end;
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
                action("Create &Whse. Receipt")
                {
                    CaptionML = ENU='Create &Whse. Receipt',
                                FRA='Créer &réception entrepôt';
                    Image = NewReceipt;

                    trigger OnAction();
                    var
                        GetSourceDocInbound : Codeunit "5751";
                    begin
                        GetSourceDocInbound.CreateFromPurchOrder(Rec);

                        IF NOT FIND('=><') THEN
                          INIT;
                    end;
                }
                action("Create Inventor&y Put-away / Pick")
                {
                    CaptionML = ENU='Create Inventor&y Put-away / Pick',
                                FRA='Créer prélèv./rangement stoc&k';
                    Ellipsis = true;
                    Image = CreateInventoryPickup;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        CreateInvtPutAwayPick;

                        IF NOT FIND('=><') THEN
                          INIT;
                    end;
                }
                separator()
                {
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
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    var
                        RecPurchaseOrder : Record "38";
                    begin

                        Post(CODEUNIT::"Purch.-Post (Yes/No)");
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
                        RecPurchaseOrder : Record "38";
                    begin

                        Post(CODEUNIT::"Purch.-Post + Print");
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
                        ReportPrint.PrintPurchHeader(Rec);
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
                        REPORT.RUNMODAL(REPORT::"Batch Post Purchase Orders",TRUE,TRUE,Rec);
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
                separator()
                {
                }
                group("Prepa&yment")
                {
                    CaptionML = ENU='Prepa&yment',
                                FRA='Acom&pte';
                    Image = Prepayment;
                    action("Prepayment Test &Report")
                    {
                        CaptionML = ENU='Prepayment Test &Report',
                                    FRA='Impression &test acompte';
                        Ellipsis = true;
                        Image = PrepaymentSimulation;

                        trigger OnAction();
                        begin
                            ReportPrint.PrintPurchHeaderPrepmt(Rec);
                        end;
                    }
                    action(PostPrepaymentInvoice)
                    {
                        CaptionML = ENU='Post Prepayment &Invoice',
                                    FRA='Valider &facture acompte';
                        Ellipsis = true;
                        Image = PrepaymentPost;

                        trigger OnAction();
                        var
                            ApprovalsMgmt : Codeunit "1535";
                            PurchPostYNPrepmt : Codeunit "445";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                              PurchPostYNPrepmt.PostPrepmtInvoiceYN(Rec,FALSE);
                        end;
                    }
                    action("Post and Print Prepmt. Invoic&e")
                    {
                        CaptionML = ENU='Post and Print Prepmt. Invoic&e',
                                    FRA='Valider et imprimer factur&e acompte';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;

                        trigger OnAction();
                        var
                            ApprovalsMgmt : Codeunit "1535";
                            PurchPostYNPrepmt : Codeunit "445";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                              PurchPostYNPrepmt.PostPrepmtInvoiceYN(Rec,TRUE);
                        end;
                    }
                    action(PostPrepaymentCreditMemo)
                    {
                        CaptionML = ENU='Post Prepayment &Credit Memo',
                                    FRA='Valider &avoir acompte';
                        Ellipsis = true;
                        Image = PrepaymentPost;

                        trigger OnAction();
                        var
                            ApprovalsMgmt : Codeunit "1535";
                            PurchPostYNPrepmt : Codeunit "445";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                              PurchPostYNPrepmt.PostPrepmtCrMemoYN(Rec,FALSE);
                        end;
                    }
                    action("Post and Print Prepmt. Cr. Mem&o")
                    {
                        CaptionML = ENU='Post and Print Prepmt. Cr. Mem&o',
                                    FRA='Valider et imprimer av&oir acompte';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;

                        trigger OnAction();
                        var
                            ApprovalsMgmt : Codeunit "1535";
                            PurchPostYNPrepmt : Codeunit "445";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                              PurchPostYNPrepmt.PostPrepmtCrMemoYN(Rec,TRUE);
                        end;
                    }
                }
            }
            group(Print)
            {
                CaptionML = ENU='Print',
                            FRA='Imprimer';
                Image = Print;
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
                        DocPrint.PrintPurchHeader(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        //CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        //ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
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

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Responsibility Center" := UserMgt.GetPurchasesFilter;

        //<< TRIUM RAD 30/03/2014 - Ajout filtre par activité utilisateur
        "Order Type" := UserMgt.GetUserActivity(USERID);
        //>> END TRIUM RAD Addin
    end;

    trigger OnOpenPage();
    begin
        IF UserMgt.GetPurchasesFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetPurchasesFilter);
          FILTERGROUP(0);
        END;

        //<< TRIUM RAD 30/03/2014 - Ajout filtre par activité utilisateur
        IF UserMgt.GetUserActivity(USERID) <> 0 THEN
          BEGIN
            FILTERGROUP(2);
            SETRANGE("Order Type",UserMgt.GetUserActivity(USERID));
            FILTERGROUP(0);
          END;
        //>> END TRIUM RAD Addin
    end;

    var
        ChangeExchangeRate : Page "511";
        CopyPurchDoc : Report "492";
        MoveNegPurchLines : Report "6698";
        ReportPrint : Codeunit "228";
        DocPrint : Codeunit "229";
        UserMgt : Codeunit "5700";
        ArchiveManagement : Codeunit "5063";
        [InDataSet]
        JobQueueVisible : Boolean;
        updateNCHASSIS : XMLport "50003";
        XmlExportVN : XMLport "50002";
        DocNoVisible : Boolean;
        OpenApprovalEntriesExistForCurrUser : Boolean;
        OpenApprovalEntriesExist : Boolean;
        ShowWorkflowStatus : Boolean;
        VendorInvoiceNoMandatory : Boolean;
        HasIncomingDocument : Boolean;

    local procedure Post(PostingCodeunitID : Integer);
    begin
        SendToPosting(PostingCodeunitID);
        IF "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting" THEN
          CurrPage.CLOSE;
        CurrPage.UPDATE(FALSE);
    end;

    local procedure ApproveCalcInvDisc();
    begin
        CurrPage.PurchLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure BuyfromVendorNoOnAfterValidate();
    begin
        IF GETFILTER("Buy-from Vendor No.") = xRec."Buy-from Vendor No." THEN
          IF "Buy-from Vendor No." <> xRec."Buy-from Vendor No." THEN
            SETRANGE("Buy-from Vendor No.");
        CurrPage.UPDATE;
    end;

    local procedure PurchaserCodeOnAfterValidate();
    begin
        CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure PaytoVendorNoOnAfterValidate();
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

    local procedure Prepayment37OnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    local procedure SetDocNoVisible();
    var
        DocumentNoVisibility : Codeunit "1400";
        DocType : Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.PurchaseDocumentNoIsVisible(DocType::Order,"No.");
    end;

    local procedure SetExtDocNoMandatoryCondition();
    var
        PurchasesPayablesSetup : Record "312";
    begin
        PurchasesPayablesSetup.GET;
        VendorInvoiceNoMandatory := PurchasesPayablesSetup."Ext. Doc. No. Mandatory"
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
}

