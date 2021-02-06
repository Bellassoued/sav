page 60105 "Posted Sales Invoice VN"
{
    // version SAV Automobile

    CaptionML = ENU='Posted Sales Invoice PR',
                FRA='Facture vente enregistrée';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table112;

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
                field("Quote No.";"Quote No.")
                {
                }
                field("Order No.";"Order No.")
                {
                    Editable = false;
                    Importance = Promoted;
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
                field("Responsibility Center";"Responsibility Center")
                {
                    Editable = true;
                }
                field("No. Printed";"No. Printed")
                {
                    Editable = false;
                }
                field("Apply Stamp fiscal";"Apply Stamp fiscal")
                {
                    Editable = false;
                }
                field("Type Paiement";"Type Paiement")
                {
                }
                field("Engagement Lettre Amount";"Engagement Lettre Amount")
                {
                }
                field("Compte Banque";"Compte Banque")
                {
                }
            }
            part(SalesInvLines;60106)
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
                field("Payment Terms Code";"Payment Terms Code")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Due Date";"Due Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Payment Discount %";"Payment Discount %")
                {
                    Editable = false;
                }
                field("Pmt. Discount Date";"Pmt. Discount Date")
                {
                    Editable = false;
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
                    Importance = Promoted;
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
                    Importance = Promoted;
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
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                    Editable = false;
                }
                field("Shipment Date";"Shipment Date")
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
            group("&Invoice")
            {
                CaptionML = ENU='&Invoice',
                            FRA='Fa&cture';
                Image = Invoice;
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 397;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 67;
                    RunPageLink = Document Type=CONST(Posted Invoice),
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
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        ApprovalsMgmt.ShowPostedApprovalEntries(RECORDID);
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
                    SalesInvHeader : Record "112";
                begin
                    SalesInvHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    SalesInvHeader.SendRecords;
                end;
            }
            action("&Print")
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
                    //KT 220318
                    SalesInvHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    IF "Facture Complémentaire" THEN BEGIN
                      CLEAR(FactureComplVN);
                      FactureComplVN.SETTABLEVIEW(SalesInvHeader);
                      FactureComplVN.RUN;
                    END ELSE BEGIN
                      SalesInvHeader := Rec;
                      CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                      SalesInvHeader.PrintRecords(TRUE);
                    END;
                end;
            }
            action("&Email")
            {
                CaptionML = ENU='&Email',
                            FRA='&E-mail';
                Image = Email;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;

                trigger OnAction();
                begin
                    SalesInvHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    SalesInvHeader.EmailRecords(TRUE);
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
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

    trigger OnOpenPage();
    begin
        SetSecurityFilterOnRespCenter;
    end;

    var
        SalesInvHeader : Record "112";
        ChangeExchangeRate : Page "511";
        HasIncomingDocument : Boolean;
        DocExchStatusStyle : Text;
        FactureComplVN : Report "60268";
        text001 : Label 'Voulez-vous imprimer le bon de livraison ?';
}

