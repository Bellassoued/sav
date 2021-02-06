page 60337 "Posted Sales Credit Memos PRCO"
{
    // version SAV Automobile

    CaptionML = ENU='Posted Sales Credit Memos PR',
                FRA='Avoirs vente enregistrés PR';
    CardPageID = "Posted Sales Credit Memo PR";
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData 114=rm;
    SourceTable = Table114;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Order Type";"Order Type")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("No.";"No.")
                {
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
                field(Amount;Amount)
                {

                    trigger OnDrillDown();
                    begin
                        SETRANGE("No.");
                        PAGE.RUNMODAL(PAGE::"Posted Sales Credit Memo",Rec)
                    end;
                }
                field("Amount Including VAT";"Amount Including VAT")
                {

                    trigger OnDrillDown();
                    begin
                        SETRANGE("No.");
                        PAGE.RUNMODAL(PAGE::"Posted Sales Credit Memo",Rec)
                    end;
                }
                field("Sell-to Post Code";"Sell-to Post Code")
                {
                    Visible = false;
                }
                field("Sell-to Country/Region Code";"Sell-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Sell-to Contact";"Sell-to Contact")
                {
                    Visible = false;
                }
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                    Visible = false;
                }
                field("Bill-to Name";"Bill-to Name")
                {
                    Visible = false;
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                    Visible = false;
                }
                field("Bill-to Country/Region Code";"Bill-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                    Visible = false;
                }
                field("Type Avoir";"Type Avoir")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Ship-to Code";"Ship-to Code")
                {
                    Visible = false;
                }
                field("Ship-to Name";"Ship-to Name")
                {
                    Visible = false;
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                    Visible = false;
                }
                field("Ship-to Country/Region Code";"Ship-to Country/Region Code")
                {
                    Visible = false;
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                    Visible = false;
                }
                field("Posting Date";"Posting Date")
                {
                    Visible = false;
                }
                field("Salesperson Code";"Salesperson Code")
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
                field("Location Code";"Location Code")
                {
                    Visible = true;
                }
                field("No. Printed";"No. Printed")
                {
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field(PRANET;PRANET)
                {
                }
                field("Applies-to Doc. Type";"Applies-to Doc. Type")
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
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Cr. Memo")
            {
                CaptionML = ENU='&Cr. Memo',
                            FRA='Avoi&r';
                Image = CreditMemo;
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';

                    trigger OnAction();
                    begin
                        PAGE.RUN(PAGE::"Posted Sales Credit Memo",Rec)
                    end;
                }
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 398;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 67;
                    RunPageLink = Document Type=CONST(Posted Credit Memo),
                                  No.=FIELD(No.);
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
            }
        }
        area(processing)
        {
            action("&Print")
            {
                CaptionML = ENU='&Print',
                            FRA='&Imprimer';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction();
                var
                    SalesCrMemoHeader : Record "114";
                begin
                    CurrPage.SETSELECTIONFILTER(SalesCrMemoHeader);
                    SalesCrMemoHeader.PrintRecords(TRUE);
                end;
            }
            action("&Navigate")
            {
                CaptionML = ENU='&Navigate',
                            FRA='Na&viguer';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    Navigate;
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        //SetSecurityFilterOnRespCenter;
    end;
}

