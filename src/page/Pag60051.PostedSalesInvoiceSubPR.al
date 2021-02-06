page 60051 "Posted Sales Invoice Sub. PR"
{
    // version SAV Automobile

    AutoSplitKey = true;
    CaptionML = ENU='Lines PR',
                FRA='Lignes PR';
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = Table113;

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
                field("IC Partner Code";"IC Partner Code")
                {
                    Visible = false;
                }
                field("Variant Code";"Variant Code")
                {
                    Visible = false;
                }
                field(Description;Description)
                {
                }
                field("Return Reason Code";"Return Reason Code")
                {
                    Visible = false;
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    Visible = false;
                }
                field("Timbre Fiscal";"Timbre Fiscal")
                {
                }
                field("Apply Fodec";"Apply Fodec")
                {
                }
                field("Montant Fodec";"Montant Fodec")
                {
                }
                field("Unit Price";"Unit Price")
                {
                    BlankZero = true;
                }
                field("Line Amount";"Line Amount")
                {
                    BlankZero = true;
                }
                field("Line Discount %";"Line Discount %")
                {
                    BlankZero = true;
                }
                field("Line Discount Amount";"Line Discount Amount")
                {
                    Visible = false;
                }
                field("Allow Invoice Disc.";"Allow Invoice Disc.")
                {
                    Visible = false;
                }
                field("Job No.";"Job No.")
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
                action(ItemTrackingEntries)
                {
                    CaptionML = ENU='Item &Tracking Entries',
                                FRA='Écritures &traçabilité';
                    Image = ItemTrackingLedger;

                    trigger OnAction();
                    begin
                        ShowItemTrackingLines;
                    end;
                }
                action("Item Shipment &Lines")
                {
                    CaptionML = ENU='Item Shipment &Lines',
                                FRA='&Lignes expédition article';
                    Image = ShipmentLines;

                    trigger OnAction();
                    begin
                        IF NOT (Type IN [Type::Item,Type::"Charge (Item)"]) THEN
                          TESTFIELD(Type);
                        ShowItemShipmentLines;
                    end;
                }
            }
            group("&Invoice")
            {
                CaptionML = ENU='&Invoice',
                            FRA='Fa&cture';
                Image = Invoice;
                action(Shipments)
                {
                    CaptionML = ENU='S&hipments',
                                FRA='E&xpéditions';
                    Image = Shipment;

                    trigger OnAction();
                    begin
                        LinesInvoiced;
                    end;
                }
            }
        }
    }

    procedure LinesInvoiced();
    var
        ShipmentInvoiced : Record "10825";
    begin
        ShipmentInvoiced.RESET;
        ShipmentInvoiced.SETCURRENTKEY("Invoice No.","Invoice Line No.","Shipment No.","Shipment Line No.");
        ShipmentInvoiced.SETRANGE("Invoice No.","Document No.");
        ShipmentInvoiced.SETRANGE("Invoice Line No.","Line No.");
        PAGE.RUNMODAL(PAGE::"Shipments bound by Invoice",ShipmentInvoiced);
    end;
}

