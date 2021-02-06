page 50039 "Posted Transfer Shipments vers"
{
    // version NAVW17.00

    CaptionML = ENU='Posted Transfer Shipments',
                FRA='Expéditions transfert enreg.';
    CardPageID = "Posted Transfer Shipment";
    Editable = false;
    PageType = List;
    SourceTable = Table5744;

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
                field("Posting Date";"Posting Date")
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Visible = false;
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
                field("Receipt Date";"Receipt Date")
                {
                    Visible = false;
                }
                field("Transfer Order No.";"Transfer Order No.")
                {
                }
                field("Source Type";"Source Type")
                {
                }
                field("Source No";"Source No")
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
                    RunObject = Page 5756;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F7';
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 5750;
                    RunPageLink = Document Type=CONST(Posted Transfer Shipment),
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
                    CurrPage.SETSELECTIONFILTER(TransShptHeader);
                    TransShptHeader.PrintRecords(TRUE);
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

        //<< TRIUM RAD 17/03/2014 - Filtre par utilisateur par magasin
        FILTERGROUP(2);
        SETFILTER("Transfer-to Code",usermgt.GetUserLocationList(USERID));
        FILTERGROUP(0);
        //>> end Trim RAD addin
    end;

    var
        TransShptHeader : Record "5744";
        usermgt : Codeunit "5700";
}

