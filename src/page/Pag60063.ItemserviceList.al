page 60063 "Item service List"
{
    // version SAV Automobile

    CaptionML = ENU='Item List',
                FRA='Liste des articles';
    CardPageID = "Item Service Card";
    Editable = false;
    PageType = List;
    SourceTable = Table27;
    SourceTableView = SORTING(Type)
                      WHERE(Type=CONST(Service));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Created From Nonstock Item";"Created From Nonstock Item")
                {
                    Visible = false;
                }
                field("Substitutes Exist";"Substitutes Exist")
                {
                }
                field("Stockkeeping Unit Exists";"Stockkeeping Unit Exists")
                {
                    Visible = false;
                }
                field("Assembly BOM";"Assembly BOM")
                {
                }
                field("Production BOM No.";"Production BOM No.")
                {
                }
                field("Routing No.";"Routing No.")
                {
                }
                field("Base Unit of Measure";"Base Unit of Measure")
                {
                }
                field("Shelf No.";"Shelf No.")
                {
                    Visible = false;
                }
                field("Costing Method";"Costing Method")
                {
                    Visible = false;
                }
                field("Cost is Adjusted";"Cost is Adjusted")
                {
                }
                field("Standard Cost";"Standard Cost")
                {
                    Visible = false;
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field("Last Direct Cost";"Last Direct Cost")
                {
                    Visible = false;
                }
                field("Price/Profit Calculation";"Price/Profit Calculation")
                {
                    Visible = false;
                }
                field("Profit %";"Profit %")
                {
                    Visible = false;
                }
                field("Unit Price";"Unit Price")
                {
                }
                field("Inventory Posting Group";"Inventory Posting Group")
                {
                    Visible = false;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    Visible = false;
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                    Visible = false;
                }
                field("Item Disc. Group";"Item Disc. Group")
                {
                    Visible = false;
                }
                field("Vendor No.";"Vendor No.")
                {
                }
                field("Vendor Item No.";"Vendor Item No.")
                {
                    Visible = false;
                }
                field("Tariff No.";"Tariff No.")
                {
                    Visible = false;
                }
                field("Search Description";"Search Description")
                {
                }
                field("Overhead Rate";"Overhead Rate")
                {
                    Visible = false;
                }
                field("Indirect Cost %";"Indirect Cost %")
                {
                    Visible = false;
                }
                field("Item Category Code";"Item Category Code")
                {
                    Visible = false;
                }
                field("Product Group Code";"Product Group Code")
                {
                    Visible = false;
                }
                field(Blocked;Blocked)
                {
                    Visible = false;
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    Visible = false;
                }
                field("Sales Unit of Measure";"Sales Unit of Measure")
                {
                    Visible = false;
                }
                field("Replenishment System";"Replenishment System")
                {
                    Visible = false;
                }
                field("Purch. Unit of Measure";"Purch. Unit of Measure")
                {
                    Visible = false;
                }
                field("Lead Time Calculation";"Lead Time Calculation")
                {
                    Visible = false;
                }
                field("Manufacturing Policy";"Manufacturing Policy")
                {
                    Visible = false;
                }
                field("Flushing Method";"Flushing Method")
                {
                    Visible = false;
                }
                field("Assembly Policy";"Assembly Policy")
                {
                    Visible = false;
                }
                field("Item Tracking Code";"Item Tracking Code")
                {
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part(;9089)
            {
                SubPageLink = No.=FIELD(No.),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 1 Filter),
                              Location Filter=FIELD(Location Filter),
                              Drop Shipment Filter=FIELD(Drop Shipment Filter),
                              Bin Filter=FIELD(Bin Filter),
                              Variant Filter=FIELD(Variant Filter),
                              Lot No. Filter=FIELD(Lot No. Filter),
                              Serial No. Filter=FIELD(Serial No. Filter);
                Visible = true;
            }
            part(;9090)
            {
                SubPageLink = No.=FIELD(No.),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 1 Filter),
                              Location Filter=FIELD(Location Filter),
                              Drop Shipment Filter=FIELD(Drop Shipment Filter),
                              Bin Filter=FIELD(Bin Filter),
                              Variant Filter=FIELD(Variant Filter),
                              Lot No. Filter=FIELD(Lot No. Filter),
                              Serial No. Filter=FIELD(Serial No. Filter);
                Visible = false;
            }
            part(;9091)
            {
                SubPageLink = No.=FIELD(No.),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 1 Filter),
                              Location Filter=FIELD(Location Filter),
                              Drop Shipment Filter=FIELD(Drop Shipment Filter),
                              Bin Filter=FIELD(Bin Filter),
                              Variant Filter=FIELD(Variant Filter),
                              Lot No. Filter=FIELD(Lot No. Filter),
                              Serial No. Filter=FIELD(Serial No. Filter);
                Visible = true;
            }
            part(;9109)
            {
                SubPageLink = No.=FIELD(No.),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 1 Filter),
                              Location Filter=FIELD(Location Filter),
                              Drop Shipment Filter=FIELD(Drop Shipment Filter),
                              Bin Filter=FIELD(Bin Filter),
                              Variant Filter=FIELD(Variant Filter),
                              Lot No. Filter=FIELD(Lot No. Filter),
                              Serial No. Filter=FIELD(Serial No. Filter);
                Visible = false;
            }
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
            group(Availability)
            {
                CaptionML = ENU='Availability',
                            FRA='Disponibilité';
                Image = Item;
                action("Items b&y Location")
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
                                FRA='Disponibi&lité article par';
                    Image = ItemAvailability;
                    action("<Action5>")
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
            group("Master Data")
            {
                CaptionML = ENU='Master Data',
                            FRA='Données principales';
                Image = DataEntry;
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
                    action("Dimensions-Single")
                    {
                        CaptionML = ENU='Dimensions-Single',
                                    FRA='Affectations - Simples';
                        Image = Dimensions;
                        RunObject = Page 540;
                        RunPageLink = Table ID=CONST(27),
                                      No.=FIELD(No.);
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        CaptionML = ENU='Dimensions-&Multiple',
                                    FRA='Affectations - &Multiples';
                        Image = DimensionSets;

                        trigger OnAction();
                        var
                            Item : Record "27";
                            DefaultDimMultiple : Page "542";
                        begin
                            CurrPage.SETSELECTIONFILTER(Item);
                            DefaultDimMultiple.SetMultiItem(Item);
                            DefaultDimMultiple.RUNMODAL;
                        end;
                    }
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
                    RunPageLink = Item No.=FIELD(No.),
                                  Variant Code=CONST();
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
                    action("<Action32>")
                    {
                        CaptionML = ENU='Assembly BOM',
                                    FRA='Nomenclature d''élément d''assemblage';
                        Image = BOM;
                        RunObject = Page 36;
                        RunPageLink = Parent Item No.=FIELD(No.);
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
                            CalculateStdCost.CalcAssemblyItemPrice("No.");
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
                            CalculateStdCost.CalcItem("No.",FALSE);
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
                                    FRA='&Ecritures traçabilité';
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
                action("Returns Orders")
                {
                    CaptionML = ENU='Returns Orders',
                                FRA='Retours';
                    Image = ReturnOrder;
                    RunObject = Page 6633;
                    RunPageLink = Type=CONST(Item),
                                  No.=FIELD(No.);
                    RunPageView = SORTING(Document Type,Type,No.);
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
                    RunPageView = SORTING(Item No.);
                }
                action("Prepa&yment Percentages")
                {
                    CaptionML = ENU='Prepa&yment Percentages',
                                FRA='Pourcentages acom&pte';
                    Image = PrepaymentPercentages;
                    RunObject = Page 665;
                    RunPageLink = Item No.=FIELD(No.);
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
                    action("Resource &Skills")
                    {
                        CaptionML = ENU='Resource &Skills',
                                    FRA='&Compétences ressources';
                        Image = ResourceSkills;
                        RunObject = Page 6019;
                        RunPageLink = Type=CONST(Item),
                                      No.=FIELD(No.);
                    }
                    action("Skilled R&esources")
                    {
                        CaptionML = ENU='Skilled R&esources',
                                    FRA='&Ressources compétentes';
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
            }
            action("Sales Prices")
            {
                CaptionML = ENU='Sales Prices',
                            FRA='Prix vente';
                Image = SalesPrices;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 7002;
                RunPageLink = Item No.=FIELD(No.);
                RunPageView = SORTING(Item No.);
            }
            action("Sales Line Discounts")
            {
                CaptionML = ENU='Sales Line Discounts',
                            FRA='Remises ligne vente';
                Image = SalesLineDisc;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 7004;
                RunPageLink = Type=CONST(Item),
                              Code=FIELD(No.);
                RunPageView = SORTING(Type,Code);
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
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 393;
            }
            action("Item Tracing")
            {
                CaptionML = ENU='Item Tracing',
                            FRA='Traçabilité';
                Image = ItemTracing;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 6520;
            }
            action("Adjust Item Cost/Price")
            {
                CaptionML = ENU='Adjust Item Cost/Price',
                            FRA='Ajuster coût et prix article';
                Image = AdjustItemCost;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Report 794;
            }
            action("Adjust Cost - Item Entries")
            {
                CaptionML = ENU='Adjust Cost - Item Entries',
                            FRA='Ajuster coûts : Écr. article';
                Image = AdjustEntries;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 795;
            }
        }
        area(reporting)
        {
            action("Inventory - List")
            {
                CaptionML = ENU='Inventory - List',
                            FRA='Stocks : Liste des articles';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 701;
            }
            action("Item Register - Quantity")
            {
                CaptionML = ENU='Item Register - Quantity',
                            FRA='Hist trans article - Qté';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 703;
            }
            action("Inventory - Transaction Detail")
            {
                CaptionML = ENU='Inventory - Transaction Detail',
                            FRA='Stocks : Liste des mouvements';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 704;
            }
            action("Inventory Availability")
            {
                CaptionML = ENU='Inventory Availability',
                            FRA='Disponibilité articles';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 705;
            }
            action(Status)
            {
                CaptionML = ENU='Status',
                            FRA='Statut';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 706;
            }
            action("Inventory - Availability Plan")
            {
                CaptionML = ENU='Inventory - Availability Plan',
                            FRA='Stocks : Échéancier des dispo.';
                Image = ItemAvailability;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 707;
            }
            action("Inventory Order Details")
            {
                CaptionML = ENU='Inventory Order Details',
                            FRA='Commandes vente en cours';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 708;
            }
            action("Inventory Purchase Orders")
            {
                CaptionML = ENU='Inventory Purchase Orders',
                            FRA='Commandes achat en cours';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 709;
            }
            action("Inventory - Top 10 List")
            {
                CaptionML = ENU='Inventory - Top 10 List',
                            FRA='Stocks : Palmarès articles';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 711;
            }
            action("Inventory - Sales Statistics")
            {
                CaptionML = ENU='Inventory - Sales Statistics',
                            FRA='Stocks : Statistiques vente';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 712;
            }
            action("Assemble to Order - Sales")
            {
                CaptionML = ENU='Assemble to Order - Sales',
                            FRA='Assembler pour commande - Ventes';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 915;
            }
            action("Inventory - Customer Sales")
            {
                CaptionML = ENU='Inventory - Customer Sales',
                            FRA='Stocks : Ventes par client';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 713;
            }
            action("Inventory - Vendor Purchases")
            {
                CaptionML = ENU='Inventory - Vendor Purchases',
                            FRA='Stocks : Achats par fourn.';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 714;
            }
            action("Price List")
            {
                CaptionML = ENU='Price List',
                            FRA='Liste des prix';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 715;
            }
            action("Inventory Cost and Price List")
            {
                CaptionML = ENU='Inventory Cost and Price List',
                            FRA='Prix et coûts article';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 716;
            }
            action("Inventory - Reorders")
            {
                CaptionML = ENU='Inventory - Reorders',
                            FRA='Stocks : Réappro. à effectuer';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 717;
            }
            action("Inventory - Sales Back Orders")
            {
                CaptionML = ENU='Inventory - Sales Back Orders',
                            FRA='Stocks : Commandes à livrer';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 718;
            }
            action("Item/Vendor Catalog")
            {
                CaptionML = ENU='Item/Vendor Catalog',
                            FRA='Articles : Catalogue fourn.';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 720;
            }
            action("Inventory - Cost Variance")
            {
                CaptionML = ENU='Inventory - Cost Variance',
                            FRA='Stocks : Évolution des coûts';
                Image = ItemCosts;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 721;
            }
            action("Phys. Inventory List")
            {
                CaptionML = ENU='Phys. Inventory List',
                            FRA='Liste d''inventaire';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 722;
            }
            action("Inventory Valuation")
            {
                CaptionML = ENU='Inventory Valuation',
                            FRA='Évaluation du stock';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 1001;
            }
            action("Nonstock Item Sales")
            {
                CaptionML = ENU='Nonstock Item Sales',
                            FRA='Ventes d''articles non stockés';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5700;
            }
            action("Item Substitutions")
            {
                CaptionML = ENU='Item Substitutions',
                            FRA='Articles de substitution';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5701;
            }
            action("Invt. Valuation - Cost Spec.")
            {
                CaptionML = ENU='Invt. Valuation - Cost Spec.',
                            FRA='Éval. stock : Composante coût';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5801;
            }
            action("Inventory Valuation - WIP")
            {
                CaptionML = ENU='Inventory Valuation - WIP',
                            FRA='Évaluation du stock d''en-cours';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5802;
            }
            action("Item Register - Value")
            {
                CaptionML = ENU='Item Register - Value',
                            FRA='Transactions article : Valeur';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5805;
            }
            action("Item Charges - Specification")
            {
                CaptionML = ENU='Item Charges - Specification',
                            FRA='Frais annexes : Composante';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5806;
            }
            action("Item Age Composition - Qty.")
            {
                CaptionML = ENU='Item Age Composition - Qty.',
                            FRA='Ancienneté stock : Qté';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5807;
            }
            action("Item Age Composition - Value")
            {
                CaptionML = ENU='Item Age Composition - Value',
                            FRA='Ancienneté stock : Valeur';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5808;
            }
            action("Item Expiration - Quantity")
            {
                CaptionML = ENU='Item Expiration - Quantity',
                            FRA='Péremption article - Quantité';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5809;
            }
            action("Cost Shares Breakdown")
            {
                CaptionML = ENU='Cost Shares Breakdown',
                            FRA='Analyse des coûts';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 5848;
            }
            action("Detailed Calculation")
            {
                CaptionML = ENU='Detailed Calculation',
                            FRA='Coût détaillé';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 99000756;
            }
            action("Rolled-up Cost Shares")
            {
                CaptionML = ENU='Rolled-up Cost Shares',
                            FRA='Coût multi-niveau détaillé';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 99000754;
            }
            action("Single-Level Cost Shares")
            {
                CaptionML = ENU='Single-Level Cost Shares',
                            FRA='Coût mono-niveau détaillé';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 99000755;
            }
            action("Where Used (Top Level)")
            {
                CaptionML = ENU='Where Used (Top Level)',
                            FRA='Cas d''emploi (multi-niveau)';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 99000757;
            }
            action("Quantity Explosion of BOM")
            {
                CaptionML = ENU='Quantity Explosion of BOM',
                            FRA='Nomenclature multi-niveau';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 99000753;
            }
            action("Compare List")
            {
                CaptionML = ENU='Compare List',
                            FRA='Liste de comparaison';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report 99000758;
            }
        }
    }

    trigger OnOpenPage();
    begin
        FILTERGROUP(2);
        SETRANGE(Type,Type::Service);
        FILTERGROUP(0);
    end;

    var
        SkilledResourceList : Page "6023";
        CalculateStdCost : Codeunit "5812";
        ItemAvailFormsMgt : Codeunit "353";

    procedure GetSelectionFilter() : Text;
    var
        Item : Record "27";
        SelectionFilterManagement : Codeunit "46";
    begin
        CurrPage.SETSELECTIONFILTER(Item);
        EXIT(SelectionFilterManagement.GetSelectionFilterForItem(Item));
    end;

    procedure SetSelection(var Item : Record "27");
    begin
        CurrPage.SETSELECTIONFILTER(Item);
    end;
}

