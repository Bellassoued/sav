page 70009 "Item Availability"
{
    Editable = false;
    PageType = List;
    SourceTable = Table70006;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Company Name";"Company Name")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Item No.";"Item No.")
                {
                    StyleExpr = LineColor;
                }
                field(Description;Description)
                {
                }
                field(Inventory;Inventory)
                {
                    StyleExpr = LineColor;
                }
                field("Qte Reserver";"Qte Reserver")
                {
                    StyleExpr = LineColor;
                }
                field("Qte Possible a demander";"Qte Possible a demander")
                {
                    StyleExpr = LineColor;
                }
                field("Stock Disponible";"Stock Disponible")
                {
                    StyleExpr = LineColor;
                }
                field("Stock Projeté Dispo.";"Stock Projeté Dispo.")
                {
                    StyleExpr = LineColor;
                }
                field("Qty. on Purch. Orders";"Qty. on Purch. Orders")
                {
                    StyleExpr = LineColor;
                }
                field("Qty En Transit";"Qty En Transit")
                {
                    StyleExpr = LineColor;
                }
                field("Qty. on Orders";"Qty. on Orders")
                {
                    StyleExpr = LineColor;
                }
                field("Qty. on Service Orders";"Qty. on Service Orders")
                {
                    StyleExpr = LineColor;
                }
                field("Qty En Transfer";"Qty En Transfer")
                {
                    StyleExpr = LineColor;
                }
                field("Qty. on Quotes";"Qty. on Quotes")
                {
                    StyleExpr = LineColor;
                }
                field("Reserved Qty. on Inventory";"Reserved Qty. on Inventory")
                {
                    Visible = false;
                }
                field("Reserved Qty. on Purch. Orders";"Reserved Qty. on Purch. Orders")
                {
                    Visible = false;
                }
                field("Base Unit of Measure";"Base Unit of Measure")
                {
                }
                field("Unit Price";"Unit Price")
                {
                }
                field("Qty à demander";"Qty à demander")
                {
                }
                field("No. Ligne commande encours";"No. Ligne commande encours")
                {
                }
                field("No. commande encours";"No. commande encours")
                {
                }
                field("Demander pièce";"Demander pièce")
                {
                }
                field("Entry No. Ach. Trans";"Entry No. Ach. Trans")
                {
                }
                field("Sales Order Location Code";"Sales Order Location Code")
                {
                }
            }
            group()
            {
                fixed()
                {
                    group("Account Name")
                    {
                        CaptionML = ENU='Account Name',
                                    FRA='Total stock';
                        field(TotalStock;TotalStock)
                        {
                            Editable = false;
                        }
                    }
                    group("Total Balance")
                    {
                        CaptionML = ENU='Total Balance',
                                    FRA='Total Qty Stock Disponible';
                        field(TotalQtyStockDispo;TotalQtyStockDispo)
                        {
                            AutoFormatType = 1;
                            Editable = false;
                        }
                    }
                    group("Total Balance")
                    {
                        CaptionML = ENU='Total Balance',
                                    FRA='Total Qty Stock Projeté Disponible';
                        field(TotalQtyStockDispoProjeté;TotalQtyStockDispoProjeté)
                        {
                            AutoFormatType = 1;
                            Editable = false;
                        }
                    }
                    group("Bal. Account Name")
                    {
                        CaptionML = ENU='Bal. Account Name',
                                    FRA='Total Qty Sur Cmd Achat';
                        field(TotalQtyCmdAchat;TotalQtyCmdAchat)
                        {
                            Editable = false;
                        }
                    }
                    group(Balance)
                    {
                        CaptionML = ENU='Balance',
                                    FRA='Total Qty En Transit';
                        field(TotalQtyTransit;TotalQtyTransit)
                        {
                            AutoFormatType = 1;
                            Editable = false;
                        }
                    }
                    group(Balance)
                    {
                        CaptionML = ENU='Balance',
                                    FRA='Total Qty Cmd Vente';
                        field(TotalQtyCmdVente;TotalQtyCmdVente)
                        {
                            AutoFormatType = 1;
                            Editable = false;
                        }
                    }
                    group("Total Balance")
                    {
                        CaptionML = ENU='Total Balance',
                                    FRA='Total Qty Sur Service';
                        field(TotalQtyCmdService;TotalQtyCmdService)
                        {
                            AutoFormatType = 1;
                            Editable = false;
                        }
                    }
                    group("Total Balance")
                    {
                        CaptionML = ENU='Total Balance',
                                    FRA='Total Qty En Transfer';
                        field(TotalQtyTransfer;TotalQtyTransfer)
                        {
                            AutoFormatType = 1;
                            Editable = false;
                        }
                    }
                    group("Total Balance")
                    {
                        CaptionML = ENU='Total Balance',
                                    FRA='Total Qty En Devis';
                        field(TotalQtyDevis;TotalQtyDevis)
                        {
                            AutoFormatType = 1;
                            Editable = false;
                        }
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Acheminements tranfert pièce")
            {
                Image = TileCamera;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 70022;
                RunPageLink = No. commande vente=FIELD(No. commande encours);
            }
            action("Proposer acheminement")
            {
                Image = Position;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    ERROR('idée à développer');
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        IF "Qte Possible a demander" <= 0  THEN
          LineColor := 'Unfavorable'
          ELSE
            LineColor := 'Favorable';
    end;

    trigger OnClosePage();
    begin
        //ADD KK 17082016
        AvailibilityItem.RESET;
        AvailibilityItem.DELETEALL;
    end;

    trigger OnOpenPage();
    begin
        //SM 270917 Pas tres jolie dépannage
        IF FINDLAST THEN
          SETRANGE("Item No.","Item No.");
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        DELETEALL;
    end;

    var
        TXT50000 : Label 'Il n''y a rien à demander';
        TotalStock : Decimal;
        TotalQtyCmdAchat : Decimal;
        TotalQtyCmdVente : Decimal;
        TotalQtyCmdService : Decimal;
        TotalQtyReservAchat : Decimal;
        TotalQtyReserStock : Decimal;
        TotalQtyStockDispo : Decimal;
        "TotalQtyStockDispoProjeté" : Decimal;
        TotalQtyDevis : Decimal;
        TotalQtyTransfer : Decimal;
        TotalQtyTransit : Decimal;
        LineColor : Text;
        AvailibilityItem : Record "70006";
        DecReserver : Decimal;
        DecPossibledemande : Decimal;

    procedure FctSetTotal(PTotalStock : Decimal;PTotalQtyCmdAchat : Decimal;PTotalQtyCmdVente : Decimal;PTotalQtyCmdService : Decimal;PTotalQtyReservAchat : Decimal;PTotalQtyReserStock : Decimal;PTotalStockDispo : Decimal;"PTotalStockDispoProjeté" : Decimal;PTotalTransit : Decimal;PTotalTransfer : Decimal;PTotalQtyDevis : Decimal;PDecreserver : Decimal;PDecPossibleDemande : Decimal);
    begin
        TotalStock:=PTotalStock;
        TotalQtyCmdAchat:=PTotalQtyCmdAchat;
        TotalQtyCmdVente:=PTotalQtyCmdVente;
        TotalQtyCmdService:=PTotalQtyCmdService;
        TotalQtyReservAchat:=PTotalQtyReservAchat;
        TotalQtyReserStock:=PTotalQtyReserStock;
        TotalQtyStockDispo := PTotalStockDispo;
        TotalQtyStockDispoProjeté :=PTotalStockDispoProjeté;
        TotalQtyTransit := PTotalTransit;
        TotalQtyTransfer := PTotalTransfer;
        TotalQtyDevis := PTotalQtyDevis;
        DecPossibledemande := PDecPossibleDemande;
        DecReserver   := PDecreserver;
    end;
}

