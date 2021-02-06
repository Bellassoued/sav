page 60103 "Sales Return Order Arc Sub. VN"
{
    // version SAV Automobile

    CaptionML = ENU='Lines PR',
                FRA='Lignes PR';
    Editable = false;
    PageType = ListPart;
    SourceTable = Table5108;
    SourceTableView = WHERE(Document Type=CONST(Return Order));

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                }
                field("Cross-Reference No.";"Cross-Reference No.")
                {
                    Visible = false;
                }
                field("Variant Code";"Variant Code")
                {
                    Visible = false;
                }
                field("Substitution Available";"Substitution Available")
                {
                    Visible = false;
                }
                field("Purchasing Code";"Purchasing Code")
                {
                    Visible = false;
                }
                field(Nonstock;Nonstock)
                {
                    Visible = false;
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                    Visible = false;
                }
                field(Description;Description)
                {
                }
                field("Drop Shipment";"Drop Shipment")
                {
                    Visible = false;
                }
                field("Special Order";"Special Order")
                {
                    Visible = false;
                }
                field("Return Reason Code";"Return Reason Code")
                {
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                }
                field(Reserve;Reserve)
                {
                    Visible = false;
                }
                field(Quantity;Quantity)
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    Visible = false;
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    Visible = false;
                }
                field("Unit Price";"Unit Price")
                {
                    Visible = false;
                }
                field("Line Amount";"Line Amount")
                {
                }
                field("Line Discount %";"Line Discount %")
                {
                }
                field("Line Discount Amount";"Line Discount Amount")
                {
                    Visible = false;
                }
                field("Allow Invoice Disc.";"Allow Invoice Disc.")
                {
                    Visible = false;
                }
                field("Inv. Discount Amount";"Inv. Discount Amount")
                {
                    Visible = false;
                }
                field("Qty. to Ship";"Qty. to Ship")
                {
                }
                field("Quantity Shipped";"Quantity Shipped")
                {
                }
                field("Qty. to Invoice";"Qty. to Invoice")
                {
                }
                field("Quantity Invoiced";"Quantity Invoiced")
                {
                }
                field("Allow Item Charge Assignment";"Allow Item Charge Assignment")
                {
                    Visible = false;
                }
                field("Requested Delivery Date";"Requested Delivery Date")
                {
                    Visible = false;
                }
                field("Promised Delivery Date";"Promised Delivery Date")
                {
                    Visible = false;
                }
                field("Planned Delivery Date";"Planned Delivery Date")
                {
                }
                field("Planned Shipment Date";"Planned Shipment Date")
                {
                }
                field("Shipment Date";"Shipment Date")
                {
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                    Visible = false;
                }
                field("Shipping Agent Service Code";"Shipping Agent Service Code")
                {
                    Visible = false;
                }
                field("Shipping Time";"Shipping Time")
                {
                    Visible = false;
                }
                field("Job No.";"Job No.")
                {
                    Visible = false;
                }
                field("Outbound Whse. Handling Time";"Outbound Whse. Handling Time")
                {
                    Visible = false;
                }
                field("Blanket Order No.";"Blanket Order No.")
                {
                    Visible = false;
                }
                field("Blanket Order Line No.";"Blanket Order Line No.")
                {
                    Visible = false;
                }
                field("FA Posting Date";"FA Posting Date")
                {
                    Visible = false;
                }
                field("Depr. until FA Posting Date";"Depr. until FA Posting Date")
                {
                    Visible = false;
                }
                field("Depreciation Book Code";"Depreciation Book Code")
                {
                    Visible = false;
                }
                field("Use Duplication List";"Use Duplication List")
                {
                    Visible = false;
                }
                field("Duplicate in Depreciation Book";"Duplicate in Depreciation Book")
                {
                    Visible = false;
                }
                field("Appl.-from Item Entry";"Appl.-from Item Entry")
                {
                    Visible = false;
                }
                field("Appl.-to Item Entry";"Appl.-to Item Entry")
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
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                Image = Line;
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
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        ShowLineComments;
                    end;
                }
            }
        }
    }

    procedure ShowLineComments();
    begin
        ShowLineComments;
    end;
}

