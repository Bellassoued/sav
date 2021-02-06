page 60324 "Posted Service Inv. Subform2"
{
    // version NAVW19.00.00.44365,CT16V001

    //  CT16V001 ZM 16/05/2016 : upgrade

    AutoSplitKey = true;
    CaptionML = ENU='Lines',
                FRA='Lignes Fact. SAV';
    DeleteAllowed = false;
    Editable = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table5993;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Customer No.";"Customer No.")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
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
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    Visible = false;
                }
                field("Unit Price";"Unit Price")
                {
                    BlankZero = true;
                }
                field("Line Amount";"Line Amount")
                {
                    BlankZero = true;
                }
                field(Amount;Amount)
                {
                }
                field("Line Discount %";"Line Discount %")
                {
                    BlankZero = true;
                }
                field("Line Discount Amount";"Line Discount Amount")
                {
                    Visible = false;
                }
                field("Appl.-to Item Entry";"Appl.-to Item Entry")
                {
                    Visible = false;
                }
                field("Service Item No.";"Service Item No.")
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("VAT %";"VAT %")
                {
                }
                field("Gross Weight";"Gross Weight")
                {
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
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
                action(Dimenions)
                {
                    AccessByPermission = TableData 348=R;
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDimensions;
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
                action(ItemShipmentLines)
                {
                    CaptionML = ENU='Item Shipment &Lines',
                                FRA='&Lignes expédition article';
                    Image = ShipmentLines;

                    trigger OnAction();
                    begin
                        PageShowItemShipmentLines;
                    end;
                }
            }
        }
    }

    local procedure PageShowItemShipmentLines();
    begin
        TESTFIELD(Type,Type::Item);
        ShowItemShipmentLines;
    end;
}

