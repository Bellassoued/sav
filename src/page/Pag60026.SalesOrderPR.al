page 60026 "Sales Order PR"
{
    // version SAV Automobile,MAZDA06

    CaptionML = ENU='Sales Order PR',
                FRA='Commande vente';
    DeleteAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table36;
    SourceTableView = SORTING(Document Type,No.)
                      WHERE(Document Type=FILTER(Order),
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
                    Editable = false;
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        SelltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Sell-to Contact No.";"Sell-to Contact No.")
                {
                    Importance = Additional;

                    trigger OnValidate();
                    begin
                        IF GETFILTER("Sell-to Contact No.") = xRec."Sell-to Contact No." THEN
                          IF "Sell-to Contact No." <> xRec."Sell-to Contact No." THEN
                            SETRANGE("Sell-to Contact No.");
                    end;
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                    Editable = true;
                    QuickEntry = false;
                }
                field("Sell-to Address";"Sell-to Address")
                {
                    Editable = false;
                    Importance = Additional;
                }
                field("Sell-to Address 2";"Sell-to Address 2")
                {
                    Editable = false;
                    Importance = Additional;
                }
                field("Sell-to Post Code";"Sell-to Post Code")
                {
                    Editable = false;
                    Importance = Additional;
                }
                field("Sell-to City";"Sell-to City")
                {
                    Editable = false;
                    QuickEntry = false;
                }
                field("Sell-to Contact";"Sell-to Contact")
                {
                    Editable = false;
                    Importance = Additional;
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                    QuickEntry = false;
                    Visible = true;
                }
                field("Order Date";"Order Date")
                {
                    Editable = false;
                    Importance = Promoted;
                    QuickEntry = false;
                    Visible = true;
                }
                field("Document Date";"Document Date")
                {
                    QuickEntry = false;
                }
                field("Quote No.";"Quote No.")
                {
                    Importance = Additional;
                }
                field("External Document No.";"External Document No.")
                {
                    CaptionML = ENU='Bon de Commande Client',
                                FRA='N° doc. externe';
                    Importance = Promoted;
                }
                field("Salesperson Code";"Salesperson Code")
                {
                    Editable = true;
                    QuickEntry = false;

                    trigger OnValidate();
                    begin
                        SalespersonCodeOnAfterValidate;
                    end;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    Editable = false;
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
                field("Specific Order";"Specific Order")
                {
                }
                field("Reason Code";"Reason Code")
                {
                }
                field("Specific Order No.";"Specific Order No.")
                {
                    DrillDown = false;
                    Editable = false;
                    TableRelation = "Purchase Request Header".No.;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        //MMS
                        RecgPurchaseReq.FILTERGROUP(2);
                        RecgPurchaseReq.SETRANGE(RecgPurchaseReq."No.","Specific Order No.");
                        RecgPurchaseReq.FILTERGROUP(0);
                        PAGE.RUNMODAL(PAGE::"Purchase Request",RecgPurchaseReq);
                        //
                    end;
                }
                field("Currency Code";"Currency Code")
                {
                    Editable = false;
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
                field("Location Code";"Location Code")
                {
                    Editable = false;
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    Importance = Promoted;
                }
                field("Compte Banque";"Compte Banque")
                {
                }
                field("Due Date";"Due Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Payment Method Code";"Payment Method Code")
                {
                    Editable = true;
                }
                field("VAT Registration No.";"VAT Registration No.")
                {
                    CaptionML = ENU='VAT Registration No.',
                                FRA='Matricule fiscal';
                    Editable = false;
                }
                field("Apply Stamp fiscal";"Apply Stamp fiscal")
                {
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field(Promotion;Promotion)
                {
                    Editable = BoolPromotion;

                    trigger OnValidate();
                    begin

                        CurrPage.UPDATE ;
                    end;
                }
                field(VIN;VIN)
                {
                }
                field(PRANET;PRANET)
                {
                    Editable = false;
                }
                field("Order Type";"Order Type")
                {
                    Editable = false;
                }
                field("Visa Directeur";"Visa Directeur")
                {
                }
                field("Type avance";"Type avance")
                {
                }
                field("Avance sur commande";"Avance sur commande")
                {
                }
            }
            part(SalesLines;60027)
            {
                Editable = DynamicEditable;
                SubPageLink = Document No.=FIELD(No.);
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                    Editable = true;
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No.";"Bill-to Contact No.")
                {
                    Importance = Additional;
                }
                field("Bill-to Name";"Bill-to Name")
                {
                    Editable = false;
                }
                field("Bill-to Address";"Bill-to Address")
                {
                    Editable = false;
                    Importance = Additional;
                }
                field("Bill-to Address 2";"Bill-to Address 2")
                {
                    Editable = false;
                    Importance = Additional;
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                    Editable = false;
                    Importance = Additional;
                }
                field("Bill-to City";"Bill-to City")
                {
                    Editable = false;
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                    Editable = false;
                    Importance = Additional;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Editable = false;

                    trigger OnValidate();
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Editable = false;

                    trigger OnValidate();
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("No Autorisation administrative";"No Autorisation administrative")
                {
                }
                field("Date Début autorisation Admin.";"Date Début autorisation Admin.")
                {
                }
                field("Date Fin exonération Admin.";"Date Fin exonération Admin.")
                {
                }
                field("No. Bon de commande V. susp";"No. Bon de commande V. susp")
                {
                }
                field("Date Bon Commande V. susp";"Date Bon Commande V. susp")
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
                    Importance = Promoted;
                }
                field("Ship-to City";"Ship-to City")
                {
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                    Importance = Additional;
                }
                field("Shipment Method Code";"Shipment Method Code")
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
                    Editable = false;
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
            }
        }
        area(factboxes)
        {
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
            part(IncomingDocAttachFactBox;193)
            {
                ShowFilter = false;
                Visible = false;
            }
            part(;9108)
            {
                Provider = SalesLines;
                SubPageLink = No.=FIELD(No.);
                Visible = false;
            }
            part(;9109)
            {
                Provider = SalesLines;
                SubPageLink = No.=FIELD(No.);
                Visible = false;
            }
            part(;9081)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.);
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
            group("O&rder")
            {
                CaptionML = ENU='O&rder',
                            FRA='&Commande';
                Image = "Order";
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
                action(ViewArchivQuote)
                {
                    CaptionML = ENU='View archiv quote',
                                FRA='Consulter devis archivé';
                    Image = View;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        SalesHeaderArchive : Record "5107";
                    begin
                        IF "Quote No." <> '' THEN
                          BEGIN
                            SalesHeaderArchive.RESET;
                            SalesHeaderArchive.SETRANGE("Document Type",0);
                            SalesHeaderArchive.SETRANGE("No.","Quote No.");
                            IF SalesHeaderArchive.FINDFIRST THEN
                              PAGE.RUN(5162,SalesHeaderArchive);
                          END
                        ELSE
                          MESSAGE('Archiv devis n''existe pas !');
                    end;
                }
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    RunObject = Page 21;
                    RunPageLink = No.=FIELD(Sell-to Customer No.);
                    ShortCutKey = 'Shift+F7';
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
                action("A&pprovals")
                {
                    CaptionML = ENU='A&pprovals',
                                FRA='&Approbations';
                    Image = Approvals;

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
                action("Assembly Orders")
                {
                    CaptionML = ENU='Assembly Orders',
                                FRA='Ordres d''assemblage';
                    Image = AssemblyOrder;

                    trigger OnAction();
                    var
                        AssembleToOrderLink : Record "904";
                    begin
                        AssembleToOrderLink.ShowAsmOrders(Rec);
                    end;
                }
                action("List Demande Piéce")
                {
                    Image = list;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction();
                    begin
                        FctListDemandePieceVentePR(Rec);
                    end;
                }
                action("Liste Retour Pièces")
                {
                    Image = list;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction();
                    var
                        RecListDemandePiece : Record "70055";
                    begin
                        FctListDemandePieceRetoutPR(Rec);
                    end;
                }
                action("Demande Pièce")
                {
                    Image = Register;
                    Promoted = true;

                    trigger OnAction();
                    var
                        SalesLine : Record "37";
                    begin
                        //SM MAZDA06
                        CLEAR(CDUStockFunction);
                        //END SM
                        //ADD RA004
                        IF "Order Type"="Order Type"::PR THEN
                          BEGIN
                        SalesLine.RESET;
                        SalesLine.SETRANGE("Document No.","No.");
                        SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::Order);
                        SalesLine.SETRANGE(Promotion,TRUE);
                        IF SalesLine.FINDSET THEN BEGIN
                          REPEAT
                          IF NOT ("Posting Date" IN [SalesLine."Date Debut Promotion"..SalesLine."Date Fin Promotion"]) THEN
                            ERROR(' Vous ne pouvez pas commander cette piece %1 en promotion',SalesLine."No.");
                          UNTIL SalesLine.NEXT=0
                          END;
                          END;
                        //END RA004
                        CDUStockFunction.CreateTransOrderFromSalesOrder("No.");
                    end;
                }
                action("Reception Transfert")
                {
                    Image = TransferOrder;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //SM MAZDA06
                        //IF COMPANYNAME <> 'Mazda Détail' THEN BEGIN
                        //  RecTransferHeader.RESET;
                        //  RecTransferHeader.SETRANGE(RecTransferHeader."No Service Order","No.");
                        //  PAGE.RUN(PAGE::"Transfer Order",RecTransferHeader);
                        //SM TEST
                        //END ELSE BEGIN
                        //  RecTransferHeader.RESET;
                        //  RecTransferHeader.CHANGECOMPANY('Economic Auto');
                        //  RecTransferHeader.SETRANGE("No Service Order","No.");
                        //  IF RecTransferHeader.FINDFIRST THEN BEGIN
                        //    url := GETURL(CLIENTTYPE::Current, 'Economic Auto', OBJECTTYPE::Page,5740,RecTransferHeader);
                        //    HYPERLINK(url);
                        //  END;
                        //END;
                        //END SM
                        
                        //SM MAZDA06
                        RecGInventorySetup.GET;
                        IF RecGInventorySetup."Socité stock consolidé" = COMPANYNAME THEN BEGIN
                          RecTransferHeader.RESET;
                          RecTransferHeader.SETRANGE(RecTransferHeader."No Service Order","No.");
                          PAGE.RUN(PAGE::"Transfer Order",RecTransferHeader);
                        END ELSE BEGIN
                          RecTransferHeader.RESET;
                          //RecTransferHeader.CHANGECOMPANY(RecGInventorySetup."Socité stock consolidé");
                          RecTransferHeader.SETRANGE("No Service Order","No.");
                          PAGE.RUN(PAGE::"Transfer Order",RecTransferHeader);
                          IF RecTransferHeader.FINDFIRST THEN BEGIN
                            /*
                             /url := 'DynamicsNAV:////'+RecGInventorySetup."Socité stock consolidé"+'/runpage?page=5740&$filter=''No.'' IS ''' +RecTransferHeader."No."+'''';
                             url1 := GETURL(CURRENTCLIENTTYPE, COMPANYNAME, OBJECTTYPE::Page,5740,RecTransferHeader);//RecGInventorySetup."Socité stock consolidé"
                             MESSAGE('%1     :::: %2  %3',url,url1,RecGInventorySetup."Socité stock consolidé");
                            HYPERLINK(url1);
                            */
                          END;
                        END;
                        //END SM

                    end;
                }
                action("Retour Pièce")
                {
                    Image = Register;
                    Promoted = true;

                    trigger OnAction();
                    begin
                        //SM MAZDA06
                        CLEAR(CDUStockFunction);
                        CDUStockFunction.CreateTransOrderReturnFromSalesOrder("No.");
                        //END SM
                    end;
                }
                action("Expédition Retour Transfert")
                {
                    Image = TransferOrder;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //SM MAZDA06
                        //RecTransferHeader.RESET;
                        //RecTransferHeader.SETRANGE(RecTransferHeader."No Service Order","No.");
                        //RecTransferHeader.SETRANGE(Retour,TRUE);
                        //PAGE.RUN(PAGE::"Transfer Order",RecTransferHeader);
                        //END SM

                        //SM MAZDA06
                        RecGInventorySetup.GET;
                        IF RecGInventorySetup."Socité stock consolidé" = '' THEN BEGIN
                          RecTransferHeader.RESET;
                          RecTransferHeader.SETRANGE(RecTransferHeader."No Service Order","No.");
                          RecTransferHeader.SETRANGE(Retour,TRUE);
                          PAGE.RUN(PAGE::"Transfer Order",RecTransferHeader);
                        END ELSE BEGIN
                          RecTransferHeader.RESET;
                          RecTransferHeader.CHANGECOMPANY(RecGInventorySetup."Socité stock consolidé");
                          RecTransferHeader.SETRANGE("No Service Order","No.");
                          RecTransferHeader.SETRANGE(Retour,TRUE);

                          IF RecTransferHeader.FINDFIRST THEN BEGIN
                            url := GETURL(CLIENTTYPE::Current, RecGInventorySetup."Socité stock consolidé", OBJECTTYPE::Page,5740,RecTransferHeader);
                            HYPERLINK(url);
                          END;
                        END;
                        //END SM
                    end;
                }
                action("Liste expéditions transfert")
                {
                    Image = Shipment;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction();
                    var
                        TransferShipmentHeader : Record "5744";
                        TransferShipmentReceipt : Record "50043" temporary;
                    begin
                        RecCompany.RESET;
                        IF RecCompany.FINDSET THEN
                          REPEAT
                            //RecGTransferHeader.RESET;
                            TransferShipmentHeader.CHANGECOMPANY(RecCompany.Name);
                            TransferShipmentHeader.RESET;
                            TransferShipmentHeader.SETRANGE("Source No","No.");
                            TransferShipmentHeader.SETRANGE(Retour,FALSE);
                            IF TransferShipmentHeader.FINDSET THEN
                              REPEAT
                                TransferShipmentReceipt.INIT;
                                TransferShipmentReceipt."No." := TransferShipmentHeader."No.";
                                TransferShipmentReceipt."Transfer-from Code" := TransferShipmentHeader."Transfer-from Code";
                                TransferShipmentReceipt."Transfer-to Code" := TransferShipmentHeader."Transfer-to Code";
                                TransferShipmentReceipt."Posting Date" := TransferShipmentHeader."Posting Date";
                                TransferShipmentReceipt."Shipment Date" := TransferShipmentHeader."Shipment Date";
                                TransferShipmentReceipt."Receipt Date" := TransferShipmentHeader."Receipt Date";
                                //TransferShipmentReceipt.Status := RecGTransferHeader.Status;
                                TransferShipmentReceipt."Company Name" := RecCompany.Name;
                                TransferShipmentReceipt."Source Type" := TransferShipmentHeader."Source Type";
                                TransferShipmentReceipt."Source No" := TransferShipmentHeader."Source No";
                                TransferShipmentReceipt."Operation type":=TransferShipmentReceipt."Operation type"::Transfert;
                                TransferShipmentReceipt.INSERT;
                              UNTIL TransferShipmentHeader.NEXT= 0;
                          UNTIL RecCompany.NEXT = 0;
                        PAGE.RUN(PAGE::"Receptions/expeditions",TransferShipmentReceipt);
                    end;
                }
                action("Liste réceptions transfert")
                {
                    Image = Receipt;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction();
                    var
                        TransferReceiptHeader : Record "5746";
                        TransferShipmentReceipt : Record "50043" temporary;
                    begin
                        RecCompany.RESET;
                        IF RecCompany.FINDSET THEN
                          REPEAT
                            TransferReceiptHeader.CHANGECOMPANY(RecCompany.Name);
                            TransferReceiptHeader.RESET;
                            TransferReceiptHeader.SETRANGE("Source No","No.");
                            TransferReceiptHeader.SETRANGE(Retour,FALSE);
                            IF TransferReceiptHeader.FINDSET THEN
                              REPEAT
                                TransferShipmentReceipt.INIT;
                                TransferShipmentReceipt."No." := TransferReceiptHeader."No.";
                                TransferShipmentReceipt."Transfer-from Code" := TransferReceiptHeader."Transfer-from Code";
                                TransferShipmentReceipt."Transfer-to Code" := TransferReceiptHeader."Transfer-to Code";
                                TransferShipmentReceipt."Posting Date" := TransferReceiptHeader."Posting Date";
                                TransferShipmentReceipt."Shipment Date" := TransferReceiptHeader."Shipment Date";
                                TransferShipmentReceipt."Receipt Date" := TransferReceiptHeader."Receipt Date";
                                TransferShipmentReceipt."Company Name" := RecCompany.Name;
                                TransferShipmentReceipt."Source Type" := TransferReceiptHeader."Source Type";
                                TransferShipmentReceipt."Source No" := TransferReceiptHeader."Source No";
                                TransferShipmentReceipt."Operation type":=TransferShipmentReceipt."Operation type"::Reception;
                                TransferShipmentReceipt.INSERT;
                              UNTIL TransferReceiptHeader.NEXT= 0;
                          UNTIL RecCompany.NEXT = 0;
                        PAGE.RUN(PAGE::"Receptions/expeditions",TransferShipmentReceipt);
                    end;
                }
                action("Liste expéditions retour")
                {
                    Image = Shipment;
                    Promoted = true;
                    PromotedCategory = New;

                    trigger OnAction();
                    var
                        TransferShipmentHeader : Record "5744";
                        TransferShipmentReceipt : Record "50043";
                    begin
                        RecCompany.RESET;
                        IF RecCompany.FINDSET THEN
                          REPEAT
                            TransferShipmentHeader.CHANGECOMPANY(RecCompany.Name);
                            TransferShipmentHeader.SETRANGE("Source No","No.");
                            TransferShipmentHeader.SETRANGE(Retour,TRUE);
                            IF TransferShipmentHeader.FINDSET THEN
                              REPEAT
                                TransferShipmentReceipt.INIT;
                                TransferShipmentReceipt."No." := TransferShipmentHeader."No.";
                                TransferShipmentReceipt."Transfer-from Code" := TransferShipmentHeader."Transfer-from Code";
                                TransferShipmentReceipt."Transfer-to Code" := TransferShipmentHeader."Transfer-to Code";
                                TransferShipmentReceipt."Posting Date" := TransferShipmentHeader."Posting Date";
                                TransferShipmentReceipt."Shipment Date" := TransferShipmentHeader."Shipment Date";
                                TransferShipmentReceipt."Receipt Date" := TransferShipmentHeader."Receipt Date";
                                //TransferShipmentReceipt.Status := RecGTransferHeader.Status;
                                TransferShipmentReceipt."Company Name" := RecCompany.Name;
                                TransferShipmentReceipt."Source Type" := TransferShipmentHeader."Source Type";
                                TransferShipmentReceipt."Source No" := TransferShipmentHeader."Source No";
                                TransferShipmentReceipt."Operation type":=TransferShipmentReceipt."Operation type"::Transfert;
                                TransferShipmentReceipt.INSERT;
                              UNTIL TransferShipmentHeader.NEXT= 0;
                          UNTIL RecCompany.NEXT = 0;
                        PAGE.RUN(PAGE::"Receptions/expeditions",TransferShipmentReceipt);
                    end;
                }
                action("Liste réceptions retour")
                {
                    Image = Receipt;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        TransferReceiptHeader : Record "5746";
                        TransferShipmentReceipt : Record "50043";
                    begin
                        RecCompany.RESET;
                        IF RecCompany.FINDSET THEN
                          REPEAT
                            TransferReceiptHeader.CHANGECOMPANY(RecCompany.Name);
                            TransferReceiptHeader.SETRANGE("Source No","No.");
                            TransferReceiptHeader.SETRANGE(Retour,TRUE);
                            IF TransferReceiptHeader.FINDSET THEN
                              REPEAT
                                TransferShipmentReceipt.INIT;
                                TransferShipmentReceipt."No." := TransferReceiptHeader."No.";
                                TransferShipmentReceipt."Transfer-from Code" := TransferReceiptHeader."Transfer-from Code";
                                TransferShipmentReceipt."Transfer-to Code" := TransferReceiptHeader."Transfer-to Code";
                                TransferShipmentReceipt."Posting Date" := TransferReceiptHeader."Posting Date";
                                TransferShipmentReceipt."Shipment Date" := TransferReceiptHeader."Shipment Date";
                                TransferShipmentReceipt."Receipt Date" := TransferReceiptHeader."Receipt Date";
                                //TransferShipmentReceipt.Status := RecGTransferHeader.Status;
                                TransferShipmentReceipt."Company Name" := RecCompany.Name;
                                TransferShipmentReceipt."Source Type" := TransferReceiptHeader."Source Type";
                                TransferShipmentReceipt."Source No" := TransferReceiptHeader."Source No";
                                TransferShipmentReceipt."Operation type":=TransferShipmentReceipt."Operation type"::Reception;
                                TransferShipmentReceipt.INSERT;
                              UNTIL TransferReceiptHeader.NEXT= 0;
                          UNTIL RecCompany.NEXT = 0;
                        PAGE.RUN(PAGE::"Receptions/expeditions",TransferShipmentReceipt);
                    end;
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
                                FRA='Li&vraisons';
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
                    RunPageLink = Source Document=CONST(Sales Order),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Document,Source No.,Location Code);
                }
                action("Whse. Shipment Lines")
                {
                    CaptionML = ENU='Whse. Shipment Lines',
                                FRA='Lignes expédition entrep.';
                    Image = ShipmentLines;
                    RunObject = Page 7341;
                    RunPageLink = Source Type=CONST(37),
                                  Source Subtype=FIELD(Document Type),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.);
                }
            }
            group(Prepayment)
            {
                CaptionML = ENU='Prepayment',
                            FRA='Acompte';
                Image = Prepayment;
                action("Prepa&yment Invoices")
                {
                    CaptionML = ENU='Prepa&yment Invoices',
                                FRA='Factures acom&pte';
                    Image = PrepaymentInvoice;
                    RunObject = Page 143;
                    RunPageLink = Prepayment Order No.=FIELD(No.);
                    RunPageView = SORTING(Prepayment Order No.);
                }
                action("Prepayment Credi&t Memos")
                {
                    CaptionML = ENU='Prepayment Credi&t Memos',
                                FRA='A&voirs acompte';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page 144;
                    RunPageLink = Prepayment Order No.=FIELD(No.);
                    RunPageView = SORTING(Prepayment Order No.);
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
                        ReleaseSalesDoc : Codeunit "414";
                        PrepaymentMgt : Codeunit "441";
                    begin
                        IF PrepaymentMgt.TestSalesPrepayment(Rec) THEN
                          ERROR(STRSUBSTNO(Text10800,"Document Type","No."));

                        IF PrepaymentMgt.TestSalesPayment(Rec) THEN BEGIN
                          IF NOT CONFIRM(STRSUBSTNO(Text10801,"Document Type","No.")) THEN
                            EXIT;
                          Status := Status::"Pending Prepayment";
                          MODIFY;
                          CurrPage.UPDATE;
                        END ELSE
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

                    trigger OnAction();
                    var
                        ReleaseSalesDoc : Codeunit "414";
                    begin
                        ReleaseSalesDoc.PerformManualReopen(Rec);
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
                action(CommandeAchat)
                {
                    Caption = 'Commande Spécifique';
                    Image = Purchasing;
                    Promoted = true;

                    trigger OnAction();
                    begin
                        CreatePurchaseRequest(Rec,3);
                    end;
                }
                action("Proposer Article")
                {

                    trigger OnAction();
                    begin
                        //<< MMS 09102013
                        CLEAR(RecGPagePropArticle);
                        //Type Document Commande Vente
                        RecGTypeDoc:=2;
                        MESSAGE(Rec."No.");
                        RecGPagePropArticle.SetPurchaseRequest(Rec."No.",RecGTypeDoc);
                        RecGPagePropArticle.RUNMODAL();
                        //>>
                    end;
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
                action("Move Negative Lines")
                {
                    CaptionML = ENU='Move Negative Lines',
                                FRA='Déplacer lignes négatives';
                    Ellipsis = true;
                    Image = MoveNegativeLines;

                    trigger OnAction();
                    begin
                        CLEAR(MoveNegSalesLines);
                        MoveNegSalesLines.SetSalesHeader(Rec);
                        MoveNegSalesLines.RUNMODAL;
                        MoveNegSalesLines.ShowDocument;
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
                action("Créer Commande Intersociété")
                {
                    Image = Calculate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin

                        RecGSalesOrder.SETRANGE(RecGSalesOrder."Document Type",RecGSalesOrder."Document Type"::Order) ;
                        RecGSalesOrder.SETRANGE(RecGSalesOrder."No.","No.");
                        REPORT.RUNMODAL(REPORT::"Facture Vente IC",TRUE,FALSE,RecGSalesOrder);
                    end;
                }
                action("Send IC Sales Order Cnfmn.")
                {
                    AccessByPermission = TableData 410=R;
                    CaptionML = ENU='Send IC Sales Order Cnfmn.',
                                FRA='Confirmation envoi commande vente IC';
                    Image = IntercompanyOrder;

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
            group(Plan)
            {
                CaptionML = ENU='Plan',
                            FRA='Planifier';
                Image = Planning;
                action("Order &Promising")
                {
                    CaptionML = ENU='Order &Promising',
                                FRA='Pro&messe de livraison';
                    Image = OrderPromising;

                    trigger OnAction();
                    var
                        OrderPromisingLine : Record "99000880" temporary;
                    begin
                        OrderPromisingLine.SETRANGE("Source Type","Document Type");
                        OrderPromisingLine.SETRANGE("Source ID","No.");
                        PAGE.RUNMODAL(PAGE::"Order Promising Lines",OrderPromisingLine);
                    end;
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
                        DemandOverview.Initialize(0D,1,"No.",'','');
                        DemandOverview.RUNMODAL;
                    end;
                }
                action("Pla&nning")
                {
                    CaptionML = ENU='Pla&nning',
                                FRA='Pla&nification';
                    Image = Planning;

                    trigger OnAction();
                    var
                        SalesPlanForm : Page "99000883";
                    begin
                        SalesPlanForm.SetSalesOrder("No.");
                        SalesPlanForm.RUNMODAL;
                    end;
                }
            }
            group("Request Approval")
            {
                CaptionML = ENU='Request Approval',
                            FRA='Approbation demande achat';
                Image = SendApprovalRequest;
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
                group(Authorize)
                {
                    CaptionML = ENU='Authorize',
                                FRA='Autoriser';
                    Image = AuthorizeCreditCard;
                    action(Authorize)
                    {
                        CaptionML = ENU='Authorize',
                                    FRA='Autoriser';
                        Image = AuthorizeCreditCard;

                        trigger OnAction();
                        begin
                            //KT MIG 90 TO 110 Fonction n'existe pas STD Authorize;
                        end;
                    }
                    action("Void A&uthorize")
                    {
                        CaptionML = ENU='Void A&uthorize',
                                    FRA='Annuler l''a&utorisation';
                        Image = VoidCreditCard;

                        trigger OnAction();
                        begin
                            //KT MIG 90 TO 110 Fonction n'existe pas STD Void;
                        end;
                    }
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
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
                action("Create &Whse. Shipment")
                {
                    CaptionML = ENU='Create &Whse. Shipment',
                                FRA='Créer &expédition entrepôt';
                    Image = NewShipment;

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
                        RecCustomer : Record "18";
                        RecGenBusinessPostingGroup : Record "250";
                    begin
                        TESTFIELD("Sell-to Customer No.");
                        RecCustomer.GET("Sell-to Customer No.");
                        RecGenBusinessPostingGroup.GET(RecCustomer."Gen. Bus. Posting Group");
                        IF RecGenBusinessPostingGroup."Client Passager" THEN
                          PostInvoice(CODEUNIT::"Sales-Post (Yes/No)")
                        ELSE
                            Post(CODEUNIT::"Sales-Post (Yes/No)");
                        CurrPage.CLOSE;
                    end;
                }
                action(PostShip)
                {
                    CaptionML = ENU='P&ost',
                                FRA='&BL';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //SM MAZDA06
                        PostShip(CODEUNIT::"Sales-Post (Yes/No)");

                        //END SM
                    end;
                }
                action(PostInvoice)
                {
                    CaptionML = ENU='P&ost',
                                FRA='&Facturer';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //SM MAZDA06
                        PostInvoice(CODEUNIT::"Sales-Post (Yes/No)");
                        //END SM
                    end;
                }
                action("Mtre à jour TVA")
                {
                    Image = VATPostingSetup;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        RecSalesLineTVA : Record "37";
                        ReleaseSalesDocument : Codeunit "414";
                        RecVATProductPostingGroup : Record "324";
                        RecSalesShipmentLine : Record "111";
                    begin
                        //IF ("Sales Line"."Qty. Shipped Not Invoiced" = 0) AND ("Sales Line"."Quantity Invoiced" <> 0)THEN
                        //  CurrReport.SKIP ;
                        RecGUserSetup.GET(USERID);
                        IF (NOT RecGUserSetup."Admin Finance NAV")   THEN
                              ERROR('Vous n''avez pas le droit metre à jour les lignes du commande ,Merci de contacter votre administrateur Système!!');
                        RecSalesLineTVA.RESET;
                        RecSalesLineTVA.SETRANGE("Document Type","Document Type");
                        RecSalesLineTVA.SETRANGE("Document No.","No.");
                        IF RecSalesLineTVA.FINDSET THEN
                          REPEAT
                            RecSalesHeader.GET("Document Type","No.");
                            ReleaseSalesDocument.Reopen(RecSalesHeader);
                            IF RecVATProductPostingGroup.GET(RecSalesLineTVA."VAT Prod. Posting Group") AND (RecVATProductPostingGroup.Nature = RecVATProductPostingGroup.Nature::Ancien) THEN
                             BEGIN
                               RecSalesLineTVA.VALIDATE("VAT Prod. Posting Group" ,RecVATProductPostingGroup."Coresp. TVA");
                               RecSalesLineTVA.MODIFY;
                               RecSalesShipmentLine.RESET;
                               RecSalesShipmentLine.SETRANGE("Order No.",RecSalesHeader."No.");
                               RecSalesShipmentLine.SETRANGE("Order Line No.",RecSalesLineTVA."Line No.");
                               RecSalesShipmentLine.SETFILTER("Qty. Shipped Not Invoiced",'<>0');
                               IF RecSalesShipmentLine.FINDSET THEN
                                 REPEAT
                                   RecSalesShipmentLine.VALIDATE("VAT Prod. Posting Group",RecVATProductPostingGroup."Coresp. TVA");
                                   RecSalesShipmentLine.MODIFY;
                                 UNTIL RecSalesShipmentLine.NEXT = 0;
                             END;
                         UNTIL RecSalesLineTVA.NEXT = 0;
                    end;
                }
                action("Mtre à jour TVA Ancen")
                {
                    Image = VATPostingSetup;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        RecSalesLineTVA : Record "37";
                        ReleaseSalesDocument : Codeunit "414";
                        RecVATProductPostingGroup : Record "324";
                        RecSalesShipmentLine : Record "111";
                    begin
                        //IF ("Sales Line"."Qty. Shipped Not Invoiced" = 0) AND ("Sales Line"."Quantity Invoiced" <> 0)THEN
                        //  CurrReport.SKIP ;
                        RecGUserSetup.GET(USERID);
                         IF (NOT RecGUserSetup."Admin Finance NAV") THEN
                          ERROR('Vous n''avez pas le droit metre à jour les lignes du commande ,Merci de contacter votre administrateur Système!!');
                        RecSalesLineTVA.RESET;
                        RecSalesLineTVA.SETRANGE("Document Type","Document Type");
                        RecSalesLineTVA.SETRANGE("Document No.","No.");
                        IF RecSalesLineTVA.FINDSET THEN
                          REPEAT
                            RecSalesHeader.GET("Document Type","No.");
                            ReleaseSalesDocument.Reopen(RecSalesHeader);
                            IF RecVATProductPostingGroup.GET(RecSalesLineTVA."VAT Prod. Posting Group") AND (RecVATProductPostingGroup.Nature = RecVATProductPostingGroup.Nature::Nouveau) THEN
                             BEGIN
                               RecSalesLineTVA.VALIDATE("VAT Prod. Posting Group" ,RecVATProductPostingGroup."Coresp. TVA");
                               RecSalesLineTVA.MODIFY;
                               RecSalesShipmentLine.RESET;
                               RecSalesShipmentLine.SETRANGE("Order No.",RecSalesHeader."No.");
                               RecSalesShipmentLine.SETRANGE("Order Line No.",RecSalesLineTVA."Line No.");
                               RecSalesShipmentLine.SETFILTER("Qty. Shipped Not Invoiced",'<>0');
                               IF RecSalesShipmentLine.FINDSET THEN
                                 REPEAT
                                   RecSalesShipmentLine.VALIDATE("VAT Prod. Posting Group",RecVATProductPostingGroup."Coresp. TVA");
                                   RecSalesShipmentLine.MODIFY;
                                 UNTIL RecSalesShipmentLine.NEXT = 0;
                             END;
                         UNTIL RecSalesLineTVA.NEXT = 0;
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
                    begin
                        Post(CODEUNIT::"Sales-Post + Print");
                        CurrPage.CLOSE;
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
                    Enabled = false;
                    Image = RemoveLine;
                    Visible = JobQueueVisible;

                    trigger OnAction();
                    begin
                        CancelBackgroundPosting;
                    end;
                }
                action("MAJ Qté à Expédier")
                {
                    Image = AddWatch;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        SalesLineMAJQteAExp : Record "37";
                    begin
                        //SM 240619
                        ERROR('Non Encore Opérationnel');
                        SalesLineMAJQteAExp.RESET;
                        SalesLineMAJQteAExp.SETRANGE("Document No.","No.");
                        SalesLineMAJQteAExp.SETRANGE("Document Type","Document Type");
                        SalesLineMAJQteAExp.SETRANGE(Type,SalesLineMAJQteAExp.Type::Item);
                        IF SalesLineMAJQteAExp.FINDSET THEN BEGIN
                          REPEAT
                            SalesLineMAJQteAExp.CALCFIELDS("Qty TransferOrder To Receive","Qty TransferOrder To Ship");
                            IF (SalesLineMAJQteAExp."Qty TransferOrder To Receive" <> 0) OR (SalesLineMAJQteAExp."Qty TransferOrder To Ship" <> 0) THEN BEGIN
                              ERROR('Il y a des transferts non reçus ou retours non expédiés !!!');
                            END;
                          UNTIL SalesLineMAJQteAExp.NEXT = 0;
                        END;
                        IF SalesLineMAJQteAExp.FINDSET THEN BEGIN
                          REPEAT
                            SalesLineMAJQteAExp.CALCFIELDS("Qty Received","Qty Shipped Returned");
                            SalesLineMAJQteAExp.VALIDATE("Qty. to Ship",(SalesLineMAJQteAExp."Qty Received"-SalesLineMAJQteAExp."Qty Shipped Returned")-(SalesLineMAJQteAExp."Quantity Shipped"));
                            SalesLineMAJQteAExp.MODIFY;
                            SalesLineMAJQteAExp.CalcOrderedQty;
                          UNTIL SalesLineMAJQteAExp.NEXT = 0;
                        END;

                          //CALCFIELDS("Qty TransferOrder To Receive","Qty Received","Qty Received Transfert Order",
                          //          "Qty Shipped Returned","Qty TransferOrder To Ship","Qty Shipped Transfert Order");

                          //"Ordered Qty" := ("Qty Received" ) - ("Qty Shipped Returned" );
                          //"Remaining Qty to Order" := ("Quantity Shipped"+ "Qty. to Ship") -"Ordered Qty";

                        //END SM
                    end;
                }
                group("Prepa&yment")
                {
                    CaptionML = ENU='Prepa&yment',
                                FRA='Acom&pte';
                    Image = Prepayment;
                    action("Prepayment &Test Report")
                    {
                        CaptionML = ENU='Prepayment &Test Report',
                                    FRA='Impression &test acompte';
                        Ellipsis = true;
                        Image = PrepaymentSimulation;

                        trigger OnAction();
                        begin
                            ReportPrint.PrintSalesHeaderPrepmt(Rec);
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
                            SalesPostYNPrepmt : Codeunit "443";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                              SalesPostYNPrepmt.PostPrepmtInvoiceYN(Rec,FALSE);
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
                            PurchaseHeader : Record "38";
                            SalesPostYNPrepmt : Codeunit "443";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                              SalesPostYNPrepmt.PostPrepmtInvoiceYN(Rec,TRUE);
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
                            PurchaseHeader : Record "38";
                            SalesPostYNPrepmt : Codeunit "443";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                              SalesPostYNPrepmt.PostPrepmtCrMemoYN(Rec,FALSE);
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
                            PurchaseHeader : Record "38";
                            SalesPostYNPrepmt : Codeunit "443";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckSales(Rec) THEN
                              SalesPostYNPrepmt.PostPrepmtCrMemoYN(Rec,TRUE);
                        end;
                    }
                }
            }
            group("&Print")
            {
                CaptionML = ENU='&Print',
                            FRA='Im&primer';
                Image = Print;
                action("Test Report")
                {
                    CaptionML = ENU='Test Report',
                                FRA='Impression test';
                    Ellipsis = true;
                    Image = TestReport;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        DynamicEditable := CurrPage.EDITABLE;
        //CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    end;

    trigger OnAfterGetRecord();
    begin
        SetControlVisibility;

        IF "Bill-to Customer No."  <> '' THEN
        BEGIN
        DecMontantavance := 0;
        RecPaymentHeader.RESET;
        RecPaymentHeader.SETRANGE("Applies-to Doc. Type",RecPaymentHeader."Applies-to Doc. Type"::"Commande PR");
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
        END;

        IF "Avance sur commande"= 0 THEN BEGIN
          IF "Bill-to Customer No."  <> '' THEN
            BEGIN
            DecMontantavance := 0;
            RecPaymentHeader.RESET;
            RecPaymentHeader.SETRANGE("Applies-to Doc. Type",RecPaymentHeader."Applies-to Doc. Type"::"Devis PR");
            RecPaymentHeader.SETRANGE("Applies-to Doc. No.","Quote No.");
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
          END;
        END;
    end;

    trigger OnDeleteRecord() : Boolean;
    begin
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnInit();
    begin

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
        RecGUserSetup.GET(USERID);
        IF NOT RecGUserSetup."Service Compta." THEN
         BEGIN
            IF UserMgt.GetSalesFilter <> '' THEN
            BEGIN
              FILTERGROUP(2);
              SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);
              FILTERGROUP(0);
            END;
         END;
        SETRANGE("Date Filter",0D,WORKDATE - 1);
    end;

    var
        Text000 : TextConst ENU='Unable to execute this function while in view only mode.',FRA='Impossible d''exécuter cette fonction quand vous êtes en mode visualisation seule.';
        CopySalesDoc : Report "292";
        MoveNegSalesLines : Report "6699";
        ReportPrint : Codeunit "228";
        DocPrint : Codeunit "229";
        ArchiveManagement : Codeunit "5063";
        ChangeExchangeRate : Page "511";
        UserMgt : Codeunit "5700";
        Usage : Option "Order Confirmation","Work Order","Pick Instruction";
        [InDataSet]
        JobQueueVisible : Boolean;
        Text10800 : TextConst ENU='There are unposted prepayment amounts on the document of type %1 with the number %2.',FRA='Il existe des montants acompte non validés sur le document de type %1 portant le numéro %2.';
        Text10801 : TextConst ENU='There are unpaid prepayment invoices related to the document of type %1 with the number %2.',FRA='Il existe des factures d''acompte impayées liées au document de type %1 portant le numéro %2.';
        Text001 : TextConst ENU='Do you want to change %1 in all related records in the warehouse?',FRA='Souhaitez-vous modifier %1 dans tous les enregistrements associés de l''entrepôt ?';
        Text002 : TextConst ENU='The update has been interrupted to respect the warning.',FRA='La mise à jour a été interrompue pour respecter l''alerte.';
        RecGUserSetup : Record "91";
        RecGPurchaseSetup : Record "312";
        CodLDefaultSeriesCode : Code[20];
        CuGNoSeriesMgt : Codeunit "396";
        LstNumber : Code[10];
        CstText003 : Label 'La commande doit étre lancé pour la transformer en demande achat.';
        CstText004 : Label '"La Commande Vente Num %1 a été transférer en demande achat sous le Num %2 "';
        CstText005 : Label 'Il existe une demande achat lancé sous le numéro %1 pour la commande vente %2';
        CstText006 : Label 'Il faut indiqué si cette commande est spécifique!';
        RecgPurchaseReq : Record "50005";
        RecGPagePropArticle : Page "60010";
        RecGTypeDoc : Integer;
        DynamicEditable : Boolean;
        CDUStockFunction : Codeunit "50000";
        RecTransferHeader : Record "5740";
        url : Text[500];
        RecGSalesOrder : Record "36";
        RecGInventorySetup : Record "313";
        BoolPromotion : Boolean;
        HasIncomingDocument : Boolean;
        OpenApprovalEntriesExistForCurrUser : Boolean;
        OpenApprovalEntriesExist : Boolean;
        ExternalDocNoMandatory : Boolean;
        ApprovalsMgmt : Codeunit "1535";
        ShowWorkflowStatus : Boolean;
        url1 : Text[500];
        RecGTransferHeader : Record "5740";
        RecCompany : Record "2000000006";
        RecTransferLine : Record "5741";
        RecLinedemandePiece : Record "60086";
        RecSalesHeader : Record "36";
        DecMontantavance : Decimal;
        RecPaymentHeader : Record "10865";
        RecCustLedgerEntry : Record "21";

    local procedure Post(PostingCodeunitID : Integer);
    begin
        SendToPosting(PostingCodeunitID);
        IF "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting" THEN
          CurrPage.CLOSE;
        CurrPage.UPDATE(FALSE);
    end;

    procedure UpdateAllowed() : Boolean;
    begin
        IF CurrPage.EDITABLE = FALSE THEN
          ERROR(Text000);
        EXIT(TRUE);
    end;

    local procedure ApproveCalcInvDisc();
    begin
        CurrPage.SalesLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure SelltoCustomerNoOnAfterValidat();
    begin
        IF GETFILTER("Sell-to Customer No.") = xRec."Sell-to Customer No." THEN
          IF "Sell-to Customer No." <> xRec."Sell-to Customer No." THEN
            SETRANGE("Sell-to Customer No.");
        CurrPage.UPDATE;
    end;

    local procedure SalespersonCodeOnAfterValidate();
    begin
        CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure BilltoCustomerNoOnAfterValidat();
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

    procedure CreatePurchaseRequest(RecSalesOrder : Record "36";TypeDoc : Integer);
    var
        RecLPurchReqHdr : Record "50005";
        RecLPurchReqLine : Record "50008";
        RecLorderLine : Record "37";
        IntLineNo : Integer;
        RecLPurchReqHdrTmp : Record "50005";
    begin

        //Le statut de la commande vente doit étre lancé
        IF RecSalesOrder.Status=0 THEN
           ERROR(CstText003);

        //Verifier si la commande est déstiner pour une demande achat
        IF NOT RecSalesOrder."Specific Order" THEN
           ERROR(CstText006);

        //Verifier si cette commande vente posséde une DA
        IF RecSalesOrder."Specific Order No." <>'' THEN
           ERROR(CstText005,RecSalesOrder."Specific Order No.",RecSalesOrder."No.");


        // Créer l'entête DA
        //RecGUserSetup.GET(USERID);
        RecLPurchReqHdr.INIT ;
        //RecGPurchaseSetup.GET;
        IF RecLPurchReqHdr.INSERT(TRUE) THEN
          BEGIN
            RecLPurchReqHdr."Request User ID":=USERID;
            RecLPurchReqHdr."Request Date":=TODAY;
            RecLPurchReqHdr."Source No.":=RecSalesOrder."No.";
            RecLPurchReqHdr."Source Type":=RecLPurchReqHdr."Source Type"::Sales ;
            RecLPurchReqHdr."Customer No." := RecSalesOrder."Sell-to Customer No.";
            IF  RecLPurchReqHdr.MODIFY THEN;
        END;

        RecSalesOrder."Specific Order No." :=RecLPurchReqHdr."No.";
        IF  RecSalesOrder.MODIFY THEN;


        // Créer les lignes DA
        RecLorderLine.RESET;
        RecLorderLine.SETRANGE(RecLorderLine."Document Type",RecLorderLine."Document Type"::Order);
        RecLorderLine.SETRANGE(RecLorderLine."Document No.","No.");
        IF RecLorderLine.COUNT <> 0 THEN
          IF RecLorderLine.FINDSET THEN
            BEGIN
              REPEAT
                // Affectation des Champs DA
                RecLPurchReqLine.INIT;
                RecLPurchReqLine."Request No." := RecLPurchReqHdr."No." ;
                RecLPurchReqLine."Line No.":=RecLorderLine."Line No.";
               // Type ligne
                CASE  RecLorderLine.Type OF
                       RecLorderLine.Type::Item:RecLPurchReqLine.Type :=RecLPurchReqLine.Type::Item;
                       RecLorderLine.Type::"Charge (Item)" :RecLPurchReqLine.Type :=RecLPurchReqLine.Type::"Charge (Item)";
                       RecLorderLine.Type::"Fixed Asset" :RecLPurchReqLine.Type :=RecLPurchReqLine.Type::"Existing Fixed Asset";
                       ELSE   RecLPurchReqLine.Type :=RecLPurchReqLine.Type::" ";
                END;

                RecLPurchReqLine."Item No." := RecLorderLine."No.";
                RecLPurchReqLine."Variant code" :=RecLorderLine."Variant Code";
                RecLPurchReqLine."Location Code" :=RecLorderLine."Location Code";
                RecLPurchReqLine.Description := RecLorderLine.Description;
                RecLPurchReqLine."Unit of Measure Code" :=RecLorderLine."Unit of Measure Code";
                RecLPurchReqLine.Quantity :=RecLorderLine.Quantity;
                RecLPurchReqLine."Currency Code" :=RecLorderLine."Currency Code";
                RecLPurchReqLine."Unit Cost" :=RecLorderLine."Unit Cost";
                RecLPurchReqLine."Purchaseperson Code" :=RecLorderLine."Purchase Order No.";
                RecLPurchReqLine.Montant :=RecLorderLine.Amount;
                RecLPurchReqLine."Code Client" := RecLorderLine."Bill-to Customer No.";
                RecLPurchReqLine."% Remise" :=RecLorderLine."Line Discount %" ;
                IF RecLPurchReqLine.INSERT THEN;
            UNTIL RecLorderLine.NEXT = 0 ;
        END;

        MESSAGE(CstText004,RecSalesOrder."No.",RecLPurchReqHdr."No.");
    end;

    local procedure PostShip(PostingCodeunitID : Integer);
    begin
        SendToPostingToShip(PostingCodeunitID);
        IF "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting" THEN
          CurrPage.CLOSE;
        CurrPage.UPDATE(FALSE);
    end;

    local procedure PostInvoice(PostingCodeunitID : Integer);
    begin
        SendToPostingToInvoice(PostingCodeunitID);
        IF "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting" THEN
          CurrPage.CLOSE;
        CurrPage.UPDATE(FALSE);
    end;

    local procedure SetControlVisibility();
    var
        ApprovalsMgmt : Codeunit "1535";
    begin
        JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        HasIncomingDocument := "Incoming Document Entry No." <> 0;
        SetExtDocNoMandatoryCondition;

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
    end;

    local procedure SetExtDocNoMandatoryCondition();
    var
        SalesReceivablesSetup : Record "311";
    begin
        SalesReceivablesSetup.GET;
        ExternalDocNoMandatory := SalesReceivablesSetup."Ext. Doc. No. Mandatory"
    end;

    procedure FctListDemandePieceVentePR(PRecSalesHeader : Record "36");
    var
        RecListDemandePiece : Record "70055" temporary;
    begin
        RecCompany.RESET;
        IF RecCompany.FINDSET THEN
          REPEAT
            RecGTransferHeader.CHANGECOMPANY(RecCompany.Name);
            RecGTransferHeader.RESET;
            RecGTransferHeader.SETRANGE("No Service Order",PRecSalesHeader."No.");
            RecGTransferHeader.SETRANGE(Retour,FALSE);
            IF RecGTransferHeader.FINDSET THEN
              REPEAT
                RecListDemandePiece.INIT;
                RecListDemandePiece."No." := RecGTransferHeader."No.";
                RecListDemandePiece."Transfer-from Code" := RecGTransferHeader."Transfer-from Code";
                RecListDemandePiece."Transfer-to Code" := RecGTransferHeader."Transfer-to Code";
                RecListDemandePiece."Posting Date" := RecGTransferHeader."Posting Date";
                RecListDemandePiece."Shipment Date" := RecGTransferHeader."Shipment Date";
                RecListDemandePiece."Receipt Date" := RecGTransferHeader."Receipt Date";
                RecListDemandePiece.Status := RecGTransferHeader.Status;
                RecListDemandePiece."Company Name" := RecCompany.Name;
                RecListDemandePiece."Source Type" := RecGTransferHeader."Source Type";
                RecListDemandePiece."Source No." := RecGTransferHeader."Source No";
                RecListDemandePiece.INSERT;
                RecTransferLine.CHANGECOMPANY(RecCompany.Name);
                RecTransferLine.SETRANGE("Document No.",RecGTransferHeader."No.");
                IF RecTransferLine.FINDSET THEN
                  REPEAT
                     RecLinedemandePiece.INIT;
                     RecLinedemandePiece.TRANSFERFIELDS(RecTransferLine);
                     RecLinedemandePiece.INSERT;
                  UNTIL RecTransferLine.NEXT = 0;
              UNTIL RecGTransferHeader.NEXT= 0;
          UNTIL RecCompany.NEXT = 0;
        PAGE.RUN(PAGE::"List Demande Piece",RecListDemandePiece);
    end;

    procedure FctListDemandePieceRetoutPR(PRecSalesHeader : Record "36");
    var
        RecListDemandePiece : Record "70055" temporary;
    begin
        RecCompany.RESET;
        IF RecCompany.FINDSET THEN
          REPEAT
            RecGTransferHeader.CHANGECOMPANY(RecCompany.Name);
            //RecGTransferHeader.RESET;
            RecGTransferHeader.SETRANGE("No Service Order",PRecSalesHeader."No.");
            RecGTransferHeader.SETRANGE(Retour,TRUE);
            IF RecGTransferHeader.FINDSET THEN
              REPEAT
                RecListDemandePiece.INIT;
                RecListDemandePiece."No." := RecGTransferHeader."No.";
                RecListDemandePiece."Transfer-from Code" := RecGTransferHeader."Transfer-from Code";
                RecListDemandePiece."Transfer-to Code" := RecGTransferHeader."Transfer-to Code";
                RecListDemandePiece."Posting Date" := RecGTransferHeader."Posting Date";
                RecListDemandePiece."Shipment Date" := RecGTransferHeader."Shipment Date";
                RecListDemandePiece."Receipt Date" := RecGTransferHeader."Receipt Date";
                RecListDemandePiece.Status := RecGTransferHeader.Status;
                RecListDemandePiece."Company Name" := RecCompany.Name;
                RecListDemandePiece."Source Type" := RecGTransferHeader."Source Type";
                RecListDemandePiece."Source No." := RecGTransferHeader."Source No";
                RecListDemandePiece.INSERT;
                RecTransferLine.CHANGECOMPANY(RecCompany.Name);
                RecTransferLine.SETRANGE("Document No.",RecGTransferHeader."No.");
                IF RecTransferLine.FINDSET THEN
                  REPEAT
                     RecLinedemandePiece.INIT;
                     RecLinedemandePiece.TRANSFERFIELDS(RecTransferLine);
                     RecLinedemandePiece.INSERT;
                  UNTIL RecTransferLine.NEXT = 0;
              UNTIL RecGTransferHeader.NEXT= 0;
          UNTIL RecCompany.NEXT = 0;
        PAGE.RUN(PAGE::"List Demande Piece",RecListDemandePiece);
    end;
}

