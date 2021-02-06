page 60023 "Sales Quote PR"
{
    // version SAV Automobile

    CaptionML = ENU='Sales Quote PR',
                FRA='Devis';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table36;
    SourceTableView = SORTING(Document Type,No.)
                      WHERE(Document Type=FILTER(Quote),
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

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                    Enabled = "Sell-to Customer No.Enable";
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        SelltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Sell-to Contact No.";"Sell-to Contact No.")
                {
                    QuickEntry = false;

                    trigger OnValidate();
                    begin
                        SelltoContactNoOnAfterValidate;
                    end;
                }
                field("Sell-to Customer Template Code";"Sell-to Customer Template Code")
                {
                    Enabled = SelltoCustomerTemplateCodeEnab;
                    Importance = Additional;

                    trigger OnValidate();
                    begin
                        SelltoCustomerTemplateCodeOnAf;
                    end;
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                    QuickEntry = false;
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
                    QuickEntry = false;
                }
                field("Sell-to Contact";"Sell-to Contact")
                {
                    Importance = Additional;
                }
                field(VIN;VIN)
                {
                }
                field("No. of Archived Versions";"No. of Archived Versions")
                {
                    Importance = Additional;

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        COMMIT;
                        SalesHeaderArchive.SETRANGE("Document Type","Document Type"::Quote);
                        SalesHeaderArchive.SETRANGE("No.","No.");
                        SalesHeaderArchive.SETRANGE("Doc. No. Occurrence","Doc. No. Occurrence");
                        IF SalesHeaderArchive.GET("Document Type"::Quote,"No.","Doc. No. Occurrence","No. of Archived Versions") THEN ;
                        PAGE.RUNMODAL(PAGE::"Sales List Archive",SalesHeaderArchive);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                field("Order Date";"Order Date")
                {
                    Editable = false;
                    Importance = Promoted;
                    QuickEntry = false;
                }
                field("Document Date";"Document Date")
                {
                    Editable = false;
                    QuickEntry = false;
                }
                field("Requested Delivery Date";"Requested Delivery Date")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                    QuickEntry = false;

                    trigger OnValidate();
                    begin
                        SalespersonCodeOnAfterValidate;
                    end;
                }
                field("Campaign No.";"Campaign No.")
                {
                    QuickEntry = false;
                }
                field("Opportunity No.";"Opportunity No.")
                {
                    QuickEntry = false;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    Importance = Additional;
                }
                field("Assigned User ID";"Assigned User ID")
                {
                    Importance = Additional;
                }
                field(Status;Status)
                {
                    Importance = Promoted;
                    QuickEntry = false;
                }
                field("VAT Registration No.";"VAT Registration No.")
                {
                    CaptionML = ENU='VAT Registration No.',
                                FRA='Matricule Fiscal';
                }
                field("% Remise Facture";"% Remise Facture")
                {
                    Editable = false;
                    Visible = false;

                    trigger OnValidate();
                    begin
                        CurrPage.UPDATE ;
                    end;
                }
                field("Apply Stamp fiscal";"Apply Stamp fiscal")
                {
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                }
                field(Promotion;Promotion)
                {
                    Editable = BoolPromotion;
                }
                field(Amount;Amount)
                {
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("Devis Sur Commande";"Devis Sur Commande")
                {
                }
                field("Montant Sur Commande";"Montant Sur Commande")
                {
                }
                field("Estimated Time For Delivery";"Estimated Time For Delivery")
                {
                }
                field("Motif Vente Ratee";"Motif Vente Ratee")
                {
                }
                field("Quote Valid Until Date";"Quote Valid Until Date")
                {

                    trigger OnValidate();
                    begin
                        RecGUserSetup.GET(USERID);
                        IF NOT RecGUserSetup."Modifier date expiration devis" THEN
                          ERROR('Vous n''avez pas accès');
                    end;
                }
            }
            part(SalesLines;60024)
            {
                SubPageLink = Document No.=FIELD(No.);
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                    Editable = false;
                    Enabled = "Bill-to Customer No.Enable";
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No.";"Bill-to Contact No.")
                {
                }
                field("Bill-to Customer Template Code";"Bill-to Customer Template Code")
                {
                    Enabled = BilltoCustomerTemplateCodeEnab;
                    Importance = Additional;

                    trigger OnValidate();
                    begin
                        BilltoCustomerTemplateCodeOnAf;
                    end;
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
                    Editable = false;

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
                    Importance = Additional;
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
                    Importance = Promoted;
                }
                field("Shipment Method Code";"Shipment Method Code")
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
            part(IncomingDocAttachFactBox;193)
            {
                ShowFilter = false;
                Visible = false;
            }
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
                Visible = true;
            }
            part(;9081)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.);
                Visible = false;
            }
            part(;9082)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.);
                Visible = false;
            }
            part(;9084)
            {
                SubPageLink = No.=FIELD(Sell-to Customer No.);
                Visible = false;
            }
            part(;9087)
            {
                Provider = SalesLines;
                SubPageLink = Document Type=FIELD(Document Type),
                              Document No.=FIELD(Document No.),
                              Line No.=FIELD(Line No.);
                Visible = true;
            }
            part(;9089)
            {
                Provider = SalesLines;
                SubPageLink = No.=FIELD(No.);
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
                    TESTFIELD(Status,Status::Released);
                    DocPrint.PrintSalesHeader(Rec);
                end;
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
                        ReleaseSalesDoc : Codeunit "414";
                    begin
                        ReleaseSalesDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Valider acompte")
                {
                    Visible = false;

                    trigger OnAction();
                    var
                        AmountToCompare : Decimal;
                    begin
                        CALCFIELDS("Montant Sur Commande","Montant Sur Commande HT",Amount,"Amount Including VAT");

                        SalesReceivablesSetup.GET;
                        CASE SalesReceivablesSetup."Base de calcul avance devis" OF
                          SalesReceivablesSetup."Base de calcul avance devis"::"Montant TTC articles sur commande": BEGIN
                          AmountToCompare:="Montant Sur Commande";
                          END;
                          SalesReceivablesSetup."Base de calcul avance devis"::"Montant HT articles sur commande": BEGIN
                          AmountToCompare:="Montant Sur Commande HT";
                          END;
                          SalesReceivablesSetup."Base de calcul avance devis"::"Montant HT Total": BEGIN
                          AmountToCompare:=Amount;
                          END;
                          SalesReceivablesSetup."Base de calcul avance devis"::"Montant TTC Total" :BEGIN
                          AmountToCompare:="Amount Including VAT";
                          END;
                        END;
                        MESSAGE('Montant à comparer %1 /Avance %2 / Rapport %3 /Base de calcul %4 /% requis %5',AmountToCompare,"Avance sur commande","Avance sur commande"/AmountToCompare,
                        SalesReceivablesSetup."Base de calcul avance devis",SalesReceivablesSetup."Quote prepayment %");
                        IF ("Avance sur commande"/AmountToCompare)<(SalesReceivablesSetup."Quote prepayment %"/100) THEN BEGIN
                          IF CONFIRM('Le montant acompte reçu sur ce devis est i férieur à %1%.  Voulez-vous quand même le lancer?') THEN

                            "SP Quote Status":="SP Quote Status"::"Prepayment Received"
                            ELSE EXIT

                          END ELSE
                          "SP Quote Status":="SP Quote Status"::"Prepayment Received";
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
                action("Archive Document")
                {
                    CaptionML = ENU='Archi&ve Document',
                                FRA='Archi&ver document';
                    Image = Archive;

                    trigger OnAction();
                    begin
                        ArchiveManagement.ArchiveSalesDocument(Rec);
                        CurrPage.UPDATE(FALSE);
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
                Image = NewCustomer;
                action("Make Order")
                {
                    CaptionML = ENU='Make &Order',
                                FRA='&Créer commande';
                    Image = MakeOrder;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        PurchaseHeader : Record "38";
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        /*IF "Order Type"="Order Type"::PR THEN BEGIN
                          CALCFIELDS("Devis Sur Commande");
                          IF "Devis Sur Commande" THEN
                            IF "SP Quote Status"<>"SP Quote Status"::"Prepayment Received" THEN
                              ERROR('Création interdite avant réception acompte');
                        END;*/
                        //<< TRIUM RAD 15/04/2014 - Commenter ancien code
                        //IF ApprovalMgt.PrePostApprovalCheck(Rec,PurchaseHeader) THEN
                        //  CODEUNIT.RUN(CODEUNIT::"Sales-Quote to Order (Yes/No)",Rec);
                        // Add new Code
                        IF "Quote Valid Until Date"<>0D THEN
                          IF "Quote Valid Until Date"<TODAY THEN
                            ERROR('Devis expiré');
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
                    PromotedCategory = Process;

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
                    PromotedCategory = Process;

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
        ActivateFields;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
        DecMontantavance := 0;
        /*SM TMP CAUSE ERREUR WHEN NEW DOC
        RecPaymentHeader.RESET;
        RecPaymentHeader.SETRANGE("Applies-to Doc. Type",RecPaymentHeader."Applies-to Doc. Type"::"Commande VN");
        RecPaymentHeader.SETRANGE("Applies-to Doc. No.","No.");
        // RecPaymentHeader.SETRANGE("Enc CHQ Annulé",FALSE);
        // RecPaymentHeader.SETRANGE("Enc Esp Annulé",FALSE);
        IF RecPaymentHeader.FINDSET THEN
          REPEAT
            //MESSAGE('Bordereau  %1',RecPaymentHeader."No.");
            //MESSAGE('Bordereau %1',RecPaymentHeader."No.");
            RecCustLedgerEntry.RESET;
            RecCustLedgerEntry.SETRANGE("Document No.",RecPaymentHeader."No.");
            RecCustLedgerEntry.SETRANGE("Customer No.","Bill-to Customer No.");
            RecCustLedgerEntry.SETRANGE(Open,TRUE);
            IF RecCustLedgerEntry.FINDSET THEN BEGIN
                RecCustLedgerEntry.CALCFIELDS(Amount);
                DecMontantavance := DecMontantavance + ABS(RecCustLedgerEntry.Amount);
            END;
          UNTIL RecPaymentHeader.NEXT = 0;
         "Avance sur commande":= DecMontantavance;
         MODIFY;
        //IF DecMontantavance<>0 THEN
         //MESSAGE('%1',DecMontantavance);
        */

    end;

    trigger OnAfterGetRecord();
    begin
        ActivateFields;
        SetControlAppearance;
        CALCFIELDS("Devis Sur Commande","Montant Sur Commande");

        //SM TMP CAUSE ERREUR WHEN NEW DOC

        RecPaymentHeader.RESET;
        RecPaymentHeader.SETRANGE("Applies-to Doc. Type",RecPaymentHeader."Applies-to Doc. Type"::"Devis PR");
        RecPaymentHeader.SETRANGE("Applies-to Doc. No.","No.");
        //MESSAGE('%1',RecPaymentHeader.COUNT);
        IF RecPaymentHeader.FINDSET THEN
          REPEAT
            RecCustLedgerEntry.RESET;
            RecCustLedgerEntry.SETRANGE("Document No.",RecPaymentHeader."No.");
            RecCustLedgerEntry.SETRANGE("Customer No.","Bill-to Customer No.");
            RecCustLedgerEntry.SETRANGE(Open,TRUE);
            IF RecCustLedgerEntry.FINDSET THEN BEGIN
                RecCustLedgerEntry.CALCFIELDS(Amount);
                DecMontantavance := DecMontantavance + ABS(RecCustLedgerEntry.Amount);
            END;
          UNTIL RecPaymentHeader.NEXT = 0;
         "Avance sur commande":= DecMontantavance;
         MODIFY;
    end;

    trigger OnClosePage();
    var
        SalesReceivablesSetup : Record "311";
    begin
        //ZMN << 27/08/2019
        SalesReceivablesSetup.GET;
        IF SalesReceivablesSetup."Motif Vente Ratee Obligatoire" THEN
           TESTFIELD("Motif Vente Ratee");
        //ZMN >> 27/08/2019
    end;

    trigger OnDeleteRecord() : Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnInit();
    begin
        "Bill-to Customer No.Enable" := TRUE;
        "Sell-to Customer No.Enable" := TRUE;
        SelltoCustomerTemplateCodeEnab := TRUE;
        BilltoCustomerTemplateCodeEnab := TRUE;

        //<< TRIUM RAD 28/10/2014 - Activer /desactiver champ promotion
        IF RecGUserSetup.GET(UPPERCASE(USERID)) THEN
          BoolPromotion := RecGUserSetup."Activer Promotion" ;

        //>> End TRIUM RAd Addin
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        CheckCreditMaxBeforeInsert;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    var
        WarehouseEmployee : Record "7301";
    begin
        "Responsibility Center" := UserMgt.GetSalesFilter;
        "Order Type" := "Order Type"::PR;
        //SM 200917
        IF ("Order Type" = "Order Type"::PR) THEN
          BEGIN
            WarehouseEmployee.SETRANGE("User ID",USERID);
            WarehouseEmployee.SETRANGE(Default,TRUE);
            IF WarehouseEmployee.FINDFIRST THEN
              VALIDATE("Location Code" , WarehouseEmployee."Location Code") ;
          END ;
        //>>END SM
    end;

    trigger OnOpenPage();
    begin
        IF UserMgt.GetSalesFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);
          FILTERGROUP(0);
        END;

        ActivateFields;
    end;

    var
        Text000 : TextConst ENU='Unable to execute this function while in view only mode.',FRA='Impossible d''exécuter cette fonction quand vous êtes en mode visualisation seule.';
        ChangeExchangeRate : Page "511";
        CopySalesDoc : Report "292";
        DocPrint : Codeunit "229";
        UserMgt : Codeunit "5700";
        ArchiveManagement : Codeunit "5063";
        SalesHeaderArchive : Record "5107";
        [InDataSet]
        BilltoCustomerTemplateCodeEnab : Boolean;
        [InDataSet]
        SelltoCustomerTemplateCodeEnab : Boolean;
        [InDataSet]
        "Sell-to Customer No.Enable" : Boolean;
        [InDataSet]
        "Bill-to Customer No.Enable" : Boolean;
        RecGUserSetup : Record "91";
        BoolPromotion : Boolean;
        OpenApprovalEntriesExist : Boolean;
        HasIncomingDocument : Boolean;
        OpenApprovalEntriesExistForCurrUser : Boolean;
        ShowWorkflowStatus : Boolean;
        RecPaymentHeader : Record "10865";
        RecCustLedgerEntry : Record "21";
        DecMontantavance : Decimal;
        SalesReceivablesSetup : Record "311";

    procedure UpdateAllowed() : Boolean;
    begin
        IF CurrPage.EDITABLE = FALSE THEN BEGIN
          MESSAGE(Text000);
          EXIT(FALSE);
        END;
        EXIT(TRUE);
    end;

    procedure ActivateFields();
    begin
        BilltoCustomerTemplateCodeEnab := "Bill-to Customer No." = '';
        SelltoCustomerTemplateCodeEnab := "Sell-to Customer No." = '';
        "Sell-to Customer No.Enable" := "Sell-to Customer Template Code" = '';
        "Bill-to Customer No.Enable" := "Bill-to Customer Template Code" = '';
    end;

    local procedure ApproveCalcInvDisc();
    begin
        CurrPage.SalesLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure SelltoCustomerNoOnAfterValidat();
    begin
        ClearSellToFilter;
        ActivateFields;
        CurrPage.UPDATE;
    end;

    local procedure SalespersonCodeOnAfterValidate();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure SelltoContactNoOnAfterValidate();
    begin
        ClearSellToFilter;
        ActivateFields;
        CurrPage.UPDATE;
    end;

    local procedure SelltoCustomerTemplateCodeOnAf();
    begin
        ActivateFields;
        CurrPage.UPDATE;
    end;

    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        ActivateFields;
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

    local procedure BilltoCustomerTemplateCodeOnAf();
    begin
        ActivateFields;
        CurrPage.UPDATE;
    end;

    procedure ClearSellToFilter();
    begin
        IF GETFILTER("Sell-to Customer No.") = xRec."Sell-to Customer No." THEN
          IF "Sell-to Customer No." <> xRec."Sell-to Customer No." THEN
            SETRANGE("Sell-to Customer No.");
        IF GETFILTER("Sell-to Contact No.") = xRec."Sell-to Contact No." THEN
          IF "Sell-to Contact No." <> xRec."Sell-to Contact No." THEN
            SETRANGE("Sell-to Contact No.");
    end;

    local procedure SetControlAppearance();
    var
        ApprovalsMgmt : Codeunit "1535";
    begin
        HasIncomingDocument := "Incoming Document Entry No." <> 0;

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;
}

