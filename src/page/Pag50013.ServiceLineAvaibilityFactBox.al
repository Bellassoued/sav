page 50013 "Service Line AvaibilityFactBox"
{
    // version NAVW19.00,CT16V001

    CaptionML = ENU='Sales Line Details',
                FRA='Détails ligne vente';
    PageType = CardPart;
    SourceTable = 5902;

    layout
    {
        area(content)
        {
            field(ItemNo;ShowNo)
            {
                CaptionML = ENU='Item No.',
                            FRA='N° article';
                Lookup = false;

                trigger OnDrillDown();
                begin
                    //KT MIG 90 TO 110 ServiceInfoPaneManagement.LookupItem(Rec);
                    //N'existe pas dans codeunit STD
                end;
            }
            field("Required Quantity";"Outstanding Quantity" - "Reserved Quantity")
            {
                CaptionML = ENU='Required Quantity',
                            FRA='Quantité requise';
                DecimalPlaces = 0:5;
            }
            group(Item)
            {
                CaptionML = ENU='Item',
                            FRA='Article';
                field(UnitofMeasureCode;"Unit of Measure Code")
                {
                    CaptionML = ENU='Unit of Measure Code',
                                FRA='Code unité';
                }
                field("Qty. per Unit of Measure";"Qty. per Unit of Measure")
                {
                    CaptionML = ENU='Qty. per Unit of Measure',
                                FRA='Quantité par unité';
                }
            }
            group("Qty Ordered")
            {
                Caption = 'Quantité Demandé';
                Visible = CurrCompany;
            }
            field("Ordered Qty";"Ordered Qty")
            {
                Caption = 'Qté Demandée';
                Visible = CurrCompany;
            }
            group("Transfert Order")
            {
                Caption = 'Ordre de transfert';
                Visible = CurrCompany;
            }
            field("Qty TransferOrder To Receive";"Qty TransferOrder To Receive")
            {
                Caption = 'Qté Ordre de Transfert à Réceptionner';
                Visible = CurrCompany;
            }
            field("Qty Received";"Qty Received")
            {
                Caption = 'Qté Reçue';
                Style = StrongAccent;
                StyleExpr = TRUE;
                Visible = CurrCompany;
            }
            field("Qty Shipped";"Qty Shipped")
            {
                Caption = 'Qté Expediée';
                Style = StrongAccent;
                StyleExpr = TRUE;
                Visible = CurrCompany;
            }
            group("Return Transfert Order")
            {
                Caption = 'Ordre de transfert Retour';
                Visible = CurrCompany;
            }
            field("Qty TransferOrder To Ship";"Qty TransferOrder To Ship")
            {
                Caption = 'Qté Ordre de Transfert à Expédier';
                Visible = CurrCompany;
            }
            field("Qty Received Returned";"Qty Received Returned")
            {
                Caption = 'Qté Réceptionnée Retour';
                Visible = CurrCompany;
            }
            field("Qty Shipped Returned";"Qty Shipped Returned")
            {
                Caption = 'Qté Expediée Retour';
                Visible = CurrCompany;
            }
            group("Qty Ordered2")
            {
                Caption = 'Quantité Demandé';
                Visible = OtherCompany;
            }
            field("Ordered Qty2";ConsoOrderedQty)
            {
                Caption = 'Qté Demandée';
                Visible = OtherCompany;
            }
            group("Transfert Order2")
            {
                Caption = 'Ordre de transfert';
                Visible = OtherCompany;
            }
            field("Qty TransferOrder To Receive2";ConsoQtyTransferOrderToReceive)
            {
                Caption = 'Qté Ordre de Transfert à Réceptionner';
                Visible = OtherCompany;
            }
            field("Qty Received2";ConsoQtyReceived)
            {
                Caption = 'Qté Reçue';
                Style = StrongAccent;
                StyleExpr = TRUE;
                Visible = OtherCompany;
            }
            field("Qty Shipped2";ConsoQtyShipped)
            {
                Caption = 'Qté Expediée';
                Style = StrongAccent;
                StyleExpr = TRUE;
                Visible = OtherCompany;
            }
            group("Return Transfert Order2")
            {
                Caption = 'Ordre de transfert Retour';
                Visible = OtherCompany;
            }
            field("Qty TransferOrder To Ship2";ConsoQtyTransferOrderToShip)
            {
                Caption = 'Qté Ordre de Transfert à Expédier';
                Visible = OtherCompany;
            }
            field("Qty Received Returned2";ConsoQtyReceivedReturned)
            {
                Caption = 'Qté Réceptionnée Retour';
                Visible = OtherCompany;
            }
            field("Qty Shipped Returned2";ConsoQtyShippedReturned)
            {
                Caption = 'Qté Expediée Retour';
                Visible = OtherCompany;
            }
            group("Sous Traitance")
            {
                field("Qty Purchase Line";"Qty Purchase Line")
                {
                }
                field("Qty Received Purchase Line";"Qty Received Purchase Line")
                {
                    Visible = false;
                }
                field("Qty Received Purchase";"Qty Received Purchase")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    begin
        //<<CT16V001 ZM 15/05/2016
        CalcTransfertOrderQty;
        //>>CT16V001 ZM 15/05/2016
    end;

    trigger OnAfterGetRecord();
    begin
        CALCFIELDS("Reserved Quantity");
        //<<CT16V001 ZM 15/05/2016
        CalcTransfertOrderQty;
        //>>CT16V001 ZM 15/05/2016
        RecInventorySetup.GET;
        IF RecInventorySetup."Socité stock consolidé" <> COMPANYNAME THEN BEGIN
          CurrCompany   := FALSE;
          OtherCompany  := TRUE;
        END ELSE BEGIN
          CurrCompany   := TRUE;
          OtherCompany  := FALSE;
        END;
    end;

    trigger OnOpenPage();
    begin
        //<<CT16V001 ZM 15/05/2016
        CalcTransfertOrderQty;
        RecInventorySetup.GET;
        IF RecInventorySetup."Socité stock consolidé" <> COMPANYNAME THEN BEGIN
          CurrCompany   := FALSE;
          OtherCompany  := TRUE;
        END ELSE BEGIN
          CurrCompany   := TRUE;
          OtherCompany  := FALSE;
        END;
        //>>CT16V001 ZM 15/05/2016
    end;

    var
        SalesHeader : Record "36";
        SalesPriceCalcMgt : Codeunit "7000";
        ServiceInfoPaneManagement : Codeunit "5972";
        ItemAvailFormsMgt : Codeunit "353";
        RecGInventorySetup : Record "313";
        ConsoOrderedQty : Decimal;
        ConsoQtyTransferOrderToReceive : Decimal;
        ConsoQtyReceived : Decimal;
        ConsoQtyShipped : Decimal;
        ConsoQtyTransferOrderToShip : Decimal;
        ConsoQtyReceivedReturned : Decimal;
        ConsoQtyShippedReturned : Decimal;
        RecInventorySetup : Record "313";
        CurrCompany : Boolean;
        OtherCompany : Boolean;

    local procedure ShowNo() : Code[20];
    begin
        IF Type <> Type::Item THEN
          EXIT('');
        EXIT("No.");
    end;

    procedure CalcTransfertOrderQty();
    var
        RecServiceLineTMP : Record "5902" temporary;
    begin
        //<<CT16V001 ZM 15/05/2016
        RecGInventorySetup.GET;
        IF RecGInventorySetup."Socité stock consolidé" = COMPANYNAME THEN BEGIN
          CalcOrderedQty;
          ConsoOrderedQty                := "Ordered Qty";
          ConsoQtyTransferOrderToReceive := "Qty TransferOrder To Receive";
          ConsoQtyReceived               := "Qty Received";
          ConsoQtyShipped                := "Qty Shipped";
          ConsoQtyTransferOrderToShip    := "Qty TransferOrder To Ship";
          ConsoQtyReceivedReturned       := "Qty Received Returned";
          ConsoQtyShippedReturned        := "Qty Shipped Returned";

        END ELSE BEGIN
          CalcOrderedQty;
          CreateTempSalesLigneForOtherCompany(RecServiceLineTMP);
          RecServiceLineTMP.CALCFIELDS("Qty TransferOrder To Receive","Qty Received","Qty Shipped","Qty TransferOrder To Ship",
           "Qty Received Returned","Qty Shipped Returned");
           CALCFIELDS("Qty TransferOrder To Receive","Qty Received","Qty Shipped","Qty TransferOrder To Ship",
           "Qty Received Returned","Qty Shipped Returned");
          ConsoOrderedQty                := "Ordered Qty";
          ConsoQtyTransferOrderToReceive := RecServiceLineTMP."Qty TransferOrder To Receive" + "Qty TransferOrder To Receive";
          ConsoQtyReceived               := RecServiceLineTMP."Qty Received" + "Qty Received";
          ConsoQtyShipped                := RecServiceLineTMP."Qty Shipped" + "Qty Shipped";
          ConsoQtyTransferOrderToShip    := RecServiceLineTMP."Qty TransferOrder To Ship" + "Qty TransferOrder To Ship";
          ConsoQtyReceivedReturned       := RecServiceLineTMP."Qty Received Returned" + "Qty Received Returned";
          ConsoQtyShippedReturned        := RecServiceLineTMP."Qty Shipped Returned" + "Qty Shipped Returned";

        END;
        //>>CT16V001 ZM 15/05/2016
    end;
}

