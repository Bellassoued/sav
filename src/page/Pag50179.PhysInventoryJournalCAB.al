page 50179 "Phys. Inventory Journal CAB"
{
    // version NAVW19.00,CT16V001

    // CT16V001 ZM 16/05/2016 : upgrade

    AutoSplitKey = true;
    CaptionML = ENU='Phys. Inventory Journal',
                FRA='Feuille inventaire';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    PageType = List;
    SaveValues = true;
    SourceTable = Table83;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Entry Type";"Entry Type")
                {
                    OptionCaptionML = ENU='Purchase,Sale,Positive Adjmt.,Negative Adjmt.',
                                      FRA='Achat,Vente,Positif (ajust.),Négatif (ajust.)';
                }
                field("Document No.";"Document No.")
                {
                }
                field("Item No.";"Item No.")
                {

                    trigger OnValidate();
                    begin
                        ItemJnlMgt.GetItem("Item No.",ItemDescription);
                        ShowShortcutDimCode(ShortcutDimCode);
                    end;
                }
                field("Variant Code";"Variant Code")
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
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(3),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(3,ShortcutDimCode[3]);
                    end;
                }
                field(ShortcutDimCode[4];ShortcutDimCode[4])
                {
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(4),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(4,ShortcutDimCode[4]);
                    end;
                }
                field(ShortcutDimCode[5];ShortcutDimCode[5])
                {
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(5),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(5,ShortcutDimCode[5]);
                    end;
                }
                field(ShortcutDimCode[6];ShortcutDimCode[6])
                {
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(6),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(6,ShortcutDimCode[6]);
                    end;
                }
                field(ShortcutDimCode[7];ShortcutDimCode[7])
                {
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(7),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(7,ShortcutDimCode[7]);
                    end;
                }
                field(ShortcutDimCode[8];ShortcutDimCode[8])
                {
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(8),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(8,ShortcutDimCode[8]);
                    end;
                }
                field("Location Code";"Location Code")
                {
                    Visible = true;

                    trigger OnValidate();
                    var
                        WMSManagement : Codeunit "7302";
                    begin
                        WMSManagement.CheckItemJnlLineLocation(Rec,xRec);
                    end;
                }
                field("Bin Code";"Bin Code")
                {
                    Visible = false;
                }
                field("Par Defaut INV";"Par Defaut INV")
                {
                }
                field("Niveau Casier INV";"Niveau Casier INV")
                {
                }
                field("Code Famille";"Code Famille")
                {
                }
                field("Code Index";"Code Index")
                {
                }
                field("Code Segment";"Code Segment")
                {
                }
                field("Alternative Item No.";"Alternative Item No.")
                {
                }
                field("S0 Sotck Consolidé par casier";"S0 Sotck Consolidé par casier")
                {
                }
                field("S Stock Consolidé par Magasin";"S Stock Consolidé par Magasin")
                {
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                    Visible = false;
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                    Visible = false;
                }
                field("Qty. (Calculated)";"Qty. (Calculated)")
                {
                }
                field("Qty. (Phys. Inventory)";"Qty. (Phys. Inventory)")
                {
                }
                field(Quantity;Quantity)
                {
                    Editable = false;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    Visible = false;
                }
                field("Unit Amount";"Unit Amount")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Indirect Cost %";"Indirect Cost %")
                {
                    Visible = false;
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field("Applies-to Entry";"Applies-to Entry")
                {
                }
                field("Reason Code";"Reason Code")
                {
                    Visible = false;
                }
                field("Count 1";"Count 1")
                {
                }
                field("Count 2";"Count 2")
                {
                }
                field("Count 3";"Count 3")
                {
                }
                field("CPT1 Posted";"CPT1 Posted")
                {
                }
                field("CPT2 Posted";"CPT2 Posted")
                {
                }
                field("CPT3 Posted";"CPT3 Posted")
                {
                }
                field("Ecart CPT1 / S";"Ecart CPT1 / S")
                {
                }
                field("Ecart CPT3 / S";"Ecart CPT3 / S")
                {
                }
                field("Phys. Inventory To Post";"Phys. Inventory To Post")
                {
                }
                field("Q1 Total Qté Lue Cpt 1";"Q1 Total Qté Lue Cpt 1")
                {
                }
                field("Q2 Total Qté Lue Cpt 2";"Q2 Total Qté Lue Cpt 2")
                {
                }
                field("Q3 Total Qté Lue Cpt 3";"Q3 Total Qté Lue Cpt 3")
                {
                }
                field("E1 Ind Ecart Cpt1";"E1 Ind Ecart Cpt1")
                {
                }
                field("E2 Ind Ecart Cpt2";"E2 Ind Ecart Cpt2")
                {
                }
                field("Journal Template Name";"Journal Template Name")
                {
                }
                field("Journal Batch Name";"Journal Batch Name")
                {
                }
                field(Phase;Phase)
                {
                }
            }
            group()
            {
                fixed()
                {
                    group("Item Description")
                    {
                        CaptionML = ENU='Item Description',
                                    FRA='Désignation article';
                        field(ItemDescription;ItemDescription)
                        {
                            Editable = false;
                        }
                    }
                }
            }
        }
        area(factboxes)
        {
            systempart(;Links)
            {
                Visible = false;
            }
            systempart(;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                Image = Line;
                action(Dimensions)
                {
                    AccessByPermission = TableData 348=R;
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                        CurrPage.SAVERECORD;
                    end;
                }
                action("Item &Tracking Lines")
                {
                    CaptionML = ENU='Item &Tracking Lines',
                                FRA='Lignes &traçabilité';
                    Image = ItemTrackingLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+Ctrl+I';

                    trigger OnAction();
                    begin
                        OpenItemTrackingLines(FALSE);
                    end;
                }
                action("Bin Contents")
                {
                    CaptionML = ENU='Bin Contents',
                                FRA='Contenu emplacement';
                    Image = BinContent;
                    RunObject = Page 7305;
                    RunPageLink = Location Code=FIELD(Location Code),
                                  Item No.=FIELD(Item No.),
                                  Variant Code=FIELD(Variant Code);
                    RunPageView = SORTING(Location Code,Item No.,Variant Code);
                    Scope = Repeater;
                }
            }
            group("&Item")
            {
                CaptionML = ENU='&Item',
                            FRA='Arti&cle';
                Image = Item;
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    RunObject = Page 30;
                    RunPageLink = No.=FIELD(Item No.);
                    Scope = Repeater;
                    ShortCutKey = 'Shift+F7';
                }
                action("Ledger E&ntries")
                {
                    CaptionML = ENU='Ledger E&ntries',
                                FRA='É&critures comptables';
                    Image = CustomerLedger;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    RunObject = Page 38;
                    RunPageLink = Item No.=FIELD(Item No.);
                    RunPageView = SORTING(Item No.);
                    Scope = Repeater;
                    ShortCutKey = 'Ctrl+F7';
                }
                action("Phys. In&ventory Ledger Entries")
                {
                    CaptionML = ENU='Phys. In&ventory Ledger Entries',
                                FRA='Écritures comptables &inventaire';
                    Image = PhysicalInventoryLedger;
                    RunObject = Page 390;
                    RunPageLink = Item No.=FIELD(Item No.);
                    RunPageView = SORTING(Item No.);
                    Scope = Repeater;
                }
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
                        Scope = Repeater;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItemJnlLine(Rec,ItemAvailFormsMgt.ByEvent)
                        end;
                    }
                    action(Period)
                    {
                        CaptionML = ENU='Period',
                                    FRA='Période';
                        Image = Period;
                        Scope = Repeater;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItemJnlLine(Rec,ItemAvailFormsMgt.ByPeriod)
                        end;
                    }
                    action(Variant)
                    {
                        CaptionML = ENU='Variant',
                                    FRA='Variante';
                        Image = ItemVariant;
                        Scope = Repeater;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItemJnlLine(Rec,ItemAvailFormsMgt.ByVariant)
                        end;
                    }
                    action(Location)
                    {
                        AccessByPermission = TableData 14=R;
                        CaptionML = ENU='Location',
                                    FRA='Magasin';
                        Image = Warehouse;
                        Scope = Repeater;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItemJnlLine(Rec,ItemAvailFormsMgt.ByLocation)
                        end;
                    }
                    action("BOM Level")
                    {
                        CaptionML = ENU='BOM Level',
                                    FRA='Niveau nomenclature';
                        Image = BOMLevel;
                        Scope = Repeater;

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItemJnlLine(Rec,ItemAvailFormsMgt.ByBOM)
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
                action(CalculateInventory)
                {
                    CaptionML = ENU='Calculate &Inventory',
                                FRA='C&alculer quantité en stock';
                    Ellipsis = true;
                    Image = CalculateInventory;
                    Promoted = true;
                    PromotedCategory = Process;
                    Scope = Repeater;

                    trigger OnAction();
                    begin
                        CalcQtyOnHand.SetItemJnlLine(Rec);
                        CalcQtyOnHand.FctSetLocation("Journal Batch Name");
                        CalcQtyOnHand.RUNMODAL;
                        CLEAR(CalcQtyOnHand);
                    end;
                }
                action("Calc Stock Consolidé par casier")
                {

                    trigger OnAction();
                    var
                        LRecItemJournalLine : Record "83";
                        LCduItemavailability : Codeunit "70000";
                        Window : Dialog;
                    begin
                          Window.OPEN(
                            TXT50001 +
                            TXT50002);
                        LRecItemJournalLine.RESET;
                        LRecItemJournalLine.SETRANGE("Journal Template Name","Journal Template Name");
                        LRecItemJournalLine.SETRANGE("Journal Batch Name","Journal Batch Name");
                        IF LRecItemJournalLine.FINDSET THEN
                         REPEAT
                            Window.UPDATE(1,LRecItemJournalLine.Phase);
                            Window.UPDATE(2,LRecItemJournalLine."Item No.");
                            //KKLRecItemJournalLine."S0 Sotck Consolidé par casier" := LCduItemavailability.FctCalcStockDispoByMagCentralOTPRANET(LRecItemJournalLine."Item No."
                            //KK    ,LRecItemJournalLine."Location Code",LRecItemJournalLine."Bin Code",'');
                            LRecItemJournalLine."S Stock Consolidé par Magasin" := LCduItemavailability.FctCalcStockTotalbyMag(LRecItemJournalLine."Item No."
                                ,LRecItemJournalLine."Location Code",'');
                           LRecItemJournalLine.MODIFY;
                         UNTIL LRecItemJournalLine.NEXT = 0;
                    end;
                }
                action("Passé Phase")
                {

                    trigger OnAction();
                    var
                        LRecItemJournalLine : Record "83";
                        Window : Dialog;
                    begin
                        TESTFIELD(Phase);
                        IF Phase = Phase::Ouvert THEN
                          BEGIN
                              Window.OPEN(
                            TXT50001 +
                            TXT50002);
                            LRecItemJournalLine.RESET;
                            LRecItemJournalLine.SETRANGE("Journal Template Name","Journal Template Name");
                            LRecItemJournalLine.SETRANGE("Journal Batch Name","Journal Batch Name");
                            IF LRecItemJournalLine.FINDSET THEN
                             REPEAT
                                Window.UPDATE(1,LRecItemJournalLine.Phase::"Comptage 1");
                                Window.UPDATE(2,"Item No.");
                                LRecItemJournalLine.Phase:= LRecItemJournalLine.Phase::"Comptage 1";
                                LRecItemJournalLine.MODIFY;
                             UNTIL LRecItemJournalLine.NEXT = 0;
                             Window.CLOSE;
                          END;
                        IF Phase = Phase::"Comptage 1" THEN
                          BEGIN
                            Window.OPEN(
                            TXT50001 +
                            TXT50002);
                           LRecItemJournalLine.RESET;
                            LRecItemJournalLine.SETRANGE("Journal Template Name","Journal Template Name");
                            LRecItemJournalLine.SETRANGE("Journal Batch Name","Journal Batch Name");
                            IF LRecItemJournalLine.FINDSET THEN
                             REPEAT
                                Window.UPDATE(1,LRecItemJournalLine.Phase::"Comptage 2");
                                Window.UPDATE(2,"Item No.");
                                LRecItemJournalLine.Phase:= LRecItemJournalLine.Phase::"Comptage 2";
                                LRecItemJournalLine.MODIFY;
                             UNTIL LRecItemJournalLine.NEXT = 0;
                             Window.CLOSE;
                          END;
                        IF Phase = Phase::"Comptage 2" THEN
                          BEGIN
                            Window.OPEN(TXT50001 + TXT50002);
                            LRecItemJournalLine.RESET;
                            LRecItemJournalLine.SETRANGE("Journal Template Name","Journal Template Name");
                            LRecItemJournalLine.SETRANGE("Journal Batch Name","Journal Batch Name");
                            IF LRecItemJournalLine.FINDSET THEN
                             REPEAT
                                Window.UPDATE(1,LRecItemJournalLine.Phase::"Comptage 3");
                                Window.UPDATE(2,"Item No.");
                                LRecItemJournalLine.Phase:= LRecItemJournalLine.Phase::"Comptage 3";
                                LRecItemJournalLine.MODIFY;
                             UNTIL LRecItemJournalLine.NEXT = 0;
                             Window.CLOSE;
                          END;
                    end;
                }
                action("Import Comptage")
                {

                    trigger OnAction();
                    var
                        LRecCABMouvement : Record "70045";
                        LRecItemJournalLine : Record "83";
                    begin
                        LRecItemJournalLine.RESET;
                        LRecItemJournalLine.SETRANGE("Journal Template Name","Journal Template Name");
                        LRecItemJournalLine.SETRANGE("Journal Batch Name","Journal Batch Name");
                        IF LRecItemJournalLine.FINDSET THEN
                         REPEAT
                              IF Phase = Phase::"Comptage 1" THEN
                                BEGIN
                                  LRecCABMouvement.RESET;
                                  LRecCABMouvement.SETRANGE("Code a barre",LRecItemJournalLine."Item No.");
                                  LRecCABMouvement.SETRANGE("Code Casier De",LRecItemJournalLine."Bin Code");
                                  LRecCABMouvement.SETRANGE("Code magasin De",LRecItemJournalLine."Location Code");
                                  IF LRecCABMouvement.FINDFIRST THEN BEGIN
                                     //KKLRecItemJournalLine."Count 1" := LRecCABMouvement."Comptage 1";
                                     LRecItemJournalLine.MODIFY;
                                  END;
                                  LRecCABMouvement.RESET;
                                  LRecCABMouvement.SETRANGE("Code a barre",LRecItemJournalLine."Item No.");
                                  LRecCABMouvement.SETRANGE("Code magasin De",LRecItemJournalLine."Location Code");
                                  IF LRecCABMouvement.FINDSET THEN REPEAT
                                     //KKLRecItemJournalLine.VALIDATE("Q1 Total Qté Lue Cpt 1",  (LRecItemJournalLine."Q1 Total Qté Lue Cpt 1" + LRecCABMouvement."Comptage 1"));
                                     LRecItemJournalLine.MODIFY;
                                  UNTIL LRecCABMouvement.NEXT = 0;
                                END;

                              IF Phase = Phase::"Comptage 2" THEN
                                BEGIN
                                  LRecCABMouvement.RESET;
                                  LRecCABMouvement.SETRANGE("Code a barre",LRecItemJournalLine."Item No.");
                                  LRecCABMouvement.SETRANGE("Code Casier De",LRecItemJournalLine."Bin Code");
                                  LRecCABMouvement.SETRANGE("Code magasin De",LRecItemJournalLine."Location Code");
                                  IF LRecCABMouvement.FINDFIRST THEN BEGIN
                                     //KKLRecItemJournalLine."Count 2" := LRecCABMouvement."Comptage 2";
                                     LRecItemJournalLine.MODIFY;
                                  END;

                                  LRecCABMouvement.RESET;
                                  LRecCABMouvement.SETRANGE("Code a barre",LRecItemJournalLine."Item No.");
                                  LRecCABMouvement.SETRANGE("Code magasin De",LRecItemJournalLine."Location Code");
                                  IF LRecCABMouvement.FINDSET THEN REPEAT
                                     //KKLRecItemJournalLine.VALIDATE("Q2 Total Qté Lue Cpt 2",  (LRecItemJournalLine."Q2 Total Qté Lue Cpt 2" + LRecCABMouvement."Comptage 2"));
                                     LRecItemJournalLine.MODIFY;
                                  UNTIL LRecCABMouvement.NEXT = 0;
                                END;

                              IF Phase = Phase::"Comptage 3" THEN
                                BEGIN
                                  LRecCABMouvement.RESET;
                                  LRecCABMouvement.SETRANGE("Code a barre",LRecItemJournalLine."Item No.");
                                  LRecCABMouvement.SETRANGE("Code Casier De",LRecItemJournalLine."Bin Code");
                                  LRecCABMouvement.SETRANGE("Code magasin De",LRecItemJournalLine."Location Code");
                                  IF LRecCABMouvement.FINDFIRST THEN BEGIN
                                     //KKLRecItemJournalLine."Count 3" := LRecCABMouvement."Comptage 3";
                                     LRecItemJournalLine.MODIFY;
                                  END;

                                  LRecCABMouvement.RESET;
                                  LRecCABMouvement.SETRANGE("Code a barre",LRecItemJournalLine."Item No.");
                                  LRecCABMouvement.SETRANGE("Code magasin De",LRecItemJournalLine."Location Code");
                                  IF LRecCABMouvement.FINDSET THEN REPEAT
                                     //KKLRecItemJournalLine.VALIDATE("Q3 Total Qté Lue Cpt 3",  (LRecItemJournalLine."Q3 Total Qté Lue Cpt 3" + LRecCABMouvement."Comptage 3"));
                                     LRecItemJournalLine.MODIFY;
                                  UNTIL LRecCABMouvement.NEXT = 0;
                                END;
                          UNTIL LRecItemJournalLine.NEXT = 0
                    end;
                }
                action("Insert item")
                {

                    trigger OnAction();
                    var
                        PostTransfetOrderPDA : Codeunit "70002";
                    begin
                        PostTransfetOrderPDA.FctInsertItemJnlLine('0052PR','',0,'C10 N04',2,2,'PR-CH','INVENTAIRE','PR-CH',1);
                        //PostTransfetOrderPDA.FctInsertItemJnlLine(
                    end;
                }
                action("Imp Comptage")
                {

                    trigger OnAction();
                    var
                        RepINVComptage1 : Report "60203";
                    begin
                        RepINVComptage1.FctSetTypeComptage(Phase);
                        RepINVComptage1.RUNMODAL;
                        CLEAR(RepINVComptage1);
                    end;
                }
                action("Clôturé Inventaire")
                {

                    trigger OnAction();
                    var
                        Window : Dialog;
                        LRecItemJournalLine : Record "83";
                    begin
                        TESTFIELD(Phase,Phase::"Comptage 3");

                        Window.OPEN(
                        TXT50001 +
                        TXT50002);
                        LRecItemJournalLine.RESET;
                        LRecItemJournalLine.SETRANGE("Journal Template Name","Journal Template Name");
                        LRecItemJournalLine.SETRANGE("Journal Batch Name","Journal Batch Name");
                        IF LRecItemJournalLine.FINDSET THEN
                          REPEAT
                            Window.UPDATE(1,LRecItemJournalLine.Phase);
                            Window.UPDATE(2,LRecItemJournalLine."Item No.");
                            LRecItemJournalLine."Date de Clôture" := CREATEDATETIME(WORKDATE,TIME);
                            LRecItemJournalLine."Clôturé par" := USERID;
                            LRecItemJournalLine.Phase := LRecItemJournalLine.Phase::Clôturé;
                            LRecItemJournalLine.MODIFY;
                          UNTIL LRecItemJournalLine.NEXT = 0;
                          Window.CLOSE;
                    end;
                }
                action(CalculateCountingPeriod)
                {
                    CaptionML = ENU='&Calculate Counting Period',
                                FRA='&Calculer période inventaire';
                    Ellipsis = true;
                    Image = CalculateCalendar;
                    Scope = Repeater;

                    trigger OnAction();
                    var
                        PhysInvtCountMgt : Codeunit "7380";
                    begin
                        PhysInvtCountMgt.InitFromItemJnl(Rec);
                        PhysInvtCountMgt.RUN;
                        CLEAR(PhysInvtCountMgt);
                    end;
                }
            }
            action(imp)
            {
                CaptionML = ENU='&Print',
                            FRA='&Imprimer';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                Scope = Repeater;

                trigger OnAction();
                begin
                    //<<CT16V001 ZM 15/05/2016--> Modif etat 722 par 60066

                    ItemJournalBatch.SETRANGE("Journal Template Name","Journal Template Name");
                    ItemJournalBatch.SETRANGE(Name,"Journal Batch Name");
                    PhysInventoryList.SETTABLEVIEW(ItemJournalBatch);
                    PhysInventoryList.RUNMODAL;
                    CLEAR(PhysInventoryList);
                end;
            }
            group("P&osting")
            {
                CaptionML = ENU='P&osting',
                            FRA='&Validation';
                Image = Post;
                action("Test Report")
                {
                    CaptionML = ENU='Test Report',
                                FRA='Impression test';
                    Ellipsis = true;
                    Image = TestReport;
                    Scope = Repeater;

                    trigger OnAction();
                    begin
                        ReportPrint.PrintItemJnlLine(Rec);
                    end;
                }
                action("P&ost")
                {
                    CaptionML = ENU='P&ost',
                                FRA='&Valider';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Scope = Repeater;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin
                        //<<CT16V001 ZM 15/05/2016
                        CLEAR(RecUserSetup);
                        IF (RecUserSetup.GET(USERID)) AND ( RecUserSetup."Valider Inventaire") THEN
                        BEGIN
                        CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",Rec);
                        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                        CurrPage.UPDATE(FALSE);
                        END
                        ELSE ERROR('Vous n''êtes pas autoriser : validation inventaire ');
                        //>>CT16V001 ZM 15/05/2016
                    end;
                }
                action("Post and &Print")
                {
                    CaptionML = ENU='Post and &Print',
                                FRA='Valider et i&mprimer';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+F9';

                    trigger OnAction();
                    begin
                        //<<CT16V001 ZM 15/05/2016
                        CLEAR(RecUserSetup);
                        IF (RecUserSetup.GET(USERID)) AND ( RecUserSetup."Valider Inventaire") THEN
                        BEGIN
                        CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post+Print",Rec);
                        CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                        CurrPage.UPDATE(FALSE);
                        END
                        ELSE ERROR('Vous n''êtes pas autoriser : validation inventaire ');
                        //>>CT16V001 ZM 15/05/2016
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        ItemJnlMgt.GetItem("Item No.",ItemDescription);

        CdeNodocument := "Document No.";
        IF RecLocation.GET(CurrentJnlBatchName) THEN
           "Désignation Magasin" := RecLocation.Name;
    end;

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        CdeNodocument := "Document No.";

        IF RecLocation.GET(CurrentJnlBatchName) THEN
           "Désignation Magasin" := RecLocation.Name;
    end;

    trigger OnDeleteRecord() : Boolean;
    var
        ReserveItemJnlLine : Codeunit "99000835";
    begin
        COMMIT;
        IF NOT ReserveItemJnlLine.DeleteLineConfirm(Rec) THEN
          EXIT(FALSE);
        ReserveItemJnlLine.DeleteLine(Rec);
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        SetUpNewLine(xRec);
        CLEAR(ShortcutDimCode);
    end;

    trigger OnOpenPage();
    var
        JnlSelected : Boolean;
    begin
        /*
        IF IsOpenedFromBatch THEN BEGIN
          CurrentJnlBatchName := "Journal Batch Name";
          CdeNodocument := "Document No.";
          ItemJnlMgt.OpenJnl(CurrentJnlBatchName,Rec);
          EXIT;
        END;
        ItemJnlMgt.TemplateSelection(PAGE::"Phys. Inventory Journal",2,FALSE,Rec,JnlSelected);
        IF NOT JnlSelected THEN
          ERROR('');
        ItemJnlMgt.OpenJnl(CurrentJnlBatchName,Rec);
        
        //<<CT16V001 ZM 15/05/2016
        RecUserSetup.GET(USERID);
        IF RecUserSetup."Mag Reservation/Defaut" <> '' THEN BEGIN
          CurrentJnlBatchName := RecUserSetup."Mag Reservation/Defaut";
          CdeNodocument := "Document No.";
          FILTERGROUP := 2;
          SETRANGE("Journal Batch Name",RecUserSetup."Mag Reservation/Defaut");
          FILTERGROUP := 0;
        END ELSE BEGIN
          CurrentJnlBatchName := RecUserSetup."Mag Reservation/Defaut";
          CdeNodocument := "Document No.";
          FILTERGROUP := 2;
          SETRANGE("Journal Batch Name",'DEFAULT');
          FILTERGROUP := 0;
        END;
        //>>CT16V001 ZM 15/05/2016
        */

    end;

    var
        ItemJournalBatch : Record "233";
        CalcQtyOnHand : Report "790";
        PhysInventoryList : Report "60066";
        ItemJnlMgt : Codeunit "240";
        ReportPrint : Codeunit "228";
        ItemAvailFormsMgt : Codeunit "353";
        CurrentJnlBatchName : Code[10];
        ItemDescription : Text[50];
        ShortcutDimCode : array [8] of Code[20];
        RecUserSetup : Record "91";
        TXT50000 : Label 'Vous n''avez pas le droit de sélélectionner une autres feuilles.';
        CdeNodocument : Code[20];
        RecLocation : Record "14";
        TXT50001 : TextConst ENU='Phase              #1######\',FRA='Phase              #1######\';
        TXT50002 : TextConst ENU='Article  #2######\',FRA='Article  #2######\';

    local procedure CurrentJnlBatchNameOnAfterVali();
    begin
        CurrPage.SAVERECORD;
        ItemJnlMgt.SetName(CurrentJnlBatchName,Rec);
        CurrPage.UPDATE(FALSE);
    end;
}

