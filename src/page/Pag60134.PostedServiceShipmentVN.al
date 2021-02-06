page 60134 "Posted Service Shipment VN"
{
    // version NAVW17.00

    CaptionML = ENU='Posted Service Shipment',
                FRA='Expédition service enreg.';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table5990;

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
                    Editable = false;
                    Importance = Promoted;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field("Customer No.";"Customer No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Contact No.";"Contact No.")
                {
                    Editable = false;
                }
                field(Name;Name)
                {
                    Editable = false;
                }
                field(Address;Address)
                {
                    Editable = false;
                }
                field("Address 2";"Address 2")
                {
                    Editable = false;
                }
                field("Post Code";"Post Code")
                {
                    Editable = false;
                }
                field("Contact Name";"Contact Name")
                {
                    Editable = false;
                }
                field("Phone No.";"Phone No.")
                {
                    Editable = false;
                }
                field("E-Mail";"E-Mail")
                {
                    Editable = false;
                }
                field(City;City)
                {
                    Editable = false;
                }
                field("Phone No. 2";"Phone No. 2")
                {
                    Editable = false;
                }
                field("Notify Customer";"Notify Customer")
                {
                    Editable = false;
                }
                field("Service Order Type";"Service Order Type")
                {
                    Editable = false;
                }
                field("Contract No.";"Contract No.")
                {
                    Editable = false;
                }
                field("Response Date";"Response Date")
                {
                    Editable = false;
                }
                field("Response Time";"Response Time")
                {
                    Editable = false;
                }
                field(Priority;Priority)
                {
                    Editable = false;
                }
                field("Order No.";"Order No.")
                {
                    Editable = false;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    Editable = false;
                }
                field("No. Printed";"No. Printed")
                {
                    Editable = false;
                }
            }
            part(ServShipmentItemLines;5976)
            {
                SubPageLink = No.=FIELD(No.);
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Bill-to Name";"Bill-to Name")
                {
                    Editable = false;
                }
                field("Bill-to Address";"Bill-to Address")
                {
                    Editable = false;
                }
                field("Bill-to Address 2";"Bill-to Address 2")
                {
                    Editable = false;
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                    Editable = false;
                }
                field("Bill-to City";"Bill-to City")
                {
                    Editable = false;
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                    Editable = false;
                }
                field("Your Reference";"Your Reference")
                {
                    Editable = false;
                }
                field("Salesperson Code";"Salesperson Code")
                {
                    Editable = false;
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Document Date";"Document Date")
                {
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Editable = false;
                }
            }
            group(Shipping)
            {
                CaptionML = ENU='Shipping',
                            FRA='Livraison';
                field("Ship-to Code";"Ship-to Code")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Ship-to Name";"Ship-to Name")
                {
                    Editable = false;
                }
                field("Ship-to Address";"Ship-to Address")
                {
                    Editable = false;
                }
                field("Ship-to Address 2";"Ship-to Address 2")
                {
                    Editable = false;
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Ship-to City";"Ship-to City")
                {
                    Editable = false;
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                    Editable = false;
                }
                field("Ship-to Phone";"Ship-to Phone")
                {
                    CaptionML = ENU='Ship-to Phone/Phone 2',
                                FRA='Tél./Tél. 2 destinataire';
                    Editable = false;
                }
                field("Ship-to Phone 2";"Ship-to Phone 2")
                {
                    Editable = false;
                }
                field("Ship-to E-Mail";"Ship-to E-Mail")
                {
                    Editable = false;
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
                    Importance = Promoted;
                }
            }
            group(Details)
            {
                CaptionML = ENU='Details',
                            FRA='Détails';
                field("Warning Status";"Warning Status")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Link Service to Service Item";"Link Service to Service Item")
                {
                    Editable = false;
                }
                field("Allocated Hours";"Allocated Hours")
                {
                    Editable = false;
                }
                field("Service Zone Code";"Service Zone Code")
                {
                    Editable = false;
                }
                field("Order Date";"Order Date")
                {
                    Editable = false;
                    Importance = Promoted;
                }
                field("Order Time";"Order Time")
                {
                    Editable = false;
                }
                field("Expected Finishing Date";"Expected Finishing Date")
                {
                    Editable = false;
                }
                field("Starting Date";"Starting Date")
                {
                    Editable = false;
                }
                field("Starting Time";"Starting Time")
                {
                    Editable = false;
                }
                field("Actual Response Time (Hours)";"Actual Response Time (Hours)")
                {
                    Editable = false;
                }
                field("Finishing Date";"Finishing Date")
                {
                    Editable = false;
                }
                field("Finishing Time";"Finishing Time")
                {
                    Editable = false;
                }
                field("Service Time (Hours)";"Service Time (Hours)")
                {
                    Editable = false;
                }
            }
            group("Foreign Trade")
            {
                CaptionML = ENU='Foreign Trade',
                            FRA='International';
                field("Currency Code";"Currency Code")
                {
                    Editable = false;
                }
                field("EU 3-Party Trade";"EU 3-Party Trade")
                {
                    Editable = false;
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
                                FRA='&Affectations';
                    Image = Allocations;
                    RunObject = Page 6001;
                    RunPageLink = Document Type=CONST(Order),
                                  Document No.=FIELD(Order No.);
                    RunPageView = SORTING(Status,Document Type,Document No.,Service Item Line No.,Allocation Date,Starting Time,Posted);
                }
                separator()
                {
                }
                action("S&tatistics")
                {
                    CaptionML = ENU='S&tatistics',
                                FRA='S&tatistiques';
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
                action("Service Document Lo&g")
                {
                    CaptionML = ENU='Service Document Lo&g',
                                FRA='&Journal document service';
                    Image = Log;

                    trigger OnAction();
                    var
                        ServDocLog : Record "5912";
                        TempServDocLog : Record "5912" temporary;
                    begin
                        TempServDocLog.RESET;
                        TempServDocLog.DELETEALL;

                        ServDocLog.RESET;
                        ServDocLog.SETRANGE("Document Type",ServDocLog."Document Type"::Shipment);
                        ServDocLog.SETRANGE("Document No.","No.");
                        IF ServDocLog.FINDSET THEN
                          REPEAT
                            TempServDocLog := ServDocLog;
                            TempServDocLog.INSERT;
                          UNTIL ServDocLog.NEXT = 0;

                        ServDocLog.RESET;
                        ServDocLog.SETRANGE("Document Type",ServDocLog."Document Type"::Order);
                        ServDocLog.SETRANGE("Document No.","Order No.");
                        IF ServDocLog.FINDSET THEN
                          REPEAT
                            TempServDocLog := ServDocLog;
                            TempServDocLog.INSERT;
                          UNTIL ServDocLog.NEXT = 0;

                        TempServDocLog.RESET;
                        TempServDocLog.SETCURRENTKEY("Change Date","Change Time");
                        TempServDocLog.ASCENDING(FALSE);

                        PAGE.RUN(0,TempServDocLog);
                    end;
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
                Visible = true;

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

    trigger OnFindRecord(Which : Text) : Boolean;
    begin
        IF FIND(Which) THEN
          EXIT(TRUE);
        SETRANGE("No.");
        EXIT(FIND(Which));
    end;

    trigger OnModifyRecord() : Boolean;
    begin
        CODEUNIT.RUN(CODEUNIT::"Shipment Header - Edit",Rec);
        EXIT(FALSE);
    end;

    trigger OnOpenPage();
    begin
        SetSecurityFilterOnRespCenter;
    end;

    var
        ServShptHeader : Record "5990";
}

