page 60054 "Posted Sales Shpt. Sub. PR"
{
    // version SAV Automobile

    AutoSplitKey = true;
    CaptionML = ENU='Lines PR',
                FRA='Lignes PR';
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = Table111;

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
                field(Description;Description)
                {
                }
                field("Return Reason Code";"Return Reason Code")
                {
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                }
                field("Bin Code";"Bin Code")
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
                field("Quantity Invoiced";"Quantity Invoiced")
                {
                    BlankZero = true;
                }
                field("Qty. Shipped Not Invoiced";"Qty. Shipped Not Invoiced")
                {
                    Editable = false;
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
                    Visible = true;
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
                field(Correction;Correction)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Line Discount %";"Line Discount %")
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
                action("Assemble-to-Order")
                {
                    CaptionML = ENU='Assemble-to-Order',
                                FRA='Assembler pour commande';

                    trigger OnAction();
                    begin
                        ShowAsmToOrder;
                    end;
                }
                action("Item Invoice &Lines")
                {
                    CaptionML = ENU='Item Invoice &Lines',
                                FRA='&Lignes facture article';
                    Image = ItemInvoice;

                    trigger OnAction();
                    begin
                        ShowItemSalesInvLines;
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("Order Tra&cking")
                {
                    CaptionML = ENU='Order Tra&cking',
                                FRA='&Chaînage';
                    Image = OrderTracking;

                    trigger OnAction();
                    begin
                        ShowTracking;
                    end;
                }
                action(UndoShipment)
                {
                    CaptionML = ENU='&Undo Shipment',
                                FRA='&Annuler expédition';
                    Image = UndoShipment;
                    Visible = VisibAnnuler;

                    trigger OnAction();
                    begin
                        UndoShipmentPosting;
                    end;
                }
            }
            group("&Shipment")
            {
                CaptionML = ENU='&Shipment',
                            FRA='E&xpédition';
                Image = Shipment;
                action(Invoices)
                {
                    CaptionML = ENU='Invoices',
                                FRA='Factures';
                    Image = Invoice;

                    trigger OnAction();
                    begin
                        InvoiceLines;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin

        VisibAnnuler := FALSE;
        CLEAR(RecUserSetup);
        IF RecUserSetup.GET(USERID) AND(RecUserSetup."Annuler Expédition") THEN
        BEGIN
            VisibAnnuler := TRUE;
        END;
    end;

    var
        VisibAnnuler : Boolean;
        RecUserSetup : Record "91";

    local procedure ShowTracking();
    var
        ItemLedgEntry : Record "32";
        TempItemLedgEntry : Record "32" temporary;
        TrackingForm : Page "99000822";
    begin
        TESTFIELD(Type,Type::Item);
        IF "Item Shpt. Entry No." <> 0 THEN BEGIN
          ItemLedgEntry.GET("Item Shpt. Entry No.");
          TrackingForm.SetItemLedgEntry(ItemLedgEntry);
        END ELSE
          TrackingForm.SetMultipleItemLedgEntries(TempItemLedgEntry,
            DATABASE::"Sales Shipment Line",0,"Document No.",'',0,"Line No.");

        TrackingForm.RUNMODAL;
    end;

    local procedure UndoShipmentPosting();
    var
        SalesShptLine : Record "111";
    begin
        SalesShptLine.COPY(Rec);
        CurrPage.SETSELECTIONFILTER(SalesShptLine);
        CODEUNIT.RUN(CODEUNIT::"Undo Sales Shipment Line",SalesShptLine);
    end;

    local procedure ShowItemSalesInvLines();
    begin
        TESTFIELD(Type,Type::Item);
        ShowItemSalesInvLines;
    end;

    local procedure InvoiceLines();
    var
        ShipmentInvoiced : Record "10825";
    begin
        ShipmentInvoiced.RESET;
        ShipmentInvoiced.SETCURRENTKEY("Shipment No.","Shipment Line No.");
        ShipmentInvoiced.SETRANGE("Shipment No.","Document No.");
        ShipmentInvoiced.SETRANGE("Shipment Line No.","Line No.");
        PAGE.RUNMODAL(PAGE::"Invoices bound by Shipment",ShipmentInvoiced);
    end;
}

