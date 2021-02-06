page 60081 "Sales Quote VN"
{
    // version SAV Automobile

    CaptionML = ENU='Sales Quote PR',
                FRA='Devis';
    DeleteAllowed = false;
    ModifyAllowed = true;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table36;
    SourceTableView = WHERE(Document Type=FILTER(Quote));

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
                    CaptionML = ENU='Sell-to Customer No.',
                                FRA='Code Client';
                    Enabled = "Sell-to Customer No.Enable";
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        SelltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Sell-to Contact No.";"Sell-to Contact No.")
                {
                    CaptionML = ENU='Sell-to Contact No.',
                                FRA='Code Contact';
                    QuickEntry = false;

                    trigger OnValidate();
                    begin
                        SelltoContactNoOnAfterValidate;
                    end;
                }
                field("Code Titre Client";"Code Titre Client")
                {
                }
                field("Code Titre Contact";"Code Titre Contact")
                {
                }
                field("Sell-to Customer Template Code";"Sell-to Customer Template Code")
                {
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
                    CaptionML = ENU='Sell-to Address',
                                FRA='Adresse Client';
                    Importance = Additional;
                }
                field("Sell-to Address 2";"Sell-to Address 2")
                {
                    CaptionML = ENU='Sell-to Address 2',
                                FRA='Adresse 2 Client';
                    Importance = Additional;
                    QuickEntry = false;
                }
                field("Sell-to Post Code";"Sell-to Post Code")
                {
                    CaptionML = ENU='Sell-to Post Code',
                                FRA='Code postal Client';
                    Importance = Additional;
                }
                field("Sell-to City";"Sell-to City")
                {
                    CaptionML = ENU='Sell-to City',
                                FRA='Ville Client';
                    QuickEntry = false;
                }
                field("Sell-to Contact";"Sell-to Contact")
                {
                    Importance = Additional;
                }
                field("No. of Archived Versions";"No. of Archived Versions")
                {
                    Importance = Additional;
                    QuickEntry = false;

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
                    Importance = Additional;
                    QuickEntry = false;
                    Visible = false;
                }
                field("Salesperson Code";"Salesperson Code")
                {
                    Editable = ChangeVendor;
                    Importance = Additional;
                    QuickEntry = false;

                    trigger OnValidate();
                    begin
                        SalespersonCodeOnAfterValidate;
                    end;
                }
                field("Campaign No.";"Campaign No.")
                {
                    Importance = Additional;
                    QuickEntry = false;
                }
                field("Opportunity No.";"Opportunity No.")
                {
                    Importance = Additional;
                    QuickEntry = false;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    CaptionML = ENU='Responsibility Center',
                                FRA='Centre de Gestion';
                    Editable = AdminVte;
                    Importance = Additional;
                    QuickEntry = false;
                }
                field("Assigned User ID";"Assigned User ID")
                {
                    Editable = false;
                    Importance = Additional;
                    QuickEntry = false;
                }
                field(Status;Status)
                {
                    Importance = Promoted;
                    QuickEntry = false;
                }
                field("Avance sur commande";"Avance sur commande")
                {
                    Visible = false;
                }
                field("Apply Stamp fiscal";"Apply Stamp fiscal")
                {
                }
                field("Validité Offre";"Validité Offre")
                {
                    Visible = false;
                }
                field("Délai de Livraison";"Délai de Livraison")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Modalité paiement";"Modalité paiement")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Durée Garantie";"Durée Garantie")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Exonoration TME";"Exonoration TME")
                {
                }
                field(Phone;Phone)
                {
                    Caption = 'Téléphone';
                }
                field("E-mail";"E-mail")
                {
                }
                field("Mobile Phone No.";"Mobile Phone No.")
                {
                }
            }
            part(SalesLines;60082)
            {
                SubPageLink = Document No.=FIELD(No.);
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
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
                field("Customer Price Group";"Customer Price Group")
                {
                    Editable = false;
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
                    //<<ZMN 08/11/2018
                    TESTFIELD(Status,Status::Released);
                    //>>ZMN 08/11/2018
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
                        RecSalesLine : Record "37";
                    begin
                        /*
                        CLEAR(RecSalesLine);
                        RecSalesLine.SETFILTER("Document Type",'%1',RecSalesLine."Document Type"::Quote);
                        RecSalesLine.SETFILTER("Document No.",'%1',"No.");
                        RecSalesLine.SETFILTER("Type VN",'%1',RecSalesLine."Type VN"::Vehicule);
                        IF RecSalesLine.FINDSET  THEN
                          REPEAT
                            RecSalesLine.CalcImmatriculationLvi(RecSalesLine);
                          UNTIL RecSalesLine.NEXT = 0;
                          */
                        ArchiveManagement.ArchSalesDocumentNoConfirm(Rec);
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
                        RecSalesLine : Record "37";
                        RecSalesSetup : Record "311";
                    begin
                        ReleaseSalesDoc.PerformManualReopen(Rec);
                        /*
                        CLEAR(RecSalesLine);
                        RecSalesSetup.GET;
                        RecSalesLine.SETRANGE("Document Type",RecSalesLine."Document Type"::Quote);
                        RecSalesLine.SETRANGE("Document No.","No.");
                        //RecSalesLine.SETFILTER("Type VN",'%1',RecSalesLine."Type VN"::Vehicule);
                        RecSalesLine.SETRANGE(Type,RecSalesLine.Type::"Charge (Item)");
                        RecSalesLine.SETRANGE("No.",RecSalesSetup."Frais Immatriculation");
                        IF RecSalesLine.FINDFIRST  THEN
                            RecSalesLine.DELETE;
                        */

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
                    Visible = false;

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
                    Visible = false;

                    trigger OnAction();
                    begin
                        CopySalesDoc.SetSalesHeader(Rec);
                        CopySalesDoc.RUNMODAL;
                        CLEAR(CopySalesDoc);
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
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        //<<CT16V001 ZM 15/05/2016 - Commenter ancien code
                        //IF ApprovalMgt.PrePostApprovalCheck(Rec,PurchaseHeader) THEN
                        //  CODEUNIT.RUN(CODEUNIT::"Sales-Quote to Order (Yes/No)",Rec);
                        // Add new Code
                        IF RecGUserSetup.GET(USERID) THEN
                          IF RecGUserSetup."User Activity" =  RecGUserSetup."User Activity"::PR THEN
                              CODEUNIT.RUN(CODEUNIT::"Sales-Quote to Order (Yes/No)",Rec)
                            ELSE
                        IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                          CODEUNIT.RUN(CODEUNIT::"Sales-Quote to Order (Yes/No)",Rec);
                        //>>CT16V001 ZM 15/05/2016
                    end;
                }
                action("Create &To-do")
                {
                    CaptionML = ENU='Create &To-do',
                                FRA='Créer ac&tion';
                    Image = NewToDo;

                    trigger OnAction();
                    begin
                        //KT MIG 90 TO 110 fonction n'existe pas STD CreateTodo;CreateTodo;
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
                Image = Approval;
                Visible = false;
                action(SendApprovalRequest)
                {
                    CaptionML = ENU='Send A&pproval Request',
                                FRA='Envoyer demande d''a&pprobation';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
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
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        ApprovalsMgmt.OnCancelSalesApprovalRequest(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        ActivateFields;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    end;

    trigger OnAfterGetRecord();
    begin
        ActivateFields;
        SetControlAppearance;
        //CALCFIELDS("Code Titre Client","Code Titre Contact");
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
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        CheckCreditMaxBeforeInsert;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Responsibility Center" := UserMgt.GetSalesFilter;
        "Order Type" := "Order Type"::VN;
        "Apply Stamp fiscal" := TRUE;
    end;

    trigger OnOpenPage();
    begin
        IF UserMgt.GetSalesFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);
          FILTERGROUP(0);
        END;

        ActivateFields;
        //RH 250717
        AdminVte := FALSE;
        RecGUserSetup.GET(USERID);
        IF  RecGUserSetup.Admin_Vente_VN THEN
              AdminVte := TRUE;
        //SM 260119
        ChangeVendor := FALSE;
        IF AdminVte OR RecGUserSetup."Changer Vendeur Devis"THEN
          ChangeVendor := TRUE;
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
        HasIncomingDocument : Boolean;
        DocNoVisible : Boolean;
        OpenApprovalEntriesExistForCurrUser : Boolean;
        OpenApprovalEntriesExist : Boolean;
        ShowWorkflowStatus : Boolean;
        RecGUserSetup : Record "91";
        AdminVte : Boolean;
        ChangeVendor : Boolean;

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

    local procedure SetDocNoVisible();
    var
        DocumentNoVisibility : Codeunit "1400";
        DocType : Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.SalesDocumentNoIsVisible(DocType::Quote,"No.");
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

