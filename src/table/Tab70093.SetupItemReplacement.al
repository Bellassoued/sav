table 70093 "Setup Item Replacement"
{
    // version INC2.30.xx,INC3.0.0.0

    // +-----------------------------------------------------------+
    // | Copyright © 2000 Incadea AG Germany                       |
    // +-----------------------------------------------------------+
    // | INCADEA ENGINE                                            |
    // +-----------------------------------------------------------+
    // PA-Nummer  Datum                                            |
    // ------------------------------------------------------------+
    // PA021937   28.08.03
    // PA022409   03.02.04

    CaptionML = ENU='Setup Item Replacement',
                FRA='Paramétrer le remplacement de pièce';
    DrillDownPageID = 70093;
    LookupPageID = 70093;

    fields
    {
        field(1;"Primary Key";Code[10])
        {
            CaptionML = ENU='Primary Key',
                        FRA='Clé primaire';
        }
        field(10;"Copy Locations / Bins";Boolean)
        {
            CaptionML = ENU='Copy Locations / Bins',
                        FRA='Copier magasins/emplacements';
        }
        field(11;"Copy Comments";Boolean)
        {
            CaptionML = ENU='Copy Comments',
                        FRA='Copier commentaires';
        }
        field(12;"Copy Ext. Texts";Boolean)
        {
            CaptionML = ENU='Copy Ext. Texts',
                        FRA='Copier textes étendus';
        }
        field(13;"Copy Units of Measure";Boolean)
        {
            CaptionML = ENU='Copy Units of Measure',
                        FRA='Copier unités';
        }
        field(14;"Copy Translations";Boolean)
        {
            CaptionML = ENU='Copy Translations',
                        FRA='Copier traductions';
        }
        field(16;"Copy Sales Qty. Discounts";Boolean)
        {
            CaptionML = ENU='Copy Sales Qty. Discounts',
                        FRA='Copier remises qté vente';
        }
        field(17;"Copy Sales Prices";Boolean)
        {
            CaptionML = ENU='Copy Sales Prices',
                        FRA='Copier prix vente';
        }
        field(18;"Copy Item Vendor Catalog";Boolean)
        {
            CaptionML = ENU='Copy Item Vendor Catalog',
                        FRA='Copier catal. fourn. pièce';
        }
        field(19;"Copy Purchase Qty. Discounts";Boolean)
        {
            CaptionML = ENU='Copy Purchase Qty. Discounts',
                        FRA='Copier remises sur qté d''achat';
        }
        field(20;"Copy Picture";Boolean)
        {
            CaptionML = ENU='Copy Picture',
                        FRA='Copier photo';
        }
        field(21;"Copy Additional Item";Boolean)
        {
            CaptionML = ENU='Copy Additional Item',
                        FRA='Copier pièce addit.';
        }
        field(22;"Copy Alternate Main";Boolean)
        {
            CaptionML = ENU='Copy Alternate Main',
                        FRA='Copier secondaire princ.';
        }
        field(23;"Copy Alternate Sub";Boolean)
        {
            CaptionML = ENU='Copy Alternate Sub',
                        FRA='Copier secondaire sous';
        }
        field(30;"Temp. Picture Output Path";Text[100])
        {
            CaptionML = ENU='Temporary Path for Picture Output',
                        FRA='Chemin temporaire pour sortie image';
        }
        field(50;"Item Transfer Posting Text";Text[30])
        {
            CaptionML = ENU='Item Transfer Posting Text',
                        FRA='Texte validation transfert pièce';
        }
        field(51;"Item Transfer Document Nos.";Code[10])
        {
            CaptionML = ENU='Item Transfer Document Nos.',
                        FRA='SN° Doc. transfert pièce';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
            MaintainSIFTIndex = false;
        }
    }

    fieldgroups
    {
    }
}

