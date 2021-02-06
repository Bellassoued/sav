page 60102 "Sales Return Order Archive VN"
{
    // version SAV Automobile

    CaptionML = ENU='Sales Return Order Archive PR',
                FRA='Archives retours vente';
    DeleteAllowed = false;
    Editable = false;
    PageType = Document;
    SourceTable = Table5107;
    SourceTableView = WHERE(Document Type=CONST(Return Order));

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
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field("Sell-to Contact No.";"Sell-to Contact No.")
                {
                }
                field("Sell-to Customer Name";"Sell-to Customer Name")
                {
                }
                field("Sell-to Address";"Sell-to Address")
                {
                }
                field("Sell-to Address 2";"Sell-to Address 2")
                {
                }
                field("Sell-to Post Code";"Sell-to Post Code")
                {
                    CaptionML = ENU='Sell-to Post Code/City',
                                FRA='CP/Ville donneur d''ordre';
                }
                field("Sell-to City";"Sell-to City")
                {
                }
                field("Sell-to Contact";"Sell-to Contact")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Order Date";"Order Date")
                {
                }
                field("Document Date";"Document Date")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("Campaign No.";"Campaign No.")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Assigned User ID";"Assigned User ID")
                {
                }
                field(Status;Status)
                {
                }
            }
            part(SalesLinesArchive;60103)
            {
                SubPageLink = Document No.=FIELD(No.),
                              Doc. No. Occurrence=FIELD(Doc. No. Occurrence),
                              Version No.=FIELD(Version No.);
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
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
                    CaptionML = ENU='Bill-to Post Code/City',
                                FRA='CP/Ville';
                }
                field("Bill-to City";"Bill-to City")
                {
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                }
                field("Applies-to Doc. Type";"Applies-to Doc. Type")
                {
                }
                field("Applies-to Doc. No.";"Applies-to Doc. No.")
                {
                }
                field("Applies-to ID";"Applies-to ID")
                {
                }
                field("Prices Including VAT";"Prices Including VAT")
                {

                    trigger OnValidate();
                    begin
                        PricesIncludingVATOnAfterValid;
                    end;
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                }
            }
            group(Shipping)
            {
                CaptionML = ENU='Shipping',
                            FRA='Livraison';
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
                    CaptionML = ENU='Ship-to Post Code/City',
                                FRA='CP/Ville destinataire';
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
                field("Shipment Date";"Shipment Date")
                {
                }
            }
            group("Foreign Trade")
            {
                CaptionML = ENU='Foreign Trade',
                            FRA='International';
                field("Currency Code";"Currency Code")
                {
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
            group(Version)
            {
                CaptionML = ENU='Version',
                            FRA='Version';
                field("Version No.";"Version No.")
                {
                }
                field("Archived By";"Archived By")
                {
                }
                field("Date Archived";"Date Archived")
                {
                }
                field("Time Archived";"Time Archived")
                {
                }
                field("Interaction Exist";"Interaction Exist")
                {
                }
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
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    RunObject = Page 21;
                    RunPageLink = No.=FIELD(Sell-to Customer No.);
                    ShortCutKey = 'Shift+F7';
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
                action(Print)
                {
                    CaptionML = ENU='Print',
                                FRA='Imprimer';
                    Image = Print;

                    trigger OnAction();
                    begin
                        DocPrint.PrintSalesHeaderArch(Rec);
                    end;
                }
            }
        }
        area(processing)
        {
            action(Restore)
            {
                CaptionML = ENU='&Restore',
                            FRA='&Restaurer';
                Ellipsis = true;
                Image = Restore;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    ArchiveManagement : Codeunit "5063";
                begin
                    ArchiveManagement.RestoreSalesDocument(Rec);
                end;
            }
        }
    }

    var
        DocPrint : Codeunit "229";

    local procedure PricesIncludingVATOnAfterValid();
    begin
        CurrPage.UPDATE;
    end;
}

