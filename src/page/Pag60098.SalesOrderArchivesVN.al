page 60098 "Sales Order Archives VN"
{
    // version SAV Automobile

    CaptionML = ENU='Sales Order Archives PR',
                FRA='Archives commandes vente';
    CardPageID = "Sales Order Archive VN";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Table5107;
    SourceTableView = SORTING(Document Type,No.,Doc. No. Occurrence,Version No.)
                      WHERE(Document Type=CONST(Order),
                            Order Type=CONST(VN));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Version No.";"Version No.")
                {
                }
                field("Date Archived";"Date Archived")
                {
                }
                field("Time Archived";"Time Archived")
                {
                }
                field("Archived By";"Archived By")
                {
                }
                field("Interaction Exist";"Interaction Exist")
                {
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Sell-to Contact";"Sell-to Contact")
                {
                }
                field("Sell-to Post Code";"Sell-to Post Code")
                {
                }
                field("Sell-to Country/Region Code";"Sell-to Country/Region Code")
                {
                }
                field("Bill-to Contact No.";"Bill-to Contact No.")
                {
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                }
                field("Bill-to Country/Region Code";"Bill-to Country/Region Code")
                {
                }
                field("Ship-to Code";"Ship-to Code")
                {
                }
                field("Ship-to Name";"Ship-to Name")
                {
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                }
                field("Ship-to Country/Region Code";"Ship-to Country/Region Code")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Requested Delivery Date";"Requested Delivery Date")
                {
                    Visible = false;
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    Visible = false;
                }
                field("Due Date";"Due Date")
                {
                    Visible = false;
                }
                field("Payment Discount %";"Payment Discount %")
                {
                    Visible = false;
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                    Visible = false;
                }
                field("Shipment Date";"Shipment Date")
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
            group("Ver&sion")
            {
                CaptionML = ENU='Ver&sion',
                            FRA='Ver&sion';
                Image = Versions;
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
                    RunObject = Page 5180;
                    RunPageLink = Document Type=FIELD(Document Type),
                                  No.=FIELD(No.),
                                  Document Line No.=CONST(0),
                                  Doc. No. Occurrence=FIELD(Doc. No. Occurrence),
                                  Version No.=FIELD(Version No.);
                }
            }
        }
    }
}

