table 50063 "Archive Item TOYOTA"
{
    DrillDownPageID = 50117;
    LookupPageID = 50117;

    fields
    {
        field(1;"Entry No.";Integer)
        {
            CaptionML = ENU='Entry No.',
                        FRA='N° séquence';
        }
        field(2;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='N° pièce';
        }
        field(3;"Posting Date";Date)
        {
            CaptionML = ENU='Posting Date',
                        FRA='Date comptabilisation';
        }
        field(4;"Entry Type";Option)
        {
            CaptionML = ENU='Entry Type',
                        FRA='Type écriture';
            OptionCaptionML = ENU='Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer',
                              FRA='Achat,Vente,Ajust. positif,Ajust. négatif,Transfert';
            OptionMembers = Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer;
        }
        field(5;"Source No.";Code[20])
        {
            CaptionML = ENU='Source No.',
                        FRA='N° origine';
        }
        field(6;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° Document';
        }
        field(7;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
        }
        field(8;"Location Code";Code[10])
        {
            CaptionML = ENU='Location Code',
                        FRA='Code magasin';
        }
        field(12;Quantity;Decimal)
        {
            CaptionML = ENU='Quantity',
                        FRA='Quantité';
            DecimalPlaces = 0:5;
        }
        field(13;"Remaining Quantity";Decimal)
        {
            CaptionML = ENU='Remaining Quantity',
                        FRA='Quantité non affectée';
            DecimalPlaces = 0:5;
        }
        field(14;"Invoiced Quantity";Decimal)
        {
            CaptionML = ENU='Invoiced Quantity',
                        FRA='Quantité facturée';
            DecimalPlaces = 0:5;
        }
        field(22;"Salespers./Purch. Code";Code[10])
        {
            CaptionML = ENU='Salespers./Purch. Code',
                        FRA='Code vendeur/acheteur';
        }
        field(24;"User ID";Code[20])
        {
            CaptionML = ENU='User ID',
                        FRA='Code utilisateur';
        }
        field(29;Open;Boolean)
        {
            CaptionML = ENU='Open',
                        FRA='Ouvert';
        }
        field(33;"Department Code";Code[10])
        {
            CaptionML = ENU='Department Code',
                        FRA='Code département';
        }
        field(34;"Make Code";Code[10])
        {
            CaptionML = ENU='Make Code',
                        FRA='Code marque';
        }
        field(40;"Serial No.";Code[20])
        {
            CaptionML = ENU='Serial No.',
                        FRA='N° de série';
        }
        field(47;"Drop Shipment";Boolean)
        {
            CaptionML = ENU='Drop Shipment',
                        FRA='Livraison directe';
        }
        field(61;"External Document No.";Code[20])
        {
            CaptionML = ENU='External Document No.',
                        FRA='N° Doc. externe';
        }
        field(70;"Reserved Quantity";Decimal)
        {
            CaptionML = ENU='Reserved Quantity',
                        FRA='Quantité réservée';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(71;"Book No.";Code[20])
        {
            CaptionML = ENU='Book No.',
                        FRA='N° Livre';
        }
        field(72;"Prod. Order No.";Code[20])
        {
            CaptionML = ENU='Prod. Order No.',
                        FRA='N° ordre de fabrication';
        }
        field(73;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code variante';
        }
        field(74;"Bin Code";Code[10])
        {
            CaptionML = ENU='Bin Code',
                        FRA='Code casier';
        }
        field(75;"Qty. per Unit of Measure";Decimal)
        {
            CaptionML = ENU='Qty. per Unit of Measure',
                        FRA='Quantité par unité';
            DecimalPlaces = 0:5;
        }
        field(76;"Applied Entry to Adjust";Boolean)
        {
            CaptionML = ENU='Applied Entry to Adjust',
                        FRA='Ecriture lettrée à ajuster';
        }
        field(77;"Adjusted Cost (Expected)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Adjusted Cost (Expected)',
                        FRA='Coût Ajusté (Prévu)';
            Editable = false;
        }
        field(78;"Adjusted Cost";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Adjusted Cost',
                        FRA='Coût ajusté';
            Editable = false;
        }
        field(79;"Adjusted Cost (ACY)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Adjusted Cost (Expected) (ACY)',
                        FRA='Coût Ajusté (Prévu) (DR)';
            Editable = false;
        }
        field(80;"Item Group Code";Code[10])
        {
            CaptionML = ENU='Item Group Code',
                        FRA='Code remise';
        }
        field(81;"Purch. Order Type";Code[10])
        {
            CaptionML = ENU='Purch. Order Type',
                        FRA='Type commande achat';
        }
        field(82;"Main Group Code";Code[10])
        {
            CaptionML = ENU='Main Group Code',
                        FRA='Code groupe principal';
        }
        field(83;"Subgroup Code";Code[10])
        {
            CaptionML = ENU='Subgroup Code',
                        FRA='Code sous-groupe';
        }
        field(84;"Line Group Code";Code[10])
        {
            CaptionML = ENU='Line Group Code',
                        FRA='Code groupe ligne';
        }
        field(85;"Main Area";Option)
        {
            CaptionML = ENU='Main Area',
                        FRA='Module';
            OptionCaptionML = ENU=',Parts Sales & Purchases,Vehicle Sales & Purchases,Service,Branch',
                              FRA=',Achats & ventes pièces,Achats & ventes véhicule,Atelier,Etablissement';
            OptionMembers = ,"Parts Sales & Purchases","Vehicle Sales & Purchases",Service,Branch;
        }
        field(86;"Source No. (Payment)";Code[20])
        {
            CaptionML = ENU='Source No. (Payment)',
                        FRA='N° Origine (Paiement)';
        }
        field(87;"Order Date";Date)
        {
            CaptionML = ENU='Order Date',
                        FRA='Date commande';
        }
        field(88;"Order No.";Code[20])
        {
            CaptionML = ENU='Order No.',
                        FRA='N° Commande';
        }
        field(89;"Branch Code";Code[10])
        {
            CaptionML = ENU='Branch Code',
                        FRA='Code établ. ';
        }
        field(90;"Disable for Requisition";Boolean)
        {
            CaptionML = ENU='Disable for Requisition',
                        FRA='Déactiver réapprovisionnement';
        }
        field(91;"Inventory after Posting";Decimal)
        {
            CaptionML = ENU='Inventory after Posting',
                        FRA='Stock après validation';
            DecimalPlaces = 0:5;
        }
        field(92;VIN;Code[20])
        {
            CaptionML = ENU='VIN',
                        FRA='VIN';
            Description = 'VIN';
        }
        field(93;"Cost Posted to G/L";Decimal)
        {
            CaptionML = ENU='Cost Posted to G/L',
                        FRA='Coût validé en compta.';
            Editable = false;
        }
        field(94;"Cost Posted to G/L (ACY)";Decimal)
        {
            CaptionML = ENU='Cost Posted to G/L (ACY)',
                        FRA='Coût validé en compta. (DR)';
            Editable = false;
        }
        field(95;Amount;Decimal)
        {
        }
        field(96;"Customer Group Code";Code[20])
        {
        }
        field(97;"Creation Date";Date)
        {
        }
        field(98;"Entry Type OLD";Option)
        {
            CaptionML = ENU='Entry Type',
                        FRA='Type écriture';
            OptionCaptionML = ENU='Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer',
                              FRA='Achat,Vente,Ajust. positif,Ajust. négatif,Transfert';
            OptionMembers = Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer;
        }
        field(99;"Order No. OLD";Code[20])
        {
            CaptionML = ENU='Order No.',
                        FRA='N° Commande';
        }
        field(100;"Mag existe ds mapping";Boolean)
        {
            CalcFormula = Exist("Mapping Magasin 2" WHERE (New Magasin=FIELD(Location Code)));
            FieldClass = FlowField;
        }
        field(101;Price;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(102;NUM_MVT;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(103;COD_TMVT;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(104;"Centre de gestion";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            MaintainSIFTIndex = false;
        }
        key(Key2;"Entry Type","Item No.","Location Code","Posting Date","Source No.")
        {
            SumIndexFields = "Invoiced Quantity";
        }
    }

    fieldgroups
    {
    }
}

