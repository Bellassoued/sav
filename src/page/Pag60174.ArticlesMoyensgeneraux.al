page 60174 "Articles Moyens generaux"
{
    // version NAVW17.10.00.36035CU9RAD

    CaptionML = ENU='Item Card',
                FRA='Fiche article';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Table27;

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
                    Editable = true;
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit THEN
                          CurrPage.UPDATE;
                    end;
                }
                field(Description;Description)
                {
                }
                field("Base Unit of Measure";"Base Unit of Measure")
                {
                    Importance = Promoted;
                }
                field("Assembly BOM";"Assembly BOM")
                {
                }
                field("Shelf No.";"Shelf No.")
                {
                }
                field("Automatic Ext. Texts";"Automatic Ext. Texts")
                {
                }
                field("Created From Nonstock Item";"Created From Nonstock Item")
                {
                }
                field("Item Category Code";"Item Category Code")
                {

                    trigger OnValidate();
                    begin
                        EnableCostingControls;
                    end;
                }
                field("Product Group Code";"Product Group Code")
                {
                }
                field("Code Modèle PR";"Code Modèle PR")
                {
                }
                field("Service Item Group";"Service Item Group")
                {
                }
                field("Item type";"Item type")
                {
                }
                field("Search Description";"Search Description")
                {
                }
                field(Inventory;Inventory)
                {
                    Importance = Promoted;
                }
                field("Qty. on Purch. Order";"Qty. on Purch. Order")
                {
                }
                field("Qty. on Prod. Order";"Qty. on Prod. Order")
                {
                }
                field("Qty. on Component Lines";"Qty. on Component Lines")
                {
                }
                field("Qty. on Sales Order";"Qty. on Sales Order")
                {
                }
                field("Qty. on Service Order";"Qty. on Service Order")
                {
                }
                field("Qty. on Job Order";"Qty. on Job Order")
                {
                }
                field("Qty. on Assembly Order";"Qty. on Assembly Order")
                {
                    Importance = Additional;
                }
                field("Qty. on Asm. Component";"Qty. on Asm. Component")
                {
                    Importance = Additional;
                }
                field(Blocked;Blocked)
                {
                }
                field("Last Date Modified";"Last Date Modified")
                {
                }
                field(StockoutWarningDefaultYes;"Stockout Warning")
                {
                    CaptionML = ENU='Stockout Warning',
                                FRA='Alerte rupture stock';
                    OptionCaptionML = ENU='Default (Yes),No,Yes',
                                      FRA='Par défaut (Oui),Non,Oui';
                    Visible = ShowStockoutWarningDefaultYes;
                }
                field(StockoutWarningDefaultNo;"Stockout Warning")
                {
                    CaptionML = ENU='Stockout Warning',
                                FRA='Alerte rupture stock';
                    OptionCaptionML = ENU='Default (No),No,Yes',
                                      FRA='Par défaut (Non),Non,Oui';
                    Visible = ShowStockoutWarningDefaultNo;
                }
                field(PreventNegInventoryDefaultYes;"Prevent Negative Inventory")
                {
                    CaptionML = ENU='Prevent Negative Inventory',
                                FRA='Éviter stock négatif';
                    OptionCaptionML = ENU='Default (Yes),No,Yes',
                                      FRA='Par défaut (Oui),Non,Oui';
                    Visible = ShowPreventNegInventoryDefaultYes;
                }
                field(PreventNegInventoryDefaultNo;"Prevent Negative Inventory")
                {
                    CaptionML = ENU='Prevent Negative Inventory',
                                FRA='Éviter stock négatif';
                    OptionCaptionML = ENU='Default (No),No,Yes',
                                      FRA='Par défaut (Non),Non,Oui';
                    Visible = ShowPreventNegInventoryDefaultNo;
                }
                field("Additional Sales";"Additional Sales")
                {
                }
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Costing Method";"Costing Method")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        EnableCostingControls;
                    end;
                }
                field("Cost is Adjusted";"Cost is Adjusted")
                {
                }
                field("Cost is Posted to G/L";"Cost is Posted to G/L")
                {
                }
                field("Standard Cost";"Standard Cost")
                {
                    Enabled = StandardCostEnable;

                    trigger OnDrillDown();
                    var
                        ShowAvgCalcItem : Codeunit "5803";
                    begin
                        ShowAvgCalcItem.DrillDownAvgCostAdjmtPoint(Rec)
                    end;
                }
                field("Unit Cost";"Unit Cost")
                {
                    Enabled = UnitCostEnable;

                    trigger OnDrillDown();
                    var
                        ShowAvgCalcItem : Codeunit "5803";
                    begin
                        ShowAvgCalcItem.DrillDownAvgCostAdjmtPoint(Rec)
                    end;
                }
                field("Overhead Rate";"Overhead Rate")
                {
                }
                field("Indirect Cost %";"Indirect Cost %")
                {
                }
                field("Last Direct Cost";"Last Direct Cost")
                {
                }
                field("Price/Profit Calculation";"Price/Profit Calculation")
                {
                }
                field("Profit %";"Profit %")
                {
                }
                field("Unit Price";"Unit Price")
                {
                    Importance = Promoted;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    Importance = Promoted;
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                }
                field("Inventory Posting Group";"Inventory Posting Group")
                {
                    Importance = Promoted;
                }
                field("Net Invoiced Qty.";"Net Invoiced Qty.")
                {
                }
                field("Allow Invoice Disc.";"Allow Invoice Disc.")
                {
                }
                field("Item Disc. Group";"Item Disc. Group")
                {
                }
                field("Sales Unit of Measure";"Sales Unit of Measure")
                {
                }
                field("Apply Fodec";"Apply Fodec")
                {
                }
                field("Application Wksh. User ID";"Application Wksh. User ID")
                {
                    Visible = false;
                }
            }
            group(Replenishment)
            {
                CaptionML = ENU='Replenishment',
                            FRA='Réapprovisionnement';
                field("Replenishment System";"Replenishment System")
                {
                    Importance = Promoted;
                }
                field("Lead Time Calculation";"Lead Time Calculation")
                {
                }
                group(Purchase)
                {
                    CaptionML = ENU='Purchase',
                                FRA='Achats';
                    field("Vendor No.";"Vendor No.")
                    {
                    }
                    field("Vendor Item No.";"Vendor Item No.")
                    {
                    }
                    field("Purch. Unit of Measure";"Purch. Unit of Measure")
                    {
                    }
                }
                group(Production)
                {
                    CaptionML = ENU='Production',
                                FRA='Fabrication';
                    field("Manufacturing Policy";"Manufacturing Policy")
                    {
                    }
                    field("Routing No.";"Routing No.")
                    {
                    }
                    field("Production BOM No.";"Production BOM No.")
                    {
                    }
                    field("Rounding Precision";"Rounding Precision")
                    {
                    }
                    field("Flushing Method";"Flushing Method")
                    {
                    }
                    field("Scrap %";"Scrap %")
                    {
                    }
                    field("Lot Size";"Lot Size")
                    {
                    }
                }
                group(Assembly)
                {
                    CaptionML = ENU='Assembly',
                                FRA='Assemblage';
                    field("Assembly Policy";"Assembly Policy")
                    {
                    }
                }
            }
            group(Planning)
            {
                CaptionML = ENU='Planning',
                            FRA='Planning';
                field("Reordering Policy";"Reordering Policy")
                {
                    Importance = Promoted;

                    trigger OnValidate();
                    begin
                        EnablePlanningControls
                    end;
                }
                field(Reserve;Reserve)
                {
                    Importance = Promoted;
                }
                field("Order Tracking Policy";"Order Tracking Policy")
                {
                }
                field("Stockkeeping Unit Exists";"Stockkeeping Unit Exists")
                {
                }
                field("Dampener Period";"Dampener Period")
                {
                    Enabled = DampenerPeriodEnable;
                }
                field("Dampener Quantity";"Dampener Quantity")
                {
                    Enabled = DampenerQtyEnable;
                }
                field(Critical;Critical)
                {
                }
                field("Safety Lead Time";"Safety Lead Time")
                {
                    Enabled = SafetyLeadTimeEnable;
                }
                field("Safety Stock Quantity";"Safety Stock Quantity")
                {
                    Enabled = SafetyStockQtyEnable;
                }
                group("Lot-for-Lot Parameters")
                {
                    CaptionML = ENU='Lot-for-Lot Parameters',
                                FRA='Paramètres Lot pour lot';
                    field("Include Inventory";"Include Inventory")
                    {
                        Enabled = IncludeInventoryEnable;

                        trigger OnValidate();
                        begin
                            EnablePlanningControls
                        end;
                    }
                    field("Lot Accumulation Period";"Lot Accumulation Period")
                    {
                        Enabled = LotAccumulationPeriodEnable;
                    }
                    field("Rescheduling Period";"Rescheduling Period")
                    {
                        Enabled = ReschedulingPeriodEnable;
                    }
                }
                group("Reorder-Point Parameters")
                {
                    CaptionML = ENU='Reorder-Point Parameters',
                                FRA='Paramètres Point de commande';
                    grid()
                    {
                        GridLayout = Rows;
                        group()
                        {
                            field("Reorder Point";"Reorder Point")
                            {
                                Enabled = ReorderPointEnable;
                            }
                            field("Reorder Quantity";"Reorder Quantity")
                            {
                                Enabled = ReorderQtyEnable;
                            }
                            field("Maximum Inventory";"Maximum Inventory")
                            {
                                Enabled = MaximumInventoryEnable;
                            }
                        }
                    }
                    field("Overflow Level";"Overflow Level")
                    {
                        Enabled = OverflowLevelEnable;
                        Importance = Additional;
                    }
                    field("Time Bucket";"Time Bucket")
                    {
                        Enabled = TimeBucketEnable;
                        Importance = Additional;
                    }
                }
                group("Order Modifiers")
                {
                    CaptionML = ENU='Order Modifiers',
                                FRA='Modificateur ordre';
                    grid()
                    {
                        GridLayout = Rows;
                        group()
                        {
                            field("Minimum Order Quantity";"Minimum Order Quantity")
                            {
                                Enabled = MinimumOrderQtyEnable;
                            }
                            field("Maximum Order Quantity";"Maximum Order Quantity")
                            {
                                Enabled = MaximumOrderQtyEnable;
                            }
                            field("Order Multiple";"Order Multiple")
                            {
                                Enabled = OrderMultipleEnable;
                            }
                        }
                    }
                }
            }
            group("Foreign Trade")
            {
                CaptionML = ENU='Foreign Trade',
                            FRA='International';
                field("Tariff No.";"Tariff No.")
                {
                }
                field("Country/Region of Origin Code";"Country/Region of Origin Code")
                {
                }
                field("Net Weight";"Net Weight")
                {
                }
                field("Gross Weight";"Gross Weight")
                {
                }
            }
            group("Item Tracking")
            {
                CaptionML = ENU='Item Tracking',
                            FRA='Traçabilité';
                field("Item Tracking Code";"Item Tracking Code")
                {
                    Importance = Promoted;
                }
                field("Serial Nos.";"Serial Nos.")
                {
                }
                field("Lot Nos.";"Lot Nos.")
                {
                }
                field("Expiration Calculation";"Expiration Calculation")
                {
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                field("Special Equipment Code";"Special Equipment Code")
                {
                }
                field("Put-away Template Code";"Put-away Template Code")
                {
                }
                field("Put-away Unit of Measure Code";"Put-away Unit of Measure Code")
                {
                    Importance = Promoted;
                }
                field("Phys Invt Counting Period Code";"Phys Invt Counting Period Code")
                {
                    Importance = Promoted;
                }
                field("Last Phys. Invt. Date";"Last Phys. Invt. Date")
                {
                }
                field("Last Counting Period Update";"Last Counting Period Update")
                {
                }
                field("Identifier Code";"Identifier Code")
                {
                }
                field("Use Cross-Docking";"Use Cross-Docking")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(;Links)
            {
                Visible = true;
            }
            systempart(;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Master Data")
            {
                CaptionML = ENU='Master Data',
                            FRA='Données principales';
                Image = "<DataEntry>";
                action("&Units of Measure")
                {
                    CaptionML = ENU='&Units of Measure',
                                FRA='&Unités';
                    Image = UnitOfMeasure;
                    RunObject = Page 5404;
                    RunPageLink = Item No.=FIELD(No.);
                }
                action("Va&riants")
                {
                    CaptionML = ENU='Va&riants',
                                FRA='&Variantes';
                    Image = ItemVariant;
                    RunObject = Page 5401;
                    RunPageLink = Item No.=FIELD(No.);
                }
                group(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                }
                action(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    RunObject = Page 540;
                    RunPageLink = Table ID=CONST(27),
                                  No.=FIELD(No.);
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action("Substituti&ons")
                {
                    CaptionML = ENU='Substituti&ons',
                                FRA='Articles de su&bstitution';
                    Image = ItemSubstitution;
                    RunObject = Page 5716;
                    RunPageLink = Type=CONST(Item),
                                  No.=FIELD(No.);
                }
                action("Cross Re&ferences")
                {
                    CaptionML = ENU='Cross Re&ferences',
                                FRA='&Références externes';
                    Image = Change;
                    RunObject = Page 5721;
                    RunPageLink = Item No.=FIELD(No.);
                }
                action("E&xtended Texts")
                {
                    CaptionML = ENU='E&xtended Texts',
                                FRA='Te&xtes étendus';
                    Image = Text;
                    RunObject = Page 391;
                    RunPageLink = Table Name=CONST(Item),
                                  No.=FIELD(No.);
                    RunPageView = SORTING(Table Name,No.,Language Code,All Language Codes,Starting Date,Ending Date);
                }
                action(Translations)
                {
                    CaptionML = ENU='Translations',
                                FRA='Traductions';
                    Image = Translations;
                    RunObject = Page 35;
                    RunPageLink = Item No.=FIELD(No.);
                }
                action("&Picture")
                {
                    CaptionML = ENU='&Picture',
                                FRA='&Image';
                    Image = Picture;
                    RunObject = Page 346;
                    RunPageLink = No.=FIELD(No.),
                                  Date Filter=FIELD(Date Filter),
                                  Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                                  Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),
                                  Location Filter=FIELD(Location Filter),
                                  Drop Shipment Filter=FIELD(Drop Shipment Filter),
                                  Variant Filter=FIELD(Variant Filter);
                }
                action(Identifiers)
                {
                    CaptionML = ENU='Identifiers',
                                FRA='Identifiants';
                    Image = BarCode;
                    RunObject = Page 7706;
                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.,Variant Code,Unit of Measure Code);
                }
            }
            group(Availability)
            {
                CaptionML = ENU='Availability',
                            FRA='Disponibilité';
                Image = ItemAvailability;
                action(ItemsByLocation)
                {
                    CaptionML = ENU='Items b&y Location',
                                FRA='Articles &par magasin';
                    Image = ItemAvailbyLoc;

                    trigger OnAction();
                    var
                        ItemsByLocation : Page "491";
                    begin
                        ItemsByLocation.SETRECORD(Rec);
                        ItemsByLocation.RUN;
                    end;
                }
                group("&Item Availability by")
                {
                    CaptionML = ENU='&Item Availability by',
                                FRA='&Disponibilité article par';
                    Image = ItemAvailability;
                    action("<Action110>")
                    {
                        CaptionML = ENU='Event',
                                    FRA='Événement';
                        Image = "Event";

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItem(Rec,ItemAvailFormsMgt.ByEvent);
                        end;
                    }
                    action(Period)
                    {
                        CaptionML = ENU='Period',
                                    FRA='Période';
                        Image = Period;
                        RunObject = Page 157;
                        RunPageLink = No.=FIELD(No.),
                                      Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                                      Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),
                                      Location Filter=FIELD(Location Filter),
                                      Drop Shipment Filter=FIELD(Drop Shipment Filter),
                                      Variant Filter=FIELD(Variant Filter);
                    }
                    action(Variant)
                    {
                        CaptionML = ENU='Variant',
                                    FRA='Variante';
                        Image = ItemVariant;
                        RunObject = Page 5414;
                        RunPageLink = No.=FIELD(No.),
                                      Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                                      Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),
                                      Location Filter=FIELD(Location Filter),
                                      Drop Shipment Filter=FIELD(Drop Shipment Filter),
                                      Variant Filter=FIELD(Variant Filter);
                    }
                    action(Location)
                    {
                        CaptionML = ENU='Location',
                                    FRA='Magasin';
                        Image = Warehouse;
                        RunObject = Page 492;
                        RunPageLink = No.=FIELD(No.),
                                      Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                                      Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),
                                      Location Filter=FIELD(Location Filter),
                                      Drop Shipment Filter=FIELD(Drop Shipment Filter),
                                      Variant Filter=FIELD(Variant Filter);
                    }
                    action("BOM Level")
                    {
                        CaptionML = ENU='BOM Level',
                                    FRA='Niveau nomenclature';
                        Image = BOMLevel;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItem(Rec,ItemAvailFormsMgt.ByBOM);
                        end;
                    }
                    action(Timeline)
                    {
                        CaptionML = ENU='Timeline',
                                    FRA='Chronologie';
                        Image = Timeline;

                        trigger OnAction();
                        begin
                            ShowTimelineFromItem(Rec);
                        end;
                    }
                }
            }
            group(History)
            {
                CaptionML = ENU='History',
                            FRA='Historique';
                Image = History;
                group("E&ntries")
                {
                    CaptionML = ENU='E&ntries',
                                FRA='É&critures';
                    Image = Entries;
                    action("Ledger E&ntries")
                    {
                        CaptionML = ENU='Ledger E&ntries',
                                    FRA='É&critures comptables';
                        Image = ItemLedger;
                        Promoted = false;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        RunObject = Page 38;
                        RunPageLink = Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.);
                        ShortCutKey = 'Ctrl+F7';
                    }
                    action("&Reservation Entries")
                    {
                        CaptionML = ENU='&Reservation Entries',
                                    FRA='Écritures &réservation';
                        Image = ReservationLedger;
                        RunObject = Page 497;
                        RunPageLink = Reservation Status=CONST(Reservation),
                                      Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.,Variant Code,Location Code,Reservation Status);
                    }
                    action("&Phys. Inventory Ledger Entries")
                    {
                        CaptionML = ENU='&Phys. Inventory Ledger Entries',
                                    FRA='Écritures comptables &inventaire';
                        Image = PhysicalInventoryLedger;
                        RunObject = Page 390;
                        RunPageLink = Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.);
                    }
                    action("&Value Entries")
                    {
                        CaptionML = ENU='&Value Entries',
                                    FRA='Écritures &valeur';
                        Image = ValueLedger;
                        RunObject = Page 5802;
                        RunPageLink = Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.);
                    }
                    action("Item &Tracking Entries")
                    {
                        CaptionML = ENU='Item &Tracking Entries',
                                    FRA='Ecritures &traçabilité';
                        Image = ItemTrackingLedger;

                        trigger OnAction();
                        var
                            ItemTrackingMgt : Codeunit "6500";
                            ItemTrackingDocManagement : Codeunit "6503";
                        begin
                            //ItemTrackingMgt.CallItemTrackingEntryForm(3,'',"No.",'','','','');
                            ItemTrackingDocManagement.ShowItemTrackingForMasterData(3,'',"No.",'','','','');
                        end;
                    }
                    action("&Warehouse Entries")
                    {
                        CaptionML = ENU='&Warehouse Entries',
                                    FRA='É&critures entrepôt';
                        Image = BinLedger;
                        RunObject = Page 7318;
                        RunPageLink = Item No.=FIELD(No.);
                        RunPageView = SORTING(Item No.,Bin Code,Location Code,Variant Code,Unit of Measure Code,Lot No.,Serial No.,Entry Type,Dedicated);
                    }
                    action("Application Worksheet")
                    {
                        CaptionML = ENU='Application Worksheet',
                                    FRA='Feuille lettrage';
                        Image = ApplicationWorksheet;
                        RunObject = Page 521;
                        RunPageLink = Item No.=FIELD(No.);
                    }
                }
                group(Statistics)
                {
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    action(Statistics)
                    {
                        CaptionML = ENU='Statistics',
                                    FRA='Statistiques';
                        Image = Statistics;
                        Promoted = true;
                        PromotedCategory = Process;
                        ShortCutKey = 'F7';

                        trigger OnAction();
                        var
                            ItemStatistics : Page "5827";
                        begin
                            ItemStatistics.SetItem(Rec);
                            ItemStatistics.RUNMODAL;
                        end;
                    }
                    action("Entry Statistics")
                    {
                        CaptionML = ENU='Entry Statistics',
                                    FRA='Statistiques écritures';
                        Image = EntryStatistics;
                        RunObject = Page 304;
                        RunPageLink = No.=FIELD(No.),
                                      Date Filter=FIELD(Date Filter),
                                      Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                                      Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),
                                      Location Filter=FIELD(Location Filter),
                                      Drop Shipment Filter=FIELD(Drop Shipment Filter),
                                      Variant Filter=FIELD(Variant Filter);
                    }
                    action("T&urnover")
                    {
                        CaptionML = ENU='T&urnover',
                                    FRA='&Rotation';
                        Image = Turnover;
                        RunObject = Page 158;
                        RunPageLink = No.=FIELD(No.),
                                      Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                                      Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),
                                      Location Filter=FIELD(Location Filter),
                                      Drop Shipment Filter=FIELD(Drop Shipment Filter),
                                      Variant Filter=FIELD(Variant Filter);
                    }
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 124;
                    RunPageLink = Table Name=CONST(Item),
                                  No.=FIELD(No.);
                }
            }
            group("&Purchases")
            {
                CaptionML = ENU='&Purchases',
                            FRA='Ac&hats';
                Image = Purchasing;
                action("Ven&dors")
                {
                    CaptionML = ENU='Ven&dors',
                                FRA='&Fournisseurs';
                    Image = Vendor;
                    RunObject = Page 114;
                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action(Prices)
                {
                    CaptionML = ENU='Prices',
                                FRA='Prix';
                    Image = Price;
                    RunObject = Page 7012;
                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action("Line Discounts")
                {
                    CaptionML = ENU='Line Discounts',
                                FRA='Remises ligne';
                    Image = LineDiscount;
                    RunObject = Page 7014;
                    RunPageLink = Item No.=FIELD(No.);
                }
                action("Prepa&yment Percentages")
                {
                    CaptionML = ENU='Prepa&yment Percentages',
                                FRA='Pourcentages acom&pte';
                    Image = PrepaymentPercentages;
                    RunObject = Page 665;
                    RunPageLink = Item No.=FIELD(No.);
                }
                separator()
                {
                }
                action(Orders)
                {
                    CaptionML = ENU='Orders',
                                FRA='Commandes';
                    Image = Document;
                    RunObject = Page 56;
                    RunPageLink = Type=CONST(Item),
                                  No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
                }
                action("Return Orders")
                {
                    CaptionML = ENU='Return Orders',
                                FRA='Retours';
                    Image = ReturnOrder;
                    RunObject = Page 6643;
                    RunPageLink = Type=CONST(Item),
                                  No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
                }
                action("Nonstoc&k Items")
                {
                    CaptionML = ENU='Nonstoc&k Items',
                                FRA='Articles &non stockés';
                    Image = NonStockItem;
                    RunObject = Page 5726;
                }
            }
            group("S&ales")
            {
                CaptionML = ENU='S&ales',
                            FRA='&Ventes';
                Image = Sales;
                action(Prices)
                {
                    CaptionML = ENU='Prices',
                                FRA='Prix';
                    Image = Price;
                    RunObject = Page 7002;
                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action("Line Discounts")
                {
                    CaptionML = ENU='Line Discounts',
                                FRA='Remises ligne';
                    Image = LineDiscount;
                    RunObject = Page 7004;
                    RunPageLink = Type=CONST(Item),
                                  Code=FIELD(No.);
                    RunPageView = SORTING(Type,Code);
                }
                action("Prepa&yment Percentages")
                {
                    CaptionML = ENU='Prepa&yment Percentages',
                                FRA='Pourcentages acom&pte';
                    Image = PrepaymentPercentages;
                    RunObject = Page 664;
                    RunPageLink = Item No.=FIELD(No.);
                }
                separator()
                {
                }
                action(Orders)
                {
                    CaptionML = ENU='Orders',
                                FRA='Commandes';
                    Image = Document;
                    RunObject = Page 48;
                    RunPageLink = Type=CONST(Item),
                                  No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
                }
                action("Return Orders")
                {
                    CaptionML = ENU='Return Orders',
                                FRA='Retours';
                    Image = ReturnOrder;
                    RunObject = Page 6633;
                    RunPageLink = Type=CONST(Item),
                                  No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
                }
            }
            group("Assembly/Production")
            {
                CaptionML = ENU='Assembly/Production',
                            FRA='Assemblage/Production';
                Image = Production;
                action(Structure)
                {
                    CaptionML = ENU='Structure',
                                FRA='Structure';
                    Image = Hierarchy;

                    trigger OnAction();
                    var
                        BOMStructure : Page "5870";
                    begin
                        BOMStructure.InitItem(Rec);
                        BOMStructure.RUN;
                    end;
                }
                action("Cost Shares")
                {
                    CaptionML = ENU='Cost Shares',
                                FRA='Coûts totaux';
                    Image = CostBudget;

                    trigger OnAction();
                    var
                        BOMCostShares : Page "5872";
                    begin
                        BOMCostShares.InitItem(Rec);
                        BOMCostShares.RUN;
                    end;
                }
                group("Assemb&ly")
                {
                    CaptionML = ENU='Assemb&ly',
                                FRA='Assemb&lage';
                    Image = AssemblyBOM;
                    action("Assembly BOM")
                    {
                        CaptionML = ENU='Assembly BOM',
                                    FRA='Nomenclature d''élément d''assemblage';
                        Image = BOM;
                        RunObject = Page 36;
                        RunPageLink = Parent Item No.=FIELD(No.);
                    }
                    action("Nomenclature prp Livraison")
                    {
                        Caption = 'Nomenclature préparation Livraison';
                        Image = CalculateWIP;
                        Promoted = true;
                        PromotedCategory = Process;
                        PromotedIsBig = true;
                        RunObject = Page 60153;
                        RunPageLink = Code Article=FIELD(No.);
                    }
                    action("Where-Used")
                    {
                        CaptionML = ENU='Where-Used',
                                    FRA='Cas d''emploi';
                        Image = Track;
                        RunObject = Page 37;
                        RunPageLink = Type=CONST(Item),
                                      No.=FIELD(No.);
                        RunPageView = SORTING(Type,No.);
                    }
                    action("Calc. Stan&dard Cost")
                    {
                        CaptionML = ENU='Calc. Stan&dard Cost',
                                    FRA='Calculer coût stan&dard';
                        Image = CalculateCost;

                        trigger OnAction();
                        begin
                            CLEAR(CalculateStdCost);
                            CalculateStdCost.CalcItem("No.",TRUE);
                        end;
                    }
                    action("Calc. Unit Price")
                    {
                        CaptionML = ENU='Calc. Unit Price',
                                    FRA='Calculer prix unitaire';
                        Image = SuggestItemPrice;

                        trigger OnAction();
                        begin
                            CLEAR(CalculateStdCost);
                            CalculateStdCost.CalcAssemblyItemPrice("No.")
                        end;
                    }
                }
                group(Production)
                {
                    CaptionML = ENU='Production',
                                FRA='Fabrication';
                    Image = Production;
                    action("Production BOM")
                    {
                        CaptionML = ENU='Production BOM',
                                    FRA='Nomenclature de production';
                        Image = BOM;
                        RunObject = Page 99000786;
                        RunPageLink = No.=FIELD(No.);
                    }
                    action("Where-Used")
                    {
                        CaptionML = ENU='Where-Used',
                                    FRA='Cas d''emploi';
                        Image = "Where-Used";

                        trigger OnAction();
                        var
                            ProdBOMWhereUsed : Page "99000811";
                        begin
                            ProdBOMWhereUsed.SetItem(Rec,WORKDATE);
                            ProdBOMWhereUsed.RUNMODAL;
                        end;
                    }
                    action("Calc. Stan&dard Cost")
                    {
                        CaptionML = ENU='Calc. Stan&dard Cost',
                                    FRA='Calculer coût stan&dard';
                        Image = CalculateCost;

                        trigger OnAction();
                        begin
                            CLEAR(CalculateStdCost);
                            CalculateStdCost.CalcItem("No.",FALSE);
                        end;
                    }
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
                action("&Bin Contents")
                {
                    CaptionML = ENU='&Bin Contents',
                                FRA='C&ontenu emplacement';
                    Image = BinContent;
                    RunObject = Page 7379;
                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action("Stockkeepin&g Units")
                {
                    CaptionML = ENU='Stockkeepin&g Units',
                                FRA='Point de stoc&k';
                    Image = SKU;
                    RunObject = Page 5701;
                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
            }
            group(Service)
            {
                CaptionML = ENU='Service',
                            FRA='Service';
                Image = ServiceItem;
                action("Ser&vice Items")
                {
                    CaptionML = ENU='Ser&vice Items',
                                FRA='&Articles de service';
                    Image = ServiceItem;
                    RunObject = Page 5988;
                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action(Troubleshooting)
                {
                    CaptionML = ENU='Troubleshooting',
                                FRA='Incident';
                    Image = Troubleshoot;

                    trigger OnAction();
                    var
                        TroubleshootingHeader : Record "5943";
                    begin
                        TroubleshootingHeader.ShowForItem(Rec);
                    end;
                }
                action("Troubleshooting Setup")
                {
                    CaptionML = ENU='Troubleshooting Setup',
                                FRA='Paramètres incidents';
                    Image = Troubleshoot;
                    RunObject = Page 5993;
                    RunPageLink = Type=CONST(Item),
                                  No.=FIELD(No.);
                }
            }
            group(Resources)
            {
                CaptionML = ENU='Resources',
                            FRA='Ressources';
                Image = Resource;
                group("R&esource")
                {
                    CaptionML = ENU='R&esource',
                                FRA='Re&ssource';
                    Image = Resource;
                    action("Resource Skills")
                    {
                        CaptionML = ENU='Resource Skills',
                                    FRA='Compétences ressource';
                        Image = ResourceSkills;
                        RunObject = Page 6019;
                        RunPageLink = Type=CONST(Item),
                                      No.=FIELD(No.);
                    }
                    action("Skilled Resources")
                    {
                        CaptionML = ENU='Skilled Resources',
                                    FRA='Ressources compétentes';
                        Image = ResourceSkills;

                        trigger OnAction();
                        var
                            ResourceSkill : Record "5956";
                        begin
                            CLEAR(SkilledResourceList);
                            SkilledResourceList.Initialize(ResourceSkill.Type::Item,"No.",Description);
                            SkilledResourceList.RUNMODAL;
                        end;
                    }
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("&Create Stockkeeping Unit")
                {
                    CaptionML = ENU='&Create Stockkeeping Unit',
                                FRA='&Créer point de stock';
                    Image = CreateSKU;

                    trigger OnAction();
                    var
                        Item : Record "27";
                    begin
                        Item.SETRANGE("No.","No.");
                        REPORT.RUNMODAL(REPORT::"Create Stockkeeping Unit",TRUE,FALSE,Item);
                    end;
                }
                action("C&alculate Counting Period")
                {
                    CaptionML = ENU='C&alculate Counting Period',
                                FRA='C&alculer période d''inventaire';
                    Image = CalculateCalendar;

                    trigger OnAction();
                    var
                        PhysInvtCountMgt : Codeunit "7380";
                    begin
                        PhysInvtCountMgt.UpdateItemPhysInvtCount(Rec);
                    end;
                }
                separator()
                {
                }
                action("Apply Template")
                {
                    CaptionML = ENU='Apply Template',
                                FRA='Appliquer modèle';
                    Ellipsis = true;
                    Image = ApplyTemplate;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ConfigTemplateMgt : Codeunit "8612";
                        RecRef : RecordRef;
                    begin
                        RecRef.GETTABLE(Rec);
                        ConfigTemplateMgt.UpdateFromTemplateSelection(RecRef);
                    end;
                }
            }
            action("Requisition Worksheet")
            {
                CaptionML = ENU='Requisition Worksheet',
                            FRA='Demande achat';
                Image = Worksheet;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 291;
            }
            action("Item Journal")
            {
                CaptionML = ENU='Item Journal',
                            FRA='Feuille article';
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 40;
            }
            action("Item Reclassification Journal")
            {
                CaptionML = ENU='Item Reclassification Journal',
                            FRA='Feuille reclassement article';
                Image = Journals;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 393;
            }
            action("Item Tracing")
            {
                CaptionML = ENU='Item Tracing',
                            FRA='Traçabilité';
                Image = ItemTracing;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 6520;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        EnablePlanningControls;
        EnableCostingControls;
    end;

    trigger OnInit();
    begin
        UnitCostEnable := TRUE;
        StandardCostEnable := TRUE;
        OverflowLevelEnable := TRUE;
        DampenerQtyEnable := TRUE;
        DampenerPeriodEnable := TRUE;
        LotAccumulationPeriodEnable := TRUE;
        ReschedulingPeriodEnable := TRUE;
        IncludeInventoryEnable := TRUE;
        OrderMultipleEnable := TRUE;
        MaximumOrderQtyEnable := TRUE;
        MinimumOrderQtyEnable := TRUE;
        MaximumInventoryEnable := TRUE;
        ReorderQtyEnable := TRUE;
        ReorderPointEnable := TRUE;
        SafetyStockQtyEnable := TRUE;
        SafetyLeadTimeEnable := TRUE;
        TimeBucketEnable := TRUE;

        //<< RAD 01
        FILTERGROUP(2);
          SETRANGE("Item type" ,"Item type"::Accessoires);
        FILTERGROUP(0);
        //>> End RAD 01
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        EnablePlanningControls;
        EnableCostingControls;
        //<< RAD 01
        "Item type" := "Item type"::Accessoires;
        Type := Type::Service ;

        //>> End RAD 01
    end;

    trigger OnOpenPage();
    begin
        EnableShowStockOutWarning;
        EnableShowShowEnforcePositivInventory;
    end;

    var
        SkilledResourceList : Page "6023";
        CalculateStdCost : Codeunit "5812";
        ItemAvailFormsMgt : Codeunit "353";
        ShowStockoutWarningDefaultYes : Boolean;
        ShowStockoutWarningDefaultNo : Boolean;
        ShowPreventNegInventoryDefaultYes : Boolean;
        ShowPreventNegInventoryDefaultNo : Boolean;
        [InDataSet]
        TimeBucketEnable : Boolean;
        [InDataSet]
        SafetyLeadTimeEnable : Boolean;
        [InDataSet]
        SafetyStockQtyEnable : Boolean;
        [InDataSet]
        ReorderPointEnable : Boolean;
        [InDataSet]
        ReorderQtyEnable : Boolean;
        [InDataSet]
        MaximumInventoryEnable : Boolean;
        [InDataSet]
        MinimumOrderQtyEnable : Boolean;
        [InDataSet]
        MaximumOrderQtyEnable : Boolean;
        [InDataSet]
        OrderMultipleEnable : Boolean;
        [InDataSet]
        IncludeInventoryEnable : Boolean;
        [InDataSet]
        ReschedulingPeriodEnable : Boolean;
        [InDataSet]
        LotAccumulationPeriodEnable : Boolean;
        [InDataSet]
        DampenerPeriodEnable : Boolean;
        [InDataSet]
        DampenerQtyEnable : Boolean;
        [InDataSet]
        OverflowLevelEnable : Boolean;
        [InDataSet]
        StandardCostEnable : Boolean;
        [InDataSet]
        UnitCostEnable : Boolean;

    procedure EnableShowStockOutWarning();
    var
        SalesSetup : Record "311";
    begin
        SalesSetup.GET;
        ShowStockoutWarningDefaultYes := SalesSetup."Stockout Warning";
        ShowStockoutWarningDefaultNo := NOT ShowStockoutWarningDefaultYes;
    end;

    procedure EnableShowShowEnforcePositivInventory();
    var
        InventorySetup : Record "313";
    begin
        InventorySetup.GET;
        ShowPreventNegInventoryDefaultYes := InventorySetup."Prevent Negative Inventory";
        ShowPreventNegInventoryDefaultNo := NOT ShowPreventNegInventoryDefaultYes;
    end;

    local procedure EnablePlanningControls();
    var
        PlanningGetParam : Codeunit "99000855";
        TimeBucketEnabled : Boolean;
        SafetyLeadTimeEnabled : Boolean;
        SafetyStockQtyEnabled : Boolean;
        ReorderPointEnabled : Boolean;
        ReorderQtyEnabled : Boolean;
        MaximumInventoryEnabled : Boolean;
        MinimumOrderQtyEnabled : Boolean;
        MaximumOrderQtyEnabled : Boolean;
        OrderMultipleEnabled : Boolean;
        IncludeInventoryEnabled : Boolean;
        ReschedulingPeriodEnabled : Boolean;
        LotAccumulationPeriodEnabled : Boolean;
        DampenerPeriodEnabled : Boolean;
        DampenerQtyEnabled : Boolean;
        OverflowLevelEnabled : Boolean;
    begin
        PlanningGetParam.SetUpPlanningControls("Reordering Policy","Include Inventory",
          TimeBucketEnabled,SafetyLeadTimeEnabled,SafetyStockQtyEnabled,
          ReorderPointEnabled,ReorderQtyEnabled,MaximumInventoryEnabled,
          MinimumOrderQtyEnabled,MaximumOrderQtyEnabled,OrderMultipleEnabled,IncludeInventoryEnabled,
          ReschedulingPeriodEnabled,LotAccumulationPeriodEnabled,
          DampenerPeriodEnabled,DampenerQtyEnabled,OverflowLevelEnabled);

        TimeBucketEnable := TimeBucketEnabled;
        SafetyLeadTimeEnable := SafetyLeadTimeEnabled;
        SafetyStockQtyEnable := SafetyStockQtyEnabled;
        ReorderPointEnable := ReorderPointEnabled;
        ReorderQtyEnable := ReorderQtyEnabled;
        MaximumInventoryEnable := MaximumInventoryEnabled;
        MinimumOrderQtyEnable := MinimumOrderQtyEnabled;
        MaximumOrderQtyEnable := MaximumOrderQtyEnabled;
        OrderMultipleEnable := OrderMultipleEnabled;
        IncludeInventoryEnable := IncludeInventoryEnabled;
        ReschedulingPeriodEnable := ReschedulingPeriodEnabled;
        LotAccumulationPeriodEnable := LotAccumulationPeriodEnabled;
        DampenerPeriodEnable := DampenerPeriodEnabled;
        DampenerQtyEnable := DampenerQtyEnabled;
        OverflowLevelEnable := OverflowLevelEnabled;
    end;

    local procedure EnableCostingControls();
    begin
        StandardCostEnable := "Costing Method" = "Costing Method"::Standard;
        UnitCostEnable := "Costing Method" <> "Costing Method"::Standard;
    end;
}

