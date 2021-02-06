page 60085 "Sales Order Subform VN"
{
    // version SAV Automobile,DM

    AutoSplitKey = true;
    CaptionML = ENU='Lines PR',
                FRA='Lignes VN';
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = Table37;
    SourceTableView = WHERE(Document Type=FILTER(Order));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Line No.";"Line No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Type VN";"Type VN")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    QuickEntry = false;

                    trigger OnValidate();
                    var
                        OldTypeVN : Option "0","1","2","3","4","5","6","7","8","9";
                    begin
                        //SM 040717

                        //OldTypeVN := "Type VN";
                        CASE "Type VN" OF
                          "Type VN"::" "            : OldTypeVN := 0;
                          "Type VN"::Vehicule       : OldTypeVN := 1;
                          "Type VN"::Accessoire     : OldTypeVN := 2;
                          "Type VN"::"Charge (Item)": OldTypeVN := 3;
                          "Type VN"::"Fixed Asset"  : OldTypeVN := 4;
                          "Type VN"::"G/L Account"  : OldTypeVN := 5;
                        END;

                        CASE "Type VN" OF
                          "Type VN"::" "            : VALIDATE(Type,Type::Item);
                          "Type VN"::Vehicule       : VALIDATE(Type,Type::Item);
                          "Type VN"::Accessoire     : VALIDATE(Type,Type::Item);
                          "Type VN"::"Charge (Item)": VALIDATE(Type,Type::"Charge (Item)");
                          "Type VN"::"Fixed Asset"  : VALIDATE(Type,Type::"Fixed Asset");
                          "Type VN"::"G/L Account"  : VALIDATE(Type,Type::"G/L Account");
                        END;

                        //"Type VN":= OldTypeVN ;
                        CASE OldTypeVN OF
                          0  : "Type VN" := "Type VN"::" " ;
                          1  : "Type VN" := "Type VN"::Vehicule ;
                          2  : "Type VN" := "Type VN"::Accessoire;
                          3  : "Type VN" := "Type VN"::"Charge (Item)";
                          4  : "Type VN" := "Type VN"::"Fixed Asset";
                          5  : "Type VN" := "Type VN"::"G/L Account";
                        END;

                        //END 040717
                        //KT 100717 En cours
                        FctAffecterSur;

                        //IF ("Type VN" = 3) OR ("Type VN" = 5) THEN
                        Quantity := 1;
                    end;
                }
                field("No. VN";"No. VN")
                {
                    Editable = ClientTaxiLou OR AdminVte;

                    trigger OnValidate();
                    var
                        OldNo : Code[20];
                        OldTypeVN : Option "0","1","2","3","4","5","6","7","8","9";
                    begin
                        //SM 040717
                        MODIFY;
                        OldNo := "No. VN";

                        CASE "Type VN" OF
                          "Type VN"::" "            : OldTypeVN := 0;
                          "Type VN"::Vehicule       : OldTypeVN := 1;
                          "Type VN"::Accessoire     : OldTypeVN := 2;
                          "Type VN"::"Charge (Item)": OldTypeVN := 3;
                          "Type VN"::"Fixed Asset"  : OldTypeVN := 4;
                          "Type VN"::"G/L Account"  : OldTypeVN := 5;
                        END;



                        VALIDATE("No.",OldNo);

                        "No. VN" := OldNo;
                        //"Type VN":= OldTypeVN ;
                        CASE OldTypeVN OF
                          0  : "Type VN" := "Type VN"::" " ;
                          1  : "Type VN" := "Type VN"::Vehicule ;
                          2  : "Type VN" := "Type VN"::Accessoire;
                          3  : "Type VN" := "Type VN"::"Charge (Item)";
                          4  : "Type VN" := "Type VN"::"Fixed Asset";
                          5  : "Type VN" := "Type VN"::"G/L Account";
                        END;
                        //END 040717
                    end;
                }
                field(Type;Type)
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        TypeOnAfterValidate;
                        NoOnAfterValidate;
                        //KT 100717 En cours
                        FctAffecterSur;
                    end;
                }
                field("No.";"No.")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;
                        //KT 100717 En cours
                        FctAffecterSur1;
                        //ad hr
                        VALIDATE(Quantity,1);
                        ItemExists("No.");
                    end;
                }
                field("Variant Code";"Variant Code")
                {
                    Editable = ClientTaxiLou OR AdminVte;

                    trigger OnValidate();
                    begin
                        VariantCodeOnAfterValidate;
                        //SM 050717
                        VALIDATE(Quantity,1);
                    end;
                }
                field(VIN;VIN)
                {
                    Lookup = true;

                    trigger OnValidate();
                    begin
                        //KT 100717 En cours
                        FctAffecterSur;
                        //KT 231017
                    end;
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
                field(Nonstock;Nonstock)
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                    Editable = false;
                    Visible = false;
                }
                field(Description;Description)
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    QuickEntry = false;
                }
                field("Description 2";"Description 2")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                }
                field("Document Date";"Document Date")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                }
                field("Location Code";"Location Code")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    QuickEntry = false;

                    trigger OnValidate();
                    begin
                        LocationCodeOnAfterValidate;
                    end;
                }
                field("Bin Code";"Bin Code")
                {
                }
                field(Reserve;Reserve)
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ReserveOnAfterValidate;
                    end;
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;

                    trigger OnValidate();
                    begin
                        //ClientTaxiLou OR AdminVte

                        //SM 260917
                        IF Quantity <> 1 THEN
                          ERROR('Il fau saisir 1');
                        //END SM
                        QuantityOnAfterValidate;
                        //KT 100717 En cours
                        FctAffecterSur;
                    end;
                }
                field("Affecter sur";"Affecter sur")
                {
                }
                field(Campaign;Campaign)
                {
                    Visible = false;
                }
                field("Qty. to Assemble to Order";"Qty. to Assemble to Order")
                {
                    BlankZero = true;
                    Editable = ClientTaxiLou OR AdminVte;
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
                    Editable = ClientTaxiLou OR AdminVte;
                    QuickEntry = false;
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
                    Editable = BlnRemise;

                    trigger OnValidate();
                    begin
                        //SM 260319
                        IF UserSetup.GET(USERID) THEN
                          IF NOT UserSetup."Admin IT NAV" THEN
                            BEGIN
                                IF "Type VN" <> "Type VN"::Accessoire THEN
                                 ERROR('Vous n avez pas le droit');
                            END;
                        //END SM
                    end;
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
                }
                field("Line Discount Amount";"Line Discount Amount")
                {
                    Editable = BlnRemise;

                    trigger OnValidate();
                    begin
                        //SM 300717
                        IF "Line Discount Amount" < 0 THEN ERROR('Montant remise doit être positif')
                    end;
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("Réservée Sur Arrivage";"Réservée Sur Arrivage")
                {
                    Editable = false;
                }
                field("VIN Sur Arrivage";"VIN Sur Arrivage")
                {
                    Editable = false;
                }
                field("No. Expédition";"No. Expédition")
                {
                }
                field("Prepayment %";"Prepayment %")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Prepmt. Line Amount";"Prepmt. Line Amount")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Prepmt. Amt. Inv.";"Prepmt. Amt. Inv.")
                {
                    Visible = false;
                }
                field("Allow Invoice Disc.";"Allow Invoice Disc.")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Inv. Discount Amount";"Inv. Discount Amount")
                {
                    Visible = false;
                }
                field("Qty. to Ship";"Qty. to Ship")
                {
                    BlankZero = true;
                    Editable = false;
                    Visible = ClientTaxiLou OR AdminVte;

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
                    Visible = false;
                }
                field("Qty. to Invoice";"Qty. to Invoice")
                {
                    BlankZero = true;
                    Editable = false;
                    Visible = ClientTaxiLou OR AdminVte;
                }
                field("Quantity Invoiced";"Quantity Invoiced")
                {
                    BlankZero = true;
                }
                field("Prepmt Amt to Deduct";"Prepmt Amt to Deduct")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Prepmt Amt Deducted";"Prepmt Amt Deducted")
                {
                    Visible = false;
                }
                field("Allow Item Charge Assignment";"Allow Item Charge Assignment")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Qty. to Assign";"Qty. to Assign")
                {
                    BlankZero = true;
                    QuickEntry = false;
                    Visible = false;

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
                    Visible = false;

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        ShowItemChargeAssgnt;
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                field("Requested Delivery Date";"Requested Delivery Date")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Promised Delivery Date";"Promised Delivery Date")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Planned Delivery Date";"Planned Delivery Date")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    QuickEntry = false;
                }
                field("Shipment Date";"Shipment Date")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    QuickEntry = false;

                    trigger OnValidate();
                    begin
                        ShipmentDateOnAfterValidate;
                    end;
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Shipping Agent Service Code";"Shipping Agent Service Code")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Shipping Time";"Shipping Time")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Work Type Code";"Work Type Code")
                {
                    Editable = ClientTaxiLou OR AdminVte;
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
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Blanket Order No.";"Blanket Order No.")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Blanket Order Line No.";"Blanket Order Line No.")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("FA Posting Date";"FA Posting Date")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Depr. until FA Posting Date";"Depr. until FA Posting Date")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Depreciation Book Code";"Depreciation Book Code")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Use Duplication List";"Use Duplication List")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Duplicate in Depreciation Book";"Duplicate in Depreciation Book")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Appl.-from Item Entry";"Appl.-from Item Entry")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Appl.-to Item Entry";"Appl.-to Item Entry")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Editable = ClientTaxiLou OR AdminVte;
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
                    Editable = ClientTaxiLou OR AdminVte;
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
                field("Code Famille";"Code Famille")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Code Index";"Code Index")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Code Segment";"Code Segment")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    Editable = ClientTaxiLou OR AdminVte;
                    Visible = false;
                }
                field("Return Reason Code";"Return Reason Code")
                {
                    CaptionML = ENU='Return Reason Code',
                                FRA='Motif Remise';
                    Editable = BlnRemise;
                }
                field("Autoriser Vte Vn Marge/Négativ";"Autoriser Vte Vn Marge/Négativ")
                {
                    Visible = false;
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
                action("Fiche Véhicule")
                {

                    trigger OnAction();
                    var
                        ServiceItemCard : Page "5980";
                        ServiceItem : Record "5940";
                    begin
                        //SM 130717
                        CALCFIELDS(VIN);
                        CLEAR(ServiceItemCard);
                        IF VIN <> '' THEN BEGIN
                          ServiceItem.RESET;
                          ServiceItem.SETRANGE("Serial No.",VIN);
                          IF ServiceItem.FINDLAST THEN BEGIN
                            ServiceItemCard.SETRECORD(ServiceItem);
                            ServiceItemCard.SETTABLEVIEW(ServiceItem);
                            ServiceItemCard.RUNMODAL;
                          END;
                        END;
                        //END SM
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
                action("Contenu emplacement")
                {

                    trigger OnAction();
                    begin
                        //ADD RH
                        ShowBinContent;
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
                action("Actualiser affectation")
                {

                    trigger OnAction();
                    begin

                        FctAffecterSur1;
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
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        //RH 250717
        AdminVte := FALSE;
        RecGUserSetup.GET(USERID);
          IF  RecGUserSetup.Admin_Vente_VN THEN BEGIN
                AdminVte := TRUE;
          END ELSE BEGIN
            IF ("Document Date" <> 0D) AND ("Document Date"  < TODAY) THEN
                AdminVte := FALSE
            ELSE
                AdminVte := TRUE;
          END;


        ClientTaxiLou := FALSE;
        IF RecCustomerTaxiLou.GET("Sell-to Customer No.") THEN BEGIN
          IF ((RecCustomerTaxiLou."Code Titre" = 'LOU_TRR') OR  (RecCustomerTaxiLou."Code Titre" = 'TAXI') OR  (RecCustomerTaxiLou."Code Titre" = 'LOUAGE') OR  (RecCustomerTaxiLou."Code Titre" = 'TAXCOLLECT'))
            AND ((Type = Type::"Charge (Item)") AND (("No." = 'TVA015') OR ("No." = 'FODEC') OR ("No." = 'RPD')))  THEN
               ClientTaxiLou := TRUE;
        END;

        //SM 280817 Price Editable
        RecGUserSetup.GET(USERID);
         IF ("Document Date" <> 0D) AND ("Document Date"  < TODAY) THEN
                DateBeforeTODAY := FALSE
            ELSE
                DateBeforeTODAY := TRUE;
        IF RecCustomerTaxiLou.GET("Sell-to Customer No.") THEN BEGIN
          PriceEditable := RecGUserSetup.Admin_Vente_VN
           OR (DateBeforeTODAY AND (Type = Type::"Charge (Item)"))
           OR ((NOT DateBeforeTODAY) AND ((Type = Type::"Charge (Item)") AND
            ((RecCustomerTaxiLou."Code Titre" = 'LOU_TRR') OR  (RecCustomerTaxiLou."Code Titre" = 'LOUAGE')
            OR  (RecCustomerTaxiLou."Code Titre" = 'TAXI') OR  (RecCustomerTaxiLou."Code Titre" = 'TAXCOLLECT'))));
        END ELSE
          PriceEditable := RecGUserSetup.Admin_Vente_VN OR (Type = Type::"Charge (Item)");

        //END SM

        //END SM
        //SM 070917
        IF SalesHeader.GET("Document Type","Document No.") THEN
        EditableForFactureComp:= ("Type VN" = "Type VN"::Vehicule) AND SalesHeader."Facture Complémentaire";
        //END SM
    end;

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        //RH 250717
        AdminVte := FALSE;
        RecGUserSetup.GET(USERID);
          IF  RecGUserSetup.Admin_Vente_VN THEN BEGIN
                AdminVte := TRUE;
          END ELSE BEGIN
            IF ("Document Date" <> 0D) AND ("Document Date"  < TODAY) THEN
                AdminVte := FALSE
            ELSE
                AdminVte := TRUE;
          END;



        ClientTaxiLou := FALSE;
        IF RecCustomerTaxiLou.GET("Sell-to Customer No.") THEN BEGIN
          IF ((RecCustomerTaxiLou."Code Titre" = 'LOU_TRR') OR  (RecCustomerTaxiLou."Code Titre" = 'TAXI') OR  (RecCustomerTaxiLou."Code Titre" = 'LOUAGE') OR (RecCustomerTaxiLou."Code Titre" = 'TAXCOLLECT'))
            AND ((Type = Type::"Charge (Item)") AND (("No." = 'TVA015') OR ("No." = 'FODEC') OR ("No." = 'RPD') OR ("No." = 'IMPR')))  THEN
               ClientTaxiLou := TRUE;
        END;

        //SM 280817 Price Editable
        RecGUserSetup.GET(USERID);
         IF ("Document Date" <> 0D) AND ("Document Date"  < TODAY) THEN
                DateBeforeTODAY := FALSE
            ELSE
                DateBeforeTODAY := TRUE;
        IF RecCustomerTaxiLou.GET("Sell-to Customer No.") THEN BEGIN
          PriceEditable := RecGUserSetup.Admin_Vente_VN
           OR (DateBeforeTODAY AND (Type = Type::"Charge (Item)"))
           OR ((NOT DateBeforeTODAY) AND ((Type = Type::"Charge (Item)") AND
            ((RecCustomerTaxiLou."Code Titre" = 'LOU_TRR') OR  (RecCustomerTaxiLou."Code Titre" = 'LOUAGE') OR  (RecCustomerTaxiLou."Code Titre" = 'TAXI') OR  (RecCustomerTaxiLou."Code Titre" = 'TAXCOLLECT'))));
        END ELSE
          PriceEditable := RecGUserSetup.Admin_Vente_VN OR (Type = Type::"Charge (Item)");

        //END SM
        //SM 070917
        IF SalesHeader.GET("Document Type","Document No.") THEN
        EditableForFactureComp:= ("Type VN" = "Type VN"::Vehicule) AND SalesHeader."Facture Complémentaire";
        //END SM
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
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin


         //SM 200617
        IF "Affecter sur"  = '' THEN
          "Affecter sur" := xRec."Affecter sur";
        //KT 100717 En cours
        FctAffecterSur;
        //SM 300717
        IF NOT (AdminVte OR ClientTaxiLou) THEN BEGIN
          ERROR('Vous ne pouvez pas Insérer')
        END;
        //KT 010817
        Quantity:=1;
        //END KT

        //SM 060917 Price Editable
        RecGUserSetup.GET(USERID);
         IF ("Document Date" <> 0D) AND ("Document Date"  < TODAY) THEN
                DateBeforeTODAY := FALSE
            ELSE
                DateBeforeTODAY := TRUE;
        IF RecCustomerTaxiLou.GET("Sell-to Customer No.") THEN BEGIN
          PriceEditable := RecGUserSetup.Admin_Vente_VN
           OR (DateBeforeTODAY AND (Type = Type::"Charge (Item)"))
           OR ((NOT DateBeforeTODAY) AND ((Type = Type::"Charge (Item)") AND ((RecCustomerTaxiLou."Code Titre" = 'LOU_TRR')
            OR  (RecCustomerTaxiLou."Code Titre" = 'TAXI') OR  (RecCustomerTaxiLou."Code Titre" = 'LOUAGE')
             OR  (RecCustomerTaxiLou."Code Titre" = 'TAXCOLLECT'))));
        END ELSE
          PriceEditable := RecGUserSetup.Admin_Vente_VN OR (Type = Type::"Charge (Item)");

        //END SM
        //SM 070917
        IF SalesHeader.GET("Document Type","Document No.") THEN
        EditableForFactureComp:= ("Type VN" = "Type VN"::Vehicule) AND SalesHeader."Facture Complémentaire";
        //END SM
    end;

    trigger OnModifyRecord() : Boolean;
    begin
         //SM 200617
         IF "Affecter sur"  = '' THEN
           "Affecter sur" := xRec."Affecter sur";
        //KT 100717 En cours
        FctAffecterSur;
        //SM 300717
        IF NOT (AdminVte OR ClientTaxiLou) THEN BEGIN
          ERROR('Vous ne pouvez pas modifier')
        END;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        //SM TMP InitType;
        CLEAR(ShortcutDimCode);

        //KT 100717 En cours
        FctAffecterSur;
        //KT 010817
        Quantity := 1;
        //END KT
    end;

    trigger OnOpenPage();
    begin
        //SM 280817
        PriceEditable := FALSE;
        DateBeforeTODAY := FALSE;
        //END SM
        //SM 070917
        EditableForFactureComp:= FALSE;
        //END SM
        RecGUserSetup.GET(USERID);
        BlnRemise := RecGUserSetup."Autoriser Modif Remise"

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
        UserSetup : Record "91";
        AdminVte : Boolean;
        RecGUserSetup : Record "91";
        ClientTaxiLou : Boolean;
        RecCustomerTaxiLou : Record "18";
        PriceEditable : Boolean;
        DateBeforeTODAY : Boolean;
        EditableForFactureComp : Boolean;
        BlnRemise : Boolean;
        BoolChangeDisc : Boolean;

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

    procedure ShowBinContent();
    var
        PageItemBinContents : Page "7379";
        RecBinContent : Record "7302";
    begin
        IF ("No." <> '') AND ("Variant Code"='') AND ("Bin Code" = '') THEN
          BEGIN
          CLEAR(RecBinContent);
            RecBinContent.SETFILTER(RecBinContent."Item No.",'%1',"No.");
           // PAGE.RUN(7379,RecBinContent);
            PAGE.RUNMODAL(PAGE::"Item Bin Contents",RecBinContent)
          END;

        IF ("No." <> '') AND ("Variant Code" <> '') AND ("Bin Code" = '') THEN
          BEGIN
          CLEAR(RecBinContent);
            RecBinContent.SETFILTER(RecBinContent."Item No.",'%1',"No.");
            RecBinContent.SETFILTER(RecBinContent."Variant Code",'%1',"Variant Code");
           // PAGE.RUN(7379,RecBinContent);
            PAGE.RUNMODAL(PAGE::"Item Bin Contents",RecBinContent)
          END;
          IF ("No." <> '') AND ("Variant Code" = '') AND ("Bin Code" <> '') THEN
          BEGIN
          CLEAR(RecBinContent);
            RecBinContent.SETFILTER(RecBinContent."Item No.",'%1',"No.");
            RecBinContent.SETFILTER(RecBinContent."Bin Code",'%1',"Bin Code");
           // PAGE.RUN(7379,RecBinContent);
            PAGE.RUNMODAL(PAGE::"Item Bin Contents",RecBinContent)
          END;
          IF ("No." <> '') AND ("Variant Code" <> '') AND ("Bin Code" <> '') THEN
          BEGIN
          CLEAR(RecBinContent);
            RecBinContent.SETFILTER(RecBinContent."Item No.",'%1',"No.");
            RecBinContent.SETFILTER(RecBinContent."Bin Code",'%1',"Bin Code");
             RecBinContent.SETFILTER(RecBinContent."Variant Code",'%1',"Variant Code");
            PAGE.RUNMODAL(PAGE::"Item Bin Contents",RecBinContent)
          END;
    end;

    procedure FctAffecterSur();
    var
        LRecSalesLine : Record "37";
        LRecSalesLine2 : Record "37";
    begin
        //KT 100717 En cours
         // IF "Affecter sur"='' THEN
          IF "Type VN"<>"Type VN"::Vehicule  THEN BEGIN
            LRecSalesLine.RESET;
            LRecSalesLine.SETRANGE("Document Type","Document Type");
            LRecSalesLine.SETRANGE("Document No.","Document No.");
            LRecSalesLine.SETRANGE("Type VN",LRecSalesLine."Type VN"::Vehicule);
            LRecSalesLine.SETFILTER("Line No.",'<%1',"Line No.");
            IF LRecSalesLine.FINDLAST THEN BEGIN
              LRecSalesLine.CALCFIELDS(VIN);
              //LRecSalesLine2.GET(LRecSalesLine."Document No.",LRecSalesLine."Document Type",LRecSalesLine."Line No.");//SM ADD
              //LRecSalesLine2."Affecter sur":=LRecSalesLine.VIN;
              //LRecSalesLine2.MODIFY;
              "Affecter sur":=LRecSalesLine.VIN;
              MODIFY;
            END;
          END ELSE
           "Affecter sur":=VIN;
          //LRecSalesLine2.MODIFY;
    end;

    procedure FctAffecterSur1();
    var
        LRecSalesLine : Record "37";
        LRecSalesLine2 : Record "37";
        LRecSalesHeader : Record "36";
    begin
        //KT 100717 En cours
        //MESSAGE('1');
        LRecSalesHeader.RESET;
        LRecSalesHeader.SETRANGE("Document Type","Document Type");
        LRecSalesHeader.SETRANGE("No.","Document No.");
        IF LRecSalesHeader.FINDFIRST THEN BEGIN
          LRecSalesLine2.RESET;
          LRecSalesLine2.SETRANGE("Document Type",LRecSalesHeader."Document Type");
          LRecSalesLine2.SETRANGE("Document No.",LRecSalesHeader."No.");
          LRecSalesLine2.SETFILTER("Type VN",'<>%1',LRecSalesLine2."Type VN"::Vehicule);
          IF LRecSalesLine2.FINDSET THEN BEGIN
            REPEAT
              //IF LRecSalesLine2."Affecter sur"='' THEN
                IF LRecSalesLine2."Type VN"<>LRecSalesLine2."Type VN"::Vehicule  THEN BEGIN
                  LRecSalesLine.RESET;
                  LRecSalesLine.SETRANGE("Document Type",LRecSalesLine2."Document Type");
                  LRecSalesLine.SETRANGE("Document No.",LRecSalesLine2."Document No.");
                  LRecSalesLine.SETRANGE("Type VN",LRecSalesLine."Type VN"::Vehicule);
                  LRecSalesLine.SETFILTER("Line No.",'<%1',LRecSalesLine2."Line No.");
                  IF LRecSalesLine.FINDLAST THEN BEGIN
                    LRecSalesLine.CALCFIELDS(VIN);
                    LRecSalesLine.CALCFIELDS("VIN Sur Arrivage");
                    //MODIF KK_28092017
                    //OLD LRecSalesLine2."Affecter sur":= LRecSalesLine.VIN;
                    IF LRecSalesLine.VIN <> '' THEN
                      LRecSalesLine2."Affecter sur" := LRecSalesLine.VIN
                    ELSE
                      LRecSalesLine2."Affecter sur" := LRecSalesLine."VIN Sur Arrivage";

                    LRecSalesLine2.MODIFY;
                  END;
                END ELSE BEGIN
                  //SM OLD LRecSalesLine.CALCFIELDS(VIN);
                  //SM OLD LRecSalesLine.CALCFIELDS("VIN Sur Arrivage");
                  LRecSalesLine2.CALCFIELDS(VIN);
                  LRecSalesLine2.CALCFIELDS("VIN Sur Arrivage");
                  //MODIF KK_28092017
                  //OLD LRecSalesLine2."Affecter sur":= LRecSalesLine.VIN;
                  IF LRecSalesLine2.VIN <> '' THEN
                    LRecSalesLine2."Affecter sur" := LRecSalesLine2.VIN
                  ELSE
                    LRecSalesLine2."Affecter sur" := LRecSalesLine2."VIN Sur Arrivage";
                  //SM OLD LRecSalesLine2."Affecter sur":=LRecSalesLine2.VIN;
                  LRecSalesLine2.MODIFY;
              END;
            UNTIL LRecSalesLine2.NEXT=0;
          END;
        END;
        CurrPage.UPDATE;
    end;

    procedure ItemExists(ItemNo : Code[20]);
    var
        RecLSalesLine : Record "37";
    begin
        IF ("Type VN"="Type VN"::Accessoire)  AND ("Affecter sur"<>'')THEN BEGIN
          RecLSalesLine.RESET;
          RecLSalesLine.SETRANGE("Document Type","Document Type");
          RecLSalesLine.SETRANGE("Document No.","Document No.");
          RecLSalesLine.SETRANGE(Type,Type);
          RecLSalesLine.SETRANGE("No.","No.");
          RecLSalesLine.SETRANGE("Affecter sur","Affecter sur");
          RecLSalesLine.SETFILTER("Line No.",'<>%1',"Line No.");
          IF NOT RecLSalesLine.ISEMPTY THEN
            ERROR('Article %1 déjà saisi pour ce véhicule ',"No.");
        END;
    end;
}

