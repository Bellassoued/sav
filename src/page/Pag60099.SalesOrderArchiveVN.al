page 60099 "Sales Order Archive VN"
{
    // version SAV Automobile

    CaptionML = ENU='Sales Order Archive PR',
                FRA='Archives commandes vente';
    DeleteAllowed = false;
    Editable = false;
    PageType = Document;
    SourceTable = Table5107;
    SourceTableView = WHERE(Document Type=CONST(Order));

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
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field("Sell-to Contact No.";"Sell-to Contact No.")
                {
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                }
                field("Sell-to Address";"Sell-to Address")
                {
                }
                field("Sell-to Address 2";"Sell-to Address 2")
                {
                }
                field("Sell-to Post Code";"Sell-to Post Code")
                {
                }
                field("Sell-to City";"Sell-to City")
                {
                }
                field("Sell-to Contact";"Sell-to Contact")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Order Date";"Order Date")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field("Requested Delivery Date";"Requested Delivery Date")
                {
                }
                field("Promised Delivery Date";"Promised Delivery Date")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("Campaign No.";"Campaign No.")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field(Status;Status)
                {
                }
            }
            part(SalesLinesArchive;60100)
            {
                SubPageLink = Document No.=FIELD(No.),
                              Doc. No. Occurrence=FIELD(Doc. No. Occurrence),
                              Version No.=FIELD(Version No.);
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                }
                field("Bill-to Contact No.";"Bill-to Contact No.")
                {
                }
                field("Bill-to Name";"Bill-to Name")
                {
                }
                field("Bill-to Address";"Bill-to Address")
                {
                }
                field("Bill-to Address 2";"Bill-to Address 2")
                {
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                }
                field("Bill-to City";"Bill-to City")
                {
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                }
                field("Due Date";"Due Date")
                {
                }
                field("Payment Discount %";"Payment Discount %")
                {
                }
                field("Pmt. Discount Date";"Pmt. Discount Date")
                {
                }
                field("Payment Method Code";"Payment Method Code")
                {
                }
                field("Prices Including VAT";"Prices Including VAT")
                {
                }
                field("Credit Card No.";"Credit Card No.")
                {
                }
            }
            group(Shipping)
            {
                CaptionML = ENU='Shipping',
                            FRA='Livraison';
                field("Ship-to Code";"Ship-to Code")
                {
                }
                field("Ship-to Name";"Ship-to Name")
                {
                }
                field("Ship-to Address";"Ship-to Address")
                {
                }
                field("Ship-to Address 2";"Ship-to Address 2")
                {
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                }
                field("Ship-to City";"Ship-to City")
                {
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Outbound Whse. Handling Time";"Outbound Whse. Handling Time")
                {
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                }
                field("Shipping Agent Service Code";"Shipping Agent Service Code")
                {
                }
                field("Shipping Time";"Shipping Time")
                {
                }
                field("Late Order Shipping";"Late Order Shipping")
                {
                }
                field("Package Tracking No.";"Package Tracking No.")
                {
                }
                field("Shipment Date";"Shipment Date")
                {
                }
                field("Shipping Advice";"Shipping Advice")
                {
                }
            }
            group("Foreign Trade")
            {
                CaptionML = ENU='Foreign Trade',
                            FRA='International';
                field("Currency Code";"Currency Code")
                {
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
            group(Version)
            {
                CaptionML = ENU='Version',
                            FRA='Version';
                field("Version No.";"Version No.")
                {
                }
                field("Archived By";"Archived By")
                {
                }
                field("Date Archived";"Date Archived")
                {
                }
                field("Time Archived";"Time Archived")
                {
                }
                field("Interaction Exist";"Interaction Exist")
                {
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
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ver&sion")
            {
                CaptionML = ENU='Ver&sion',
                            FRA='Ver&sion';
                Image = Versions;
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
                        ShowDimensions;
                        CurrPage.SAVERECORD;
                    end;
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 5180;
                    RunPageLink = Document Type=FIELD(Document Type),
                                  No.=FIELD(No.),
                                  Document Line No.=CONST(0),
                                  Doc. No. Occurrence=FIELD(Doc. No. Occurrence),
                                  Version No.=FIELD(Version No.);
                }
                action(Print)
                {
                    CaptionML = ENU='Print',
                                FRA='Imprimer';
                    Image = Print;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesHeaderArch(Rec);
                    end;
                }
                separator()
                {
                }
            }
        }
        area(processing)
        {
            action(Restore)
            {
                CaptionML = ENU='&Restore',
                            FRA='&Restaurer';
                Ellipsis = true;
                Image = Restore;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    ArchiveManagement : Codeunit "5063";
                begin
                    ArchiveManagement.RestoreSalesDocument(Rec);
                end;
            }
        }
    }

    var
        DocPrint : Codeunit "229";
}

