page 60083 "Sales Order List VN"
{
    // version SAV Automobile

    CaptionML = ENU='Sales Orders PR',
                FRA='Commandes vente';
    CardPageID = "Sales Order VN";
    Editable = false;
    PageType = List;
    SourceTable = Table36;
    SourceTableView = SORTING(Document Type,No.)
                      WHERE(Document Type=CONST(Order),
                            Order Type=CONST(VN));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                    CaptionML = ENU='Sell-to Customer No.',
                                FRA='N° Client';
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("Document Date";"Document Date")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                    CaptionML = ENU='Sell-to Customer Name',
                                FRA='Nom du client';
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field(Justificatif;Justificatif)
                {
                }
                field("Dossier complet";"Dossier complet")
                {
                }
                field("Date Recept Doss";"Date Recept Doss")
                {
                }
                field("Dossier Validé";"Dossier Validé")
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
                field("Assigned User ID";"Assigned User ID")
                {
                }
                field("Currency Code";"Currency Code")
                {
                    Visible = false;
                }
                field("Requested Delivery Date";"Requested Delivery Date")
                {
                    Visible = false;
                }
                field("Campaign No.";"Campaign No.")
                {
                    Visible = false;
                }
                field(Status;Status)
                {
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
                field("Shipment Method Code";"Shipment Method Code")
                {
                    Visible = false;
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                    Visible = false;
                }
                field("Shipment Date";"Shipment Date")
                {
                    Visible = false;
                }
                field("Shipping Advice";"Shipping Advice")
                {
                    Visible = false;
                }
                field("Job Queue Status";"Job Queue Status")
                {
                    Visible = JobQueueActive;
                }
                field("Type Paiement";"Type Paiement")
                {
                }
                field(AI;AI)
                {
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field(Modele;Modele)
                {
                }
                field(Amount;Amount)
                {
                    Visible = false;
                }
                field(Phone;Phone)
                {
                }
                field("Mobile Phone No.";"Mobile Phone No.")
                {
                }
                field("No. Facture Cession";"No. Facture Cession")
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
            part(IncomingDocAttachFactBox;193)
            {
                ShowFilter = false;
                Visible = false;
            }
            part(;9084)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.),
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
                        PAGE.RUNMODAL(PAGE::"Sales Order Statistics",Rec);
                    end;
                }
                action("A&pprovals")
                {
                    CaptionML = ENU='A&pprovals',
                                FRA='&Approbations';
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
                    RunObject = Page 142;
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                }
                action(Invoices)
                {
                    CaptionML = ENU='Invoices',
                                FRA='Factures';
                    Image = Invoice;
                    RunObject = Page 143;
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                }
                action("Prepa&yment Invoices")
                {
                    CaptionML = ENU='Prepa&yment Invoices',
                                FRA='Factures acom&pte';
                    Image = PrepaymentInvoice;
                    RunObject = Page 143;
                    RunPageLink = Prepayment Order No.=FIELD(No.);
                    RunPageView = SORTING(Prepayment Order No.);
                    Visible = false;
                }
                action("Prepayment Credi&t Memos")
                {
                    CaptionML = ENU='Prepayment Credi&t Memos',
                                FRA='A&voirs acompte';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page 144;
                    RunPageLink = Prepayment Order No.=FIELD(No.);
                    RunPageView = SORTING(Prepayment Order No.);
                    Visible = false;
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
                action("Whse. Shipment Lines")
                {
                    CaptionML = ENU='Whse. Shipment Lines',
                                FRA='Lignes expédition entrepôt';
                    Image = ShipmentLines;
                    RunObject = Page 7341;
                    RunPageLink = Source Type=CONST(37),
                                  Source Subtype=FIELD(Document Type),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.);
                    Visible = false;
                }
                action("In&vt. Put-away/Pick Lines")
                {
                    CaptionML = ENU='In&vt. Put-away/Pick Lines',
                                FRA='Lignes prélè&v./rangement stock';
                    Image = PickLines;
                    RunObject = Page 5774;
                    RunPageLink = Source Document=CONST(Sales Order),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Document,Source No.,Location Code);
                    Visible = false;
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
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';
                    Visible = VisibiliteRSHOWROOM OR VisibiliteFacturation;

                    trigger OnAction();
                    var
                        ReleaseSalesDoc : Codeunit "414";
                    begin
                        //SM2807
                        CheckToRelease;
                        //END SM
                        ReleaseSalesDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    CaptionML = ENU='Re&open',
                                FRA='R&ouvrir';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = VisibiliteFacturation;

                    trigger OnAction();
                    var
                        ReleaseSalesDoc : Codeunit "414";
                    begin
                        //SM 130917
                        TESTFIELD("Dossier Validé",FALSE);
                        //END SM
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("Pla&nning")
                {
                    CaptionML = ENU='Pla&nning',
                                FRA='Plan&ning';
                    Image = Planning;
                    Visible = false;

                    trigger OnAction();
                    var
                        SalesOrderPlanningForm : Page "99000883";
                    begin
                        SalesOrderPlanningForm.SetSalesOrder("No.");
                        SalesOrderPlanningForm.RUNMODAL;
                    end;
                }
                action("Order &Promising")
                {
                    CaptionML = ENU='Order &Promising',
                                FRA='Pro&messe de livraison';
                    Image = OrderPromising;
                    Visible = false;

                    trigger OnAction();
                    var
                        OrderPromisingLine : Record "99000880" temporary;
                    begin
                        OrderPromisingLine.SETRANGE("Source Type","Document Type");
                        OrderPromisingLine.SETRANGE("Source ID","No.");
                        PAGE.RUNMODAL(PAGE::"Order Promising Lines",OrderPromisingLine);
                    end;
                }
                action("Send IC Sales Order Cnfmn.")
                {
                    AccessByPermission = TableData 410=R;
                    CaptionML = ENU='Send IC Sales Order Cnfmn.',
                                FRA='Confirmation envoi commande vente IC';
                    Image = IntercompanyOrder;
                    Visible = false;

                    trigger OnAction();
                    var
                        ICInOutboxMgt : Codeunit "427";
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                          ICInOutboxMgt.SendSalesDoc(Rec,FALSE);
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
                    Visible = false;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        //SM 280717
                        CheckToRelease;
                        //END SM
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
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
                action("Create Inventor&y Put-away/Pick")
                {
                    CaptionML = ENU='Create Inventor&y Put-away/Pick',
                                FRA='Créer prélèv./rangement stoc&k';
                    Ellipsis = true;
                    Image = CreatePutawayPick;
                    Visible = false;

                    trigger OnAction();
                    begin
                        CreateInvtPutAwayPick;

                        IF NOT FIND('=><') THEN
                          INIT;
                    end;
                }
                action("Create &Whse. Shipment")
                {
                    CaptionML = ENU='Create &Whse. Shipment',
                                FRA='Créer e&xpédition entrepôt';
                    Image = NewShipment;
                    Visible = false;

                    trigger OnAction();
                    var
                        GetSourceDocOutbound : Codeunit "5752";
                    begin
                        GetSourceDocOutbound.CreateFromSalesOrder(Rec);

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
                action("P&ost")
                {
                    CaptionML = ENU='P&ost',
                                FRA='&Valider';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    Visible = VisibiliteFacturation;

                    trigger OnAction();
                    begin
                        SendToPosting(CODEUNIT::"Sales-Post (Yes/No)");
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
                    Visible = VisibiliteFacturation;

                    trigger OnAction();
                    begin
                        SendToPosting(CODEUNIT::"Sales-Post + Print");
                    end;
                }
                action("Test Report")
                {
                    CaptionML = ENU='Test Report',
                                FRA='Impression test';
                    Ellipsis = true;
                    Image = TestReport;
                    Visible = false;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
                action("Post &Batch")
                {
                    CaptionML = ENU='Post &Batch',
                                FRA='Valider par l&ot';
                    Ellipsis = true;
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    begin
                        REPORT.RUNMODAL(REPORT::"Batch Post Sales Orders",TRUE,TRUE,Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Remove From Job Queue")
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
            group("&Print")
            {
                CaptionML = ENU='&Print',
                            FRA='&Imprimer';
                Image = Print;
                action("Order Confirmation")
                {
                    CaptionML = ENU='Order Confirmation',
                                FRA='Confirmation de commande';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesOrder(Rec,Usage::"Order Confirmation");
                    end;
                }
                action("Work Order")
                {
                    CaptionML = ENU='Work Order',
                                FRA='Ordre de fabrication';
                    Ellipsis = true;
                    Image = Print;
                    Visible = false;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesOrder(Rec,Usage::"Work Order");
                    end;
                }
                action("Pick Instruction")
                {
                    CaptionML = ENU='Pick Instruction',
                                FRA='Instruction prélèvement';
                    Image = Print;
                    Visible = false;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesOrder(Rec,Usage::"Pick Instruction");
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Sales Reservation Avail.")
            {
                CaptionML = ENU='Sales Reservation Avail.',
                            FRA='Dispo. réservation vente';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 209;
                Visible = false;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        //SM 22117
        FctVerifAIHeader;
        //ENDSM
        SetControlVisibility;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

    trigger OnAfterGetRecord();
    begin
        //SM 22117
        FctVerifAIHeader;
        CALCFIELDS("Amount Including VAT");
        //KK_
        LineColor := 'Standard';
        IF "Date expiration réservation" <> 0D THEN
          IF "Date expiration réservation" < WORKDATE THEN
            LineColor := 'Unfavorable';
    end;

    trigger OnOpenPage();
    var
        SalesSetup : Record "311";
    begin
        //SM 020817
        FILTERGROUP(2);
        RecGUserSetup.GET(USERID);
        IF NOT RecGUserSetup."Autoriser Facturation VN" THEN BEGIN
        IF NOT RecGUserSetup.Admin_Vente_VN  THEN BEGIN
          IF UserMgt.GetSalesFilter <> '' THEN BEGIN

            SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);

          END;
        END;

        IF (NOT RecGUserSetup.Admin_Vente_VN) AND (NOT RecGUserSetup."Responsable agence VN") THEN BEGIN
          SETRANGE("Salesperson Code",RecGUserSetup."Salespers./Purch. Code");
        END;
        FILTERGROUP(0);
        //SM
        END;


        SETRANGE("Date Filter",0D,WORKDATE - 1);

        JobQueueActive := SalesSetup.JobQueueActive;
        //SM 270717
        RecGUserSetup.GET(USERID);
        VisibiliteFacturation := RecGUserSetup.Admin_Vente_VN;
        VisibiliteRSHOWROOM := RecGUserSetup."Responsable agence VN";
        //END SM
    end;

    var
        DocPrint : Codeunit "229";
        ReportPrint : Codeunit "228";
        UserMgt : Codeunit "5700";
        Usage : Option "Order Confirmation","Work Order","Pick Instruction";
        [InDataSet]
        JobQueueActive : Boolean;
        OpenApprovalEntriesExist : Boolean;
        VisibiliteFacturation : Boolean;
        RecGUserSetup : Record "91";
        VisibiliteRSHOWROOM : Boolean;
        AIByVIN : Boolean;
        LineColor : Text;

    local procedure SetControlVisibility();
    var
        ApprovalsMgmt : Codeunit "1535";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;

    local procedure CheckToRelease();
    var
        RecLSalesLine : Record "37";
        RecWarehouseEntry : Record "7312";
        Bin : Record "7354";
    begin
        //SM 270717
        IF "Promised Delivery Date" = 0D THEN
          ERROR('Merci de saisie date livraison prévue');
        //END SM

        //SM 280717
        RecLSalesLine.RESET;
        RecLSalesLine.SETRANGE("Document Type",RecLSalesLine."Document Type"::Order);
        RecLSalesLine.SETRANGE("Document No.","No.");
        RecLSalesLine.SETRANGE("Type VN",RecLSalesLine."Type VN"::Vehicule);
        IF RecLSalesLine.FINDSET THEN BEGIN
          REPEAT
            RecLSalesLine.CALCFIELDS(VIN);

            RecWarehouseEntry.RESET;
            RecWarehouseEntry.SETRANGE("Serial No.",RecLSalesLine.VIN);
            RecWarehouseEntry.SETRANGE("Item No.",RecLSalesLine."No.");
            RecWarehouseEntry.SETRANGE("Variant Code",RecLSalesLine."Variant Code");
            RecWarehouseEntry.SETRANGE("Location Code",RecLSalesLine."Location Code");
            IF RecWarehouseEntry.FINDLAST AND (RecLSalesLine.VIN <> '') THEN
             IF Bin.GET(RecLSalesLine."Location Code",RecWarehouseEntry."Bin Code") AND Bin."Not available" THEN
              ERROR('Véhicule Non Dispo., Magasin Avarie');

          UNTIL RecLSalesLine.NEXT = 0;
        END;
        //END SM
    end;

    procedure FctVerifAIHeaderEX() : Boolean;
    var
        LRecSalesHeader : Record "36";
        LRecServiceItem : Record "5940";
        LRecSalesLine : Record "37";
    begin
        //KT 231017


        LRecSalesLine.RESET;
        LRecSalesLine.SETRANGE("Document Type","Document Type");
        LRecSalesLine.SETRANGE("Document No.","No.");
        LRecSalesLine.SETRANGE("Type VN",LRecSalesLine."Type VN"::Vehicule);
        IF LRecSalesLine.FINDSET THEN BEGIN
        REPEAT
          LRecSalesLine.CALCFIELDS(VIN);
          IF LRecSalesLine.VIN<>'' THEN BEGIN
            LRecServiceItem.RESET;
            LRecServiceItem.SETRANGE("Serial No.",LRecSalesLine.VIN);
            IF LRecServiceItem.FINDFIRST AND (NOT LRecServiceItem.AI) THEN
              AIByVIN := FALSE;
           END ELSE
           AIByVIN := FALSE;
        UNTIL  LRecSalesLine.NEXT = 0;

        END ELSE BEGIN
          AIByVIN := FALSE;
        END;
    end;

    procedure FctVerifAIHeader() : Boolean;
    var
        LRecSalesHeader : Record "36";
        LRecServiceItem : Record "5940";
        AIByVIN : Boolean;
        LRecSalesLine : Record "37";
    begin
        //KT 231017
        AIByVIN := TRUE;
        
        LRecSalesLine.RESET;
        LRecSalesLine.SETRANGE("Document Type","Document Type");
        LRecSalesLine.SETRANGE("Document No.","No.");
        LRecSalesLine.SETRANGE("Type VN",LRecSalesLine."Type VN"::Vehicule);
        IF LRecSalesLine.FINDSET THEN BEGIN
        REPEAT
          LRecSalesLine.CALCFIELDS(VIN);
          LRecServiceItem.RESET;
          LRecServiceItem.SETRANGE("Serial No.",LRecSalesLine.VIN);
          IF LRecServiceItem.FINDFIRST AND (NOT LRecServiceItem.AI) THEN
            AIByVIN := FALSE;
        
        UNTIL  LRecSalesLine.NEXT = 0;
        IF AI <> AIByVIN THEN BEGIN
          AI:=AIByVIN;
          MODIFY;
        END;
        END /*SM WHY ya KAIS ELSE BEGIN
        IF AI <> FALSE THEN BEGIN
          AI:=FALSE;
          MODIFY;
        END;
        END;*/

    end;
}

