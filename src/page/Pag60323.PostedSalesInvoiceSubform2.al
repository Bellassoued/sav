page 60323 "Posted Sales Invoice Subform 2"
{
    // version NAVW19.00.00.44365,NAVFR9.00.00.44365,CT16V001

    // CT16V001 ZM 16/05/2016 : upgrade

    AutoSplitKey = true;
    CaptionML = ENU='Lines',
                FRA='Lignes Facture Vte';
    DeleteAllowed = false;
    Editable = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table113;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Posting Date";"Posting Date")
                {
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
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
                field(VIN;VIN)
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
                field(Amount;Amount)
                {
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("Code devise";"Code devise")
                {
                }
                field("Facteur devise";"Facteur devise")
                {
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
                field("Deferral Code";"Deferral Code")
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
                field("Affecter sur";"Affecter sur")
                {
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                }
                field("VAT Base Amount";"VAT Base Amount")
                {
                }
                field("VAT %";"VAT %")
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
                action(Comments)
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
                action(ItemShipmentLines)
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
                action(DeferralSchedule)
                {
                    CaptionML = ENU='Deferral Schedule',
                                FRA='Tableau échelonnement';
                    Image = PaymentPeriod;

                    trigger OnAction();
                    begin
                        ShowDeferrals;
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

    trigger OnAfterGetCurrRecord();
    begin
        DocumentTotals.CalculatePostedSalesInvoiceTotals(TotalSalesInvoiceHeader,VATAmount,Rec);
    end;

    trigger OnAfterGetRecord();
    begin
        //<<ADD KK VN0002
        ShowItemTrackingLines3;
        //END KK VN0002
    end;

    var
        TotalSalesInvoiceHeader : Record "112";
        DocumentTotals : Codeunit "57";
        VATAmount : Decimal;

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

