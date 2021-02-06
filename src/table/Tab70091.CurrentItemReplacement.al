table 70091 "Current Item Replacement"
{
    // version INC2.30.xx,INC3.0.0.0,INC3.0.1.0

    // +----------------------------------------------+
    // | Copyright © 2000 Incadea AG Germany          |
    // +----------------------------------------------+
    // | INCADEA ENGINE                               |
    // +----------------------------------------------+
    // PA-Nummer   Datum
    // ------------------------------------------------
    // PA021937    28.08.03
    // PA022409    03.02.04
    // PA022492    27.02.04
    // PA021506    13.09.04
    // PA025782    25.08.05

    CaptionML = ENU='Current Item Replacement',
                FRA='Remplacement de pièce actuelle';
    DrillDownPageID = 70091;
    LookupPageID = 70091;

    fields
    {
        field(2;"Old Item No.";Code[20])
        {
            CaptionML = ENU='Old Item No.',
                        FRA='Ancien N° Pièce';
            NotBlank = true;
            TableRelation = Item.No. WHERE (Item type=CONST(Pièce));
            ValidateTableRelation = false;

            trigger OnValidate();
            begin
                /*OLD
                IF xRec."Old Item No." = "Old Item No." THEN
                  EXIT;
                IF CurrFieldNo = FIELDNO("Old Item No.") THEN
                  "Old Item No." := Item.ItemSearch("Old Item No.","Make Code",0);
                IF xRec."Old Item No." = "Old Item No." THEN
                  EXIT;
                IF ("Old Item No." = "New Item No.") THEN
                  ERROR(C_INC001, FIELDCAPTION("Old Item No."), FIELDCAPTION("New Item No."));
                
                IF Item.GET("Old Item No.") THEN BEGIN
                  CheckCurrent(TRUE);
                  Item.GET("Old Item No.");
                  IF Item."Replacement Status" = Item."Replacement Status"::"Has been replaced" THEN
                    ERROR(C_INC006,"Old Item No.");
                  IF Item."Replacement Status" <> Item."Replacement Status"::"Will be replaced" THEN BEGIN
                    //The old item status may not be overwritten, when the new status has already been set beforehand
                    Item."Old Replacement Status" := Item."Replacement Status";
                    Item."Replacement Status" := Item."Replacement Status"::"Will be replaced";
                    Item.MODIFY;
                  END;
                  "Make Code" := Item."Make Code";
                  IF (xRec."Old Item No." <> '') THEN
                    ChangeReplacementStatusOld(xRec."Old Item No.");
                  VALIDATE("Attached to Replacement No.");  //Check "Attached to Line No."
                // Start PA025782
                //END;
                END ELSE
                  ERROR(C_INC015,Item.TABLECAPTION,"Old Item No.");
                // Stop PA025782
                OLD*/

            end;
        }
        field(3;"New Item No.";Code[20])
        {
            CaptionML = ENU='New Item No.',
                        FRA='Nouveau N° Pièce';
            NotBlank = true;
            TableRelation = Item.No. WHERE (Item type=CONST(Pièce),
                                            Manufacturer Code=FIELD(Make Code));
            ValidateTableRelation = false;

            trigger OnValidate();
            begin
                //OLD IF CurrFieldNo = FIELDNO("New Item No.") THEN
                //OLD   "New Item No." := Item.ItemSearch("New Item No.","Make Code",0);
                
                IF ("Old Item No." = "New Item No.") THEN
                  ERROR(C_INC001, FIELDCAPTION("Old Item No."), FIELDCAPTION("New Item No."));
                /*OLD
                IF "New Item No." <> xRec."New Item No." THEN BEGIN
                  IF Item.GET("New Item No.") THEN BEGIN
                    CheckCurrent(FALSE);
                    IF Item."Replacement Status" = Item."Replacement Status"::"Has been replaced" THEN
                      CheckNewItemReplaceStatus;
                    IF Item."Replacement Status" <> Item."Replacement Status"::"Replacement Item" THEN BEGIN
                      //The old item status may not be overwritten, when the new status has already been set beforehand
                      Item."Old Replacement Status" := Item."Replacement Status";
                      Item."Replacement Status" := Item."Replacement Status"::"Replacement Item";
                      Item.MODIFY;
                    END;
                    IF (xRec."New Item No." <> '') THEN
                      ChangeReplacementStatusNew(xRec."New Item No.");
                  END ELSE BEGIN
                    IF CurrFieldNo = FIELDNO("New Item No.") THEN BEGIN
                      MasterSearch.CheckItemReplacementLine(Rec,"Make Code");
                    END;
                  END;
                END;
                OLD */
                VALIDATE("Attached to Replacement No.");  //Check "Attached to Line No."

            end;
        }
        field(10;"Full Replacement";Boolean)
        {
            CaptionML = ENU='Full Replacement',
                        FRA='Remplacement total';
        }
        field(11;"Created on";Date)
        {
            CaptionML = ENU='Created on',
                        FRA='Date création';
            Editable = false;
        }
        field(12;"Origin Type";Option)
        {
            CaptionML = ENU='Origin Type',
                        FRA='Type origine';
            Editable = false;
            OptionCaptionML = ENU='Manual,Factory,Receipt',
                              FRA='Manuel,Constructeur,Livraison';
            OptionMembers = Manual,Factory,Receipt;
        }
        field(13;"Created by User ID";Code[100])
        {
            CaptionML = ENU='Created by User ID',
                        FRA='Créé par ID utilisateur';
            Editable = false;
            TableRelation = User;
        }
        field(14;"Replacement No.";Integer)
        {
            CaptionML = ENU='Replacement No.',
                        FRA='N° Remplacement';
            Editable = false;
        }
        field(15;"Attached to Replacement No.";Integer)
        {
            CaptionML = ENU='Attached to Replacement No.',
                        FRA='Attaché au N° Remplacement';

            trigger OnValidate();
            begin
                /*OLD
                IF "Attached to Replacement No." <> 0 THEN BEGIN
                  IF "Attached to Replacement No." = "Replacement No." THEN
                    ERROR(C_INC008);
                  CurrentReplcmts2.SETCURRENTKEY("Replacement No.");
                  CurrentReplcmts2.SETRANGE("Replacement No.","Attached to Replacement No.");
                  IF NOT CurrentReplcmts2.FIND('-') THEN
                    ERROR(C_INC009,"Attached to Replacement No.");
                  IF (CurrentReplcmts2."Old Item No." <> "Old Item No.") AND
                     (CurrentReplcmts2."New Item No." <> "New Item No.") THEN
                    ERROR(C_INC007);
                  IF CurrentReplcmts2."Attached to Replacement No." <> 0 THEN
                    ERROR(C_INC010);
                END;
                OLD*/

            end;
        }
        field(16;"Make Code";Code[20])
        {
            CaptionML = ENU='Make Code',
                        FRA='Code marque';
            TableRelation = Make;
        }
        field(17;"Piecing Old Item No.";Integer)
        {
            CaptionML = ENU='Piecing Old Item No.',
                        FRA='Ratio ancien N° Pièce';
            MinValue = 1;

            trigger OnValidate();
            begin
                IF ("Piecing Old Item No." <> 1) AND ("Piecing New Item No." <> 1) THEN
                  ERROR(C_INC011);
            end;
        }
        field(18;"Piecing New Item No.";Integer)
        {
            CaptionML = ENU='Piecing New Item No.',
                        FRA='Ratio nouveau N° Pièce';
            MinValue = 1;

            trigger OnValidate();
            begin
                IF ("Piecing Old Item No." <> 1) AND ("Piecing New Item No." <> 1) THEN
                  ERROR(C_INC011);
            end;
        }
        field(19;"Created through Receipt No.";Code[20])
        {
            CaptionML = ENU='Created through Receipt No.',
                        FRA='Créé par N° Livraison';
        }
        field(20;"Process File Data";Boolean)
        {
            CaptionML = ENU='Process File Data',
                        FRA='Données trait. fichier';

            trigger OnValidate();
            begin
                IF "Process File Data" THEN BEGIN
                  "Processed by User ID" := USERID;
                  "Date Modified" := TODAY;
                END ELSE BEGIN
                  "Processed by User ID" := '';
                  "Date Modified" := 0D;
                END;
            end;
        }
        field(21;"Processed by User ID";Code[100])
        {
            CaptionML = ENU='Processed by User ID',
                        FRA='Traité par ID utilisateur';
            Editable = false;
            TableRelation = User;
        }
        field(22;"Date Modified";Date)
        {
            CaptionML = ENU='Date Modified',
                        FRA='Date modification';
            Editable = false;
        }
        field(25;"Creation Time";Time)
        {
            CaptionML = ENU='Creation Time',
                        FRA='Heure création';
            Editable = false;
        }
        field(30;"Copy Locations / Bins";Boolean)
        {
            CaptionML = ENU='Copy Locations / Bins',
                        FRA='Copier magasins/emplacements';
            Editable = false;
        }
        field(31;"Copy Comments";Boolean)
        {
            CaptionML = ENU='Copy Comments',
                        FRA='Copier commentaires';
            Editable = false;
        }
        field(32;"Copy Ext. Texts";Boolean)
        {
            CaptionML = ENU='Copy Ext. Texts',
                        FRA='Copier textes étendus';
            Editable = false;
        }
        field(33;"Copy Units of Measure";Boolean)
        {
            CaptionML = ENU='Copy Units of Measure',
                        FRA='Copier unités';
            Editable = false;
        }
        field(34;"Copy Translations";Boolean)
        {
            CaptionML = ENU='Copy Translations',
                        FRA='Copier traductions';
            Editable = false;
        }
        field(35;"Copy Sales Qty. Discounts";Boolean)
        {
            CaptionML = ENU='Copy Sales Qty. Discounts',
                        FRA='Copier remises qté vente';
            Editable = false;
        }
        field(36;"Copy Sales Prices";Boolean)
        {
            CaptionML = ENU='Copy Sales Prices',
                        FRA='Copier prix vente';
            Editable = false;
        }
        field(37;"Copy Item Vendor Catalog";Boolean)
        {
            CaptionML = ENU='Copy Item Vendor Catalog',
                        FRA='Copier catal. fourn. pièce';
            Editable = false;
        }
        field(38;"Copy Purchase Qty. Discounts";Boolean)
        {
            CaptionML = ENU='Copy Purchase Qty. Discounts',
                        FRA='Copier remises sur qté d''achat';
            Editable = false;
        }
        field(39;"Copy Picture";Boolean)
        {
            CaptionML = ENU='Copy Picture',
                        FRA='Copier photo';
            Editable = false;
        }
        field(40;"Delete Old Locations";Boolean)
        {
            CaptionML = ENU='Delete Old Locations',
                        FRA='Supprimer anciens magasins';
            Editable = false;
        }
        field(41;"Delete Old Comments";Boolean)
        {
            CaptionML = ENU='Delete Old Comments',
                        FRA='Supprimer anciens commentaires';
            Editable = false;
        }
        field(42;"Delete Old Ext. Texts";Boolean)
        {
            CaptionML = ENU='Delete Old Ext. Texts',
                        FRA='Suppr.anciens textes étendus';
            Editable = false;
        }
        field(43;"Delete Old Units of Measure";Boolean)
        {
            CaptionML = ENU='Delete Old Units of Measure',
                        FRA='Supprimer anciennes unités';
            Editable = false;
        }
        field(44;"Delete Old Translations";Boolean)
        {
            CaptionML = ENU='Delete Old Translations',
                        FRA='Supprimer anciennes traductions';
            Editable = false;
        }
        field(45;"Delete Old Sales Qty. Disc.";Boolean)
        {
            CaptionML = ENU='Delete Old Sales Qty. Discounts',
                        FRA='Suppr. anciennes remises qté vente';
            Editable = false;
        }
        field(46;"Delete Old Sales Prices";Boolean)
        {
            CaptionML = ENU='Delete Old Sales Prices',
                        FRA='Suppr. anciens prix vente';
            Editable = false;
        }
        field(47;"Delete Old Item Vendor Catalog";Boolean)
        {
            CaptionML = ENU='Delete Old Item Vendor Catalog',
                        FRA='Suppr. ancien catalogue fourn. pièce';
            Editable = false;
        }
        field(48;"Delete Old Purch. Qty. Disc.";Boolean)
        {
            CaptionML = ENU='Delete Old Purch. Qty. Discounts',
                        FRA='Suppr. anciennes remises qté achat';
            Editable = false;
        }
        field(49;"Delete Picture";Boolean)
        {
            CaptionML = ENU='Delete Picture',
                        FRA='Supprimer photo';
            Editable = false;
        }
        field(50;"Date Completed";Date)
        {
            CaptionML = ENU='Date Completed',
                        FRA='Date terminé';
            Enabled = false;
        }
        field(51;"Completed by User ID";Code[100])
        {
            CaptionML = ENU='Completed by User ID',
                        FRA='Réalisé par ID utilisateur';
            Enabled = false;
            TableRelation = User;
        }
        field(52;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° Document';
            Enabled = false;
        }
        field(55;"Copy Additional Item";Boolean)
        {
            CaptionML = ENU='Copy Additional Item',
                        FRA='Copier pièce addit.';

            trigger OnValidate();
            begin
                /*OLD
                IF "Copy Additional Item" THEN
                  CheckAddItem();
                OLD*/

            end;
        }
        field(56;"Delete Old Add. Items";Boolean)
        {
            CaptionML = ENU='Delete Old Add. Items',
                        FRA='Suppr. anciennes pièces addit.';
        }
        field(60;"N:1 Replacement";Boolean)
        {
            CaptionML = ENU='N:1 Replacement',
                        FRA='N:1 Replacement';
        }
        field(61;"1:N Replacement";Boolean)
        {
            CaptionML = ENU='1:N Replacement',
                        FRA='1:N Replacement';
        }
        field(62;"Replacement Chain No.";Integer)
        {
            CaptionML = ENU='Replacement Chain No.',
                        FRA='N° Chaîne de remplacement';
            Editable = false;
        }
        field(70;"Copy Alternate Main";Boolean)
        {
            CaptionML = ENU='Copy Alternate Main',
                        FRA='Copier secondaire princ.';
        }
        field(71;"Copy Alternate Sub";Boolean)
        {
            CaptionML = ENU='Copy Alternate Sub',
                        FRA='Copier secondaire sous';
        }
        field(72;"Delete Old Alternate Main";Boolean)
        {
            CaptionML = ENU='Delete Old Alternate Main',
                        FRA='Suppr. ancien secondaire princ.';
        }
        field(73;"Delete Old Alternate Sub";Boolean)
        {
            CaptionML = ENU='Delete Old Alternate Sub',
                        FRA='Supprimer ancien secondaire sous';
        }
        field(100;"Last 1:N Line";Boolean)
        {
            CaptionML = ENU='Last 1:N Line',
                        FRA='Dernière ligne 1:N';
        }
        field(101;"Last N:1 Line";Boolean)
        {
            CaptionML = ENU='Last N:1 Line',
                        FRA='Dernière ligne N:1';
        }
        field(150;Remark;Text[150])
        {
            CaptionML = ENU='Remark',
                        FRA='Remarque';
        }
    }

    keys
    {
        key(Key1;"Old Item No.","New Item No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key2;"Old Item No.","Created on")
        {
            MaintainSIFTIndex = false;
        }
        key(Key3;"New Item No.","Created on")
        {
            MaintainSIFTIndex = false;
        }
        key(Key4;"Replacement No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key5;"Attached to Replacement No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key6;"Created on","Replacement No.")
        {
            MaintainSIFTIndex = false;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        /*OLD
        ChangeReplacementStatusOld("Old Item No.");
        ChangeReplacementStatusNew("New Item No.");
        
        ItemReplcmtTransfs.SETRANGE("Old Item No.","Old Item No.");
        ItemReplcmtTransfs.SETRANGE("New Item No.","New Item No.");
        ItemReplcmtTransfs.DELETEALL;
        OLD*/

    end;

    trigger OnInsert();
    begin
        IF "Created on" = 0D THEN
          "Created on" := TODAY;
        IF "Created by User ID" = '' THEN
          "Created by User ID" := USERID;
        IF "Creation Time" = 0T THEN
          "Creation Time" := TIME;
        
        IF "Replacement No." = 0 THEN
          GetReplacementNo;
        /*OLD
        SetupItemReplcmt.FIND;
        "Copy Locations / Bins" := SetupItemReplcmt."Copy Locations / Bins";
        "Copy Comments" := SetupItemReplcmt."Copy Comments";
        "Copy Ext. Texts" := SetupItemReplcmt."Copy Ext. Texts";
        "Copy Units of Measure" := SetupItemReplcmt."Copy Units of Measure";
        "Copy Translations" := SetupItemReplcmt."Copy Translations";
        "Copy Sales Qty. Discounts" := SetupItemReplcmt."Copy Sales Qty. Discounts";
        "Copy Sales Prices" := SetupItemReplcmt."Copy Sales Prices";
        "Copy Item Vendor Catalog" := SetupItemReplcmt."Copy Item Vendor Catalog";
        "Copy Purchase Qty. Discounts" := SetupItemReplcmt."Copy Purchase Qty. Discounts";
        "Copy Picture" := SetupItemReplcmt."Copy Picture";
        "Copy Additional Item" := SetupItemReplcmt."Copy Additional Item";
        
        //Start PA022409
        "Copy Alternate Main" := SetupItemReplcmt."Copy Alternate Main";
        "Copy Alternate Sub" := SetupItemReplcmt."Copy Alternate Sub";
        //Stop PA022409
        
        
        
        CheckAddItem();
        OLD*/

    end;

    trigger OnModify();
    begin
        /*OLD
        CheckAddItem();
        OLD*/

    end;

    trigger OnRename();
    begin
        /*OLD
        CheckAddItem();
        OLD*/

    end;

    var
        Item : Record "27";
        SetupItemReplcmt : Record "70093";
        ItemReplcmtTransfs : Record "70095";
        CurrentReplcmts2 : Record "70091";
        CompletedReplcmts : Record "70092";
        C_INC001 : TextConst ENU='%1 and %2 are identical.',FRA='%1 et %2 sont identiques.';
        C_INC002 : TextConst ENU='Item %1 has already been replaced by item %3 on %2',FRA='La pièce %1 a déjà été remplacée par la pièce %3 sur %2';
        LastReplItemNo : Code[20];
        LastReplDate : Date;
        C_INC003 : TextConst ENU='The replacement of item %1 by %2 has already been done on %3',FRA='Le remplacement de la pièce %1 par %2 a déjà été effectué dans %3';
        C_INC004 : TextConst ENU='Item %1 is used as a replacement for item %2 and can therefore not be replaced.',FRA='La pièce %1 est utilisée en remplacement de la pièce %2 et ne peut donc pas être remplacée.';
        C_INC005 : TextConst ENU='Item %1 has already been replaced by item %2 and can therefore not be entered.',FRA='La pièce %1 a déjà été remplacée par la pièce %2 et ne peut donc pas être saisie.';
        C_INC006 : TextConst ENU='Item %1 has already been replaced',FRA='La pièce %1 a déjà été remplacée';
        C_INC007 : TextConst ENU='Old or new item has to match for multiple replacements',FRA='La pièce ancienne ou nouvelle doit correspondre à plusieurs remplacements';
        C_INC008 : TextConst ENU='Replacement may not point to itself',FRA='Le remplacement peut ne pas pointer vers lui-même';
        C_INC009 : TextConst ENU='The replacement line %1 was not found',FRA='Ligne de remplacement %1 introuvable';
        C_INC010 : TextConst ENU='The assigned replacement line itself cannot be assigned',FRA='La ligne de remplacement affectée elle-même ne peut pas être affectée';
        C_INC011 : TextConst ENU='One of the two piecings has to contain the value 1',FRA='L''une des deux ratios doit contenir la valeur 1';
        C_INC012 : TextConst ENU=' %1 cannot be taken as new item. It is replaced already and would not be the end of the replacement-chain',FRA=' %1 ne peut pas être considéré comme nouvelle pièce. Il est déjà remplacé et ne serait pas la fin de la chaîne de remplacement';
        C_INC013 : TextConst ENU='%1 %2 (%3) is a deposit and can only be replaced in %4 in which ''%5'' = %6.',FRA='%1 %2 (%3) est une consigne et peut uniquement être remplacé dans %4 dans lequel ''%5'' = %6.';
        C_INC014 : TextConst ENU='Additional items are affected by this N:1 replacement.\Additional Items cannot transfered automatically.\\Please add additionally Items manually',FRA='Les pièces supplémentaires sont affectées par ce remplacement N:1.\Les pièces additionnelles ne peuvent pas être transférées automatiquement.\\Veuillez ajouter les pièces additionnelles manuellement';
        C_INC015 : TextConst ENU='%1 %2 does not exist.',FRA='%1 %2 n''existe pas.';

    procedure CheckCurrent(OldItemCheck : Boolean);
    var
        CurItemReplcmt : Record "70091";
    begin
        // CheckCurrent
        /*OLD
        IF OldItemCheck THEN BEGIN
          CurItemReplcmt.SETCURRENTKEY("New Item No.","Created on");
          CurItemReplcmt.SETRANGE("New Item No.","Old Item No.");
          IF CurItemReplcmt.FIND('-') THEN
            ERROR(C_INC004,"Old Item No.", CurItemReplcmt."Old Item No.");
        END ELSE BEGIN
          CurItemReplcmt.SETCURRENTKEY("Old Item No.","Created on");
          CurItemReplcmt.SETRANGE("Old Item No.","New Item No.");
          IF CurItemReplcmt.FIND('-') THEN
            ERROR(C_INC005,CurItemReplcmt."Old Item No.", CurItemReplcmt."New Item No.");
        END;
        OLD*/

    end;

    procedure ChangeReplacementStatusOld(ItemNo : Code[20]);
    var
        CurItemReplcmt : Record "70091";
    begin
        // ChangeReplacementStatusOld
        /*OLD
        IF Item.GET(ItemNo) THEN BEGIN
          CurItemReplcmt.SETCURRENTKEY("Old Item No.","Created on");
          CurItemReplcmt.SETRANGE("Old Item No.",ItemNo);
          IF CurItemReplcmt.COUNT = 1 THEN BEGIN //
            Item."Replacement Status" := Item."Old Replacement Status";
            Item.MODIFY;
          END;
        END;
        OLD*/

    end;

    procedure ChangeReplacementStatusNew(ItemNo : Code[20]);
    var
        CurItemReplcmt : Record "70091";
    begin
        // ChangeReplacementStatusNew
        /*OLD
        IF Item.GET(ItemNo) THEN BEGIN
          CurItemReplcmt.SETCURRENTKEY("New Item No.","Created on");
          CurItemReplcmt.SETRANGE("New Item No.",ItemNo);
          IF CurItemReplcmt.COUNT = 1 THEN BEGIN //
            Item."Replacement Status" := Item."Old Replacement Status";
            Item.MODIFY;
          END;
        END;
        OLD*/

    end;

    procedure OldNoLookup(var Text : Text[250];var ForMakeCode : Code[10]) Change : Boolean;
    var
        ItemLoc : Record "27";
    begin
        // OldNoLookup
        /*OLD
        Change := FALSE;
        IF ItemLoc.GET(Text) THEN;
        IF ItemLoc.LookupWithMaster() THEN BEGIN
          Text := ItemLoc."No.";
          ForMakeCode := ItemLoc."Make Code";
          Change := TRUE;
        END;
        OLD*/

    end;

    procedure NewNoLookup(var Text : Text[250]) Change : Boolean;
    var
        ItemLoc : Record "27";
    begin
        // NewNoLookup
        /*OLD
        Change := FALSE;
        ItemLoc.SETRANGE("Make Code", "Make Code");
        IF ItemLoc.GET(Text) THEN;
        IF ItemLoc.LookupWithMaster() THEN BEGIN
          Text := ItemLoc."No.";
          Change := TRUE;
        END;
        OLD*/

    end;

    procedure GetReplacementNo();
    var
        CurReplcmts : Record "70091";
        CompReplcmts : Record "70092";
    begin
        // GetReplacemtNo
        /*OLD
        CurReplcmts.SETCURRENTKEY("Replacement No.");
        CompReplcmts.SETCURRENTKEY("Replacement No.");
        
        IF CurReplcmts.FIND('+') THEN BEGIN
          IF CompReplcmts.FIND('+') AND (CompReplcmts."Replacement No." > CurReplcmts."Replacement No.") THEN
            "Replacement No." := CompReplcmts."Replacement No." + 1
          ELSE
            "Replacement No." := CurReplcmts."Replacement No." + 1
        END ELSE IF CompReplcmts.FIND('+') THEN
          "Replacement No." := CompReplcmts."Replacement No." + 1
        ELSE
          "Replacement No." := 1;
        OLD*/

    end;

    procedure CheckNewItemReplaceStatus();
    var
        ReplcmtChains : Record "70095";
        CompReplcmts : Record "70092";
        ChainSearchNo : Integer;
        OldChainNo : Integer;
        Regis1 : Boolean;
        Regis2 : Boolean;
    begin
        // CheckNewItemReplaceStatus
        /*OLD
        ReplcmtChains.SETRANGE("Item No.","Old Item No.");
        IF ReplcmtChains.FIND('-') THEN BEGIN
          //Replacement belongs to a chain.
          OldChainNo := ReplcmtChains."Chain No.";
        END ELSE
          OldChainNo := 0;
        
        
        Regis1 := TRUE;
        Regis2 := TRUE;
        
        ReplcmtChains.SETRANGE("Item No.","New Item No.");
        ReplcmtChains.SETFILTER("Chain No.",'<>%1',OldChainNo);
        IF ReplcmtChains.FIND('-') THEN BEGIN
        //new item also belongs to another chain
        
          //check last replacement of the "new item" if it is the last element
          CLEAR(CompReplcmts);
          CompReplcmts.SETCURRENTKEY("New Item No.","Created on");
          CompReplcmts.SETRANGE("New Item No.","New Item No.");
          IF CompReplcmts.FIND('+') THEN BEGIN
            ChainSearchNo := CompReplcmts."Replacement Chain No.";
            IF ChainSearchNo <> OldChainNo THEN BEGIN
              CLEAR(CompReplcmts);
              CompReplcmts.SETCURRENTKEY("Replacement Chain No.","Created on");
              CompReplcmts.SETRANGE("Replacement Chain No.",ChainSearchNo);
              IF CompReplcmts.FIND('+') AND (CompReplcmts."New Item No." <> "New Item No.") THEN
                Regis1 := FALSE;
            END ELSE
              Regis1 := FALSE;
          END ELSE
            Regis1 := FALSE;
        
          //Check oldest Chain if it is the last point
          CLEAR(ReplcmtChains);
          ReplcmtChains.SETRANGE("Item No.","New Item No.");
          IF ReplcmtChains.FIND('-') THEN BEGIN
            IF ReplcmtChains."Chain No." <> OldChainNo THEN BEGIN
              CLEAR(CompReplcmts);
              CompReplcmts.SETCURRENTKEY("Replacement Chain No.","Created on");
              CompReplcmts.SETRANGE("Replacement Chain No.",ReplcmtChains."Chain No.");
              IF CompReplcmts.FIND('+') AND (CompReplcmts."New Item No." <> "New Item No.") THEN
                Regis2 := FALSE;
            END ELSE
              Regis2 := FALSE;
          END;
        END;
        
        IF NOT Regis1 AND NOT Regis2 THEN
          ERROR(C_INC012);
        OLD*/

    end;

    procedure CheckAddItem() : Boolean;
    var
        DisplayText : Boolean;
    begin
        // CheckAddItem
        /*OLD
        DisplayText := FALSE;
        IF "Copy Additional Item" AND ("Attached to Replacement No." <> 0) THEN BEGIN
          "Copy Additional Item" := FALSE;
          "Delete Old Add. Items" := FALSE;
          IF AdditionalItemExists("Old Item No.") THEN
            DisplayText := TRUE;
          CurrentReplcmts2.RESET;
          CurrentReplcmts2.SETCURRENTKEY("Replacement No.");
          CurrentReplcmts2.SETRANGE("Replacement No.", "Attached to Replacement No.");
          CurrentReplcmts2.SETRANGE("Copy Additional Item", TRUE);
          IF CurrentReplcmts2.FIND('-') THEN
            REPEAT
              IF AdditionalItemExists(CurrentReplcmts2."Old Item No.") THEN
                DisplayText := TRUE;
              CurrentReplcmts2."Copy Additional Item" := FALSE;
              CurrentReplcmts2."Delete Old Add. Items" := FALSE;
              CurrentReplcmts2.MODIFY;
            UNTIL CurrentReplcmts2.NEXT = 0;
        
          CurrentReplcmts2.RESET;
          CurrentReplcmts2.SETCURRENTKEY("Attached to Replacement No.");
          CurrentReplcmts2.SETRANGE("Attached to Replacement No.", "Attached to Replacement No.");
          CurrentReplcmts2.SETFILTER("Old Item No.", '<>%1', "Old Item No.");
          IF CurrentReplcmts2.FIND('-') THEN
            REPEAT
              IF AdditionalItemExists(CurrentReplcmts2."Old Item No.") THEN
                DisplayText := TRUE;
              CurrentReplcmts2."Copy Additional Item" := FALSE;
              CurrentReplcmts2."Delete Old Add. Items" := FALSE;
              CurrentReplcmts2.MODIFY;
            UNTIL CurrentReplcmts2.NEXT = 0;
        END;
        IF "Copy Additional Item" AND ("Attached to Replacement No." = 0) THEN BEGIN
          CurrentReplcmts2.RESET;
          CurrentReplcmts2.SETCURRENTKEY("Attached to Replacement No.");
          CurrentReplcmts2.SETRANGE("Attached to Replacement No.", "Replacement No.");
          IF CurrentReplcmts2.FIND('-') THEN BEGIN
            "Copy Additional Item" := FALSE;
            "Delete Old Add. Items" := FALSE;
            REPEAT
              IF AdditionalItemExists(CurrentReplcmts2."Old Item No.") THEN
                DisplayText := TRUE;
              CurrentReplcmts2."Copy Additional Item" := FALSE;
              CurrentReplcmts2."Delete Old Add. Items" := FALSE;
              CurrentReplcmts2.MODIFY;
            UNTIL CurrentReplcmts2.NEXT = 0;
          END;
        END;
        IF DisplayText THEN
          MESSAGE(C_INC014);
        EXIT(DisplayText);
        OLD*/

    end;

    procedure AdditionalItemExists(ForItemNo : Code[20]) : Boolean;
    begin
        //
        /*OLD
        AddItemL.RESET;
        AddItemL.SETRANGE("Item No.", ForItemNo);
        EXIT(AddItemL.FIND('-'));
        OLD*/

    end;
}

