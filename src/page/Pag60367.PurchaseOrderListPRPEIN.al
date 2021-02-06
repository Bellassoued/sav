page 60367 "Purchase Order List PR PEIN"
{
    // version NAVW19.00.00.44974,CT16V001

    // CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Purchase Orders',
                FRA='Commandes achat';
    CardPageID = "Purchase Order PEIN";
    Editable = false;
    PageType = List;
    SourceTable = Table38;
    SourceTableView = WHERE(Document Type=CONST(Order),
                            Order Type=CONST(PR),
                            Vendor Type=CONST(Frs. Peinture));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field("Posting Date";"Posting Date")
                {
                    Visible = false;
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Buy-from Vendor No.";"Buy-from Vendor No.")
                {
                }
                field("Pay-to Name";"Pay-to Name")
                {
                    Visible = false;
                }
                field("Reception No";"Reception No")
                {
                    Caption = 'Num OR';
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field(Status;Status)
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("Nbre de lignes";"Nbre de lignes")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("Assigned User ID";"Assigned User ID")
                {
                }
                field("Buy-from Vendor Name";"Buy-from Vendor Name")
                {
                }
                field("Pay-to Vendor No.";"Pay-to Vendor No.")
                {
                    Visible = false;
                }
                field("Pay-to Post Code";"Pay-to Post Code")
                {
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                    Visible = true;
                }
                field("Purchaser Code";"Purchaser Code")
                {
                    Visible = false;
                }
                field("Currency Code";"Currency Code")
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
                field("Payment Method Code";"Payment Method Code")
                {
                    Visible = false;
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                    Visible = false;
                }
                field("Vendor Order No.";"Vendor Order No.")
                {
                }
                field("Reste à Recevoir";"Reste à Recevoir")
                {
                }
                field("Order Type";"Order Type")
                {
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            part(IncomingDocAttachFactBox;193)
            {
                ShowFilter = false;
                Visible = false;
            }
            part(;9093)
            {
                SubPageLink = No.=FIELD(Buy-from Vendor No.),
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
                action("Importer liste collisage")
                {
                    Image = ImportLog;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecRecoupprofachat : Record "60020";
                    begin
                          PAGE.RUN(PAGE::ImportCollisage);

                           //XmlImportListeCollisage.RUN;
                    end;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348=R;
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
                        OpenPurchaseOrderStatistics;
                    end;
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
            }
            group(Documents)
            {
                CaptionML = ENU='Documents',
                            FRA='Documents';
                Image = Documents;
                action(Receipts)
                {
                    CaptionML = ENU='Receipts',
                                FRA='Réceptions';
                    Image = PostedReceipts;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page 145;
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                }
                action(PostedPurchaseInvoices)
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
                action(PostedPurchasePrepmtInvoices)
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
                separator()
                {
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
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
            }
        }
        area(processing)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            FRA='Général';
                Image = Print;
                action(Print)
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
                action("Imprimer Bon Commande ST")
                {
                    Image = ServiceMan;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        PurchaseHeader : Record "38";
                    begin
                        //<<---NM280317--------
                        PurchaseHeader.RESET;
                        PurchaseHeader.SETRANGE("No.","No.");
                        IF PurchaseHeader.FINDFIRST THEN
                           REPORT.RUN(REPORT::"Bon Commande Sous Traitance",TRUE,TRUE,PurchaseHeader);
                        //>>---NM280317--------
                    end;
                }
            }
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
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction();
                    var
                        ReleasePurchDoc : Codeunit "415";
                    begin
                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
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
                action("Create auto Commande Achat PR")
                {
                    Image = CreateInteraction;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        MgtAures : Codeunit "70003";
                    begin
                        MgtAures.FctCreateautoPOPR;
                    end;
                }
                action("Import Code 62")
                {
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ADDINCustTxtFile : Text;
                        ADDINXmlStream : InStream;
                        path : Text;
                        FileMgmt : Codeunit "419";
                        ImportListcolisFactTYT : XMLport "70071";
                        LFile : File;
                    begin
                        /*
                        ADDINCustTxtFile := STRSUBSTNO('%1.csv','');
                        ADDINCustTxtFile := FileMgmt.OpenFileDialog('',ADDINCustTxtFile,'');
                        
                        path := FileMgmt.GetDirectoryName(ADDINCustTxtFile);
                        
                        LFile.OPEN(ADDINCustTxtFile);
                        LFile.CREATEINSTREAM(ADDINXmlStream);
                        CLEAR(ImportListcolisFactTYT);
                        ImportListcolisFactTYT.SETSOURCE(ADDINXmlStream);
                        ImportListcolisFactTYT.IMPORT;
                        LFile.CLOSE();
                        */
                        ImportListcolisFactTYT.RUN;

                    end;
                }
                action("Import Code 22")
                {
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ADDINCustTxtFile : Text;
                        ADDINXmlStream : InStream;
                        path : Text;
                        FileMgmt : Codeunit "419";
                        ImportListcolisFactTYT : XMLport "70071";
                        LFile : File;
                    begin
                        /*
                        ADDINCustTxtFile := STRSUBSTNO('%1.csv','');
                        ADDINCustTxtFile := FileMgmt.OpenFileDialog('',ADDINCustTxtFile,'');
                        
                        path := FileMgmt.GetDirectoryName(ADDINCustTxtFile);
                        
                        LFile.OPEN(ADDINCustTxtFile);
                        LFile.CREATEINSTREAM(ADDINXmlStream);
                        CLEAR(ImportListcolisFactTYT);
                        ImportListcolisFactTYT.SETSOURCE(ADDINXmlStream);
                        ImportListcolisFactTYT.IMPORT;
                        LFile.CLOSE();
                        */
                        ImportListcolisFactTYT.RUN;

                    end;
                }
                action("Report Code 22")
                {
                    Image = List;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 50149;
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
                    AccessByPermission = TableData 7316=R;
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
                action("Create Inventor&y Put-away/Pick")
                {
                    AccessByPermission = TableData 7340=R;
                    CaptionML = ENU='Create Inventor&y Put-away/Pick',
                                FRA='Créer prélèv./rangement stoc&k';
                    Ellipsis = true;
                    Image = CreatePutawayPick;

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
                action(TestReport)
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
                    begin
                        SendToPosting(CODEUNIT::"Purch.-Post (Yes/No)");
                    end;
                }
                action(Preview)
                {
                    CaptionML = ENU='Preview Posting',
                                FRA='Aperçu compta.';
                    Image = ViewPostedOrder;

                    trigger OnAction();
                    var
                        PurchPostYesNo : Codeunit "91";
                    begin
                        PurchPostYesNo.Preview(Rec);
                    end;
                }
                action(PostAndPrint)
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
                    begin
                        SendToPosting(CODEUNIT::"Purch.-Post + Print");
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
                        REPORT.RUNMODAL(REPORT::"Batch Post Purchase Orders",TRUE,TRUE,Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action(RemoveFromJobQueue)
                {
                    CaptionML = ENU='Remove From Job Queue',
                                FRA='Supprimer de la file d''attente des travaux';
                    Image = RemoveLine;
                    Visible = JobQueueActive;

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
        SetControlAppearance;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

    trigger OnOpenPage();
    var
        PurchasesPayablesSetup : Record "312";
    begin
        SetSecurityFilterOnRespCenter;

        JobQueueActive := PurchasesPayablesSetup.JobQueueActive;
    end;

    var
        DimMgt : Codeunit "408";
        ReportPrint : Codeunit "228";
        DocPrint : Codeunit "229";
        [InDataSet]
        JobQueueActive : Boolean;
        OpenApprovalEntriesExist : Boolean;
        XmlImportListeCollisage : XMLport "50006";

    local procedure SetControlAppearance();
    var
        ApprovalsMgmt : Codeunit "1535";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;
}

