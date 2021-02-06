page 60132 "Posted Service Inv Lines VN"
{
    // version NAVW17.00

    CaptionML = ENU='Posted Service Invoice Lines',
                FRA='Lignes facture serv.enreg.';
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Table5993;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Document No.";"Document No.")
                {
                }
                field("Customer No.";"Customer No.")
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
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
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
                field("Unit Price";"Unit Price")
                {
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    Visible = false;
                }
                field(Amount;Amount)
                {
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                    Visible = false;
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
                field("Appl.-to Item Entry";"Appl.-to Item Entry")
                {
                    Visible = false;
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
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                Image = Line;
                action("Show Document")
                {
                    CaptionML = ENU='Show Document',
                                FRA='Afficher document';
                    Image = View;
                    ShortCutKey = 'Shift+F7';

                    trigger OnAction();
                    begin
                        ServInvHeader.GET("Document No.");
                        PAGE.RUN(PAGE::"Posted Service Invoice",ServInvHeader);
                    end;
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
                action("Item &Tracking Entries")
                {
                    CaptionML = ENU='Item &Tracking Entries',
                                FRA='Écritures &traçabilité';
                    Image = ItemTrackingLedger;

                    trigger OnAction();
                    begin
                        ShowItemTrackingLines;
                    end;
                }
            }
        }
    }

    var
        ServInvHeader : Record "5992";
}

