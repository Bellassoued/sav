page 60030 "Blanket Sales Order Subform PR"
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
                      WHERE(Document Type=FILTER(Blanket Order));

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
                        NoOnAfterValidate;
                    end;
                }
                field("No.";"No.")
                {

                    trigger OnValidate();
                    begin
                        ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate;
                        DecGStock:= CalcStockEconAuto;
                    end;
                }
                field("Cross-Reference No.";"Cross-Reference No.")
                {
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        CrossReferenceNoLookUp;
                        InsertExtendedText(FALSE);
                    end;

                    trigger OnValidate();
                    begin
                        CrossReferenceNoOnAfterValidat;
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
                        LocationCodeOnAfterValidate
                    end;
                }
                field("Stock Economic Auto";DecGStock)
                {
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
                field("Work Type Code";"Work Type Code")
                {
                    Visible = false;
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
                    CaptionML = ENU='Sale Price Exists',
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
                    Visible = false;
                }
                field("Allow Invoice Disc.";"Allow Invoice Disc.")
                {
                    Visible = false;
                }
                field("Qty. to Ship";"Qty. to Ship")
                {
                    BlankZero = true;
                }
                field("Quantity Shipped";"Quantity Shipped")
                {
                    BlankZero = true;
                }
                field("Quantity Invoiced";"Quantity Invoiced")
                {
                    BlankZero = true;
                }
                field("Shipment Date";"Shipment Date")
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
                group("Unposted Lines")
                {
                    CaptionML = ENU='Unposted Lines',
                                FRA='Lignes non validées';
                    Image = "Order";
                    action(Orders)
                    {
                        CaptionML = ENU='Orders',
                                    FRA='Commandes';
                        Image = Document;

                        trigger OnAction();
                        begin
                            ShowOrders;
                        end;
                    }
                    action(Invoices)
                    {
                        CaptionML = ENU='Invoices',
                                    FRA='Factures';
                        Image = Invoice;

                        trigger OnAction();
                        begin
                            ShowInvoices;
                        end;
                    }
                    action("Return Orders")
                    {
                        CaptionML = ENU='Return Orders',
                                    FRA='Retours';
                        Image = ReturnOrder;

                        trigger OnAction();
                        begin
                            ShowReturnOrders;
                        end;
                    }
                    action("Credit Memos")
                    {
                        CaptionML = ENU='Credit Memos',
                                    FRA='Avoirs';
                        Image = CreditMemo;

                        trigger OnAction();
                        begin
                            ShowCreditMemos;
                        end;
                    }
                }
                group("Posted Lines")
                {
                    CaptionML = ENU='Posted Lines',
                                FRA='Lignes validées';
                    Image = Post;
                    action(Shipments)
                    {
                        CaptionML = ENU='Shipments',
                                    FRA='Livraisons';
                        Image = Shipment;

                        trigger OnAction();
                        begin
                            ShowPostedOrders;
                        end;
                    }
                    action(Invoices)
                    {
                        CaptionML = ENU='Invoices',
                                    FRA='Factures';
                        Image = Invoice;

                        trigger OnAction();
                        begin
                            ShowPostedInvoices;
                        end;
                    }
                    action("Return Receipts")
                    {
                        CaptionML = ENU='Return Receipts',
                                    FRA='Réceptions retour';
                        Image = ReturnReceipt;

                        trigger OnAction();
                        begin
                            ShowPostedReturnReceipts;
                        end;
                    }
                    action("Credit Memos")
                    {
                        CaptionML = ENU='Credit Memos',
                                    FRA='Avoirs';
                        Image = CreditMemo;

                        trigger OnAction();
                        begin
                            ShowPostedCreditMemos;
                        end;
                    }
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
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnClosePage();
    begin
        RecUserSetup.GET(USERID);
        IF RecUserSetup."Autoriser Modif Remise" THEN
           BlnRemise := TRUE;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        InitType;
        CLEAR(ShortcutDimCode);
    end;

    trigger OnOpenPage();
    begin
        BlnRemise := FALSE;
    end;

    var
        SalesHeader : Record "36";
        TransferExtendedText : Codeunit "378";
        SalesPriceCalcMgt : Codeunit "7000";
        ItemAvailFormsMgt : Codeunit "353";
        ShortcutDimCode : array [8] of Code[20];
        CurrentSalesLine : Record "37";
        SalesLine : Record "37";
        DecGStock : Decimal;
        RecUserSetup : Record "91";
        BlnRemise : Boolean;

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

    procedure ShowOrders();
    begin
        CurrentSalesLine := Rec;
        SalesLine.RESET;
        SalesLine.SETCURRENTKEY("Document Type","Blanket Order No.","Blanket Order Line No.");
        SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::Order);
        SalesLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
        SalesLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
        PAGE.RUNMODAL(PAGE::"Sales Lines",SalesLine);
    end;

    procedure ShowInvoices();
    begin
        CurrentSalesLine := Rec;
        SalesLine.RESET;
        SalesLine.SETCURRENTKEY("Document Type","Blanket Order No.","Blanket Order Line No.");
        SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::Invoice);
        SalesLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
        SalesLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
        PAGE.RUNMODAL(PAGE::"Sales Lines",SalesLine);
    end;

    procedure ShowReturnOrders();
    begin
        CurrentSalesLine := Rec;
        SalesLine.RESET;
        SalesLine.SETCURRENTKEY("Document Type","Blanket Order No.","Blanket Order Line No.");
        SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::"Return Order");
        SalesLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
        SalesLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
        PAGE.RUNMODAL(PAGE::"Sales Lines",SalesLine);
    end;

    procedure ShowCreditMemos();
    begin
        CurrentSalesLine := Rec;
        SalesLine.RESET;
        SalesLine.SETCURRENTKEY("Document Type","Blanket Order No.","Blanket Order Line No.");
        SalesLine.SETRANGE("Document Type",SalesLine."Document Type"::"Credit Memo");
        SalesLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
        SalesLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
        PAGE.RUNMODAL(PAGE::"Sales Lines",SalesLine);
    end;

    procedure ShowPostedOrders();
    var
        SaleShptLine : Record "111";
    begin
        CurrentSalesLine := Rec;
        SaleShptLine.RESET;
        SaleShptLine.SETCURRENTKEY("Blanket Order No.","Blanket Order Line No.");
        SaleShptLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
        SaleShptLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
        PAGE.RUNMODAL(PAGE::"Posted Sales Shipment Lines",SaleShptLine);
    end;

    procedure ShowPostedInvoices();
    var
        SalesInvLine : Record "113";
    begin
        CurrentSalesLine := Rec;
        SalesInvLine.RESET;
        SalesInvLine.SETCURRENTKEY("Blanket Order No.","Blanket Order Line No.");
        SalesInvLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
        SalesInvLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
        PAGE.RUNMODAL(PAGE::"Posted Sales Invoice Lines",SalesInvLine);
    end;

    procedure ShowPostedReturnReceipts();
    var
        ReturnRcptLine : Record "6661";
    begin
        CurrentSalesLine := Rec;
        ReturnRcptLine.RESET;
        ReturnRcptLine.SETCURRENTKEY("Blanket Order No.","Blanket Order Line No.");
        ReturnRcptLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
        ReturnRcptLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
        PAGE.RUNMODAL(PAGE::"Posted Return Receipt Lines",ReturnRcptLine);
    end;

    procedure ShowPostedCreditMemos();
    var
        SalesCrMemoLine : Record "115";
    begin
        CurrentSalesLine := Rec;
        SalesCrMemoLine.RESET;
        SalesCrMemoLine.SETCURRENTKEY("Blanket Order No.","Blanket Order Line No.");
        SalesCrMemoLine.SETRANGE("Blanket Order No.",CurrentSalesLine."Document No.");
        SalesCrMemoLine.SETRANGE("Blanket Order Line No.",CurrentSalesLine."Line No.");
        PAGE.RUNMODAL(PAGE::"Posted Sales Credit Memo Lines",SalesCrMemoLine);
    end;

    local procedure NoOnAfterValidate();
    begin
        InsertExtendedText(FALSE);

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
}

