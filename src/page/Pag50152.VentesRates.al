page 50152 "Ventes Ratées"
{
    PageType = List;
    SourceTable = Table70096;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";"Entry No.")
                {
                }
                field("Document Type";"Document Type")
                {
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("No.";"No.")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field(Description;Description)
                {
                }
                field("Description 2";"Description 2")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Unit Price";"Unit Price")
                {
                }
                field("Entry Date";"Entry Date")
                {
                }
                field("Salesperson code";"Salesperson code")
                {
                }
                field(Inventory;Inventory)
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Order type";"Order type")
                {
                }
                field(MAD;MAD)
                {
                }
                field(ICC;ICC)
                {
                }
                field("Product Code";"Product Code")
                {
                }
                field("EPM Non Reorder Code";"EPM Non Reorder Code")
                {
                }
                field("Substitution codes";"Substitution codes")
                {
                }
                field("Not used anymore";"Not used anymore")
                {
                }
                field("Sub Supplier Code";"Sub Supplier Code")
                {
                }
                field("Controle technique";"Controle technique")
                {
                }
                field("Sur Commande";"Sur Commande")
                {
                }
                field("Stock Total";"Stock Total")
                {
                }
                field("Qté Manquante";"Qté Manquante")
                {
                }
                field("Valeur des Manquant";"Valeur des Manquant")
                {
                }
                field("Qté En Cmd Achat";"Qté En Cmd Achat")
                {
                }
                field(ETD;ETD)
                {
                }
                field(ETA;ETA)
                {
                }
                field("Qty. on Sales Order";"Qty. on Sales Order")
                {
                }
                field("No Facture";"No Facture")
                {
                }
                field("Date Facture";"Date Facture")
                {
                }
                field("No Facture Service";"No Facture Service")
                {
                }
                field("Date Facture Service";"Date Facture Service")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("availability item")
            {
                CaptionML = ENU='Item availability',
                            FRA='Disponibilité Article';
                Image = Accounts;
                Promoted = true;

                trigger OnAction();
                var
                    LCUItemavailability : Codeunit "70000";
                    LRecAvailibilityItem : Record "70006";
                    LPagItemAvailability : Page "70009";
                    TotalStock : Decimal;
                    TotalQtyCmdVente : Decimal;
                    TotalQtyCmdService : Decimal;
                    TotalQtyStockDispo : Decimal;
                    "TotalQtyStockDispoProjeté" : Decimal;
                    TotalQtyTransfer : Decimal;
                    TotalQtyTransit : Decimal;
                    TotalQtyCmdAchat : Decimal;
                    DecPossibleDemande : Decimal;
                    DecReserver : Decimal;
                begin
                    //<< CT16V0002 ZMN 28/07/2016
                    CLEAR(LPagItemAvailability);
                    LCUItemavailability.FctStartSearchForItem("No.");
                    TotalStock :=LCUItemavailability.FctGetTotalStock;
                    //TotalQtyCmdAchat :=LCUItemavailability.FctGetTotalQtyCmdAchat;
                    TotalQtyCmdVente :=LCUItemavailability.FctGetTotalQtyCmdVente;
                    TotalQtyCmdService:=LCUItemavailability.FctGetTotalQtyCmdService;
                    //TotalQtyReservAchat:=LCUItemavailability.FctGetTotalQtyReservAchat;
                    //TotalQtyReserStock:=LCUItemavailability.FctGetTotalQtyReservStoick;
                    TotalQtyStockDispo := LCUItemavailability.FctGetTotalStockDispo;
                    TotalQtyStockDispoProjeté := LCUItemavailability.FctGetTotalStockDispoProjete;
                    //TotalQtyDevis
                    TotalQtyTransfer := LCUItemavailability.FctGetTotalTransfer;
                    TotalQtyTransit := LCUItemavailability.FctGetTotalTransit;
                    DecPossibleDemande :=LCUItemavailability.FctCalcStockDispoByMagCentralOT("No.");
                    DecReserver := TotalStock -DecPossibleDemande;
                    LRecAvailibilityItem.SETRANGE("Item No.","No.");//
                    LPagItemAvailability.LOOKUPMODE(TRUE);
                    LPagItemAvailability.SETTABLEVIEW(LRecAvailibilityItem);
                    LPagItemAvailability.SETRECORD(LRecAvailibilityItem);
                    LPagItemAvailability.FctSetTotal(TotalStock ,TotalQtyCmdAchat ,TotalQtyCmdVente ,TotalQtyCmdService ,0,0
                                                     ,TotalQtyStockDispo,TotalQtyStockDispoProjeté,TotalQtyTransit,TotalQtyTransfer,0,DecPossibleDemande,DecReserver);
                    IF LPagItemAvailability.RUNMODAL = ACTION::LookupOK THEN
                        LPagItemAvailability.GETRECORD(LRecAvailibilityItem);

                    //>> CT16V0002 ZMN 28/07/2016
                end;
            }
        }
    }
}

