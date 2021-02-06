page 60361 "Cmd Urgent pour Succ"
{
    DeleteAllowed = true;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Table60094;
    SourceTableView = WHERE(Selectionner=FILTER(No),
                            Status Ligne=FILTER(<>Annuler par magasinier));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Selectionner;Selectionner)
                {
                    CaptionML = ENU='Valider',
                                FRA='Valider';
                }
                field("Entry no.";"Entry no.")
                {
                }
                field("No. Document";"No. Document")
                {
                }
                field("Type Commande";"Type Commande")
                {
                }
                field(Société;Société)
                {
                }
                field(Client;Client)
                {
                }
                field("Nom Client";"Nom Client")
                {
                }
                field("Article No.";"Article No.")
                {
                }
                field(Qté;Qté)
                {
                }
                field("Date Comptabilisation";"Date Comptabilisation")
                {
                }
                field("No. Cmd Achat";"No. Cmd Achat")
                {
                }
                field(Description;Description)
                {
                }
                field("Product Code";"Product Code")
                {
                }
                field("Type Document";"Type Document")
                {
                }
                field("No Ligne Cmd Achat";"No Ligne Cmd Achat")
                {
                }
                field("Type Cmd Achat";"Type Cmd Achat")
                {
                }
                field("Type Transport";"Type Transport")
                {
                }
                field("Type Order";"Type Order")
                {
                }
                field("Type FD";"Type FD")
                {
                }
                field("No Ligne Cmd Vente";"No Ligne Cmd Vente")
                {
                }
                field("Centre de gestion Vente";"Centre de gestion Vente")
                {
                }
                field("No Arrivage";"No Arrivage")
                {
                }
                field("No colis";"No colis")
                {
                }
                field("No Facture";"No Facture")
                {
                }
                field("Date Facture";"Date Facture")
                {
                }
                field("Date de Reception Prevu";"Date de Reception Prevu")
                {
                }
                field("No. Reception";"No. Reception")
                {
                }
                field("No. Reception Enreg.";"No. Reception Enreg.")
                {
                }
                field("No Commande Achat";"No Commande Achat")
                {
                }
                field(Stock;Stock)
                {
                }
                field("Date Demmande";"Date Demmande")
                {
                }
                field("Status Ligne";"Status Ligne")
                {
                }
                field(Motif;Motif)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Item)
            {
                CaptionML = ENU='Item',
                            FRA='Article';
                Image = DataEntry;
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
                    begin
                        //<< CT16V0002 ZMN 28/07/2016
                        CLEAR(LPagItemAvailability);
                        LCUItemavailability.FctStartSearchForItem("Article No.");
                        TotalStock :=LCUItemavailability.FctGetTotalStock;
                        TotalQtyCmdAchat :=LCUItemavailability.FctGetTotalQtyCmdAchat;
                        TotalQtyCmdVente :=LCUItemavailability.FctGetTotalQtyCmdVente;
                        TotalQtyCmdService:=LCUItemavailability.FctGetTotalQtyCmdService;
                        TotalQtyReservAchat:=LCUItemavailability.FctGetTotalQtyReservAchat;
                        TotalQtyReserStock:=LCUItemavailability.FctGetTotalQtyReservStoick;
                        TotalQtyStockDispo := LCUItemavailability.FctGetTotalStockDispo;
                        //TotalQtyStockDispoProjeté := LCUItemavailability.FctGetTotalStockDispoProjete;
                        //TotalQtyDevis
                        TotalQtyTransfer := LCUItemavailability.FctGetTotalTransfer;
                        TotalQtyTransit := LCUItemavailability.FctGetTotalTransit;
                        LRecAvailibilityItem.SETRANGE("Item No.","Article No.");//
                        LPagItemAvailability.LOOKUPMODE(TRUE);
                        LPagItemAvailability.SETTABLEVIEW(LRecAvailibilityItem);
                        LPagItemAvailability.SETRECORD(LRecAvailibilityItem);
                        LPagItemAvailability.FctSetTotal(TotalStock ,TotalQtyCmdAchat ,TotalQtyCmdVente ,TotalQtyCmdService ,TotalQtyReservAchat,TotalQtyReserStock
                                                         ,TotalQtyStockDispo,0,TotalQtyTransit,TotalQtyTransfer,0,0,0);

                        IF LPagItemAvailability.RUNMODAL = ACTION::LookupOK THEN
                            LPagItemAvailability.GETRECORD(LRecAvailibilityItem);

                        //>> CT16V0002 ZMN 28/07/2016
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        IF UserMgt.GetSalesFilter <> '' THEN
          BEGIN
            FILTERGROUP(2);
            SETRANGE("Centre de gestion Vente",UserMgt.GetSalesFilter);
            FILTERGROUP(0);
          END;
    end;

    var
        UserMgt : Codeunit "5700";
        TotalStock : Decimal;
        TotalQtyCmdAchat : Decimal;
        TotalQtyCmdVente : Decimal;
        TotalQtyCmdService : Decimal;
        TotalQtyReservAchat : Decimal;
        TotalQtyReserStock : Decimal;
        TotalQtyStockDispo : Decimal;
        TotalQtyTransfer : Decimal;
        TotalQtyTransit : Decimal;
}

