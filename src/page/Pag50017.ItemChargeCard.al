page 50017 "Item Charge Card"
{
    // version CT16V001

    CaptionML = ENU='Item Charge Card',
                FRA='Fiche frais annexe';
    PageType = Card;
    SourceTable = 5800;

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
                field(Description;Description)
                {
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                }
                field(Assignable;Assignable)
                {
                }
                field(Sales;Sales)
                {
                }
                field(Purchase;Purchase)
                {
                }
                field("Search Description";"Search Description")
                {
                }
                field("Profit % ST";"Profit % ST")
                {
                }
                field("Prix unitaire HT";"Prix unitaire HT")
                {
                }
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Item Charge")
            {
                CaptionML = ENU='&Item Charge',
                            FRA='F&rais annexes';
                separator()
                {
                }
                action("Value E&ntries")
                {
                    CaptionML = ENU='Value E&ntries',
                                FRA='E&critures valeur';
                    Image = ValueLedger;
                    RunObject = Page 5802;
                    RunPageLink = Entry Type=CONST(Direct Cost),
                                  Item Charge No.=FIELD(No.);
                    RunPageView = SORTING(Item Charge No.);
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='A&xes analytiques';
                    Image = Dimensions;
                    RunObject = Page 540;
                    RunPageLink = Table ID=CONST(5800),
                                  No.=FIELD(No.);
                    ShortCutKey = 'Shift+Ctrl+D';
                }
            }
        }
    }
}

