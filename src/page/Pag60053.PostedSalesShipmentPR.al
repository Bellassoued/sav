page 60053 "Posted Sales Shipment PR"
{
    // version SAV Automobile

    CaptionML = ENU='Posted Sales Shipment PR',
                FRA='Expédition vente enregistrée';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Document;
    SourceTable = Table110;
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
                field("No. Printed";"No. Printed")
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
                field("Requested Delivery Date";"Requested Delivery Date")
                {
                    Editable = false;
                }
                field("Promised Delivery Date";"Promised Delivery Date")
                {
                    Editable = false;
                }
                field("Quote No.";"Quote No.")
                {
                    Editable = false;
                }
                field("Order No.";"Order No.")
                {
                    Editable = false;
                    Importance = Promoted;
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
                    Editable = false;
                }
            }
            part(SalesShipmLines;60054)
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
                    Importance = Promoted;
                }
                field("Outbound Whse. Handling Time";"Outbound Whse. Handling Time")
                {
                    Editable = false;
                }
                field("Shipping Time";"Shipping Time")
                {
                    Editable = false;
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                    Editable = false;
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                }
                field("Shipping Agent Service Code";"Shipping Agent Service Code")
                {
                }
                field("Package Tracking No.";"Package Tracking No.")
                {
                }
                field("Shipment Date";"Shipment Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
            }
        }
        area(factboxes)
        {
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
            group("&Shipment")
            {
                CaptionML = ENU='&Shipment',
                            FRA='E&xpédition';
                Image = Shipment;
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 396;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F7';
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
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 67;
                    RunPageLink = Document Type=CONST(Shipment),
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
                action(CertificateOfSupplyDetails)
                {
                    CaptionML = ENU='Certificate of Supply Details',
                                FRA='Détails certificat d''approvisionnement';
                    Image = Certificate;
                    RunObject = Page 780;
                    RunPageLink = Document Type=FILTER(Sales Shipment),
                                  Document No.=FIELD(No.);
                }
                action(PrintCertificateofSupply)
                {
                    CaptionML = ENU='Print Certificate of Supply',
                                FRA='Imprimer le certificat d''approvisionnement';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction();
                    var
                        CertificateOfSupply : Record "780";
                    begin
                        CertificateOfSupply.SETRANGE("Document Type",CertificateOfSupply."Document Type"::"Sales Shipment");
                        CertificateOfSupply.SETRANGE("Document No.","No.");
                        CertificateOfSupply.Print;
                    end;
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
                action("&Track Package")
                {
                    CaptionML = ENU='&Track Package',
                                FRA='&Suivre colis';
                    Image = ItemTracking;

                    trigger OnAction();
                    begin
                        StartTrackingSite;
                    end;
                }
            }
            action("&Print")
            {
                CaptionML = ENU='&Print',
                            FRA='&Imprimer';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;

                trigger OnAction();
                begin
                    CurrPage.SETSELECTIONFILTER(SalesShptHeader);
                    SalesShptHeader.PrintRecordsPR(TRUE);
                end;
            }
            action("&Navigate")
            {
                CaptionML = ENU='&Navigate',
                            FRA='Na&viguer';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Navigate;
                end;
            }
            action("Retour pièces")
            {
                Visible = false;

                trigger OnAction();
                var
                    InventorySetup : Record "313";
                    CDUStockFunction : Codeunit "50000";
                begin
                    //<< TRIUM RAD 17/04/2014 - retour pièce
                    InventorySetup.GET;
                    IF COMPANYNAME <> InventorySetup."Socité stock consolidé" THEN
                      ERROR('Cette fonctionnalité retour pièce n est disponible que pour la société GROS!');
                    CLEAR(CDUStockFunction);
                    //CDUStockFunction.CreateTransOrderReturnFromCancelledShipment("No.");
                    CDUStockFunction.CreateTransOrderReturnFromSalesCancelledShipment ("No.");
                    //>> End TRIUM RAD Addin
                end;
            }
            action("Liste retors pièces")
            {
                RunObject = Page 5742;
                RunPageLink = Source No=FIELD(No.),
                              Source Type=CONST(Vente PR);
                Visible = false;
            }
        }
    }

    trigger OnModifyRecord() : Boolean;
    begin
        CODEUNIT.RUN(CODEUNIT::"Shipment Header - Edit",Rec);
        EXIT(FALSE);
    end;

    trigger OnOpenPage();
    begin
        SetSecurityFilterOnRespCenter;
    end;

    var
        SalesShptHeader : Record "110";
}

