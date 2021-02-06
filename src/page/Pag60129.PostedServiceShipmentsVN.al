page 60129 "Posted Service Shipments VN"
{
    // version NAVW17.00

    CaptionML = ENU='Posted Service Shipments',
                FRA='Expéditions service enreg.';
    CardPageID = "Posted Service Shipment";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Table5990;
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
                field("Currency Code";"Currency Code")
                {
                }
                field("Location Code";"Location Code")
                {
                    Visible = true;
                }
                field("Notify Customer";"Notify Customer")
                {
                    Visible = false;
                }
                field("Service Order Type";"Service Order Type")
                {
                    Visible = false;
                }
                field("Contract No.";"Contract No.")
                {
                    Visible = false;
                }
                field("Response Date";"Response Date")
                {
                    Visible = false;
                }
                field(Priority;Priority)
                {
                    Visible = false;
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Warning Status";"Warning Status")
                {
                    Visible = false;
                }
                field("Allocated Hours";"Allocated Hours")
                {
                    Visible = false;
                }
                field("Order Date";"Order Date")
                {
                    Visible = false;
                }
                field("Expected Finishing Date";"Expected Finishing Date")
                {
                    Visible = false;
                }
                field("Starting Date";"Starting Date")
                {
                    Visible = false;
                }
                field("Finishing Date";"Finishing Date")
                {
                    Visible = false;
                }
                field("Service Time (Hours)";"Service Time (Hours)")
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
            group("&Shipment")
            {
                CaptionML = ENU='&Shipment',
                            FRA='E&xpédition';
                Image = Shipment;
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 6032;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 5911;
                    RunPageLink = No.=FIELD(No.),
                                  Table Name=CONST(Service Shipment Header),
                                  Type=CONST(General);
                }
                separator()
                {
                }
                action("Service Ledger E&ntries")
                {
                    CaptionML = ENU='Service Ledger E&ntries',
                                FRA='Écritures comptables se&rvice';
                    Image = ServiceLedger;
                    RunObject = Page 5912;
                    RunPageLink = Document Type=CONST(Shipment),
                                  Document No.=FIELD(No.);
                    ShortCutKey = 'Ctrl+F7';
                }
                action("&Warranty Ledger Entries")
                {
                    CaptionML = ENU='&Warranty Ledger Entries',
                                FRA='Écritures comptables &garantie';
                    Image = WarrantyLedger;
                    RunObject = Page 5913;
                    RunPageLink = Document No.=FIELD(No.);
                    RunPageView = SORTING(Document No.,Posting Date);
                }
                action("&Job Ledger Entries")
                {
                    CaptionML = ENU='&Job Ledger Entries',
                                FRA='Écritures comptables &projet';
                    Image = JobLedger;
                    RunObject = Page 92;
                    RunPageLink = Document No.=FIELD(No.);
                }
                separator()
                {
                }
                action("&Allocations")
                {
                    CaptionML = ENU='&Allocations',
                                FRA='&Ventilations';
                    Image = Allocations;
                    RunObject = Page 6001;
                    RunPageLink = Document Type=CONST(Order),
                                  Document No.=FIELD(Order No.);
                    RunPageView = SORTING(Status,Document Type,Document No.,Service Item Line No.,Allocation Date,Starting Time,Posted);
                }
                separator()
                {
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
                separator()
                {
                }
                action("Service E-Mail &Queue")
                {
                    CaptionML = ENU='Service E-Mail &Queue',
                                FRA='&File d''attente e-mails service';
                    Image = Email;
                    RunObject = Page 5961;
                    RunPageLink = Document Type=CONST(Service Order),
                                  Document No.=FIELD(Order No.);
                    RunPageView = SORTING(Document Type,Document No.);
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
                    CurrPage.SETSELECTIONFILTER(ServShptHeader);
                    ServShptHeader.PrintRecords(TRUE);
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
        ServShptHeader : Record "5990";
        RecGUserSetup : Record "91";
        UserMgt : Codeunit "5700";
}

