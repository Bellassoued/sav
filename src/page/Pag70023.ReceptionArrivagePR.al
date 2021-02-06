page 70023 "Reception Arrivage PR"
{
    // version NAVW17.00

    CaptionML = ENU='Warehouse Receipts',
                FRA='Réceptions entrepôt';
    CardPageID = "Warehouse Receipt";
    DataCaptionFields = "No.";
    Editable = false;
    PageType = List;
    SourceTable = Table7316;
    SourceTableView = WHERE(No. Colis=FILTER(<>''));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Assigned User ID";"Assigned User ID")
                {
                }
                field("Sorting Method";"Sorting Method")
                {
                }
                field("Zone Code";"Zone Code")
                {
                    Visible = false;
                }
                field("Bin Code";"Bin Code")
                {
                    Visible = false;
                }
                field("Document Status";"Document Status")
                {
                    Visible = false;
                }
                field("Posting Date";"Posting Date")
                {
                    Visible = false;
                }
                field("Assignment Date";"Assignment Date")
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
            group("&Receipt")
            {
                CaptionML = ENU='&Receipt',
                            FRA='&Réception';
                Image = Receipt;
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 5776;
                    RunPageLink = Table Name=CONST(Whse. Receipt),
                                  Type=CONST(" "),
                                  No.=FIELD(No.);
                }
                action("Posted &Whse. Receipts")
                {
                    CaptionML = ENU='Posted &Whse. Receipts',
                                FRA='Réceptions &entrep. enreg.';
                    Image = PostedReceipts;
                    RunObject = Page 7333;
                    RunPageLink = Whse. Receipt No.=FIELD(No.);
                    RunPageView = SORTING(Whse. Receipt No.);
                }
            }
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                Image = Line;
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';

                    trigger OnAction();
                    begin
                        PAGE.RUN(PAGE::"Warehouse Receipt",Rec);
                    end;
                }
            }
        }
    }

    trigger OnFindRecord(Which : Text) : Boolean;
    begin
        EXIT(FindFirstAllowedRec(Which));
    end;

    trigger OnNextRecord(Steps : Integer) : Integer;
    begin
        EXIT(FindNextAllowedRec(Steps));
    end;

    trigger OnOpenPage();
    begin
        ErrorIfUserIsNotWhseEmployee;
    end;
}

