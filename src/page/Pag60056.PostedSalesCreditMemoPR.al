page 60056 "Posted Sales Credit Memo PR"
{
    // version SAV Automobile

    CaptionML = ENU='Posted Sales Credit Memo PR',
                FRA='Avoir vente enregistré PR';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table114;
    SourceTableView = SORTING(No.)
                      WHERE(Order Type=CONST(PR));

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
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Sell-to Contact No.";"Sell-to Contact No.")
                {
                    Editable = false;
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                    Editable = false;
                }
                field("Sell-to Address";"Sell-to Address")
                {
                    Editable = false;
                }
                field("Sell-to Address 2";"Sell-to Address 2")
                {
                    Editable = false;
                }
                field("Sell-to Post Code";"Sell-to Post Code")
                {
                    Editable = false;
                }
                field("Sell-to City";"Sell-to City")
                {
                    Editable = false;
                }
                field("Sell-to Contact";"Sell-to Contact")
                {
                    Editable = false;
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Document Date";"Document Date")
                {
                    Editable = false;
                }
                field("Pre-Assigned No.";"Pre-Assigned No.")
                {
                    Editable = false;
                }
                field("External Document No.";"External Document No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Salesperson Code";"Salesperson Code")
                {
                    Editable = false;
                }
                field("Type Avoir";"Type Avoir")
                {
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    Editable = false;
                }
                field("No. Printed";"No. Printed")
                {
                    Editable = false;
                }
                field("Apply Stamp fiscal";"Apply Stamp fiscal")
                {
                }
            }
            part(SalesCrMemoLines;60057)
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
                    Importance = Promoted;
                }
                field("Bill-to Contact No.";"Bill-to Contact No.")
                {
                    Editable = false;
                }
                field("Bill-to Name";"Bill-to Name")
                {
                    Editable = false;
                }
                field("Bill-to Address";"Bill-to Address")
                {
                    Editable = false;
                }
                field("Bill-to Address 2";"Bill-to Address 2")
                {
                    Editable = false;
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                    Editable = false;
                }
                field("Bill-to City";"Bill-to City")
                {
                    Editable = false;
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Editable = false;
                }
                field("Applies-to Doc. Type";"Applies-to Doc. Type")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Applies-to Doc. No.";"Applies-to Doc. No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Commande Origine";OrigineOrder)
                {
                }
                field("Payment Method Code";"Payment Method Code")
                {
                    Editable = false;
                }
            }
            group(Shipping)
            {
                CaptionML = ENU='Shipping',
                            FRA='Livraison';
                field("Ship-to Code";"Ship-to Code")
                {
                    Editable = false;
                }
                field("Ship-to Name";"Ship-to Name")
                {
                    Editable = false;
                }
                field("Ship-to Address";"Ship-to Address")
                {
                    Editable = false;
                }
                field("Ship-to Address 2";"Ship-to Address 2")
                {
                    Editable = false;
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                    Editable = false;
                }
                field("Ship-to City";"Ship-to City")
                {
                    Editable = false;
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                    Editable = false;
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
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
                        ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date");
                        ChangeExchangeRate.EDITABLE(FALSE);
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                          "Currency Factor" := ChangeExchangeRate.GetParameter;
                          MODIFY;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;
                }
                field("EU 3-Party Trade";"EU 3-Party Trade")
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
            group("&Cr. Memo")
            {
                CaptionML = ENU='&Cr. Memo',
                            FRA='Avoi&r';
                Image = CreditMemo;
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 398;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 67;
                    RunPageLink = Document Type=CONST(Posted Credit Memo),
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
                        ShowDimensions;
                    end;
                }
                action(Approvals)
                {
                    CaptionML = ENU='Approvals',
                                FRA='Approbations';
                    Image = Approvals;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        ApprovalsMgmt.ShowPostedApprovalEntries(RECORDID);
                    end;
                }
                action("Retour Pièce Gros")
                {
                    CaptionML = ENU='Retour Pièces',
                                FRA='Retour Pièces';
                    Image = Register;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = BLnRetourGROS;

                    trigger OnAction();
                    var
                        InventorySetup : Record "313";
                    begin
                        //<< TRIUM RAD 17/04/2014 - retour pièce
                        InventorySetup.GET;
                        IF COMPANYNAME <> InventorySetup."Socité stock consolidé" THEN
                          ERROR('Cette fonctionnalité retour pièce n est disponible que pour la société GROS!');
                        CLEAR(CDUStockFunction);
                        CDUStockFunction.CreateTransOrderReturnFromSalesCrMemo("No.");
                        //>> End TRIUM RAD Addin
                    end;
                }
                action("Liste Retour Pièces")
                {
                    Image = Return;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = BLnRetourDetail;

                    trigger OnAction();
                    var
                        LcduItemavailability : Codeunit "70000";
                    begin
                        LcduItemavailability.FctGetListRetourCrMemo("No.");
                    end;
                }
                action("Liste expéditions retour")
                {
                    Image = ReturnShipment;

                    trigger OnAction();
                    var
                        RecLTransferShipmentHeader : Record "5744" temporary;
                    begin
                        RecCompany.RESET;
                        IF RecCompany.FINDSET THEN
                          REPEAT
                            //GRecServiceHeader.GET("Document Type","Document No.");
                            RecLTransferShipmentHeader.RESET;
                            RecLTransferShipmentHeader.CHANGECOMPANY(RecCompany.Name);
                            RecLTransferShipmentHeader.SETRANGE("Source No","No.");
                            //RecLTransferShipmentHeader.SETRANGE(Retour,TRUE);
                            IF RecLTransferShipmentHeader.FINDSET THEN
                              REPEAT
                                RecGTransferShipmentReceipt.INIT;
                                RecGTransferShipmentReceipt."No." := RecLTransferShipmentHeader."No.";
                                RecGTransferShipmentReceipt."Transfer-from Code" := RecLTransferShipmentHeader."Transfer-from Code";
                                RecGTransferShipmentReceipt."Transfer-to Code" := RecLTransferShipmentHeader."Transfer-to Code";
                                RecGTransferShipmentReceipt."Posting Date" := RecLTransferShipmentHeader."Posting Date";
                                RecGTransferShipmentReceipt."Shipment Date" := RecLTransferShipmentHeader."Shipment Date";
                                RecGTransferShipmentReceipt."Receipt Date" := RecLTransferShipmentHeader."Receipt Date";
                                //TransferShipmentReceipt.Status := RecGTransferHeader.Status;
                                RecGTransferShipmentReceipt."Company Name" := RecCompany.Name;
                                RecGTransferShipmentReceipt."Source Type" := RecLTransferShipmentHeader."Source Type";
                                RecGTransferShipmentReceipt."Source No" := RecLTransferShipmentHeader."Source No";
                                RecGTransferShipmentReceipt.Retour := TRUE;
                                RecGTransferShipmentReceipt."Operation type":=RecGTransferShipmentReceipt."Operation type"::Transfert;
                                RecGTransferShipmentReceipt.INSERT;
                              UNTIL RecLTransferShipmentHeader.NEXT= 0;
                          UNTIL RecCompany.NEXT = 0;
                        PAGE.RUN(PAGE::"Receptions/expeditions",RecGTransferShipmentReceipt);
                    end;
                }
                action("Liste réceptions retour")
                {
                    Image = ReturnReceipt;

                    trigger OnAction();
                    var
                        RecLTransferReceiptHeader : Record "5746" temporary;
                    begin
                        RecCompany.RESET;
                        IF RecCompany.FINDSET THEN
                          REPEAT
                            RecLTransferReceiptHeader.CHANGECOMPANY(RecCompany.Name);
                            RecLTransferReceiptHeader.SETRANGE("Source No","No.");
                            RecLTransferReceiptHeader.SETRANGE(Retour,TRUE);
                            IF RecLTransferReceiptHeader.FINDSET THEN
                              REPEAT
                                RecGTransferShipmentReceipt.INIT;
                                RecGTransferShipmentReceipt."No." := RecLTransferReceiptHeader."No.";
                                RecGTransferShipmentReceipt."Transfer-from Code" := RecLTransferReceiptHeader."Transfer-from Code";
                                RecGTransferShipmentReceipt."Transfer-to Code" := RecLTransferReceiptHeader."Transfer-to Code";
                                RecGTransferShipmentReceipt."Posting Date" := RecLTransferReceiptHeader."Posting Date";
                                RecGTransferShipmentReceipt."Shipment Date" := RecLTransferReceiptHeader."Shipment Date";
                                RecGTransferShipmentReceipt."Receipt Date" := RecLTransferReceiptHeader."Receipt Date";
                                //TransferShipmentReceipt.Status := RecGTransferHeader.Status;
                                RecGTransferShipmentReceipt."Company Name" := RecCompany.Name;
                                RecGTransferShipmentReceipt."Source Type" := RecLTransferReceiptHeader."Source Type";
                                RecGTransferShipmentReceipt."Source No" := RecLTransferReceiptHeader."Source No";
                                RecGTransferShipmentReceipt.Retour := TRUE;
                                RecGTransferShipmentReceipt."Operation type":=RecGTransferShipmentReceipt."Operation type"::Reception;
                                RecGTransferShipmentReceipt.INSERT;
                              UNTIL RecLTransferReceiptHeader.NEXT= 0;
                          UNTIL RecCompany.NEXT = 0;
                        PAGE.RUN(PAGE::"Receptions/expeditions",RecGTransferShipmentReceipt);
                    end;
                }
                action("Retourner Pièces")
                {
                    Image = Return;
                    Promoted = true;
                    PromotedIsBig = true;
                    Visible = BLnRetourDetail;

                    trigger OnAction();
                    var
                        SalesInvoiceHeader : Record "112";
                        FromOrderNo : Text;
                        LocationCode : Code[20];
                        SalesCrMemoLine : Record "115";
                        RetourDetailPRSAV : Codeunit "70013";
                    begin
                        //SM 061017
                        /*
                        IF  OrigineOrder <> '' THEN BEGIN
                          FromOrderNo := OrigineOrder;
                          END ELSE BEGIN
                              IF "Applies-to Doc. No." <> '' THEN BEGIN
                                IF "Applies-to Doc. Type" = "Applies-to Doc. Type"::Invoice THEN BEGIN
                                  SalesInvoiceHeader.GET("Applies-to Doc. No.");
                                  IF SalesInvoiceHeader."Order No." <> '' THEN
                                    FromOrderNo := SalesInvoiceHeader."Order No."
                                END;
                                IF FromOrderNo  = '' THEN
                                  FromOrderNo := OrigineOrder;
                                END;
                        END;
                        */
                        IF "Applies-to Doc. No." <> '' THEN BEGIN
                          IF "Applies-to Doc. Type" = "Applies-to Doc. Type"::Invoice THEN BEGIN
                            SalesInvoiceHeader.GET("Applies-to Doc. No.");
                            IF SalesInvoiceHeader."Order No." <> '' THEN
                              FromOrderNo := SalesInvoiceHeader."Order No."
                          END;
                          IF FromOrderNo  = '' THEN
                            FromOrderNo := OrigineOrder;
                        END ELSE BEGIN//FILTER
                          IF FromOrderNo  = '' THEN
                            FromOrderNo := OrigineOrder;
                        END;
                        
                          //MESSAGE('%1',FromOrderNo);
                          IF FromOrderNo  = '' THEN
                            ERROR('commande non trouvé');
                        IF "Location Code" <> '' THEN
                          LocationCode := "Location Code"
                        ELSE BEGIN
                          SalesCrMemoLine.RESET;
                          SalesCrMemoLine.SETRANGE("Document No.",Rec."No.");
                          SalesCrMemoLine.SETRANGE(Type,SalesCrMemoLine.Type::Item);
                          IF SalesCrMemoLine.FINDFIRST THEN
                            LocationCode := SalesCrMemoLine."Location Code";
                        END;
                        
                        RetourDetailPRSAV.GetCommandePick('',FromOrderNo,0,"No.",LocationCode,"Order Type");//SalesInvoiceHeader."Pre-Assigned No.","Location Code"
                        FctListDemandePieceRetoutFromCreditMemoPR(Rec);
                        //END SM

                    end;
                }
                separator()
                {
                }
            }
        }
        area(processing)
        {
            action(SendCustom)
            {
                CaptionML = ENU='Send',
                            FRA='Envoyer';
                Ellipsis = true;
                Image = SendToMultiple;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    SalesCrMemoHeader : Record "114";
                begin
                    SalesCrMemoHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesCrMemoHeader);
                    SalesCrMemoHeader.SendRecords;
                end;
            }
            action(Print)
            {
                CaptionML = ENU='&Print',
                            FRA='&Imprimer';
                Ellipsis = true;
                Image = Print;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                Visible = true;

                trigger OnAction();
                begin
                    SalesCrMemoHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesCrMemoHeader);
                    SalesCrMemoHeader.PrintRecords(TRUE);
                end;
            }
            action("&Email")
            {
                CaptionML = ENU='&Email',
                            FRA='&E-mail';
                Image = Email;

                trigger OnAction();
                begin
                    SalesCrMemoHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesCrMemoHeader);
                    SalesCrMemoHeader.EmailRecords(TRUE);
                end;
            }
            action("&Navigate")
            {
                CaptionML = ENU='&Navigate',
                            FRA='Na&viguer';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    Navigate;
                end;
            }
            action(ActivityLog)
            {
                CaptionML = ENU='Activity Log',
                            FRA='Journal des activités';
                Image = Log;

                trigger OnAction();
                begin
                    ShowActivityLog;
                end;
            }
            group(IncomingDocument)
            {
                CaptionML = ENU='Incoming Document',
                            FRA='Document entrant';
                Image = Documents;
                action(IncomingDocCard)
                {
                    CaptionML = ENU='View Incoming Document',
                                FRA='Afficher le document entrant';
                    Enabled = HasIncomingDocument;
                    Image = ViewOrder;
                    ToolTipML = ;

                    trigger OnAction();
                    var
                        IncomingDocument : Record "130";
                    begin
                        IncomingDocument.ShowCard("No.","Posting Date");
                    end;
                }
                action(SelectIncomingDoc)
                {
                    AccessByPermission = TableData 130=R;
                    CaptionML = ENU='Select Incoming Document',
                                FRA='Sélectionner le document entrant';
                    Enabled = NOT HasIncomingDocument;
                    Image = SelectLineToApply;
                    ToolTipML = ;

                    trigger OnAction();
                    var
                        IncomingDocument : Record "130";
                    begin
                        IncomingDocument.SelectIncomingDocumentForPostedDocument("No.","Posting Date",RECORDID);
                    end;
                }
                action(IncomingDocAttachFile)
                {
                    CaptionML = ENU='Create Incoming Document from File',
                                FRA='Créer un document entrant à partir d''un fichier';
                    Ellipsis = true;
                    Enabled = NOT HasIncomingDocument;
                    Image = Attach;
                    ToolTipML = ;

                    trigger OnAction();
                    var
                        IncomingDocumentAttachment : Record "133";
                    begin
                        IncomingDocumentAttachment.NewAttachmentFromPostedDocument("No.","Posting Date");
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        IncomingDocument : Record "130";
    begin
        HasIncomingDocument := IncomingDocument.PostedDocExists("No.","Posting Date");
        DocExchStatusStyle := GetDocExchStatusStyle;
        //CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

    trigger OnInit();
    begin
        BLnRetourGros := FALSE;
        BLnRetourDetail:= FALSE;
    end;

    trigger OnOpenPage();
    begin
        SetSecurityFilterOnRespCenter;
        RecInventorySetup.GET;
        IF RecInventorySetup."Socité stock consolidé" = COMPANYNAME THEN BEGIN
          BLnRetourGros := TRUE;
          BLnRetourDetail := FALSE;

        END ELSE BEGIN
          BLnRetourDetail := TRUE;
          BLnRetourGros := FALSE;
          END;
    end;

    var
        SalesCrMemoHeader : Record "114";
        ChangeExchangeRate : Page "511";
        CDUStockFunction : Codeunit "50000";
        HasIncomingDocument : Boolean;
        DocExchStatusStyle : Text;
        RecCompany : Record "2000000006";
        RecGTransferShipmentReceipt : Record "50043" temporary;
        OrigineOrder : Code[20];
        BLnRetourGros : Boolean;
        RecInventorySetup : Record "313";
        BLnRetourDetail : Boolean;

    procedure FctListDemandePieceRetoutFromCreditMemoPR(PRecSalesCreditMemoHeader : Record "114");
    var
        RecListDemandePiece : Record "70055" temporary;
        TransferHeaderReturn : Record "60073";
        TransferLineReturn : Record "60074";
        RecCompany : Record "2000000006";
        RecLinedemandePiece : Record "60086";
    begin
        RecCompany.RESET;
        IF RecCompany.FINDSET THEN
          REPEAT
            TransferHeaderReturn.CHANGECOMPANY(RecCompany.Name);
            TransferHeaderReturn.SETRANGE("No Service Order",PRecSalesCreditMemoHeader."No.");
            TransferHeaderReturn.SETRANGE(Retour,TRUE);
            IF TransferHeaderReturn.FINDSET THEN
              REPEAT
                RecListDemandePiece.INIT;
                RecListDemandePiece."No." := TransferHeaderReturn."No.";
                RecListDemandePiece."Transfer-from Code" := TransferHeaderReturn."Transfer-from Code";
                RecListDemandePiece."Transfer-to Code" := TransferHeaderReturn."Transfer-to Code";
                RecListDemandePiece."Posting Date" := TransferHeaderReturn."Posting Date";
                RecListDemandePiece."Shipment Date" := TransferHeaderReturn."Shipment Date";
                RecListDemandePiece."Receipt Date" := TransferHeaderReturn."Receipt Date";
                RecListDemandePiece.Status := TransferHeaderReturn.Status;
                RecListDemandePiece."Company Name" := RecCompany.Name;
                RecListDemandePiece."Source Type" := TransferHeaderReturn."Source Type";
                RecListDemandePiece."Source No." := TransferHeaderReturn."Source No";
                RecListDemandePiece.INSERT;
                TransferLineReturn.CHANGECOMPANY(RecCompany.Name);
                TransferLineReturn.SETRANGE("Document No.",TransferHeaderReturn."No.");
                IF TransferLineReturn.FINDSET THEN
                  REPEAT
                     RecLinedemandePiece.INIT;
                     RecLinedemandePiece.TRANSFERFIELDS(TransferLineReturn);
                     RecLinedemandePiece.INSERT;
                  UNTIL TransferLineReturn.NEXT = 0;
              UNTIL TransferHeaderReturn.NEXT= 0;
          UNTIL RecCompany.NEXT = 0;
        PAGE.RUN(PAGE::"List  Retour Piece Avoir",RecListDemandePiece);
    end;
}

