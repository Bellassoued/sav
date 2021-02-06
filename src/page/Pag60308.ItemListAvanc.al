page 60308 "Item List Avancé"
{
    // version NAVW19.00.00.44974,CT16V001,CT16V002

    //  CT16V001 ZM 16/05/2016 : upgrade
    //  CT16V002 ZM 08/06/2016 : Added new Fields

    CaptionML = ENU='Item List',
                FRA='Liste des articles';
    CardPageID = "Item Card";
    Editable = false;
    PageType = List;
    SourceTable = Table27;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field("Qte.  Sur Cmd Reserver";"Qte.  Sur Cmd Reserver")
                {
                }
                field(Description;Description)
                {
                }
                field("Description 2";"Description 2")
                {
                }
                field("Unit Cost";"Unit Cost")
                {
                    Visible = false;
                }
                field("Alternative Item No.";"Alternative Item No.")
                {
                }
                field("Ref. Equivalante";"Ref. Equivalante")
                {
                }
                field("Replacement Status";"Replacement Status")
                {
                }
                field("Inventory Due Reappro";"Inventory Due Reappro")
                {
                    Visible = false;
                }
                field("No. 2";"No. 2")
                {
                    Visible = false;
                }
                field(Statut;Statut)
                {
                    Visible = false;
                }
                field("Per. Date Achat Archv.";"Per. Date Achat Archv.")
                {
                }
                field("Per. Date Achat Mvt.";"Per. Date Achat Mvt.")
                {
                }
                field("Dern. Date Vente";"Dern. Date Vente")
                {
                }
                field("Dern. Date Achat";"Dern. Date Achat")
                {
                }
                field("Dern. Date Vente Histo.";"Dern. Date Vente Histo.")
                {
                }
                field("Dern. Date Achat Histo.";"Dern. Date Achat Histo.")
                {
                }
                field("Manufacturer Code";"Manufacturer Code")
                {
                }
                field("Unit Price incl. VAT";"Unit Price incl. VAT")
                {
                    Visible = false;
                }
                field("Purchases Vendor (Qty.)";"Purchases Vendor (Qty.)")
                {
                    Visible = false;
                }
                field("Sales Customer (Qty.)";"Sales Customer (Qty.)")
                {
                    Visible = false;
                }
                field("Product Code";"Product Code")
                {
                }
                field("Prix Fob";"Prix Fob")
                {
                }
                field("Sur commande";"Sur commande")
                {
                }
                field("EPM Non Reorder Code";"EPM Non Reorder Code")
                {
                }
                field("Non Stock Code";"Non Stock Code")
                {
                }
                field(MAD;MAD)
                {
                }
                field("Ancien MAD";"Ancien MAD")
                {
                }
                field("PART NAME CODE";"PART NAME CODE")
                {
                }
                field("PRICE CLASS";"PRICE CLASS")
                {
                }
                field("Code Famille";"Code Famille")
                {
                    Visible = false;
                }
                field("Code Index";"Code Index")
                {
                    Visible = false;
                }
                field("Code Segment";"Code Segment")
                {
                    Visible = false;
                }
                field("Pièce d'origine";"Pièce d'origine")
                {
                    Visible = false;
                }
                field("Vehicule Type";"Vehicule Type")
                {
                    Visible = false;
                }
                field("Inventory Due";"Inventory Due")
                {
                }
                field("Code Version";"Code Version")
                {
                    Visible = false;
                }
                field("Code Perse";"Code Perse")
                {
                    Visible = false;
                }
                field("Created From Nonstock Item";"Created From Nonstock Item")
                {
                    Visible = false;
                }
                field("Substitutes Exist";"Substitutes Exist")
                {
                    Visible = false;
                }
                field("Stockkeeping Unit Exists";"Stockkeeping Unit Exists")
                {
                    Visible = false;
                }
                field("Article Racine";"Article Racine")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Assembly BOM";"Assembly BOM")
                {
                    Visible = false;
                }
                field("Production BOM No.";"Production BOM No.")
                {
                    Visible = false;
                }
                field("Routing No.";"Routing No.")
                {
                    Visible = false;
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
                    CaptionML = ENU='Cost is Adjusted',
                                FRA='<Cost is Adjusted>';
                    Editable = NOT UnitCostHide;
                    Enabled = UnitCostEnable;
                    HideValue = UnitCostHide;
                    Visible = false;
                }
                field("Standard Cost";"Standard Cost")
                {
                    Editable = NOT UnitCostHide;
                    Enabled = UnitCostEnable;
                    HideValue = UnitCostHide;
                    Visible = false;
                }
                field("Last Direct Cost";"Last Direct Cost")
                {
                    Editable = NOT UnitCostHide;
                    Enabled = UnitCostEnable;
                    HideValue = UnitCostHide;
                    Visible = false;
                }
                field("Qty. on Purch. Order";"Qty. on Purch. Order")
                {
                    Visible = false;
                }
                field("Qty. on Sales Order";"Qty. on Sales Order")
                {
                    Visible = false;
                }
                field("Qty. on Service Order";"Qty. on Service Order")
                {
                    Visible = false;
                }
                field("Price/Profit Calculation";"Price/Profit Calculation")
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
                field("Code NGP";"Code NGP")
                {
                }
                field("Contrôl Technique";"Contrôl Technique")
                {
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
                field("Reorder Point";"Reorder Point")
                {
                    CaptionML = ENU='Reorder Point',
                                FRA='Stock Min';
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
                field("Code Modèle PR";"Code Modèle PR")
                {
                    Visible = false;
                }
                field("Item Tracking Code";"Item Tracking Code")
                {
                    Visible = false;
                }
                field(Inventory;Inventory)
                {
                }
                field(Type;Type)
                {
                    Editable = false;
                }
                field("Item type";"Item type")
                {
                }
                field("Default Deferral Template Code";"Default Deferral Template Code")
                {
                    CaptionML = ENU='Default Deferral Template',
                                FRA='Modèle échelonnement par défaut';
                    Visible = false;
                }
                field("Date Modified Master Item";"Date Modified Master Item")
                {
                    Visible = false;
                }
                field("Code Remise";"Code Remise")
                {
                    Visible = false;
                }
                field("Nature Piece";"Nature Piece")
                {
                    Visible = false;
                }
                field("Nature Piece Remplaçante";"Nature Piece Remplaçante")
                {
                    Visible = false;
                }
                field("Achat Etrangé";"Achat Etrangé")
                {
                    Visible = false;
                }
                field("Date creation";"Date creation")
                {
                    Visible = false;
                }
                field(Rotation;Rotation)
                {
                }
            }
        }
        area(factboxes)
        {
            part(;875)
            {
                SubPageLink = Source Type=CONST(Item),
                              Source No.=FIELD(No.);
                Visible = SocialListeningVisible;
            }
            part(;876)
            {
                SubPageLink = Source Type=CONST(Item),
                              Source No.=FIELD(No.);
                UpdatePropagation = Both;
                Visible = SocialListeningSetupVisible;
            }
            part(;9109)
            {
                SubPageLink = No.=FIELD(No.),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter),
                              Location Filter=FIELD(Location Filter),
                              Drop Shipment Filter=FIELD(Drop Shipment Filter),
                              Bin Filter=FIELD(Bin Filter),
                              Variant Filter=FIELD(Variant Filter),
                              Lot No. Filter=FIELD(Lot No. Filter),
                              Serial No. Filter=FIELD(Serial No. Filter);
                Visible = false;
            }
            part(;69055)
            {
                SubPageLink = Type=CONST(Item),
                              No.=FIELD(No.);
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
                    AccessByPermission = TableData 14=R;
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
                    action("availability item")
                    {
                        CaptionML = ENU='Item availability',
                                    FRA='Disponibilité Article';
                        Image = Account;
                        Promoted = true;
                        PromotedCategory = Process;

                        trigger OnAction();
                        var
                            LCUItemavailability : Codeunit "70000";
                            LRecAvailibilityItem : Record "70006";
                            LPagItemAvailability : Page "70009";
                        begin
                            //<< CT16V0002 ZMN 28/07/2016
                            CLEAR(LPagItemAvailability);
                            LCUItemavailability.FctStartSearchForItem("No.");
                            TotalStock :=LCUItemavailability.FctGetTotalStock;
                            TotalQtyCmdAchat :=LCUItemavailability.FctGetTotalQtyCmdAchat;
                            TotalQtyCmdVente :=LCUItemavailability.FctGetTotalQtyCmdVente;
                            TotalQtyCmdService:=LCUItemavailability.FctGetTotalQtyCmdService;
                            TotalQtyReservAchat:=LCUItemavailability.FctGetTotalQtyReservAchat;
                            TotalQtyReserStock:=LCUItemavailability.FctGetTotalQtyReservStoick;
                            TotalQtyStockDispo := LCUItemavailability.FctGetTotalStockDispo;
                            TotalQtyStockDispoProjeté := LCUItemavailability.FctGetTotalStockDispoProjete;
                            //TotalQtyDevis
                            TotalQtyTransfer := LCUItemavailability.FctGetTotalTransfer;
                            TotalQtyTransit := LCUItemavailability.FctGetTotalTransit;
                            DecPossibledemande := LCUItemavailability.FctCalcStockDispoByCompanybyMagCentralOT("No.",'');
                            DecReserver := TotalStock -DecPossibledemande ;
                            LPagItemAvailability.SETTABLEVIEW(LRecAvailibilityItem);
                            LPagItemAvailability.SETRECORD(LRecAvailibilityItem);
                            LPagItemAvailability.FctSetTotal(TotalStock ,TotalQtyCmdAchat ,TotalQtyCmdVente ,TotalQtyCmdService ,TotalQtyReservAchat,TotalQtyReserStock
                                                             ,TotalQtyStockDispo,TotalQtyStockDispoProjeté,TotalQtyTransit,TotalQtyTransfer,TotalQtyDevis,DecPossibledemande,DecReserver);
                            IF LPagItemAvailability.RUNMODAL = ACTION::LookupOK THEN;
                            //>> CT16V0002 ZMN 28/07/2016
                        end;
                    }
                    action("Item Master")
                    {
                        RunObject = Page 70010;
                    }
                }
            }
            group(ActionGroupCRM)
            {
                CaptionML = ENU='Dynamics CRM',
                            FRA='Dynamics CRM';
                Visible = CRMIntegrationEnabled;
                action(CRMGoToProduct)
                {
                    CaptionML = ENU='Product',
                                FRA='Produit';
                    Image = CoupledItem;
                    ToolTipML = ENU='Open the coupled Microsoft Dynamics CRM product.',
                                FRA='Ouvrez le produit Microsoft Dynamics CRM couplé.';

                    trigger OnAction();
                    var
                        CRMIntegrationManagement : Codeunit "5330";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(RECORDID);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData 5331=IM;
                    CaptionML = ENU='Synchronize Now',
                                FRA='Synchroniser maintenant';
                    Image = Refresh;
                    ToolTipML = ENU='Send updated data to Microsoft Dynamics CRM.',
                                FRA='Envoyez des données mises à jour à Microsoft Dynamics CRM.';

                    trigger OnAction();
                    var
                        Item : Record "27";
                        CRMIntegrationManagement : Codeunit "5330";
                        ItemRecordRef : RecordRef;
                    begin
                        CurrPage.SETSELECTIONFILTER(Item);
                        Item.NEXT;

                        IF Item.COUNT = 1 THEN
                          CRMIntegrationManagement.UpdateOneNow(Item.RECORDID)
                        ELSE BEGIN
                          ItemRecordRef.GETTABLE(Item);
                          CRMIntegrationManagement.UpdateMultipleNow(ItemRecordRef);
                        END
                    end;
                }
                group(Coupling)
                {
                    CaptionML = Comment='Coupling is a noun',
                                ENU='Coupling',
                                FRA='Couplage';
                    Image = LinkAccount;
                    ToolTipML = ENU='Create, change, or delete a coupling between the Microsoft Dynamics NAV record and a Microsoft Dynamics CRM record.',
                                FRA='Créez, modifiez ou supprimez un couplage entre l''enregistrement Microsoft Dynamics NAV et un enregistrement Microsoft Dynamics CRM.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData 5331=IM;
                        CaptionML = ENU='Set Up Coupling',
                                    FRA='Configurer le couplage';
                        Image = LinkAccount;
                        ToolTipML = ENU='Create or modify the coupling to a Microsoft Dynamics CRM product.',
                                    FRA='Créez ou modifiez le couplage avec un produit Microsoft Dynamics CRM.';

                        trigger OnAction();
                        var
                            CRMIntegrationManagement : Codeunit "5330";
                        begin
                            CRMIntegrationManagement.DefineCoupling(RECORDID);
                        end;
                    }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData 5331=IM;
                        CaptionML = ENU='Delete Coupling',
                                    FRA='Supprimer le couplage';
                        Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTipML = ENU='Delete the coupling to a Microsoft Dynamics CRM product.',
                                    FRA='Supprimez le couplage avec un produit Microsoft Dynamics CRM.';

                        trigger OnAction();
                        var
                            CRMCouplingManagement : Codeunit "5331";
                        begin
                            CRMCouplingManagement.RemoveCoupling(RECORDID);
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
                        AccessByPermission = TableData 348=R;
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
                        AccessByPermission = TableData 90=R;
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
                        AccessByPermission = TableData 90=R;
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
                        RunPageLink = No.=FIELD(Production BOM No.);
                    }
                    action("Where-Used")
                    {
                        AccessByPermission = TableData 90=R;
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
                        AccessByPermission = TableData 99000771=R;
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
                            ItemTrackingDocMgt : Codeunit "6503";
                        begin
                            ItemTrackingDocMgt.ShowItemTrackingForMasterData(3,'',"No.",'','','','');
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
                action("Import Promotion Articles")
                {
                    Image = Import;

                    trigger OnAction();
                    var
                        ImportLineRemiseVente : XMLport "50023";
                    begin
                        CLEAR(ImportLineRemiseVente);
                        ImportLineRemiseVente.RUN;
                    end;
                }
                action(Sales_Prices)
                {
                    CaptionML = ENU='Prices',
                                FRA='Prix';
                    Image = Price;
                    RunObject = Page 7002;
                    RunPageLink = Item No.=FIELD(No.);
                    RunPageView = SORTING(Item No.);
                }
                action(Sales_LineDiscounts)
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
                    AccessByPermission = TableData 5900=R;
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
                        AccessByPermission = TableData 5900=R;
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
            group("Request Approval")
            {
                CaptionML = ENU='Request Approval',
                            FRA='Approbation demande achat';
                Image = SendApprovalRequest;
                action(SendApprovalRequest)
                {
                    CaptionML = ENU='Send A&pproval Request',
                                FRA='Envoyer demande d''a&pprobation';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        IF ApprovalsMgmt.CheckItemApprovalsWorkflowEnabled(Rec) THEN
                          ApprovalsMgmt.OnSendItemForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    CaptionML = ENU='Cancel Approval Re&quest',
                                FRA='Annuler demande d''appro&bation';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        ApprovalsMgmt.OnCancelItemApprovalRequest(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("&Create Stockkeeping Unit")
                {
                    AccessByPermission = TableData 5700=R;
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
                    AccessByPermission = TableData 7380=R;
                    CaptionML = ENU='C&alculate Counting Period',
                                FRA='C&alculer période d''inventaire';
                    Image = CalculateCalendar;

                    trigger OnAction();
                    var
                        Item : Record "27";
                        PhysInvtCountMgt : Codeunit "7380";
                    begin
                        CurrPage.SETSELECTIONFILTER(Item);
                        PhysInvtCountMgt.UpdateItemPhysInvtCount(Item);
                    end;
                }
            }
            action(Prices_Prices)
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
            action(Prices_LineDiscounts)
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
            action("Where-Used (Top Level)")
            {
                CaptionML = ENU='Where-Used (Top Level)',
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

    trigger OnAfterGetCurrRecord();
    var
        CRMCouplingManagement : Codeunit "5331";
    begin
        SetSocialListeningFactboxVisibility;

        CRMIsCoupledToRecord :=
          CRMCouplingManagement.IsRecordCoupledToCRM(RECORDID) AND CRMIntegrationEnabled;

        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID)
    end;

    trigger OnAfterGetRecord();
    begin
        SetSocialListeningFactboxVisibility;
        EnableCostingControls;
        IF (RecInventorySetup."Socité stock consolidé" <> COMPANYNAME) OR (NOT RecUserSetup."Modifier client/Client Facturé") THEN
          BolVisUnitCost := FALSE;
    end;

    trigger OnInit();
    begin
        BolVisUnitCost:= TRUE
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        EnableCostingControls
    end;

    trigger OnOpenPage();
    var
        CRMIntegrationManagement : Codeunit "5330";
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
        //<<CT16V001 ZM 15/05/2016 - Récupération du magasin par défaut de l'utilisateur
        /*
        IF RecGUserSetup.GET(UPPERCASE(USERID)) THEN
          BEGIN
            IF RecGUserSetup."Mag Reservation/Defaut" <> '' THEN BEGIN
              SETRANGE("Location Filter", RecGUserSetup."Mag Reservation/Defaut");
            // ADD KK 26012016
            IF RecLocation.GET(RecGUserSetup."Mag Reservation/Defaut") AND (RecLocation."Magasin SAV"<>'') THEN
              SETFILTER("Magasin Qty Com. Service",'%1',RecLocation."Magasin SAV");
            //END KK
            END;
          END;
        //SETAUTOCALCFIELDS(Inventory);
        //>> End TRIUM RAD Addin
        
        //ADD KK 260116
        SETFILTER("Magasin Qty Com. Achat",'%1','MAG - EMB*');
        //>>CT16V001 ZM 15/05/2016
        */
        //SM ADD 050717
          FILTERGROUP(2);
          IF RecGUserSetup.GET(UPPERCASE(USERID)) THEN
            IF RecGUserSetup."User Activity" = RecGUserSetup."User Activity"::PR THEN //SM OLD <> VN
              Rec.SETFILTER("Inventory Posting Group",'<>VEHICULES');
        
         FILTERGROUP(0);
         //END SM
        TxtFilterLocation :=CduItemavailability.FctGetFiletLocation(COMPANYNAME);
        IF TxtFilterLocation <> '' THEN
          TxtFilterLocation:= '<>'+TxtFilterLocation;
        
        SETFILTER("Location Filter",TxtFilterLocation);
        RecInventorySetup.GET;
        
        IF (RecInventorySetup."Socité stock consolidé" <> COMPANYNAME) OR (NOT RecUserSetup."Modifier client/Client Facturé") THEN
          BolVisUnitCost := FALSE;

    end;

    var
        SkilledResourceList : Page "6023";
        CalculateStdCost : Codeunit "5812";
        ItemAvailFormsMgt : Codeunit "353";
        ApprovalsMgmt : Codeunit "1535";
        [InDataSet]
        SocialListeningSetupVisible : Boolean;
        [InDataSet]
        SocialListeningVisible : Boolean;
        CRMIntegrationEnabled : Boolean;
        CRMIsCoupledToRecord : Boolean;
        OpenApprovalEntriesExist : Boolean;
        RecGUserSetup : Record "91";
        RecLocation : Record "14";
        TxtFilterLocation : Text;
        CduItemavailability : Codeunit "70000";
        TotalStock : Decimal;
        TotalQtyCmdAchat : Decimal;
        TotalQtyCmdVente : Decimal;
        TotalQtyCmdService : Decimal;
        TotalQtyReservAchat : Decimal;
        TotalQtyReserStock : Integer;
        TotalQtyStockDispo : Decimal;
        "TotalQtyStockDispoProjeté" : Decimal;
        TotalQtyDevis : Decimal;
        TotalQtyTransfer : Decimal;
        TotalQtyTransit : Decimal;
        StandardCostEnable : Boolean;
        UnitCostEnable : Boolean;
        UnitCostHide : Boolean;
        RecUserSetup : Record "91";
        BolVisUnitCost : Boolean;
        RecInventorySetup : Record "313";
        DecPossibledemande : Decimal;
        DecReserver : Decimal;

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

    local procedure SetSocialListeningFactboxVisibility();
    var
        SocialListeningMgt : Codeunit "871";
    begin
        SocialListeningMgt.GetItemFactboxVisibility(Rec,SocialListeningSetupVisible,SocialListeningVisible);
    end;

    local procedure EnableCostingControls();
    begin
        StandardCostEnable := "Costing Method" = "Costing Method"::Standard;
        UnitCostEnable := "Costing Method" <> "Costing Method"::Standard;
        //<<CT16V001 ZM 15/05/2016
        RecUserSetup.GET(USERID);
        UnitCostHide := NOT RecUserSetup."Cost Responsable";
        //>>CT16V001 ZM 15/05/2016
    end;
}

