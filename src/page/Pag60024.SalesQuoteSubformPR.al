page 60024 "Sales Quote Subform PR"
{
    // version SAV Automobile

    AutoSplitKey = true;
    CaptionML = ENU='Lines PR',
                FRA='Lignes PR';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = Table37;
    SourceTableView = SORTING(Document Type,Document No.,Line No.)
                      WHERE(Document Type=FILTER(Quote));

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

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;
                        //DecGStock :=CalcStockEconAuto;
                        //DecGStock :=  FctCalcTotalStockDispoMag ;
                        //DecStockTotalDispo := LCduItemavailability.FctCalcStockDispoTotal("No.");
                        //DecStockTotalDispoProj := LCduItemavailability.FctCalcStockProjeterDispoTotal("No.");

                        RecGStockCompagny := LCduItemavailability.FctCalcStockDispoByCompanyForAllCentralMag("No.",COMPANYNAME);
                        //END SM 090519

                        //DecStockTotalDispo := LCduItemavailability.FctCalcStockDispoTotal("No.");
                        //DecStockTotalDispoProj := LCduItemavailability.FctCalcStockProjeterDispoTotal("No.");
                        //DecGStock := CalcStockEconAuto ;
                        DecQtyDispoAcmD := LCduItemavailability.FctCalcStockDispoByMagCentralOT("No.");
                        //VALIDATE(Quantity);
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
                field("Variant Code";"Variant Code")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        VariantCodeOnAfterValidate
                    end;
                }
                field("Substitution Available";"Substitution Available")
                {
                    Visible = false;
                }
                field(Nonstock;Nonstock)
                {
                    Visible = false;
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                    Visible = false;
                }
                field(Description;Description)
                {
                }
                field("Location Code";"Location Code")
                {

                    trigger OnValidate();
                    begin
                        LocationCodeOnAfterValidate;
                    end;
                }
                field("Stock Dispo. Mag. Consolidé";DecQtyDispoAcmD)
                {
                    Caption = 'Qty Succursale';
                    Editable = false;
                }
                field("Stock Possible à Commander";RecGStockCompagny)
                {
                    CaptionML = ENU='QtyTotal Disponible',
                                FRA='Qté Possible à Commander';
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;

                    trigger OnValidate();
                    begin
                        QuantityOnAfterValidate;
                    end;
                }
                field("Qty. to Assemble to Order";"Qty. to Assemble to Order")
                {
                    Visible = false;

                    trigger OnDrillDown();
                    begin
                        ShowAsmToOrderLines;
                    end;

                    trigger OnValidate();
                    begin
                        CurrPage.SAVERECORD;
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {

                    trigger OnValidate();
                    begin
                        UnitofMeasureCodeOnAfterValida;
                    end;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    Visible = false;
                }
                field(PriceExists;PriceExists)
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
                    Editable = BlnRemise;
                }
                field(LineDiscExists;LineDiscExists)
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
                    Visible = false;
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("Allow Invoice Disc.";"Allow Invoice Disc.")
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

                    trigger OnDrillDown();
                    begin
                        CurrPage.SAVERECORD;
                        ShowItemChargeAssgnt;
                        UpdateForm(FALSE);
                    end;
                }
                field("Work Type Code";"Work Type Code")
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
                field("Transaction Specification";"Transaction Specification")
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
    begin

        RecGStockCompagny := LCduItemavailability.FctCalcStockDispoByCompanyForAllCentralMag("No.",COMPANYNAME);
        DecQtyDispoAcmD := LCduItemavailability.FctCalcStockDispoByMagCentralOT("No.");
    end;

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        //<< TRIUM RAD 18/02/2014 - Calcul stock Consolidé
        //DecGStock := CalcStockEconAuto ;
        //>> End TRIUM RAD Addin
        //DecGStock :=  FctCalcTotalStockDispoMag ;
        //DecStockTotalDispo := LCduItemavailability.FctCalcStockDispoTotal("No.");
        //DecStockTotalDispoProj := LCduItemavailability.FctCalcStockProjeterDispoTotal("No.");
        //DecQtyDispoAcmD := LCduItemavailability.FctCalcStockDispoByMagCentralOT("No.");

        RecGStockCompagny := LCduItemavailability.FctCalcStockDispoByCompanyForAllCentralMag("No.",COMPANYNAME);
        DecQtyDispoAcmD := LCduItemavailability.FctCalcStockDispoByMagCentralOT("No.");
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

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        InitType;
        CLEAR(ShortcutDimCode);
    end;

    trigger OnOpenPage();
    begin
        RecUserSetup.GET(USERID);
        IF RecUserSetup."Autoriser Modif Remise" THEN
           BlnRemise := TRUE;
    end;

    var
        SalesHeader : Record "36";
        TransferExtendedText : Codeunit "378";
        SalesPriceCalcMgt : Codeunit "7000";
        ItemAvailFormsMgt : Codeunit "353";
        ShortcutDimCode : array [8] of Code[20];
        [InDataSet]
        ItemPanelVisible : Boolean;
        DecGStock : Decimal;
        DecStockTotalDispo : Decimal;
        DecStockTotalDispoProj : Decimal;
        LCduItemavailability : Codeunit "70000";
        BlnRemise : Boolean;
        RecUserSetup : Record "91";
        DecQtyDispoAcmD : Decimal;
        RecGStockCompagny : Decimal;

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
        //SM 080617
        /*
        DecQtyDispoAcmD := LCduItemavailability.FctCalcStockDispoByMagCentralOT("No.");
        IF (Type = Type::Item) AND (DecQtyDispoAcmD <  Quantity) THEN BEGIN //TODO ligne service
        // T37 cle no seq magsin bin CLIENT qty current date 3 chanmps cal DecGStock an after get record no commande no lign centre de gestion utilisate(code vendeur) prix untaire article designat ref
        FctInsertionVentesRatees;
        END;
        */
        //END
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

    local procedure FctInsertionVentesRatees();
    var
        SalesHeader : Record "36";
        RecGItem : Record "27";
        "RecGVentesratées" : Record "70096";
        LRecPurchaseLine : Record "39";
    begin
        SalesHeader.GET("Document Type","Document No.");
        RecGItem.GET("No.");
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
        DecQtyDispoAcmD := LCduItemavailability.FctCalcStockDispoByMagCentralOT("No.");
        RecGVentesratées.VALIDATE(Inventory ,DecQtyDispoAcmD);
        /*
        RecGVentesratées."Stock Total"                    := RecGItem.Inventory;
        RecGVentesratées."Qté Manquante"                  := DecQtyDispoAcmD - Quantity;
        RecGVentesratées."Valeur des Manquant"            := "Unit Price" * (DecQtyDispoAcmD - Quantity);;
        */
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

