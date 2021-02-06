page 60115 "Posted Return Receipt Sub. VN"
{
    // version SAV Automobile

    AutoSplitKey = true;
    CaptionML = ENU='Lines PR',
                FRA='Lignes VN';
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = Table6661;

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
                field("Return Qty. Rcd. Not Invd.";"Return Qty. Rcd. Not Invd.")
                {
                }
                field("Shipment Date";"Shipment Date")
                {
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
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("&Undo Return Receipt")
                {
                    CaptionML = ENU='&Undo Return Receipt',
                                FRA='&Annuler réception retour';

                    trigger OnAction();
                    begin
                        UndoReturnReceipt;
                    end;
                }
            }
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
                action("Item Credit Memo &Lines")
                {
                    CaptionML = ENU='Item Credit Memo &Lines',
                                FRA='&Lignes avoir article';

                    trigger OnAction();
                    begin
                        ShowItemSalesCrMemoLines;
                    end;
                }
            }
        }
    }

    procedure ShowItemTrackingLines();
    begin
        ShowItemTrackingLines;
    end;

    procedure UndoReturnReceipt();
    var
        ReturnRcptLine : Record "6661";
    begin
        ReturnRcptLine.COPY(Rec);
        CurrPage.SETSELECTIONFILTER(ReturnRcptLine);
        CODEUNIT.RUN(CODEUNIT::"Undo Return Receipt Line",ReturnRcptLine);
    end;

    procedure ShowItemSalesCrMemoLines();
    begin
        TESTFIELD(Type,Type::Item);
        ShowItemSalesCrMemoLines;
    end;

    procedure ShowLineComments();
    begin
        ShowLineComments;
    end;
}

