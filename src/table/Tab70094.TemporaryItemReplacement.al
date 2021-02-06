table 70094 "Temporary Item Replacement"
{
    // version INC2.30.05,INC3.0.0.0

    // +----------------------------------------------+
    // | Copyright © 2000 Incadea AG Germany          |
    // +----------------------------------------------+
    // | INCADEA ENGINE                               |
    // +----------------------------------------------+
    // Version Datum    Kz     Bemerkung
    // ------------------------------------------------
    //    2.30 01.12.02 INC    Update
    // 
    // PA022409    03.02.04

    CaptionML = ENU='Temporary Item Replacement',
                FRA='Remplacement de pièce temporaire';
    DrillDownPageID = 70092;
    LookupPageID = 70092;

    fields
    {
        field(1;"Temp. Entry No.";Integer)
        {
            CaptionML = ENU='Temp. Entry No.',
                        FRA='N° Séq. temp.';
        }
        field(2;"Old Item No.";Code[20])
        {
            CaptionML = ENU='Old Item No.',
                        FRA='Ancien N° Pièce';
            TableRelation = Item.No. WHERE (Item type=CONST(Pièce));
        }
        field(3;"New Item No.";Code[20])
        {
            CaptionML = ENU='New Item No.',
                        FRA='Nouveau N° Pièce';
            TableRelation = Item.No. WHERE (Item type=CONST(Pièce));
        }
        field(10;"Full Replacement";Boolean)
        {
            CaptionML = ENU='Full Replacement',
                        FRA='Remplacement total';
        }
        field(11;Date;Date)
        {
            CaptionML = ENU='Date',
                        FRA='Date';
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
        }
        field(17;"Piecing Old Item No.";Integer)
        {
            CaptionML = ENU='Piecing Old Item No.',
                        FRA='Ratio ancien N° Pièce';
            MinValue = 1;
        }
        field(18;"Piecing New Item No.";Integer)
        {
            CaptionML = ENU='Piecing New Item No.',
                        FRA='Ratio nouveau N° Pièce';
            MinValue = 1;
        }
        field(50;"Date Completed";Date)
        {
            CaptionML = ENU='Date Completed',
                        FRA='Date terminé';
        }
        field(51;"Completed by User ID";Code[100])
        {
            CaptionML = ENU='Completed by User ID',
                        FRA='Réalisé par ID utilisateur';
        }
        field(52;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° Document';
        }
        field(55;"Copy Additional Item";Boolean)
        {
            CaptionML = ENU='Copy Additional Item',
                        FRA='Copier pièce addit.';
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
        field(200;"Associated Replacmts. Exist";Boolean)
        {
            CalcFormula = Exist("Current Item Replacement" WHERE (Attached to Replacement No.=FIELD(Replacement No.)));
            CaptionML = ENU='Associated Replacmts. Exist',
                        FRA='Présence remplacement assoc.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(201;"Old Item Inventory";Decimal)
        {
            CaptionML = ENU='Old Item Inventory',
                        FRA='Ancien stock pièces';
        }
        field(202;"New Item Inventory";Decimal)
        {
            CaptionML = ENU='New Item Inventory',
                        FRA='Nouveau stock pièces';
        }
        field(300;"Item Description";Text[30])
        {
            CalcFormula = Lookup(Item.Description WHERE (No.=FIELD(Old Item No.)));
            CaptionML = ENU='Item Description',
                        FRA='Désignation pièce';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Temp. Entry No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key2;"Old Item No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key3;"Replacement Chain No.","Temp. Entry No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key4;"Replacement No.")
        {
            MaintainSIFTIndex = false;
        }
    }

    fieldgroups
    {
    }

    procedure OldNoLookup();
    var
        Item : Record "27";
        ItemList : Page "31";
    begin
        // OldNoLookup
        /*OLD
        Item.SETCURRENTKEY("Item Type","No.");
        Item.SETRANGE("Item Type",Item."Item Type"::Item);
        IF Item.GET("Old Item No.") THEN;
        
        CLEAR(ItemList);
        ItemList.LOOKUPMODE(TRUE);
        ItemList.SETTABLEVIEW(Item);
        ItemList.SETRECORD(Item);
        ItemList.RUNMODAL;
        OLD*/

    end;

    procedure NewNoLookup();
    var
        Item : Record "27";
        ItemList : Page "31";
    begin
        // NewNoLookUp
        /*Old
        Item.SETCURRENTKEY("Item Type","No.");
        Item.SETRANGE("Item Type",Item."Item Type"::Item);
        IF Item.GET("New Item No.") THEN;
        
        CLEAR(ItemList);
        ItemList.LOOKUPMODE(TRUE);
        ItemList.SETTABLEVIEW(Item);
        ItemList.SETRECORD(Item);
        ItemList.RUNMODAL;
        OLD*/

    end;
}

