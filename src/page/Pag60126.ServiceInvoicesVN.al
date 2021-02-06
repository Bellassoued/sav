page 60126 "Service Invoices VN"
{
    // version NAVW17.10

    CaptionML = ENU='Service Invoices',
                FRA='Factures service';
    CardPageID = "Service Invoice";
    Editable = false;
    PageType = List;
    SourceTable = Table5900;
    SourceTableView = WHERE(Document Type=CONST(Invoice),
                            Type Reception=CONST(VN));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field(Status;Status)
                {
                }
                field("Order Date";"Order Date")
                {
                }
                field("Order Time";"Order Time")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Ship-to Code";"Ship-to Code")
                {
                }
                field(Name;Name)
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field(Priority;Priority)
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(1);
                    end;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        DimMgt.LookupDimValueCodeNoUpdate(2);
                    end;
                }
                field("Assigned User ID";"Assigned User ID")
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
                field("Payment Method Code";"Payment Method Code")
                {
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part(;9082)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.),
                              Date Filter=FIELD(Date Filter);
                Visible = true;
            }
            part(;9084)
            {
                SubPageLink = No.=FIELD(Customer No.),
                              Date Filter=FIELD(Date Filter);
                Visible = true;
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
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';

                    trigger OnAction();
                    begin
                        CalcInvDiscForHeader;
                        COMMIT;
                        PAGE.RUNMODAL(PAGE::"Service Statistics",Rec);
                    end;
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 5911;
                    RunPageLink = Table Name=CONST(Service Header),
                                  Table Subtype=FIELD(Document Type),
                                  No.=FIELD(No.),
                                  Type=CONST(General);
                }
                action("&Dimensions")
                {
                    CaptionML = ENU='&Dimensions',
                                FRA='&Axes analytiques';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDocDim;
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
                        ServDocLog.SETRANGE("Document Type",ServDocLog."Document Type"::Invoice);
                        ServDocLog.SETRANGE("Document No.","No.");
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
            }
        }
        area(processing)
        {
            group("P&osting")
            {
                CaptionML = ENU='P&osting',
                            FRA='&Validation';
                Image = Post;
                action("P&ost")
                {
                    CaptionML = ENU='P&ost',
                                FRA='&Valider';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    var
                        ServPostYesNo : Codeunit "5981";
                    begin
                        ServPostYesNo.PostDocument(Rec);
                    end;
                }
                action("Post and &Print")
                {
                    CaptionML = ENU='Post and &Print',
                                FRA='Valider et i&mprimer';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction();
                    var
                        ServPostPrint : Codeunit "5982";
                    begin
                        ServPostPrint.PostDocument(Rec);
                    end;
                }
                action("Post &Batch")
                {
                    CaptionML = ENU='Post &Batch',
                                FRA='Valider par l&ot';
                    Ellipsis = true;
                    Image = PostBatch;

                    trigger OnAction();
                    begin
                        REPORT.RUNMODAL(REPORT::"Batch Post Service Invoices",TRUE,TRUE,Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        SetSecurityFilterOnRespCenter;
    end;

    var
        DimMgt : Codeunit "408";
}

