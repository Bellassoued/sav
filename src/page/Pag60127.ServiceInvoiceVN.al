page 60127 "Service Invoice VN"
{
    // version NAVW17.10

    CaptionML = ENU='Service Invoice',
                FRA='Facture service';
    PageType = Document;
    PopulateAllFields = true;
    RefreshOnActivate = true;
    SourceTable = Table5900;
    SourceTableView = WHERE(Document Type=FILTER(Invoice));

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

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field("Customer No.";"Customer No.")
                {

                    trigger OnValidate();
                    begin
                        CustomerNoOnAfterValidate;
                    end;
                }
                field("Contact No.";"Contact No.")
                {

                    trigger OnValidate();
                    begin
                        IF GETFILTER("Contact No.") = xRec."Contact No." THEN
                          IF "Contact No." <> xRec."Contact No." THEN
                            SETRANGE("Contact No.");
                    end;
                }
                field(Name;Name)
                {
                }
                field(Address;Address)
                {
                }
                field("Address 2";"Address 2")
                {
                }
                field("Post Code";"Post Code")
                {
                }
                field(City;City)
                {
                }
                field("Contact Name";"Contact Name")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {

                    trigger OnValidate();
                    begin
                        SalespersonCodeOnAfterValidate;
                    end;
                }
                field("Responsibility Center";"Responsibility Center")
                {

                    trigger OnValidate();
                    begin
                        ResponsibilityCenterOnAfterVal;
                    end;
                }
                field("Assigned User ID";"Assigned User ID")
                {
                }
                field(Timbre;Timbre)
                {
                }
            }
            part(ServLines;5934)
            {
                SubPageLink = Document No.=FIELD(No.);
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {

                    trigger OnValidate();
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No.";"Bill-to Contact No.")
                {
                }
                field("Bill-to Name";"Bill-to Name")
                {
                }
                field("Bill-to Address";"Bill-to Address")
                {
                }
                field("Bill-to Address 2";"Bill-to Address 2")
                {
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                }
                field("Bill-to City";"Bill-to City")
                {
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {

                    trigger OnValidate();
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                }
                field("Due Date";"Due Date")
                {
                }
                field("Payment Discount %";"Payment Discount %")
                {
                }
                field("Pmt. Discount Date";"Pmt. Discount Date")
                {
                }
                field("Payment Method Code";"Payment Method Code")
                {
                }
                field("Prices Including VAT";"Prices Including VAT")
                {

                    trigger OnValidate();
                    begin
                        PricesIncludingVATOnAfterValid;
                    end;
                }
            }
            group(Shipping)
            {
                CaptionML = ENU='Shipping',
                            FRA='Livraison';
                field("Ship-to Code";"Ship-to Code")
                {

                    trigger OnValidate();
                    begin
                        ShiptoCodeOnAfterValidate;
                    end;
                }
                field("Ship-to Name";"Ship-to Name")
                {
                }
                field("Ship-to Address";"Ship-to Address")
                {
                }
                field("Ship-to Address 2";"Ship-to Address 2")
                {
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                }
                field("Ship-to City";"Ship-to City")
                {
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                }
                field("Location Code";"Location Code")
                {
                }
            }
            group("Foreign Trade")
            {
                CaptionML = ENU='Foreign Trade',
                            FRA='International';
                field("Currency Code";"Currency Code")
                {

                    trigger OnAssistEdit();
                    begin
                        CLEAR(ChangeExchangeRate);
                        ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date");
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                          VALIDATE("Currency Factor",ChangeExchangeRate.GetParameter);
                          CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;
                }
                field("EU 3-Party Trade";"EU 3-Party Trade")
                {
                }
                field("Transaction Type";"Transaction Type")
                {
                }
                field("Transaction Specification";"Transaction Specification")
                {
                }
                field("Transport Method";"Transport Method")
                {
                }
                field("Exit Point";"Exit Point")
                {
                }
                field(Area;Area)
                {
                }
            }
        }
        area(factboxes)
        {
            part(;9082)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.);
                Visible = true;
            }
            part(;9084)
            {
                SubPageLink = No.=FIELD(Customer No.);
                Visible = false;
            }
            part(;9085)
            {
                SubPageLink = No.=FIELD(Customer No.);
                Visible = false;
            }
            part(;9086)
            {
                SubPageLink = No.=FIELD(Bill-to Customer No.);
                Visible = false;
            }
            part(;9088)
            {
                Provider = ServLines;
                SubPageLink = Document Type=FIELD(Document Type),
                              Document No.=FIELD(No.),
                              Line No.=FIELD(Line No.);
                Visible = false;
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
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    RunObject = Page 21;
                    RunPageLink = No.=FIELD(Customer No.);
                    ShortCutKey = 'Shift+F7';
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
                                FRA='A&xes analytiques';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDocDim;
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
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("Calculate Invoice Discount")
                {
                    CaptionML = ENU='Calculate &Invoice Discount',
                                FRA='C&alculer remise facture';
                    Image = CalculateInvoiceDiscount;

                    trigger OnAction();
                    begin
                        ApproveCalcInvDisc;
                    end;
                }
                separator()
                {
                }
                action("Get St&d. Service Codes")
                {
                    CaptionML = ENU='Get St&d. Service Codes',
                                FRA='Extraire codes prestation st&d';
                    Ellipsis = true;
                    Image = ServiceCode;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        StdServCode : Record "5996";
                    begin
                        StdServCode.InsertServiceLines(Rec);
                    end;
                }
            }
            group("P&osting")
            {
                CaptionML = ENU='P&osting',
                            FRA='&Validation';
                Image = Post;
                action("Test Report")
                {
                    CaptionML = ENU='Test Report',
                                FRA='Impression test';
                    Ellipsis = true;
                    Image = TestReport;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintServiceHeader(Rec);
                    end;
                }
                action(Post)
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

    trigger OnDeleteRecord() : Boolean;
    begin
        CurrPage.SAVERECORD;
        CLEAR(ServLogMgt);
        ServLogMgt.ServHeaderManualDelete(Rec);
        EXIT(ConfirmDeletion);
    end;

    trigger OnFindRecord(Which : Text) : Boolean;
    begin
        IF FIND(Which) THEN
          EXIT(TRUE);

        SETRANGE("No.");
        EXIT(FIND(Which));
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Responsibility Center" := UserMgt.GetServiceFilter;
        "Type Reception" := "Type Reception"::VN;
    end;

    trigger OnOpenPage();
    begin
        SetSecurityFilterOnRespCenter;
    end;

    var
        ChangeExchangeRate : Page "511";
        ReportPrint : Codeunit "228";
        UserMgt : Codeunit "5700";
        ServLogMgt : Codeunit "5906";

    local procedure ApproveCalcInvDisc();
    begin
        CurrPage.ServLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure CustomerNoOnAfterValidate();
    begin
        IF GETFILTER("Customer No.") = xRec."Customer No." THEN
          IF "Customer No." <> xRec."Customer No." THEN
            SETRANGE("Customer No.");
        CurrPage.UPDATE;
    end;

    local procedure SalespersonCodeOnAfterValidate();
    begin
        CurrPage.ServLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure ResponsibilityCenterOnAfterVal();
    begin
        CurrPage.ServLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure BilltoCustomerNoOnAfterValidat();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.UPDATE;
    end;

    local procedure PricesIncludingVATOnAfterValid();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShiptoCodeOnAfterValidate();
    begin
        CurrPage.UPDATE(FALSE);
    end;
}

