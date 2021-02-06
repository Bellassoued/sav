page 69069 "Phys. Inventory Journal2"
{
    // version MAZDA860

    AutoSplitKey = true;
    CaptionML = ENU='Phys. Inventory Journal',
                FRA='Feuille inventaire';
    DataCaptionFields = "Journal Batch Name";
    DelayedInsert = true;
    PageType = Worksheet;
    SaveValues = true;
    SourceTable = Table83;

    layout
    {
        area(content)
        {
            field(CurrentJnlBatchName;CurrentJnlBatchName)
            {
                CaptionML = ENU='Batch Name',
                            FRA='Nom de la feuille';
                Lookup = true;

                trigger OnLookup(Text : Text) : Boolean;
                begin
                    //SM MAZDA70
                    RecUserSetup.GET(USERID);
                    //OLD IF NOT RecUserSetup."Administrateur Stock"  THEN
                    IF RecUserSetup."Mag Reservation/Defaut" <> '' THEN
                      ERROR(TXT50000);
                    //END SM

                    CurrPage.SAVERECORD;
                    ItemJnlMgt.LookupName(CurrentJnlBatchName,Rec);
                    CurrPage.UPDATE(FALSE);
                end;

                trigger OnValidate();
                begin
                    //SM MAZDA70
                    RecUserSetup.GET(USERID);
                    IF NOT RecUserSetup."Administrateur Stock"  THEN
                      ERROR(TXT50000);
                    //END SM

                    ItemJnlMgt.CheckName(CurrentJnlBatchName,Rec);
                    CurrentJnlBatchNameOnAfterVali;
                end;
            }
            field(Inventaire;CodeInventaire)
            {
                TableRelation = Inventaires;

                trigger OnValidate();
                var
                    RecInventaires2 : Record "60054";
                begin
                    RecInventaires2.GET(CodeInventaire);
                    BinCodeFilter := RecInventaires2."Bin Filter";
                    SETRANGE("Inventory Document No.",CodeInventaire);

                    CurrPage.UPDATE;
                end;
            }
            field("Travée";BinCodeFilter)
            {

                trigger OnValidate();
                begin
                    IF BinCodeFilter <> '' THEN
                      SETFILTER("Bin Code",BinCodeFilter)
                    ELSE
                      SETRANGE("Bin Code");
                    CurrPage.UPDATE;
                end;
            }
            field("Nouveau N° Document";NvDocNum)
            {
            }
            field("Nouvelle Date Comptabilisation";NvDate)
            {
            }
            repeater()
            {
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                }
                field("Inventory Document No.";"Inventory Document No.")
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
                field(Description;Description)
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
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    Visible = false;
                }
                field("Indirect Cost %";"Indirect Cost %")
                {
                    Visible = false;
                }
                field("Reason Code";"Reason Code")
                {
                    Visible = false;
                }
                field("Count 1";"Count 1")
                {
                    Editable = "Modifier Comptage 1";
                }
                field("Count 2";"Count 2")
                {
                    Editable = "Modifier Comptage 2";

                    trigger OnValidate();
                    begin
                        IF "Count 2" = "Count 1" THEN
                          VALIDATE("Count 3","Count 2");
                    end;
                }
                field("Count 3";"Count 3")
                {
                    Editable = "Modifier Comptage 3";
                }
                field("Ecart Final";"Ecart Final")
                {
                    Editable = FALSE ;
                }
                field("Initial Qty. (Calculated)";"Initial Qty. (Calculated)")
                {
                    Editable = false;
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
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Process;
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

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromItemJnlLine(Rec,ItemAvailFormsMgt.ByVariant)
                        end;
                    }
                    action(Location)
                    {
                        CaptionML = ENU='Location',
                                    FRA='Magasin';
                        Image = Warehouse;

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

                    trigger OnAction();
                    var
                        RecItem : Record "27";
                    begin
                        //SM
                        IF BinCodeFilter <> '' THEN BEGIN
                          RecItem.SETFILTER("Bin Filter",BinCodeFilter);
                          RecItem.SETRANGE("Location Filter",CurrentJnlBatchName)
                        END ELSE BEGIN
                          ERROR(TXT50001);
                        END;
                        //END SM

                        CalcQtyOnHand.SetItemJnlLine(Rec);
                        CalcQtyOnHand.SETTABLEVIEW(RecItem);
                        CalcQtyOnHand.RUNMODAL;
                        CLEAR(CalcQtyOnHand);
                    end;
                }
                action(CalculateCountingPeriod)
                {
                    CaptionML = ENU='&Calculate Counting Period',
                                FRA='&Calculer période inventaire';
                    Ellipsis = true;
                    Image = CalculateCalendar;
                    Visible = FALSE ;

                    trigger OnAction();
                    var
                        PhysInvtCountMgt : Codeunit "7380";
                    begin
                        PhysInvtCountMgt.InitFromItemJnl(Rec);
                        PhysInvtCountMgt.RUN;
                        CLEAR(PhysInvtCountMgt);
                    end;
                }
                action("Ajouter Référence")
                {
                    Image = Add;

                    trigger OnAction();
                    begin
                        //KK
                          AjouterReference();
                        //END KK
                    end;
                }
                action("Effacer Filter Ecart")
                {
                    Image = Delete;

                    trigger OnAction();
                    begin
                        SETFILTER("Ecart Final",'<>%1|=%2',0,0);

                        CurrPage.UPDATE;
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

                trigger OnAction();
                begin
                    // GMED 031414 --> Modif etat 722 par 60066

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
                    ShortCutKey = 'F9';
                    Visible = false;

                    trigger OnAction();
                    begin
                        // ADD GMED 030414
                        CLEAR(RecUserSetup);
                        IF (RecUserSetup.GET(USERID)) AND ( RecUserSetup."Valider Inventaire") THEN
                        BEGIN
                            CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post",Rec);
                            CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                            CurrPage.UPDATE(FALSE);
                        END
                        ELSE ERROR('Vous n''êtes pas autoriser : validation inventaire ');
                        // end GMED
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
                    ShortCutKey = 'Shift+F9';
                    Visible = false;

                    trigger OnAction();
                    begin
                        // ADD GMED 030414
                        CLEAR(RecUserSetup);
                        IF (RecUserSetup.GET(USERID)) AND ( RecUserSetup."Valider Inventaire") THEN
                        BEGIN
                            CODEUNIT.RUN(CODEUNIT::"Item Jnl.-Post+Print",Rec);
                            CurrentJnlBatchName := GETRANGEMAX("Journal Batch Name");
                            CurrPage.UPDATE(FALSE);
                        END
                        ELSE ERROR('Vous n''êtes pas autoriser : validation inventaire ');
                        // end GMED
                    end;
                }
            }
            group("Gestion Inventaire")
            {
                Caption = 'Gestion Inventaire';
                action("Verrouiller Inventaire")
                {
                    Image = DisableAllBreakpoints;

                    trigger OnAction();
                    var
                        NewDocNo : Code[20];
                        ServiceMgtSetup : Record "5911";
                        NoSeriesMgt : Codeunit "396";
                        RecInventaires : Record "60054";
                    begin
                        IF BinCodeFilter = '' THEN
                          ERROR(TXT50001);

                        RecItemJournalLine.RESET;
                        RecItemJournalLine.COPYFILTERS(Rec);
                        RecItemJournalLine.SETFILTER("Inventory Document No.",'<>''''');
                        IF NOT RecItemJournalLine.ISEMPTY THEN BEGIN
                          ERROR(TXT50002);
                        END;

                        RecItemJournalLine.SETRANGE("Inventory Document No.");

                        RecInventorySetup.GET;
                        RecInventorySetup.TESTFIELD("Inventory Nos.");
                        NoSeriesMgt.InitSeries(RecInventorySetup."Inventory Nos.",RecInventorySetup."Inventory Nos.",TODAY,NewDocNo,RecInventorySetup."Inventory Nos.");

                        IF RecItemJournalLine.FINDSET THEN BEGIN
                            REPEAT
                              RecItemJournalLine.VALIDATE("Initial Qty. (Calculated)",RecItemJournalLine."Qty. (Calculated)");
                              RecItemJournalLine.MODIFY
                            UNTIL RecItemJournalLine.NEXT = 0;
                            RecItemJournalLine.FINDSET;
                            RecItemJournalLine.MODIFYALL("Inventory Document No.",NewDocNo);
                            RecItemJournalLine.MODIFYALL("Line Locked",TRUE);
                            RecItemJournalLine.MODIFYALL("Locked Date",CURRENTDATETIME);
                            //KK
                            RecItemJournalLine.MODIFYALL("Modifier Comptage 1",TRUE);
                            RecItemJournalLine.MODIFYALL("Modifier Comptage 2",FALSE);
                            RecItemJournalLine.MODIFYALL("Modifier Comptage 3",FALSE);
                            //END KK
                        END;

                        RecInventaires.INIT;
                        RecInventaires."No." :=  NewDocNo;
                        RecInventaires."Location Code" := "Location Code";
                        RecInventaires."Bin Filter"    := BinCodeFilter;
                        RecInventaires."Date Création" := CURRENTDATETIME;
                        RecInventaires.INSERT;


                        CodeInventaire := NewDocNo;
                        SETRANGE("Inventory Document No.",NewDocNo);
                    end;
                }
                action("Changer No Document")
                {
                    Image = Change;

                    trigger OnAction();
                    begin
                        //SM
                        IF NvDocNum <> '' THEN BEGIN
                          CurrPage.SETSELECTIONFILTER(RecItemJournalLine2);
                          IF RecItemJournalLine2.FINDSET THEN
                            RecItemJournalLine2.MODIFYALL("Document No.",NvDocNum);
                        END;
                        //END SM
                    end;
                }
                action("Changer Date Comptable")
                {
                    Image = DueDate;

                    trigger OnAction();
                    begin
                        //SM
                        IF NvDate <> 0D THEN BEGIN
                          CurrPage.SETSELECTIONFILTER(RecItemJournalLine2);
                          IF RecItemJournalLine2.FINDSET THEN
                            RecItemJournalLine2.MODIFYALL("Posting Date",NvDate);
                        END;
                        //END SM
                    end;
                }
                action("Supprimer Inventaire")
                {
                    Visible = false;

                    trigger OnAction();
                    begin
                        IF CodeInventaire <> '' THEN BEGIN
                          SETRANGE("Inventory Document No.",CodeInventaire);
                          DELETEALL;
                        END;
                    end;
                }
                action("Valider Comptage 1")
                {
                    Caption = 'Valider Comptage 1';

                    trigger OnAction();
                    begin
                        //KK
                        IF BinCodeFilter = '' THEN
                          ERROR(TXT50001);

                        IF "Inventaire validé" THEN
                          ERROR(TXT50007,CodeInventaire);

                        RecItemJournalLine.RESET;
                        RecItemJournalLine.SETRANGE("Journal Batch Name",CurrentJnlBatchName);
                        RecItemJournalLine.SETRANGE("Inventory Document No.",CodeInventaire);
                        IF RecItemJournalLine.FINDSET THEN BEGIN
                          RecItemJournalLine.MODIFYALL("CPT1 Posted",TRUE);
                          RecItemJournalLine.MODIFYALL("Modifier Comptage 1",FALSE);
                          RecItemJournalLine.MODIFYALL("Modifier Comptage 2",TRUE);
                        END;

                        CurrPage.UPDATE(FALSE);
                        // END KK
                    end;
                }
                action("Valider Comptage 2")
                {
                    Caption = 'Valider Comptage 2';

                    trigger OnAction();
                    begin
                        //KK
                         IF BinCodeFilter = '' THEN
                          ERROR(TXT50001);

                        IF "Inventaire validé" THEN
                          ERROR(TXT50007,CodeInventaire);

                        RecItemJournalLine.RESET;
                        RecItemJournalLine.SETRANGE("Journal Batch Name",CurrentJnlBatchName);
                        RecItemJournalLine.SETRANGE("Inventory Document No.",CodeInventaire);
                        IF RecItemJournalLine.FINDSET THEN BEGIN
                          REPEAT
                            IF RecItemJournalLine."Count 1"=RecItemJournalLine."Count 2" THEN BEGIN
                              RecItemJournalLine.VALIDATE("CPT3 Posted",TRUE);
                              RecItemJournalLine.VALIDATE("Modifier Comptage 3",FALSE);
                              RecItemJournalLine.MODIFY;
                            END ELSE BEGIN
                              RecItemJournalLine.VALIDATE("Modifier Comptage 3",TRUE);
                              RecItemJournalLine.MODIFY;
                            END;
                          UNTIL RecItemJournalLine.NEXT=0;

                          RecItemJournalLine.FINDSET;
                          RecItemJournalLine.MODIFYALL("CPT2 Posted",TRUE);
                          RecItemJournalLine.MODIFYALL("Modifier Comptage 2",FALSE);
                        END;

                        CurrPage.UPDATE(FALSE);
                        // END KK
                    end;
                }
                action("Valider Comptage 3")
                {
                    Caption = 'Valider Comptage 3';

                    trigger OnAction();
                    begin
                        //KK
                        IF BinCodeFilter = '' THEN
                          ERROR(TXT50001);

                        IF "Inventaire validé" THEN
                          ERROR(TXT50007,CodeInventaire);

                        RecItemJournalLine.RESET;
                        RecItemJournalLine.SETRANGE("Journal Batch Name",CurrentJnlBatchName);
                        RecItemJournalLine.SETRANGE("Inventory Document No.",CodeInventaire);
                        // RecItemJournalLine.SETRANGE("CPT1 Posted",FALSE);
                        IF RecItemJournalLine.FINDSET THEN BEGIN
                          RecItemJournalLine.MODIFYALL("CPT3 Posted",FALSE);   // Ouvert
                          RecItemJournalLine.MODIFYALL("Modifier Comptage 3",TRUE); // Ouvert
                        END;

                        CurrPage.UPDATE(FALSE);
                        // END KK
                    end;
                }
            }
            group(Impression)
            {
                Caption = 'Impression';
                action("Imprimer Etat D'inventaire")
                {
                    Caption = 'Imprimer Etat D''inventaire';
                    Image = Print;

                    trigger OnAction();
                    begin
                        // KK
                          IF BinCodeFilter = '' THEN
                            ERROR(TXT50001);

                          RecInventaires.RESET;
                          RecInventaires.SETRANGE(RecInventaires."No.","Inventory Document No.");
                          REPORT.RUN(50084,TRUE,TRUE,RecInventaires);
                        // END KK
                    end;
                }
                action("Ecart Comptage")
                {
                    Caption = 'Ecart Comptage';
                    Image = DepositLines;

                    trigger OnAction();
                    begin
                        // KK
                          IF BinCodeFilter = '' THEN
                            ERROR(TXT50001);

                          RecInventaires.RESET;
                          RecInventaires.SETRANGE(RecInventaires."No.","Inventory Document No.");
                          REPORT.RUN(50085,TRUE,TRUE,RecInventaires);
                        // END KK
                    end;
                }
                action("Ecart Final")
                {

                    trigger OnAction();
                    begin
                        // KK
                          IF CurrentJnlBatchName = '' THEN
                            ERROR(TXT50006);

                          RecItemJournalLine.RESET;
                          RecItemJournalLine.SETRANGE("Journal Batch Name",CurrentJnlBatchName);
                          REPORT.RUN(50086,TRUE,TRUE,RecItemJournalLine);
                        // END KK
                    end;
                }
                action("Ecrat Comptage & Physique")
                {
                    Image = InventoryJournal;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        //KK
                          IF CurrentJnlBatchName = '' THEN
                            ERROR(TXT50006);

                          RecItemJournalLine.RESET;
                          RecItemJournalLine.SETRANGE("Journal Batch Name",CurrentJnlBatchName);
                          IF CodeInventaire <> '' THEN
                            RecItemJournalLine.SETRANGE("Inventory Document No.",CodeInventaire);
                          REPORT.RUN(50091,TRUE,TRUE,RecItemJournalLine);

                        //END KK
                    end;
                }
            }
            group(Annulation)
            {
                Caption = 'Annulation';
                action("Dévalider Comptage 1")
                {
                    Caption = 'Dévalider Comptage 1';
                    Visible = false;

                    trigger OnAction();
                    begin
                        //KK
                        RecUserSetup.RESET;
                        IF RecUserSetup.GET(USERID) AND (NOT RecUserSetup."Modifier Comptage") THEN
                          ERROR(TXT50004);

                        IF BinCodeFilter = '' THEN
                          ERROR(TXT50001);

                        RecItemJournalLine.RESET;
                        RecItemJournalLine.SETRANGE("Journal Batch Name",CurrentJnlBatchName);
                        RecItemJournalLine.SETRANGE("Inventory Document No.",CodeInventaire);
                        IF RecItemJournalLine.FINDSET THEN BEGIN
                          RecItemJournalLine.MODIFYALL("CPT1 Posted",FALSE);
                          RecItemJournalLine.MODIFYALL("Modifier Comptage 1",TRUE);
                          RecItemJournalLine.MODIFYALL("Modifier Comptage 2",FALSE);
                        END;

                        CurrPage.UPDATE(FALSE);
                        // END KK
                    end;
                }
                action("Dévalider Comptage 2")
                {
                    Caption = 'Dévalider Comptage 2';
                    Visible = false;

                    trigger OnAction();
                    begin
                        //KK
                        RecUserSetup.RESET;
                        IF RecUserSetup.GET(USERID) AND (NOT RecUserSetup."Modifier Comptage") THEN
                          ERROR(TXT50004);

                        IF BinCodeFilter = '' THEN
                          ERROR(TXT50001);

                        RecItemJournalLine.RESET;
                        RecItemJournalLine.SETRANGE("Journal Batch Name",CurrentJnlBatchName);
                        RecItemJournalLine.SETRANGE("Inventory Document No.",CodeInventaire);
                        IF RecItemJournalLine.FINDSET THEN BEGIN
                          RecItemJournalLine.MODIFYALL("CPT2 Posted",FALSE);
                          RecItemJournalLine.MODIFYALL("Modifier Comptage 2",TRUE);
                          RecItemJournalLine.MODIFYALL("Modifier Comptage 3",FALSE);
                        END;

                        CurrPage.UPDATE(FALSE);
                        // END KK
                    end;
                }
                action("Dévalider Comptage 3")
                {
                    Caption = 'Dévalider Comptage 3';
                    Visible = false;

                    trigger OnAction();
                    begin
                        //KK
                        RecUserSetup.RESET;
                        IF RecUserSetup.GET(USERID) AND (NOT RecUserSetup."Modifier Comptage") THEN
                          ERROR(TXT50004);

                        IF BinCodeFilter = '' THEN
                          ERROR(TXT50001);

                        RecItemJournalLine.RESET;
                        RecItemJournalLine.SETRANGE("Journal Batch Name",CurrentJnlBatchName);
                        RecItemJournalLine.SETRANGE("Inventory Document No.",CodeInventaire);
                        IF RecItemJournalLine.FINDSET THEN BEGIN
                          RecItemJournalLine.MODIFYALL("CPT3 Posted",FALSE);
                          RecItemJournalLine.MODIFYALL("Modifier Comptage 3",TRUE);
                        END;

                        CurrPage.UPDATE(FALSE);
                        // END KK
                    end;
                }
            }
            group(Annulation)
            {
                Caption = 'Annulation';
                action("Mise à jour quantité calculée")
                {
                    Caption = 'Mise à jour quantité calculée';
                    Image = UpdateDescription;

                    trigger OnAction();
                    var
                        CalcInvenUpdate : Report "60153";
                        RecItem : Record "27";
                    begin
                        // KK
                        //SM
                        IF BinCodeFilter <> '' THEN BEGIN
                          RecItem.SETFILTER("Bin Filter",BinCodeFilter);
                          RecItem.SETRANGE("Location Filter",CurrentJnlBatchName)
                        END ELSE BEGIN
                          ERROR(TXT50001);
                        END;
                        //END SM

                        CalcInvenUpdate.SetItemJnlLine(Rec);
                        CalcInvenUpdate.SETTABLEVIEW(RecItem);
                        CalcInvenUpdate.SetInventoryNo(CodeInventaire);
                        CalcInvenUpdate.RUNMODAL;
                        CLEAR(CalcInvenUpdate);

                        // END KK
                    end;
                }
                action("Valider Inventaire")
                {
                    Image = Apply;

                    trigger OnAction();
                    begin
                        //KK
                        CLEAR(RecUserSetup);
                        IF (RecUserSetup.GET(USERID)) AND (NOT RecUserSetup."Modifier Comptage") THEN
                          ERROR(TXT50005);

                        IF BinCodeFilter = '' THEN
                          ERROR(TXT50001);

                        IF "Inventaire validé" THEN
                          ERROR(TXT50007,CodeInventaire);

                        RecItemJournalLine.RESET;
                        RecItemJournalLine.SETRANGE("Journal Batch Name",CurrentJnlBatchName);
                        RecItemJournalLine.SETRANGE("Inventory Document No.",CodeInventaire);
                        IF RecItemJournalLine.FINDSET THEN BEGIN
                          RecItemJournalLine.MODIFYALL("CPT3 Posted",TRUE);
                          RecItemJournalLine.MODIFYALL("Modifier Comptage 3",FALSE);
                          RecItemJournalLine.MODIFYALL("Inventaire validé",TRUE);
                        END;

                        CurrPage.UPDATE(FALSE);
                        // END KK
                    end;
                }
                action("Filtre Ecart Final")
                {

                    trigger OnAction();
                    begin
                        SETFILTER("Ecart Final",'<>%1',0);

                        CurrPage.UPDATE;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        ItemJnlMgt.GetItem("Item No.",ItemDescription);
    end;

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
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
        OpenedFromBatch := ("Journal Batch Name" <> '') AND ("Journal Template Name" = '');
        IF OpenedFromBatch THEN BEGIN
          CurrentJnlBatchName := "Journal Batch Name";
          ItemJnlMgt.OpenJnl(CurrentJnlBatchName,Rec);
          EXIT;
        END;
        ItemJnlMgt.TemplateSelection(PAGE::"Phys. Inventory Journal",2,FALSE,Rec,JnlSelected);
        IF NOT JnlSelected THEN
          ERROR('');
        ItemJnlMgt.OpenJnl(CurrentJnlBatchName,Rec);

        //SM MAZDA70
        RecUserSetup.GET(USERID);
        IF RecUserSetup."Mag Reservation/Defaut" <> '' THEN BEGIN
          CurrentJnlBatchName := RecUserSetup."Mag Reservation/Defaut";
          FILTERGROUP := 2;
          SETRANGE("Journal Batch Name",RecUserSetup."Mag Reservation/Defaut");
          FILTERGROUP := 0;
        END ELSE BEGIN
          CurrentJnlBatchName := RecUserSetup."Mag Reservation/Defaut";
          FILTERGROUP := 2;
          SETRANGE("Journal Batch Name",'DEFAULT');
          FILTERGROUP := 0;
        END;
        //END SM

        CodeInventaire := '';
        BinCodeFilter  := '';
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
        OpenedFromBatch : Boolean;
        RecUserSetup : Record "91";
        TXT50000 : Label 'Vous n''avez pas le droit de sélélectionner une autres feuilles.';
        BinCodeFilter : Text;
        CodeInventaire : Code[20];
        TXT50001 : Label 'Filtre Emplacement Vide';
        RecItemJournalLine : Record "83";
        TXT50002 : Label 'Il y''a des lignes qui sont déjà affectés à des inventaires';
        RecInventorySetup : Record "313";
        NvDocNum : Code[20];
        RecItemJournalLine2 : Record "83";
        NvDate : Date;
        ModifComptage1 : Boolean;
        TXT50003 : Label 'Vous n''avez pas le droit de modifier le premier comptage';
        RecInventaires : Record "60054";
        EtatInventaire : Report "50084";
        TXT50004 : Label 'Vous n''avez pas le droit, veuillez contacter votre administrateur';
        TXT50005 : Label 'Vous n''avez pas le droit de valider l''inventaire';
        TXT50006 : Label 'Filtre nom de la feuille Vide';
        TXT50007 : Label '"L''inventiare N° %1 est déja validé  "';

    local procedure CurrentJnlBatchNameOnAfterVali();
    begin
        CurrPage.SAVERECORD;
        ItemJnlMgt.SetName(CurrentJnlBatchName,Rec);
        CurrPage.UPDATE(FALSE);
    end;

    procedure UpdatePage();
    begin
        CurrPage.UPDATE(FALSE);
    end;

    procedure AjouterReference();
    var
        DialogMotif : DotNet "'Microsoft.VisualBasic, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'.Microsoft.VisualBasic.Interaction" RUNONCLIENT;
        txt : Text;
        RecItem : Record "27";
        RefArticle : Code[20];
        NumLigne : Integer;
    begin
        //KK
        IF BinCodeFilter = '' THEN
          ERROR(TXT50001);

        txt := DialogMotif.InputBox('Tapez la référence à ajouter:', 'Tapez la référence à ajouter:', '', 100, 100);

        EVALUATE(RefArticle,txt);

        IF RecItem.GET(RefArticle) THEN BEGIN
          RecItemJournalLine.RESET;
          RecItemJournalLine.SETRANGE("Journal Batch Name",CurrentJnlBatchName);
          //RecItemJournalLine.SETRANGE("Inventory Document No.",CodeInventaire);
          IF RecItemJournalLine.FINDLAST THEN
            NumLigne := RecItemJournalLine."Line No." + 10000
          ELSE NumLigne := 10000;

          RecItemJournalLine.INIT;
          RecItemJournalLine."Journal Batch Name"      := "Journal Batch Name";
          RecItemJournalLine."Journal Template Name"   := "Journal Template Name";
          RecItemJournalLine."Line No."                := NumLigne;
          RecItemJournalLine."Inventory Document No."  := CodeInventaire;
          RecItemJournalLine."Document No."            := "Document No.";
          RecItemJournalLine."Posting Date"            := "Posting Date";

          RecItemJournalLine.VALIDATE("Item No.",RefArticle);
          RecItemJournalLine.VALIDATE("Modifier Comptage 1",TRUE);
          RecItemJournalLine.VALIDATE("Location Code","Journal Batch Name");
          RecItemJournalLine.VALIDATE("Line Locked",TRUE);

          RecItemJournalLine.INSERT;
        END ELSE ERROR('La référence tapez n''existe pas veuillez la retapez');

        CurrPage.UPDATE;
        //END KK
    end;
}

