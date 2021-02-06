table 70092 "Completed Item Replacement"
{
    // version INC2.30.xx,INC3.0.1.0

    // +----------------------------------------------+
    // | Copyright © 2000 Incadea AG Germany          |
    // +----------------------------------------------+
    // | INCADEA ENGINE                               |
    // +----------------------------------------------+
    // PA-Nummer   Datum
    // ------------------------------------------------
    // PA021937    28.08.03
    // PA022409    03.02.04

    CaptionML = ENU='Completed Item Replacement',
                FRA='Remplacement de pièce terminé';
    DrillDownPageID = 70092;
    LookupPageID = 70092;

    fields
    {
        field(1;"Entry No.";Integer)
        {
            CaptionML = ENU='Entry No.',
                        FRA='N° Séq.';
        }
        field(2;"Old Item No.";Code[20])
        {
            CaptionML = ENU='Old Item No.',
                        FRA='Ancien N° Pièce';
            TableRelation = Item.No.;
        }
        field(3;"New Item No.";Code[20])
        {
            CaptionML = ENU='New Item No.',
                        FRA='Nouveau N° Pièce';
            TableRelation = Item.No.;
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
            TableRelation = "User Setup";
        }
        field(14;"Replacement No.";Integer)
        {
            CaptionML = ENU='Replacement No.',
                        FRA='N° Remplacement';
        }
        field(15;"Attached to Replacement No.";Integer)
        {
            CaptionML = ENU='Attached to Replacement No.',
                        FRA='Attaché au N° Remplacement';
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
        }
        field(18;"Piecing New Item No.";Integer)
        {
            CaptionML = ENU='Piecing New Item No.',
                        FRA='Ratio nouveau N° Pièce';
            MinValue = 1;
        }
        field(20;"Process File Data";Boolean)
        {
            CaptionML = ENU='Process File Data',
                        FRA='Données trait. fichier';
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
        }
        field(30;"Copy Locations / Bins";Boolean)
        {
            CaptionML = ENU='Copy Locations / Bins',
                        FRA='Copier magasins/emplacements';
        }
        field(31;"Copy Comments";Boolean)
        {
            CaptionML = ENU='Copy Comments',
                        FRA='Copier commentaires';
        }
        field(32;"Copy Ext. Texts";Boolean)
        {
            CaptionML = ENU='Copy Ext. Texts',
                        FRA='Copier textes étendus';
        }
        field(33;"Copy Units of Measure";Boolean)
        {
            CaptionML = ENU='Copy Units of Measure',
                        FRA='Copier unités';
        }
        field(34;"Copy Translations";Boolean)
        {
            CaptionML = ENU='Copy Translations',
                        FRA='Copier traductions';
        }
        field(35;"Copy Sales Qty. Discounts";Boolean)
        {
            CaptionML = ENU='Copy Sales Qty. Discounts',
                        FRA='Copier remises qté vente';
        }
        field(36;"Copy Sales Prices";Boolean)
        {
            CaptionML = ENU='Copy Sales Prices',
                        FRA='Copier prix vente';
        }
        field(37;"Copy Item Vendor Catalog";Boolean)
        {
            CaptionML = ENU='Copy Item Vendor Catalog',
                        FRA='Copier catal. fourn. pièce';
        }
        field(38;"Copy Purchase Qty. Discounts";Boolean)
        {
            CaptionML = ENU='Copy Purchase Qty. Discounts',
                        FRA='Copier remises sur qté d''achat';
        }
        field(39;"Copy Picture";Boolean)
        {
            CaptionML = ENU='Copy Picture',
                        FRA='Copier photo';
        }
        field(40;"Delete Old Locations";Boolean)
        {
            CaptionML = ENU='Delete Old Locations',
                        FRA='Supprimer anciens magasins';
        }
        field(41;"Delete Old Comments";Boolean)
        {
            CaptionML = ENU='Delete Old Comments',
                        FRA='Supprimer anciens commentaires';
        }
        field(42;"Delete Old Ext. Texts";Boolean)
        {
            CaptionML = ENU='Delete Old Ext. Texts',
                        FRA='Suppr.anciens textes étendus';
        }
        field(43;"Delete Old Units of Measure";Boolean)
        {
            CaptionML = ENU='Delete Old Units of Measure',
                        FRA='Supprimer anciennes unités';
        }
        field(44;"Delete Old Translations";Boolean)
        {
            CaptionML = ENU='Delete Old Translations',
                        FRA='Supprimer anciennes traductions';
        }
        field(45;"Delete Old Sales Qty. Disc.";Boolean)
        {
            CaptionML = ENU='Delete Old Sales Qty. Discounts',
                        FRA='Suppr. anciennes remises qté vente';
        }
        field(46;"Delete Old Sales Prices";Boolean)
        {
            CaptionML = ENU='Delete Old Sales Prices',
                        FRA='Suppr. anciens prix vente';
        }
        field(47;"Delete Old Item Vendor Catalog";Boolean)
        {
            CaptionML = ENU='Delete Old Item Vendor Catalog',
                        FRA='Suppr. ancien catalogue fourn. pièce';
        }
        field(48;"Delete Old Purch. Qty. Disc.";Boolean)
        {
            CaptionML = ENU='Delete Old Purch. Qty. Discounts',
                        FRA='Suppr. anciennes remises qté achat';
        }
        field(49;"Delete Picture";Boolean)
        {
            CaptionML = ENU='Delete Picture',
                        FRA='Supprimer photo';
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
            TableRelation = User;
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
        field(63;"Completed at";Time)
        {
            CaptionML = ENU='Completed at',
                        FRA='Terminé à';
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
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key2;"Old Item No.","New Item No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key3;"New Item No.","Old Item No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key4;"Old Item No.","Created on")
        {
            MaintainSIFTIndex = false;
        }
        key(Key5;"New Item No.","Created on")
        {
            MaintainSIFTIndex = false;
        }
        key(Key6;"Created on")
        {
            MaintainSIFTIndex = false;
        }
        key(Key7;"Replacement Chain No.","Created on")
        {
            MaintainSIFTIndex = false;
        }
        key(Key8;"Attached to Replacement No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key9;"Replacement No.")
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
        /*Old
        Item.SETCURRENTKEY("Item Type","No.");
        Item.SETRANGE("Item Type",Item."Item Type"::P);
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
        /*OLD
        Item.SETCURRENTKEY("Item Type","Make Code","No.");
        Item.SETRANGE("Item Type",Item."Item Type"::P);
        Item.SETRANGE("Make Code", "Make Code");
        IF Item.GET("New Item No.") THEN;
        
        CLEAR(ItemList);
        ItemList.LOOKUPMODE(TRUE);
        ItemList.SETTABLEVIEW(Item);
        ItemList.SETRECORD(Item);
        ItemList.RUNMODAL;
        OLD*/

    end;
}

