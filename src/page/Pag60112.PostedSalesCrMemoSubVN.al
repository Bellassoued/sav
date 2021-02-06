page 60112 "Posted Sales Cr. Memo Sub. VN"
{
    // version SAV Automobile

    AutoSplitKey = true;
    CaptionML = ENU='Lines PR',
                FRA='Lignes VN';
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = Table115;

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
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;
                    Visible = true;
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
                field("Timbre Fiscal";"Timbre Fiscal")
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
                action("Item Return Receipt &Lines")
                {
                    CaptionML = ENU='Item Return Receipt &Lines',
                                FRA='&Lignes réception retour article';

                    trigger OnAction();
                    begin
                        ShowItemReturnRcptLines;
                    end;
                }
            }
        }
    }

    procedure ShowItemReturnRcptLines();
    begin
        IF NOT (Type IN [Type::Item,Type::"Charge (Item)"]) THEN
          TESTFIELD(Type);
        ShowItemReturnRcptLines;
    end;
}

