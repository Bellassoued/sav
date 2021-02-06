page 60027 "Sales Order Subform PR"
{
    // version SAV Automobile,MAZDA06,DM

    AutoSplitKey = true;
    CaptionML = ENU='Lines PR',
                FRA='Lignes PR';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = Table37;
    SourceTableView = SORTING(Document Type,Document No.,Line No.)
                      WHERE(Document Type=FILTER(Order));

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Type;Type)
                {

                    trigger OnValidate();
                    begin
                        TypeOnAfterValidate;
                        NoOnAfterValidate;
                    end;
                }
                field("No.";"No.")
                {
                    StyleExpr = LineColor;

                    trigger OnValidate();
                    var
                        LCduItemavailability : Codeunit "70000";
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;

                        //DecGStock :=  LCduItemavailability.FctCalcTotalMagReservation("No.") ;
                        //DecStockTotalDispo := LCduItemavailability.FctCalcStockDispoTotal("No.");
                        //DecStockTotalDispoProj := LCduItemavailability.FctCalcStockProjeterDispoTotal("No.");
                        DecQtyDispoAcmD := LCduItemavailability.FctCalcStockDispoByMagCentralOT("No.");
                        LineColor:= '';
                        IF DecQtyDispoAcmD < 0  THEN
                          LineColor := 'Unfavorable'
                          ELSE
                            LineColor := '';
                    end;
                }
                field("Execlut Controle Prix";"Execlut Controle Prix")
                {
                    Editable = BolExlContPrix;
                    Visible = BolExlContPrix;
                }
                field("Pièce Urgent";"Pièce Urgent")
                {
                }
                field("Sur Commande (urgent)";"Sur Commande (urgent)")
                {
                }
                field("Cross-Reference No.";"Cross-Reference No.")
                {
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        CrossReferenceNoLookUp;
                        InsertExtendedText(FALSE);
                        NoOnAfterValidate;
                    end;

                    trigger OnValidate();
                    begin
                        CrossReferenceNoOnAfterValidat;
                        NoOnAfterValidate;
                    end;
                }
                field("IC Partner Code";"IC Partner Code")
                {
                    Visible = false;
                }
                field("IC Partner Ref. Type";"IC Partner Ref. Type")
                {
                    Visible = false;
                }
                field("IC Partner Reference";"IC Partner Reference")
                {
                    Visible = false;
                }
                field("Variant Code";"Variant Code")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        VariantCodeOnAfterValidate;
                    end;
                }
                field("Substitution Available";"Substitution Available")
                {
                    Visible = false;
                }
                field("Purchasing Code";"Purchasing Code")
                {
                    Visible = false;
                }
                field(Nonstock;Nonstock)
                {
                    Visible = false;
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                    Editable = false;
                    Visible = false;
                }
                field(Description;Description)
                {
                    Editable = false;
                    QuickEntry = false;
                    StyleExpr = LineColor;
                }
                field("Drop Shipment";"Drop Shipment")
                {
                    Visible = false;
                }
                field("Special Order";"Special Order")
                {
                    Visible = false;
                }
                field("Return Reason Code";"Return Reason Code")
                {
                    Visible = false;
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;
                    StyleExpr = LineColor;

                    trigger OnValidate();
                    begin
                        QuantityOnAfterValidate;
                    end;
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
                    QuickEntry = false;
                    StyleExpr = LineColor;

                    trigger OnValidate();
                    begin
                        LocationCodeOnAfterValidate;
                    end;
                }
                field("Bin Code";"Bin Code")
                {
                    Visible = false;
                }
                field(Reserve;Reserve)
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ReserveOnAfterValidate;
                    end;
                }
                field("Qty possible à demander";DecQtyDispoAcmD)
                {
                    Caption = 'Qty Succursale';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(RecGStockCompagny;RecGStockCompagny)
                {
                    Caption = 'QtyTotal Disponible';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Ordered Qty";"Ordered Qty")
                {
                    Editable = false;
                }
                field("Remaining Qty to Order";"Remaining Qty to Order")
                {
                }
                field("Qty. to Assemble to Order";"Qty. to Assemble to Order")
                {
                    BlankZero = true;
                    Visible = false;

                    trigger OnDrillDown();
                    begin
                        ShowAsmToOrderLines;
                    end;

                    trigger OnValidate();
                    begin
                        QtyToAsmToOrderOnAfterValidate;
                    end;
                }
                field("Reserved Quantity";"Reserved Quantity")
                {
                    BlankZero = true;
                    Editable = false;
                    QuickEntry = false;
                    Visible = false;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    QuickEntry = false;

                    trigger OnValidate();
                    begin
                        UnitofMeasureCodeOnAfterValida;
                    end;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    Visible = false;
                }
                field(SalesPriceExist;PriceExists)
                {
                    CaptionML = ENU='Sales Price Exists',
                                FRA='Prix vente existant';
                    Editable = false;
                    Visible = false;
                }
                field("Unit Price";"Unit Price")
                {
                    BlankZero = true;
                    Editable = false;
                }
                field("Line Amount";"Line Amount")
                {
                    BlankZero = true;
                    Editable = false;
                }
                field(SalesLineDiscExists;LineDiscExists)
                {
                    CaptionML = ENU='Sales Line Disc. Exists',
                                FRA='Rem. ligne vente existante';
                    Editable = false;
                    Visible = false;
                }
                field("Line Discount %";"Line Discount %")
                {
                    BlankZero = true;
                    Editable = BlnRemise;

                    trigger OnValidate();
                    begin
                        RecUserSetup.GET(USERID);
                        IF NOT (RecUserSetup."Autoriser Modif Remise" OR (RecUserSetup."Plafond remise PR" = RecUserSetup."Plafond remise PR"::Responsable))   THEN
                          ERROR('Modification interdite. Contactez votre administrateur.');
                    end;
                }
                field("Line Discount Amount";"Line Discount Amount")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Prepayment %";"Prepayment %")
                {
                    Visible = false;
                }
                field("Prepmt. Line Amount";"Prepmt. Line Amount")
                {
                    Visible = false;
                }
                field("Prepmt. Amt. Inv.";"Prepmt. Amt. Inv.")
                {
                    Visible = false;
                }
                field("Allow Invoice Disc.";"Allow Invoice Disc.")
                {
                    Visible = false;
                }
                field("Inv. Discount Amount";"Inv. Discount Amount")
                {
                    Visible = false;
                }
                field("Qty. to Ship";"Qty. to Ship")
                {
                    BlankZero = true;

                    trigger OnValidate();
                    begin
                        IF "Qty. to Asm. to Order (Base)" <> 0 THEN BEGIN
                          CurrPage.SAVERECORD;
                          CurrPage.UPDATE(FALSE);
                        END;
                    end;
                }
                field("Quantity Shipped";"Quantity Shipped")
                {
                    BlankZero = true;
                    QuickEntry = false;
                }
                field("Qty. to Invoice";"Qty. to Invoice")
                {
                    BlankZero = true;
                }
                field("Quantity Invoiced";"Quantity Invoiced")
                {
                    BlankZero = true;
                }
                field("Prepmt Amt to Deduct";"Prepmt Amt to Deduct")
                {
                    Visible = false;
                }
                field("Prepmt Amt Deducted";"Prepmt Amt Deducted")
                {
                    Visible = false;
                }
                field("Allow Item Charge Assignment";"Allow Item Charge Assignment")
                {
                    Visible = false;
                }
                field("Qty. to Assign";"Qty. to Assign")
                {
                    BlankZero = true;
                    QuickEntry = false;

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        ShowItemChargeAssgnt;
                        UpdateForm(FALSE);
                    end;
                }
                field("Qty. Assigned";"Qty. Assigned")
                {
                    BlankZero = true;
                    QuickEntry = false;

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        ShowItemChargeAssgnt;
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                field("Requested Delivery Date";"Requested Delivery Date")
                {
                    Visible = false;
                }
                field("Promised Delivery Date";"Promised Delivery Date")
                {
                    Visible = false;
                }
                field("Planned Delivery Date";"Planned Delivery Date")
                {
                    QuickEntry = false;
                }
                field("Planned Shipment Date";"Planned Shipment Date")
                {
                }
                field("Shipment Date";"Shipment Date")
                {
                    QuickEntry = false;

                    trigger OnValidate();
                    begin
                        ShipmentDateOnAfterValidate;
                    end;
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                    Visible = false;
                }
                field("Shipping Agent Service Code";"Shipping Agent Service Code")
                {
                    Visible = false;
                }
                field("Shipping Time";"Shipping Time")
                {
                    Visible = false;
                }
                field("Work Type Code";"Work Type Code")
                {
                    Visible = false;
                }
                field("Whse. Outstanding Qty.";"Whse. Outstanding Qty.")
                {
                    Visible = false;
                }
                field("Whse. Outstanding Qty. (Base)";"Whse. Outstanding Qty. (Base)")
                {
                    Visible = false;
                }
                field("ATO Whse. Outstanding Qty.";"ATO Whse. Outstanding Qty.")
                {
                    Visible = false;
                }
                field("ATO Whse. Outstd. Qty. (Base)";"ATO Whse. Outstd. Qty. (Base)")
                {
                    Visible = false;
                }
                field("Outbound Whse. Handling Time";"Outbound Whse. Handling Time")
                {
                    Visible = false;
                }
                field("Blanket Order No.";"Blanket Order No.")
                {
                    Visible = false;
                }
                field("Blanket Order Line No.";"Blanket Order Line No.")
                {
                    Visible = false;
                }
                field("FA Posting Date";"FA Posting Date")
                {
                    Visible = false;
                }
                field("Depr. until FA Posting Date";"Depr. until FA Posting Date")
                {
                    Visible = false;
                }
                field("Depreciation Book Code";"Depreciation Book Code")
                {
                    Visible = false;
                }
                field("Use Duplication List";"Use Duplication List")
                {
                    Visible = false;
                }
                field("No. Order de Transfert";"No. Order de Transfert")
                {
                    Editable = false;
                }
                field("Duplicate in Depreciation Book";"Duplicate in Depreciation Book")
                {
                    Visible = false;
                }
                field("Appl.-from Item Entry";"Appl.-from Item Entry")
                {
                    Visible = false;
                }
                field("Appl.-to Item Entry";"Appl.-to Item Entry")
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
                field(ShortcutDimCode[3];ShortcutDimCode[3])
                {
                    CaptionClass = '1,2,3';
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupShortcutDimCode(3,ShortcutDimCode[3]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(3,ShortcutDimCode[3]);
                    end;
                }
                field(ShortcutDimCode[4];ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupShortcutDimCode(4,ShortcutDimCode[4]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(4,ShortcutDimCode[4]);
                    end;
                }
                field(ShortcutDimCode[5];ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupShortcutDimCode(5,ShortcutDimCode[5]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(5,ShortcutDimCode[5]);
                    end;
                }
                field(ShortcutDimCode[6];ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupShortcutDimCode(6,ShortcutDimCode[6]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(6,ShortcutDimCode[6]);
                    end;
                }
                field(ShortcutDimCode[7];ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupShortcutDimCode(7,ShortcutDimCode[7]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(7,ShortcutDimCode[7]);
                    end;
                }
                field(ShortcutDimCode[8];ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupShortcutDimCode(8,ShortcutDimCode[8]);
                    end;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(8,ShortcutDimCode[8]);
                    end;
                }
                field("Document No.";"Document No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Code Famille";"Code Famille")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Code Index";"Code Index")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Code Segment";"Code Segment")
                {
                    Editable = false;
                    Visible = false;
                }
                field(VIN;VIN)
                {
                    Editable = false;
                    Visible = false;
                }
                field("CompanyOrder Transfert";"CompanyOrder Transfert")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Qty TransferOrder To Receive";"Qty TransferOrder To Receive")
                {
                }
                field("Qty TransferOrder To Ship";"Qty TransferOrder To Ship")
                {
                }
                field("Nature Piece";"Nature Piece")
                {
                }
                field("Qty Received";"Qty Received")
                {
                }
                field("Qty Shipped";"Qty Shipped")
                {
                }
                field(ETD;ETD)
                {
                }
                field(ETA;ETA)
                {
                }
                field(ATD;ATD)
                {
                }
                field(ATA;ATA)
                {
                }
                field("Processed Item No";"Processed Item No")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                Image = Line;
                group("Item Availability by")
                {
                    CaptionML = ENU='Item Availability by',
                                FRA='Disponibilité article par';
                    Image = ItemAvailability;
                    action("<Action3>")
                    {
                        CaptionML = ENU='Event',
                                    FRA='Événement';
                        Image = "Event";

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec,ItemAvailFormsMgt.ByEvent)
                        end;
                    }
                    action(Period)
                    {
                        CaptionML = ENU='Period',
                                    FRA='Période';
                        Image = Period;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec,ItemAvailFormsMgt.ByPeriod)
                        end;
                    }
                    action(Variant)
                    {
                        CaptionML = ENU='Variant',
                                    FRA='Variante';
                        Image = ItemVariant;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec,ItemAvailFormsMgt.ByVariant)
                        end;
                    }
                    action(Location)
                    {
                        CaptionML = ENU='Location',
                                    FRA='Magasin';
                        Image = Warehouse;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec,ItemAvailFormsMgt.ByLocation)
                        end;
                    }
                    action("BOM Level")
                    {
                        CaptionML = ENU='BOM Level',
                                    FRA='Niveau nomenclature';
                        Image = BOMLevel;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec,ItemAvailFormsMgt.ByBOM)
                        end;
                    }
                }
                action("Reservation Entries")
                {
                    CaptionML = ENU='Reservation Entries',
                                FRA='Écritures réservation';
                    Image = ReservationLedger;

                    trigger OnAction();
                    begin
                        ShowReservationEntries(TRUE);
                    end;
                }
                action(ItemTrackingLines)
                {
                    CaptionML = ENU='Item &Tracking Lines',
                                FRA='Lignes &traçabilité';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction();
                    begin
                        OpenItemTrackingLines;
                    end;
                }
                action("Select Item Substitution")
                {
                    CaptionML = ENU='Select Item Substitution',
                                FRA='Sélectionner article de substitution';
                    Image = SelectItemSubstitution;

                    trigger OnAction();
                    begin
                        ShowItemSub;
                    end;
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
                action(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques DM';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        //SM DM V1
                        DMShowDimensions;
                    end;
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        ShowLineComments;
                    end;
                }
                action("Item Charge &Assignment")
                {
                    CaptionML = ENU='Item Charge &Assignment',
                                FRA='&Affectation frais annexes';

                    trigger OnAction();
                    begin
                        ItemChargeAssgnt;
                    end;
                }
                action(OrderPromising)
                {
                    CaptionML = ENU='Order &Promising',
                                FRA='Pro&messe de livraison';
                    Image = OrderPromising;

                    trigger OnAction();
                    begin
                        OrderPromisingLine;
                    end;
                }
                group("Assemble to Order")
                {
                    CaptionML = ENU='Assemble to Order',
                                FRA='Assembler pour commande';
                    Image = AssemblyBOM;
                    action(AssembleToOrderLines)
                    {
                        CaptionML = ENU='Assemble-to-Order Lines',
                                    FRA='Lignes Assembler pour commande';

                        trigger OnAction();
                        begin
                            ShowAsmToOrderLines;
                        end;
                    }
                    action("Roll Up &Price")
                    {
                        CaptionML = ENU='Roll Up &Price',
                                    FRA='&Prix relation';
                        Ellipsis = true;

                        trigger OnAction();
                        begin
                            RollupAsmPrice;
                        end;
                    }
                    action("Roll Up &Cost")
                    {
                        CaptionML = ENU='Roll Up &Cost',
                                    FRA='&Coûts relation';
                        Ellipsis = true;

                        trigger OnAction();
                        begin
                            RollUpAsmCost;
                        end;
                    }
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("Remplacement Réaliser")
                {
                    Image = List;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = New;

                    trigger OnAction();
                    var
                        LRecReplacementChain : Record "70095";
                        LPageChainesDeRemplacements : Page "70092";
                        LRecReplacementChain2 : Record "70095";
                        LRecCompletedItemReplacement : Record "70092";
                        LRecCompletedItemReplacement2 : Record "70092";
                        "LPagRemplPiècesterminées" : Page "70091";
                    begin
                        LRecReplacementChain.RESET;
                        LRecCompletedItemReplacement.SETRANGE("Old Item No." ,"No.");
                        IF LRecCompletedItemReplacement.FINDFIRST THEN
                          BEGIN
                            LRecCompletedItemReplacement2.RESET;
                            LRecCompletedItemReplacement2.SETRANGE("Replacement Chain No.",LRecCompletedItemReplacement."Replacement Chain No.");
                            IF LRecCompletedItemReplacement2.FINDSET THEN
                              BEGIN
                                CLEAR(LPagRemplPiècesterminées);
                                LPagRemplPiècesterminées.SETTABLEVIEW(LRecCompletedItemReplacement2);
                                LPagRemplPiècesterminées.SETRECORD(LRecCompletedItemReplacement2);
                                IF LPagRemplPiècesterminées.RUNMODAL = ACTION::LookupOK THEN
                                  LPagRemplPiècesterminées.GETRECORD(LRecCompletedItemReplacement2);
                             END;

                          END;
                    end;
                }
                action(GetPrice)
                {
                    CaptionML = ENU='Get Price',
                                FRA='Extraire prix';
                    Ellipsis = true;
                    Image = Price;

                    trigger OnAction();
                    begin
                        ShowPrices;
                    end;
                }
                action("Get Li&ne Discount")
                {
                    CaptionML = ENU='Get Li&ne Discount',
                                FRA='E&xtraire remise ligne';
                    Ellipsis = true;
                    Image = LineDiscount;

                    trigger OnAction();
                    begin
                        ShowLineDisc
                    end;
                }
                action(ExplodeBOM_Functions)
                {
                    CaptionML = ENU='E&xplode BOM',
                                FRA='&Eclater nomenclature';
                    Image = ExplodeBOM;

                    trigger OnAction();
                    begin
                        ExplodeBOM;
                    end;
                }
                action("Insert Ext. Texts")
                {
                    CaptionML = ENU='Insert &Ext. Text',
                                FRA='Insérer te&xte étendu';
                    Image = Text;

                    trigger OnAction();
                    begin
                        InsertExtendedText(TRUE);
                    end;
                }
                action(Reserve)
                {
                    CaptionML = ENU='&Reserve',
                                FRA='&Réserver';
                    Ellipsis = true;
                    Image = Reserve;

                    trigger OnAction();
                    begin
                        FIND;
                        ShowReservation;
                    end;
                }
                action(OrderTracking)
                {
                    CaptionML = ENU='Order &Tracking',
                                FRA='C&haînage';
                    Image = OrderTracking;

                    trigger OnAction();
                    begin
                        ShowTracking;
                    end;
                }
                action("Nonstoc&k Items")
                {
                    CaptionML = ENU='Nonstoc&k Items',
                                FRA='Articles &non stockés';
                    Image = NonStockItem;

                    trigger OnAction();
                    begin
                        ShowNonstockItems;
                    end;
                }
            }
            group("O&rder")
            {
                CaptionML = ENU='O&rder',
                            FRA='&Commande';
                Image = "Order";
                group("Dr&op Shipment")
                {
                    CaptionML = ENU='Dr&op Shipment',
                                FRA='Livraison &directe';
                    Image = Delivery;
                    action("Purchase &Order")
                    {
                        CaptionML = ENU='Purchase &Order',
                                    FRA='&Commande achat';
                        Image = Document;

                        trigger OnAction();
                        begin
                            OpenPurchOrderForm;
                        end;
                    }
                }
                group("Speci&al Order")
                {
                    CaptionML = ENU='Speci&al Order',
                                FRA='C&ommande spéciale';
                    Image = SpecialOrder;
                    action(OpenSpecialPurchaseOrder)
                    {
                        CaptionML = ENU='Purchase &Order',
                                    FRA='&Commande achat';
                        Image = Document;

                        trigger OnAction();
                        begin
                            OpenSpecialPurchOrderForm;
                        end;
                    }
                }
            }
            action("Disponibilité Article")
            {
                Image = BarChart;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    LCUItemavailability : Codeunit "70000";
                    LRecAvailibilityItem : Record "70006";
                    LPagItemAvailability : Page "70009";
                    ServLine : Record "5902";
                begin
                    //<<--NM---030417--------------
                    TESTFIELD("Location Code");
                    TESTFIELD(Quantity);
                      LCUItemavailability.SetSalesOrderInfo(Quantity-"Ordered Qty","Line No.",
                                      "Document No.","Location Code");
                      LCUItemavailability.FctStartSearchForItem("No.");
                    CLEAR(LPagItemAvailability);
                    LPagItemAvailability.SETTABLEVIEW(LRecAvailibilityItem);
                    LPagItemAvailability.SETRECORD(LRecAvailibilityItem);
                    IF LPagItemAvailability.RUNMODAL = ACTION::LookupOK THEN;
                    //>>--NM---030417--------------
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        LCduItemavailability : Codeunit "70000";
    begin
        //SM MAZDA06
        //TODO Société Consolidé
        CalcOrderedQty;
        //END SM

        //DecGStock :=  LCduItemavailability.FctCalcTotalMagReservation("No.") ;
        //DecStockTotalDispo := LCduItemavailability.FctCalcStockDispoTotal("No.");
        //DecStockTotalDispoProj := LCduItemavailability.FctCalcStockProjeterDispoTotal("No.");
        //SM 090519
        RecGStockCompagny := LCduItemavailability.FctCalcStockDispoByCompanyForAllCentralMag("No.",COMPANYNAME);
        //END SM 090519
        DecQtyDispoAcmD := LCduItemavailability.FctCalcStockDispoByMagCentralOT("No.");

        LineColor:= '';
        IF DecQtyDispoAcmD < 0  THEN
          LineColor := 'Unfavorable'
          ELSE
            LineColor := '';

        RecUserSetup.GET(USERID);
        IF RecUserSetup."Autoriser Modif Remise" OR (RecUserSetup."Plafond remise PR" = RecUserSetup."Plafond remise PR"::Responsable)  THEN//SM 100619 add OR (GRecUserSetup."Plafond remise PR" = GRecUserSetup."Plafond remise PR"::Responsable)
           BlnRemise := TRUE;

        IF RecUserSetup."Responsable Vente PR" THEN
           BolExlContPrix := TRUE
    end;

    trigger OnAfterGetRecord();
    var
        LCduItemavailability : Codeunit "70000";
    begin
        ShowShortcutDimCode(ShortcutDimCode);

        //<< TRIUM RAD 18/02/2014 - calcul stock consolidé
        ////DecGStock :=  CalcStockEconAuto ;
        //>> End TRIUM RAD Addin
        //SM MAZDA06
        //TODO Société Consolidé
        CalcOrderedQty;
        //END SM
        DecGStock :=  LCduItemavailability.FctCalcTotalMagReservation("No.") ;
        //SM 090519
        RecGStockCompagny := LCduItemavailability.FctCalcStockDispoByCompanyForAllCentralMag("No.",COMPANYNAME);
        //END SM 090519
        //DecStockTotalDispo := LCduItemavailability.FctCalcStockDispoTotal("No.");
        //DecStockTotalDispoProj := LCduItemavailability.FctCalcStockProjeterDispoTotal("No.");
        DecQtyDispoAcmD := LCduItemavailability.FctCalcStockDispoByMagCentralOT("No.");

        LineColor:= '';
        IF DecQtyDispoAcmD < 0  THEN
          LineColor := 'Unfavorable'
          ELSE
            LineColor := '';

        RecUserSetup.GET(USERID);
        IF RecUserSetup."Autoriser Modif Remise" OR (RecUserSetup."Plafond remise PR" = RecUserSetup."Plafond remise PR"::Responsable)  THEN//SM 100619 add OR (GRecUserSetup."Plafond remise PR" = GRecUserSetup."Plafond remise PR"::Responsable)
           BlnRemise := TRUE;

        IF RecUserSetup."Responsable Vente PR" THEN
           BolExlContPrix := TRUE
    end;

    trigger OnDeleteRecord() : Boolean;
    var
        ReserveSalesLine : Codeunit "99000832";
    begin
        IF (Quantity <> 0) AND ItemExists("No.") THEN BEGIN
          COMMIT;
          IF NOT ReserveSalesLine.DeleteLineConfirm(Rec) THEN
            EXIT(FALSE);
          ReserveSalesLine.DeleteLine(Rec);
        END;
    end;

    trigger OnInit();
    begin
        BlnRemise := FALSE;
        BolExlContPrix := FALSE
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        InitType;
        CLEAR(ShortcutDimCode);
        LineColor:= '';
    end;

    trigger OnOpenPage();
    begin
        RecUserSetup.GET(USERID);
        IF RecUserSetup."Autoriser Modif Remise" OR (RecUserSetup."Plafond remise PR" = RecUserSetup."Plafond remise PR"::Responsable)  THEN//SM 100619 add OR (GRecUserSetup."Plafond remise PR" = GRecUserSetup."Plafond remise PR"::Responsable)
           BlnRemise := TRUE;
        IF RecUserSetup."Responsable Vente PR" THEN
           BolExlContPrix := TRUE
    end;

    var
        SalesHeader : Record "36";
        SalesPriceCalcMgt : Codeunit "7000";
        TransferExtendedText : Codeunit "378";
        ItemAvailFormsMgt : Codeunit "353";
        ShortcutDimCode : array [8] of Code[20];
        Text001 : TextConst ENU='You cannot use the Explode BOM function because a prepayment of the sales order has been invoiced.',FRA='Vous ne pouvez pas utiliser la fonction Éclater nomenclature car un acompte de la commande vente a été facturé.';
        [InDataSet]
        ItemPanelVisible : Boolean;
        DecGStock : Decimal;
        DecStockTotalDispo : Decimal;
        DecStockTotalDispoProj : Decimal;
        LineColor : Text;
        DecQtyDispoAcmD : Decimal;
        "RecGVentesratées" : Record "70096";
        BlnRemise : Boolean;
        RecUserSetup : Record "91";
        BolExlContPrix : Boolean;
        RecGStockCompagny : Decimal;
        LCduItemavailability : Codeunit "70000";

    procedure ApproveCalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Disc. (Yes/No)",Rec);
    end;

    procedure CalcInvDisc();
    begin
        CODEUNIT.RUN(CODEUNIT::"Sales-Calc. Discount",Rec);
    end;

    procedure ExplodeBOM();
    begin
        IF "Prepmt. Amt. Inv." <> 0 THEN
          ERROR(Text001);
        CODEUNIT.RUN(CODEUNIT::"Sales-Explode BOM",Rec);
    end;

    procedure OpenPurchOrderForm();
    var
        PurchHeader : Record "38";
        PurchOrder : Page "50";
    begin
        TESTFIELD("Purchase Order No.");
        PurchHeader.SETRANGE("No.","Purchase Order No.");
        PurchOrder.SETTABLEVIEW(PurchHeader);
        PurchOrder.EDITABLE := FALSE;
        PurchOrder.RUN;
    end;

    procedure OpenSpecialPurchOrderForm();
    var
        PurchHeader : Record "38";
        PurchRcptHeader : Record "120";
        PurchOrder : Page "50";
    begin
        TESTFIELD("Special Order Purchase No.");
        PurchHeader.SETRANGE("No.","Special Order Purchase No.");
        IF NOT PurchHeader.ISEMPTY THEN BEGIN
          PurchOrder.SETTABLEVIEW(PurchHeader);
          PurchOrder.EDITABLE := FALSE;
          PurchOrder.RUN;
        END ELSE BEGIN
          PurchRcptHeader.SETRANGE("Order No.","Special Order Purchase No.");
          IF PurchRcptHeader.COUNT = 1 THEN
            PAGE.RUN(PAGE::"Posted Purchase Receipt",PurchRcptHeader)
          ELSE
            PAGE.RUN(PAGE::"Posted Purchase Receipts",PurchRcptHeader);
        END;
    end;

    procedure InsertExtendedText(Unconditionally : Boolean);
    begin
        IF TransferExtendedText.SalesCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
          COMMIT;
          TransferExtendedText.InsertSalesExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          UpdateForm(TRUE);
    end;

    procedure ShowNonstockItems();
    begin
        ShowNonstock;
    end;

    procedure ShowTracking();
    var
        TrackingForm : Page "99000822";
    begin
        TrackingForm.SetSalesLine(Rec);
        TrackingForm.RUNMODAL;
    end;

    procedure ItemChargeAssgnt();
    begin
        ShowItemChargeAssgnt;
    end;

    procedure UpdateForm(SetSaveRecord : Boolean);
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;

    procedure ShowPrices();
    begin
        SalesHeader.GET("Document Type","Document No.");
        CLEAR(SalesPriceCalcMgt);
        SalesPriceCalcMgt.GetSalesLinePrice(SalesHeader,Rec);
    end;

    procedure ShowLineDisc();
    begin
        SalesHeader.GET("Document Type","Document No.");
        CLEAR(SalesPriceCalcMgt);
        SalesPriceCalcMgt.GetSalesLineLineDisc(SalesHeader,Rec);
    end;

    procedure OrderPromisingLine();
    var
        OrderPromisingLine : Record "99000880" temporary;
        OrderPromisingLines : Page "99000959";
    begin
        OrderPromisingLine.SETRANGE("Source Type","Document Type");
        OrderPromisingLine.SETRANGE("Source ID","Document No.");
        OrderPromisingLine.SETRANGE("Source Line No.","Line No.");

        OrderPromisingLines.SetSourceType(OrderPromisingLine."Source Type"::Sales);
        OrderPromisingLines.SETTABLEVIEW(OrderPromisingLine);
        OrderPromisingLines.RUNMODAL;
    end;

    local procedure TypeOnAfterValidate();
    begin
        ItemPanelVisible := Type = Type::Item;
    end;

    local procedure NoOnAfterValidate();
    begin
        InsertExtendedText(FALSE);
        IF (Type = Type::"Charge (Item)") AND ("No." <> xRec."No.") AND
           (xRec."No." <> '')
        THEN
          CurrPage.SAVERECORD;

        SaveAndAutoAsmToOrder;

        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("No." <> xRec."No.")
        THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure CrossReferenceNoOnAfterValidat();
    begin
        InsertExtendedText(FALSE);
    end;

    local procedure VariantCodeOnAfterValidate();
    begin
        SaveAndAutoAsmToOrder;
    end;

    local procedure LocationCodeOnAfterValidate();
    begin
        SaveAndAutoAsmToOrder;

        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("Location Code" <> xRec."Location Code")
        THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure ReserveOnAfterValidate();
    begin
        IF (Reserve = Reserve::Always) AND ("Outstanding Qty. (Base)" <> 0) THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure QuantityOnAfterValidate();
    var
        UpdateIsDone : Boolean;
    begin
        IF Type = Type::Item THEN
          CASE Reserve OF
            Reserve::Always:
              BEGIN
                CurrPage.SAVERECORD;
                AutoReserve;
                CurrPage.UPDATE(FALSE);
                UpdateIsDone := TRUE;
              END;
            Reserve::Optional:
              IF (Quantity < xRec.Quantity) AND (xRec.Quantity > 0) THEN BEGIN
                CurrPage.SAVERECORD;
                CurrPage.UPDATE(FALSE);
                UpdateIsDone := TRUE;
              END;
          END;
        //SM 080617
        /*
        DecQtyDispoAcmD := LCduItemavailability.FctCalcStockDispoByMagCentralOT("No.");
        IF (Type = Type::Item) AND (DecQtyDispoAcmD <  Rec.Quantity) THEN BEGIN //TODO ligne service
        // T37 cle no seq magsin bin CLIENT qty current date 3 chanmps cal DecGStock an after get record no commande no lign centre de gestion utilisate(code vendeur) prix untaire article designat ref
        FctInsertionVentesRatees;
        END;
        */
        //END
        IF (Type = Type::Item) AND
           (Quantity <> xRec.Quantity) AND
           NOT UpdateIsDone
        THEN
          CurrPage.UPDATE(TRUE);

    end;

    local procedure QtyToAsmToOrderOnAfterValidate();
    begin
        CurrPage.SAVERECORD;
        IF Reserve = Reserve::Always THEN
          AutoReserve;
        CurrPage.UPDATE(TRUE);
    end;

    local procedure UnitofMeasureCodeOnAfterValida();
    begin
        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure ShipmentDateOnAfterValidate();
    begin
        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("Shipment Date" <> xRec."Shipment Date")
        THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure SaveAndAutoAsmToOrder();
    begin
        IF (Type = Type::Item) AND IsAsmToOrderRequired THEN BEGIN
          CurrPage.SAVERECORD;
          AutoAsmToOrder;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure FctInsertionVentesRatees();
    var
        SalesHeader : Record "36";
        RecGItem : Record "27";
        LRecPurchaseLine : Record "39";
    begin
        SalesHeader.GET("Document Type","Document No.");
        RecGItem.GET("No.");
        DecQtyDispoAcmD := LCduItemavailability.FctCalcStockDispoByMagCentralOT("No.");
        RecGItem.CALCFIELDS(Inventory);
        RecGVentesratées.INIT;
        RecGVentesratées."Document Type"                  :="Document Type";
        RecGVentesratées."Document No."                   :="Document No.";
        RecGVentesratées."No."                            :="No.";
        RecGVentesratées.Description                      :=Description;
        RecGVentesratées."Description 2"                  :="Description 2";
        RecGVentesratées.Quantity                         :=Quantity;
        RecGVentesratées."Currency Code"                  :="Currency Code";
        RecGVentesratées."Unit of Measure"                :="Unit of Measure";
        RecGVentesratées."Unit Price"                     :="Unit Price";
        //RecGVentesratées.Inventory                        :=DecGStock;
        RecGVentesratées."Total available inventory"      :=DecStockTotalDispo;
        RecGVentesratées."Total Proj inventory available" :=DecStockTotalDispoProj;
        RecGVentesratées."Bin Code"                       :="Bin Code";
        RecGVentesratées."Variant Code"                   :="Variant Code";
        RecGVentesratées."Code Famille"                   :="Code Famille";
        RecGVentesratées."Code Index"                     :="Code Index";
        RecGVentesratées."Code Segment"                   :="Code Segment";
        RecGVentesratées.Inventory                        :=DecQtyDispoAcmD;

        RecGVentesratées."Stock Total"                    := RecGItem.Inventory;
        RecGVentesratées."Qté Manquante"                  := DecQtyDispoAcmD - Quantity;
        RecGVentesratées."Valeur des Manquant"            := "Unit Price" * (DecQtyDispoAcmD - Quantity);;

        RecGVentesratées.MAD                              := RecGItem.MAD;
        RecGVentesratées.ICC                              := RecGItem.Rotation;
        RecGVentesratées."Product Code"                   := RecGItem."Product Code";
        RecGVentesratées."EPM Non Reorder Code"           := RecGItem."EPM Non Reorder Code";
        RecGVentesratées."Non Stock Code"                 := RecGItem."Non Stock Code";
        RecGVentesratées."Controle technique"             := RecGItem."Contrôl Technique";
        RecGVentesratées."Sur Commande"                   := RecGItem."Sur commande";

        RecGVentesratées."Location Code"                  :="Location Code";//SalesHeader."Location Code";
        RecGVentesratées."Salesperson code"               :=SalesHeader."Salesperson Code";
        RecGVentesratées."Responsibility Center"          :=SalesHeader."Responsibility Center";
        RecGVentesratées."Entry Date"                     :=CREATEDATETIME(TODAY,TIME);
        RecGVentesratées."Order type"                     :=RecGVentesratées."Order type"::Vente;
        LRecPurchaseLine.RESET;
        LRecPurchaseLine.SETRANGE("No.","No.");
        LRecPurchaseLine.SETRANGE("Document Type",LRecPurchaseLine."Document Type"::Order);
        LRecPurchaseLine.SETFILTER("Outstanding Quantity",'<>%1',0);
        IF LRecPurchaseLine.FINDFIRST THEN BEGIN
          RecGVentesratées."Qté En Cmd Achat" := LRecPurchaseLine."Outstanding Quantity";
          RecGVentesratées.ETA := LRecPurchaseLine.ETA;
          RecGVentesratées.ETD := LRecPurchaseLine.ETD;
          END;
        RecGVentesratées.INSERT(TRUE);
    end;
}

