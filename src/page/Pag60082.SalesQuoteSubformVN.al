page 60082 "Sales Quote Subform VN"
{
    // version SAV Automobile

    AutoSplitKey = true;
    CaptionML = ENU='Lines PR',
                FRA='Lignes VN';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = Table37;
    SourceTableView = WHERE(Document Type=FILTER(Quote));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Type VN";"Type VN")
                {

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
                        NoOnAfterValidate
                    end;
                }
                field("No. VN";"No. VN")
                {

                    trigger OnValidate();
                    var
                        OldNo : Code[20];
                        OldTypeVN : Option "0","1","2","3","4","5","6","7","8","9";
                    begin
                        //SM 040717
                        //MODIFY;
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
                        NoOnAfterValidate
                    end;
                }
                field("Variant Code";"Variant Code")
                {
                    Visible = true;

                    trigger OnValidate();
                    begin
                        VariantCodeOnAfterValidate
                    end;
                }
                field(Description;Description)
                {
                }
                field("Description 2";"Description 2")
                {
                }
                field("Location Code";"Location Code")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        LocationCodeOnAfterValidate;
                    end;
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;

                    trigger OnValidate();
                    begin
                        QuantityOnAfterValidate;
                    end;
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
                field("Line Discount %";"Line Discount %")
                {
                    BlankZero = true;
                    Editable = BoolChangeDisc;
                }
                field("Line Discount Amount";"Line Discount Amount")
                {
                    Editable = BoolChangeDisc;
                }
                field(Type;Type)
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        TypeOnAfterValidate;
                        NoOnAfterValidate;
                    end;
                }
                field("No.";"No.")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;
                    end;
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                    Editable = false;
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                    Editable = false;
                }
                field("Bin Code";"Bin Code")
                {
                    Editable = false;
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
                    action("Event")
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
                action("Item &Tracking Lines")
                {
                    CaptionML = ENU='Item &Tracking Lines',
                                FRA='Lignes &traçabilité';
                    Image = ItemTrackingLines;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction();
                    var
                        Item : Record "27";
                    begin
                        Item.GET("No.");
                        Item.TESTFIELD("Assembly Policy",Item."Assembly Policy"::"Assemble-to-Stock");
                        TESTFIELD("Qty. to Asm. to Order (Base)",0);
                        OpenItemTrackingLines;
                    end;
                }
                group("Assemble to Order")
                {
                    CaptionML = ENU='Assemble to Order',
                                FRA='Assembler pour commande';
                    Image = AssemblyBOM;
                    action("Assemble-to-Order Lines")
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
                action("Get &Price")
                {
                    CaptionML = ENU='Get &Price',
                                FRA='Extraire &prix';
                    Ellipsis = true;
                    Image = Price;

                    trigger OnAction();
                    begin
                        ShowPrices
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
                action("E&xplode BOM")
                {
                    CaptionML = ENU='E&xplode BOM',
                                FRA='&Eclater nomenclature';
                    Image = ExplodeBOM;

                    trigger OnAction();
                    begin
                        ExplodeBOM;
                    end;
                }
                action("Insert &Ext. Texts")
                {
                    CaptionML = ENU='Insert &Ext. Texts',
                                FRA='Insérer te&xtes étendus';
                    Image = Text;

                    trigger OnAction();
                    begin
                        InsertExtendedText(TRUE);
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
        }
    }

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
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

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        InitType;
        CLEAR(ShortcutDimCode);
    end;

    trigger OnOpenPage();
    begin
        BoolChangeDisc := FALSE ;
        IF RecGuserSetup.GET(UPPERCASE(USERID)) THEN
          IF RecGuserSetup."Autoriser Modif Remise" THEN
            BoolChangeDisc := TRUE ;
    end;

    var
        SalesHeader : Record "36";
        TransferExtendedText : Codeunit "378";
        SalesPriceCalcMgt : Codeunit "7000";
        ItemAvailFormsMgt : Codeunit "353";
        ShortcutDimCode : array [8] of Code[20];
        [InDataSet]
        ItemPanelVisible : Boolean;
        BoolChangeDisc : Boolean;
        RecGuserSetup : Record "91";

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
        CODEUNIT.RUN(CODEUNIT::"Sales-Explode BOM",Rec);
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

    procedure ShowItemSub();
    begin
        ShowItemSub;
    end;

    procedure ShowNonstockItems();
    begin
        ShowNonstock;
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

    procedure ShowLineComments();
    begin
        ShowLineComments;
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
    end;

    local procedure LocationCodeOnAfterValidate();
    begin
        SaveAndAutoAsmToOrder;
    end;

    local procedure VariantCodeOnAfterValidate();
    begin
        SaveAndAutoAsmToOrder;
    end;

    local procedure CrossReferenceNoOnAfterValidat();
    begin
        InsertExtendedText(FALSE);
    end;

    local procedure QuantityOnAfterValidate();
    begin
        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
        END;

        IF (Type = Type::Item) AND
           (Quantity <> xRec.Quantity)
        THEN
          CurrPage.UPDATE(TRUE);
    end;

    local procedure UnitofMeasureCodeOnAfterValida();
    begin
        IF Reserve = Reserve::Always THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
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

    procedure EnableDiscount(Enable : Boolean);
    begin
        BoolChangeDisc := Enable ;
    end;
}

