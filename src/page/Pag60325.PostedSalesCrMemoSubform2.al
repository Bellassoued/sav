page 60325 "Posted Sales Cr. Memo Subform2"
{
    // version NAVW19.00.00.44365,CT16V001

    //  CT16V001 ZM 16/05/2016 : upgrade

    AutoSplitKey = true;
    CaptionML = ENU='Lines Avoir Vente',
                FRA='Lines Avoir Vente';
    DeleteAllowed = false;
    Editable = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table115;

    layout
    {
        area(content)
        {
            repeater()
            {
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
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("Affecter sur";"Affecter sur")
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
                action(ItemReturnReceiptLines)
                {
                    AccessByPermission = TableData 6650=R;
                    CaptionML = ENU='Item Return Receipt &Lines',
                                FRA='&Lignes réception retour article';

                    trigger OnAction();
                    begin
                        PageShowItemReturnRcptLines;
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
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        DocumentTotals.CalculatePostedSalesCreditMemoTotals(TotalSalesCrMemoHeader,VATAmount,Rec);
    end;

    var
        TotalSalesCrMemoHeader : Record "114";
        DocumentTotals : Codeunit "57";
        VATAmount : Decimal;

    local procedure PageShowItemReturnRcptLines();
    begin
        IF NOT (Type IN [Type::Item,Type::"Charge (Item)"]) THEN
          TESTFIELD(Type);
        ShowItemReturnRcptLines;
    end;
}

