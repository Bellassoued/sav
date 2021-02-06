page 60149 "Transfer List de"
{
    // version NAVW17.00

    CaptionML = ENU='Transfer List',
                FRA='Liste de transfert';
    CardPageID = "Transfer Order";
    Editable = false;
    PageType = List;
    SourceTable = Table5740;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                }
                field("In-Transit Code";"In-Transit Code")
                {
                }
                field(Status;Status)
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
                field("Shipment Date";"Shipment Date")
                {
                    Visible = false;
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                    Visible = false;
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                    Visible = false;
                }
                field("Shipping Advice";"Shipping Advice")
                {
                    Visible = false;
                }
                field("Reception No";"Reception No")
                {
                }
                field("Source Type";"Source Type")
                {
                }
                field("Receipt Date";"Receipt Date")
                {
                    Visible = false;
                }
                field("Source No";"Source No")
                {
                }
                field(Retour;Retour)
                {
                    Style = Strong;
                    StyleExpr = TRUE;
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
            group("O&rder")
            {
                CaptionML = ENU='O&rder',
                            FRA='C&ommande';
                Image = "Order";
                action(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 5755;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 5750;
                    RunPageLink = Document Type=CONST(Transfer Order),
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
                        ShowDocDim;
                        CurrPage.SAVERECORD;
                    end;
                }
            }
            group(Documents)
            {
                CaptionML = ENU='Documents',
                            FRA='Documents';
                Image = Documents;
                action("S&hipments")
                {
                    CaptionML = ENU='S&hipments',
                                FRA='E&xpéditions';
                    Image = Shipment;
                    RunObject = Page 5752;
                    RunPageLink = Transfer Order No.=FIELD(No.);
                }
                action("Re&ceipts")
                {
                    CaptionML = ENU='Re&ceipts',
                                FRA='Ré&ceptions';
                    Image = PostedReceipts;
                    RunObject = Page 5753;
                    RunPageLink = Transfer Order No.=FIELD(No.);
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
                action("Whse. Shi&pments")
                {
                    CaptionML = ENU='Whse. Shi&pments',
                                FRA='E&xpéditions entrep.';
                    Image = Shipment;
                    RunObject = Page 7341;
                    RunPageLink = Source Type=CONST(5741),
                                  Source Subtype=CONST(0),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.);
                }
                action("&Whse. Receipts")
                {
                    CaptionML = ENU='&Whse. Receipts',
                                FRA='Ré&ceptions entrep.';
                    Image = Receipt;
                    RunObject = Page 7342;
                    RunPageLink = Source Type=CONST(5741),
                                  Source Subtype=CONST(1),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.);
                }
                action("In&vt. Put-away/Pick Lines")
                {
                    CaptionML = ENU='In&vt. Put-away/Pick Lines',
                                FRA='Lignes prélè&v./rangement stock';
                    Image = PickLines;
                    RunObject = Page 5774;
                    RunPageLink = Source Document=FILTER(Inbound Transfer|Outbound Transfer),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Document,Source No.,Location Code);
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

                trigger OnAction();
                var
                    DocPrint : Codeunit "229";
                begin
                    DocPrint.PrintTransferHeader(Rec);
                end;
            }
            group(Release)
            {
                CaptionML = ENU='Release',
                            FRA='Lancer';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    CaptionML = ENU='Re&lease',
                                FRA='&Lancer';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Codeunit 5708;
                    ShortCutKey = 'Ctrl+F9';
                }
                action("Reo&pen")
                {
                    CaptionML = ENU='Reo&pen',
                                FRA='&Rouvrir';
                    Image = ReOpen;

                    trigger OnAction();
                    var
                        ReleaseTransferDoc : Codeunit "5708";
                    begin
                        ReleaseTransferDoc.Reopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("Create Whse. S&hipment")
                {
                    CaptionML = ENU='Create Whse. S&hipment',
                                FRA='Créer e&xpédition entrepôt';
                    Image = NewShipment;

                    trigger OnAction();
                    var
                        GetSourceDocOutbound : Codeunit "5752";
                    begin
                        GetSourceDocOutbound.CreateFromOutbndTransferOrder(Rec);
                    end;
                }
                action("Create &Whse. Receipt")
                {
                    CaptionML = ENU='Create &Whse. Receipt',
                                FRA='Créer &réception entrepôt';
                    Image = NewReceipt;

                    trigger OnAction();
                    var
                        GetSourceDocInbound : Codeunit "5751";
                    begin
                        GetSourceDocInbound.CreateFromInbndTransferOrder(Rec);
                    end;
                }
                action("Create Inventor&y Put-away/Pick")
                {
                    CaptionML = ENU='Create Inventor&y Put-away/Pick',
                                FRA='Créer prélèv./rangement stoc&k';
                    Ellipsis = true;
                    Image = CreatePutawayPick;

                    trigger OnAction();
                    begin
                        CreateInvtPutAwayPick;
                    end;
                }
                action("Get Bin Content")
                {
                    CaptionML = ENU='Get Bin Content',
                                FRA='Extraire contenu emplacement';
                    Ellipsis = true;
                    Image = GetBinContent;

                    trigger OnAction();
                    var
                        BinContent : Record "7302";
                        GetBinContent : Report "7391";
                    begin
                        BinContent.SETRANGE("Location Code","Transfer-from Code");
                        GetBinContent.SETTABLEVIEW(BinContent);
                        GetBinContent.InitializeTransferHeader(Rec);
                        GetBinContent.RUNMODAL;
                    end;
                }
            }
            group("P&osting")
            {
                CaptionML = ENU='P&osting',
                            FRA='&Validation';
                Image = Post;
                action("P&ost")
                {
                    CaptionML = ENU='P&ost',
                                FRA='&Valider';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Codeunit 5706;
                    ShortCutKey = 'F9';
                }
                action("Post and &Print")
                {
                    CaptionML = ENU='Post and &Print',
                                FRA='Valider et i&mprimer';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Codeunit 5707;
                    ShortCutKey = 'Shift+F9';
                }
            }
        }
        area(reporting)
        {
            action("Inventory - Inbound Transfer")
            {
                CaptionML = ENU='Inventory - Inbound Transfer',
                            FRA='Stocks : Enlogement transfert';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 5702;
            }
        }
    }

    trigger OnOpenPage();
    begin
        //<< TRIUM RAD 17/03/2014 - Filtre par utilisateur par magasin
        FILTERGROUP(2);
        SETFILTER("Transfer-from Code",userMgt.GetUserLocationList(USERID));
        FILTERGROUP(0);
        //>> end Trim RAD addin
    end;

    var
        DimMgt : Codeunit "408";
        userMgt : Codeunit "5700";
}

