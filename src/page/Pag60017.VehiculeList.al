page 60017 "Vehicule List"
{
    // version SAV Automobile,MAZDA15

    CaptionML = ENU='Vehicule List',
                FRA='Liste Véhicule';
    CardPageID = "Vehicule Card";
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = Table27;
    SourceTableView = WHERE(Inventory Posting Group=CONST(VEHICULES));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                CaptionML = ENU='General',
                            FRA='Général';
                field(Version;Version)
                {

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        //
                    end;
                }
                field("No.";"No.")
                {
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
                field("Description Perse";"Description Perse")
                {
                    Visible = false;
                }
                field("Inventory Not Reserved";"Inventory Not Reserved")
                {
                    CaptionML = ENU='Inventory',
                                FRA='Stock Disponible';
                }
                field("Inventory  Reserved";"Inventory  Reserved")
                {
                }
                field(Inventory;Inventory)
                {
                    Importance = Promoted;
                }
                field("Sales (Qty.)";"Sales (Qty.)")
                {
                }
                field("Qty. on Sales Order";"Qty. on Sales Order")
                {
                }
                field("Qty. on Purch. Order";"Qty. on Purch. Order")
                {
                }
                field("Qté sur Arrivage VN";"Qté sur Arrivage VN")
                {
                    Editable = false;
                }
                field(Exposition;Exposition)
                {
                    DecimalPlaces = 0:0;
                }
                field("Code NGP";"Code NGP")
                {
                }
                field(Blocked;Blocked)
                {
                }
                field("Last Date Modified";"Last Date Modified")
                {
                }
                field("Date creation";"Date creation")
                {
                }
                field(Critical;Critical)
                {
                }
                field("Common Item No.";"Common Item No.")
                {
                }
                field("No. 2";"No. 2")
                {
                }
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
                action("Couleurs et Garnissages")
                {
                    CaptionML = ENU='Couleurs et Garnissages',
                                FRA='Couleurs et Garnissages';
                    Image = ItemVariant;
                    Promoted = true;
                    PromotedIsBig = true;
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
                                FRA='Description Technique';
                    Image = Text;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
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
                                    FRA='&Ecritures comptables';
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
                    action(AssemblyBOM)
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
                action("Stock Modèle")
                {
                    CaptionML = ENU='Stock Modèle',
                                FRA='Stock Modèle';
                    Image = BinContent;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
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
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        EnablePlanningControls;
        EnableCostingControls;
    end;

    trigger OnOpenPage();
    begin

        FILTERGROUP(2);
        SETRANGE(Type,Type::Inventory);
        SETRANGE("Item type",1);
        FILTERGROUP(0);
        UserSetup.GET(USERID);
        IF UserSetup."User Activity"=UserSetup."User Activity"::VN THEN
        SETRANGE("Model en cours",TRUE);
    end;

    var
        SkilledResourceList : Page "6023";
        CalculateStdCost : Codeunit "5812";
        ItemAvailFormsMgt : Codeunit "353";
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
        UserSetup : Record "91";

    procedure EnablePlanningControls();
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

    procedure EnableCostingControls();
    begin
        StandardCostEnable := "Costing Method" = "Costing Method"::Standard;
        UnitCostEnable := "Costing Method" <> "Costing Method"::Standard;
    end;
}

