page 60131 "Posted Service Invoices VN"
{
    // version NAVW17.00

    CaptionML = ENU='Posted Service Invoices',
                FRA='Factures service enreg.';
    CardPageID = "Posted Service Invoice";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Table5992;
    SourceTableView = WHERE(Type Reception=CONST(VN));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
                field("Post Code";"Post Code")
                {
                    Visible = false;
                }
                field("Country/Region Code";"Country/Region Code")
                {
                    Visible = false;
                }
                field("Contact Name";"Contact Name")
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
                field("Monatant TTC";"Monatant TTC")
                {
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
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Due Date";"Due Date")
                {
                    Visible = false;
                }
                field("Reception No";"Reception No")
                {
                }
                field("Your Reference";"Your Reference")
                {
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
            group("&Invoice")
            {
                CaptionML = ENU='&Invoice',
                            FRA='Fa&cture';
                Image = Invoice;
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 6033;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 5911;
                    RunPageLink = Table Name=CONST(Service Invoice Header),
                                  No.=FIELD(No.),
                                  Type=CONST(General);
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
                        CurrPage.SAVERECORD;
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
                begin
                    CurrPage.SETSELECTIONFILTER(ServiceInvHeader);
                    ServiceInvHeader.PrintRecords(TRUE);
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
        //SM 020817
        FILTERGROUP(2);
        RecGUserSetup.GET(USERID);
        IF NOT RecGUserSetup.Admin_Vente_VN  THEN BEGIN
          IF UserMgt.GetSalesFilter <> '' THEN BEGIN

            SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);

          END;
        END;

        IF (NOT RecGUserSetup.Admin_Vente_VN) AND (NOT RecGUserSetup."Responsable agence VN") THEN BEGIN
          SETRANGE("Salesperson Code",RecGUserSetup."Salespers./Purch. Code");
        END;
        FILTERGROUP(0);
        //SM
    end;

    var
        ServiceInvHeader : Record "5992";
        RecGUserSetup : Record "91";
        UserMgt : Codeunit "5700";
}

