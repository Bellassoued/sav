page 60369 "Posted Sales Credit MemosCORR"
{
    // version NAVW19.00,CT16V001,CT16V002

    //  CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Posted Sales Credit Memos',
                FRA='Avoirs vente enregistrés';
    CardPageID = "Posted Sales Credit Memo";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData 114=rm;
    PromotedActionCategoriesML = ENU='New,Process,Report,Cr. Memo',
                                 FRA='Nouveau,Traitement,État,Avoir';
    SourceTable = Table114;

    layout
    {
        area(content)
        {
            repeater()
            {
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
                field("Order Type";"Order Type")
                {
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
                field("Applies-to Doc. Type";"Applies-to Doc. Type")
                {
                    Visible = false;
                }
                field("Document Exchange Status";"Document Exchange Status")
                {
                    StyleExpr = DocExchStatusStyle;

                    trigger OnDrillDown();
                    begin
                        //DocExchStatusDrillDown;
                    end;
                }
                field("Discount Quarter";"Discount Quarter")
                {
                }
                field("User ID";"User ID")
                {
                }
                field("Discount Year";"Discount Year")
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
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
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
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page 398;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page 67;
                    RunPageLink = Document Type=CONST(Posted Credit Memo),
                                  No.=FIELD(No.);
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348=R;
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                    end;
                }
                action(IncomingDoc)
                {
                    AccessByPermission = TableData 130=R;
                    CaptionML = ENU='Incoming Document',
                                FRA='Document entrant';
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction();
                    var
                        IncomingDocument : Record "130";
                    begin
                        IncomingDocument.ShowCard("No.","Posting Date");
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
                    SalesCrMemoHeader : Record "114";
                begin
                    SalesCrMemoHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesCrMemoHeader);
                    SalesCrMemoHeader.SendRecords;
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
                    SalesCrMemoHeader : Record "114";
                begin
                    SalesCrMemoHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesCrMemoHeader);
                    SalesCrMemoHeader.PrintRecords(TRUE);
                end;
            }
            action("&Email")
            {
                CaptionML = ENU='&Email',
                            FRA='&E-mail';
                Image = Email;

                trigger OnAction();
                var
                    SalesCrMemoHeader : Record "114";
                begin
                    SalesCrMemoHeader := Rec;
                    CurrPage.SETSELECTIONFILTER(SalesCrMemoHeader);
                    SalesCrMemoHeader.EmailRecords(TRUE);
                end;
            }
            action("&Navigate")
            {
                CaptionML = ENU='&Navigate',
                            FRA='Na&viguer';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Category4;
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

    trigger OnAfterGetCurrRecord();
    begin
        DocExchStatusStyle := GetDocExchStatusStyle;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

    trigger OnAfterGetRecord();
    begin
        DocExchStatusStyle := GetDocExchStatusStyle;
    end;

    trigger OnOpenPage();
    begin
        SetSecurityFilterOnRespCenter;
        //<< CT16V002 ZM 13/06/2016
        IF RecGUserSetup.GET(USERID) THEN
            FctGetUserFilter(RecGUserSetup."User ID");
        //>> CT16V002 ZM 13/06/2016
    end;

    var
        DocExchStatusStyle : Text;
        RecGUserSetup : Record "91";
}

