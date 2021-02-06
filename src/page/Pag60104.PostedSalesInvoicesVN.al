page 60104 "Posted Sales Invoices VN"
{
    // version SAV Automobile

    CaptionML = ENU='Posted Sales Invoices PR',
                FRA='Factures vente enregistrées';
    CardPageID = "Posted Sales Invoice VN";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    Permissions = TableData 112=rm,
                  TableData 113=rm;
    SourceTable = Table112;
    SourceTableView = SORTING(No.)
                      WHERE(Order Type=CONST(VN));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Posting Date";"Posting Date")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("No.";"No.")
                {
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field("Order No.";"Order No.")
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
                        PAGE.RUNMODAL(PAGE::"Posted Sales Invoice",Rec)
                    end;
                }
                field("Amount Including VAT";"Amount Including VAT")
                {

                    trigger OnDrillDown();
                    begin
                        SETRANGE("No.");
                        PAGE.RUNMODAL(PAGE::"Posted Sales Invoice",Rec)
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
                field("Responsibility Center";"Responsibility Center")
                {
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
                field("Engagement Lettre Amount";"Engagement Lettre Amount")
                {
                }
                field("Type Paiement";"Type Paiement")
                {
                }
                field("N° autorisation";"N° autorisation")
                {
                }
                field("Date autorisation";"Date autorisation")
                {
                }
                field("Invoice Discount Amount";"Invoice Discount Amount")
                {
                }
            }
        }
        area(factboxes)
        {
            part(IncomingDocAttachFactBox;193)
            {
                ShowFilter = false;
            }
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
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    ShortCutKey = 'Shift+F7';

                    trigger OnAction();
                    begin
                        PAGE.RUN(PAGE::"Posted Sales Invoice",Rec)
                    end;
                }
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 397;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 67;
                    RunPageLink = Document Type=CONST(Posted Invoice),
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
            action(SendCustom)
            {
                CaptionML = ENU='Send',
                            FRA='Envoyer';
                Ellipsis = true;
                Image = SendToMultiple;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    SalesInvHeader : Record "112";
                begin
                    SalesInvHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    SalesInvHeader.SendRecords;
                end;
            }
            action("&Print")
            {
                CaptionML = ENU='&Print',
                            FRA='&Imprimer';
                Ellipsis = true;
                Image = Print;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                Visible = false;

                trigger OnAction();
                var
                    SalesInvHeader : Record "112";
                begin
                    SalesInvHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    SalesInvHeader.PrintRecords(TRUE);
                end;
            }
            action("&Email")
            {
                CaptionML = ENU='&Email',
                            FRA='&E-mail';
                Image = Email;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;

                trigger OnAction();
                var
                    SalesInvHeader : Record "112";
                begin
                    SalesInvHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesInvHeader);
                    SalesInvHeader.EmailRecords(TRUE);
                end;
            }
            action("&Navigate")
            {
                CaptionML = ENU='&Navigate',
                            FRA='Na&viguer';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    Navigate;
                end;
            }
            action(ActivityLog)
            {
                CaptionML = ENU='Activity Log',
                            FRA='Journal des activités';
                Image = Log;

                trigger OnAction();
                var
                    ActivityLog : Record "710";
                begin
                    ActivityLog.ShowEntries(RECORDID);
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        //SetSecurityFilterOnRespCenter;
        //SM 020817
        RecGUserSetup.GET(USERID);
        IF NOT RecGUserSetup."Service Compta." THEN
          BEGIN
            FILTERGROUP(2);
            IF NOT RecGUserSetup.Admin_Vente_VN  THEN BEGIN
              IF UserMgt.GetSalesFilter <> '' THEN BEGIN

                SETRANGE("Responsibility Center",UserMgt.GetSalesFilter);

              END;
            END;
        IF (RecGUserSetup."Salespers./Purch. Code"<>'') THEN
              IF (NOT RecGUserSetup.Admin_Vente_VN) AND (NOT RecGUserSetup."Responsable agence VN") AND (NOT RecGUserSetup."Afficher Tous Document VN Site") THEN BEGIN
              SETRANGE("Salesperson Code",RecGUserSetup."Salespers./Purch. Code");
            END;
            FILTERGROUP(0);
            //SM
        END;
    end;

    var
        RecGUserSetup : Record "91";
        UserMgt : Codeunit "5700";
}

