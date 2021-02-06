table 60020 "Recoupement proformat achat"
{
    // version NAVW17.10.00.35701

    CaptionML = ENU='Purchase Line',
                FRA='Ligne achat';
    DrillDownPageID = 518;
    LookupPageID = 518;
    PasteIsValid = false;

    fields
    {
        field(1;"Document Type";Option)
        {
            CaptionML = ENU='Document Type',
                        FRA='Type document';
            OptionCaptionML = ENU='Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order',
                              FRA='Devis,Commande,Facture,Avoir,Commande ouverte,Retour';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(2;"Buy-from Vendor No.";Code[20])
        {
            CaptionML = ENU='Buy-from Vendor No.',
                        FRA='N° fournisseur';
            Editable = false;
            TableRelation = Vendor;
        }
        field(3;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° document';
            TableRelation = "Purchase Header".No. WHERE (Document Type=FIELD(Document Type));
        }
        field(4;"Line No.";Integer)
        {
            AutoIncrement = false;
            CaptionML = ENU='Line No.',
                        FRA='N° ligne';
        }
        field(5;Type;Option)
        {
            CaptionML = ENU='Type',
                        FRA='Type';
            OptionCaptionML = ENU=' ,G/L Account,Item,,Fixed Asset,Charge (Item)',
                              FRA=' ,Compte général,Article,,Immobilisation,Frais annexes';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)";
        }
        field(6;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            TableRelation = IF (Type=CONST(" ")) "Standard Text"
                            ELSE IF (Type=CONST(G/L Account),
                                     System-Created Entry=CONST(No)) "G/L Account" WHERE (Direct Posting=CONST(Yes),
                                                                                          Account Type=CONST(Posting),
                                                                                          Blocked=CONST(No))
                                                                                          ELSE IF (Type=CONST(G/L Account),
                                                                                                   System-Created Entry=CONST(No)) "G/L Account"
                                                                                                   ELSE IF (Type=CONST(Item)) Item
                                                                                                   ELSE IF (Type=CONST(3)) Resource
                                                                                                   ELSE IF (Type=CONST(Fixed Asset)) "Fixed Asset"
                                                                                                   ELSE IF (Type=CONST("Charge (Item)")) "Item Charge";

            trigger OnValidate();
            var
                ICPartner : Record "413";
                ItemCrossReference : Record "5717";
                PrepmtMgt : Codeunit "441";
            begin
            end;
        }
        field(7;"Location Code";Code[10])
        {
            CaptionML = ENU='Location Code',
                        FRA='Code magasin';
            TableRelation = Location WHERE (Use As In-Transit=CONST(No));
        }
        field(8;"Posting Group";Code[10])
        {
            CaptionML = ENU='Posting Group',
                        FRA='Groupe comptabilisation';
            Editable = false;
            TableRelation = IF (Type=CONST(Item)) "Inventory Posting Group"
                            ELSE IF (Type=CONST(Fixed Asset)) "FA Posting Group";
        }
        field(10;"Expected Receipt Date";Date)
        {
            CaptionML = ENU='Expected Receipt Date',
                        FRA='Date réception prévue';
        }
        field(11;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
        }
        field(12;"Description 2";Text[50])
        {
            CaptionML = ENU='Description 2',
                        FRA='Désignation 2';
        }
        field(13;"Unit of Measure";Text[10])
        {
            CaptionML = ENU='Unit of Measure',
                        FRA='Unité';
        }
        field(15;Quantity;Decimal)
        {
            CaptionML = ENU='Quantity',
                        FRA='Quantité';
            DecimalPlaces = 0:5;
        }
        field(16;"Outstanding Quantity";Decimal)
        {
            CaptionML = ENU='Outstanding Quantity',
                        FRA='Quantité restante';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(17;"Qty. to Invoice";Decimal)
        {
            CaptionML = ENU='Qty. to Invoice',
                        FRA='Qté à facturer';
            DecimalPlaces = 0:5;
        }
        field(18;"Qty. to Receive";Decimal)
        {
            CaptionML = ENU='Qty. to Receive',
                        FRA='Qté à recevoir';
            DecimalPlaces = 0:5;
        }
        field(22;"Direct Unit Cost";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            CaptionML = ENU='Direct Unit Cost',
                        FRA='Prix Unitaire';
            Description = 'SM';
        }
        field(23;"Unit Cost (LCY)";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Unit Cost (LCY)',
                        FRA='Coût unitaire DS';
        }
        field(25;"VAT %";Decimal)
        {
            CaptionML = ENU='VAT %',
                        FRA='% TVA';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(27;"Line Discount %";Decimal)
        {
            CaptionML = ENU='Line Discount %',
                        FRA='% remise ligne';
            DecimalPlaces = 0:5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(28;"Line Discount Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Line Discount Amount',
                        FRA='Montant remise ligne';
        }
        field(29;Amount;Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Amount',
                        FRA='Montant';
            Editable = false;
        }
        field(30;"Amount Including VAT";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Amount Including VAT',
                        FRA='Montant TTC';
            Editable = false;
        }
        field(31;"Unit Price (LCY)";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Unit Price (LCY)',
                        FRA='Prix unitaire DS';
        }
        field(32;"Allow Invoice Disc.";Boolean)
        {
            CaptionML = ENU='Allow Invoice Disc.',
                        FRA='Remise facture autorisée';
            InitValue = true;
        }
        field(34;"Gross Weight";Decimal)
        {
            CaptionML = ENU='Gross Weight',
                        FRA='Poids brut';
            DecimalPlaces = 0:5;
        }
        field(35;"Net Weight";Decimal)
        {
            CaptionML = ENU='Net Weight',
                        FRA='Poids net';
            DecimalPlaces = 0:5;
        }
        field(36;"Units per Parcel";Decimal)
        {
            CaptionML = ENU='Units per Parcel',
                        FRA='Conditionnement';
            DecimalPlaces = 0:5;
        }
        field(37;"Unit Volume";Decimal)
        {
            CaptionML = ENU='Unit Volume',
                        FRA='Volume unitaire';
            DecimalPlaces = 0:5;
        }
        field(38;"Appl.-to Item Entry";Integer)
        {
            CaptionML = ENU='Appl.-to Item Entry',
                        FRA='Écr. article à lettrer';
        }
        field(40;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            CaptionML = ENU='Shortcut Dimension 1 Code',
                        FRA='Code raccourci axe 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));
        }
        field(41;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            CaptionML = ENU='Shortcut Dimension 2 Code',
                        FRA='Code raccourci axe 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2));
        }
        field(45;"Job No.";Code[20])
        {
            CaptionML = ENU='Job No.',
                        FRA='N° projet';
            TableRelation = Job;

            trigger OnValidate();
            var
                Job : Record "167";
            begin
            end;
        }
        field(54;"Indirect Cost %";Decimal)
        {
            CaptionML = ENU='Indirect Cost %',
                        FRA='% coût indirect';
            DecimalPlaces = 0:5;
            MinValue = 0;
        }
        field(57;"Outstanding Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Outstanding Amount',
                        FRA='Montant en commande';
            Editable = false;

            trigger OnValidate();
            var
                Currency2 : Record "4";
            begin
            end;
        }
        field(58;"Qty. Rcd. Not Invoiced";Decimal)
        {
            CaptionML = ENU='Qty. Rcd. Not Invoiced',
                        FRA='Qté reçue non facturée';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(59;"Amt. Rcd. Not Invoiced";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Amt. Rcd. Not Invoiced',
                        FRA='Montant reçu non facturé';
            Editable = false;

            trigger OnValidate();
            var
                Currency2 : Record "4";
            begin
            end;
        }
        field(60;"Quantity Received";Decimal)
        {
            CaptionML = ENU='Quantity Received',
                        FRA='Quantité reçue';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(61;"Quantity Invoiced";Decimal)
        {
            CaptionML = ENU='Quantity Invoiced',
                        FRA='Quantité facturée';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(63;"Receipt No.";Code[20])
        {
            CaptionML = ENU='Receipt No.',
                        FRA='N° bon de réception';
            Editable = false;
        }
        field(64;"Receipt Line No.";Integer)
        {
            CaptionML = ENU='Receipt Line No.',
                        FRA='N° ligne bon de réception';
            Editable = false;
        }
        field(67;"Profit %";Decimal)
        {
            CaptionML = ENU='Profit %',
                        FRA='% marge sur vente';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(68;"Pay-to Vendor No.";Code[20])
        {
            CaptionML = ENU='Pay-to Vendor No.',
                        FRA='N° fournisseur à payer';
            Editable = false;
            TableRelation = Vendor;
        }
        field(69;"Inv. Discount Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Inv. Discount Amount',
                        FRA='Montant remise facture';
            Editable = false;
        }
        field(70;"Vendor Item No.";Text[20])
        {
            CaptionML = ENU='Vendor Item No.',
                        FRA='Référence fournisseur';
        }
        field(71;"Sales Order No.";Code[20])
        {
            CaptionML = ENU='Sales Order No.',
                        FRA='N° commande vente';
            Editable = false;
            TableRelation = IF (Drop Shipment=CONST(Yes)) "Sales Header".No. WHERE (Document Type=CONST(Order));
        }
        field(72;"Sales Order Line No.";Integer)
        {
            CaptionML = ENU='Sales Order Line No.',
                        FRA='N° ligne commande vente';
            Editable = false;
            TableRelation = IF (Drop Shipment=CONST(Yes)) "Sales Line"."Line No." WHERE (Document Type=CONST(Order),
                                                                                         Document No.=FIELD(Sales Order No.));
        }
        field(73;"Drop Shipment";Boolean)
        {
            CaptionML = ENU='Drop Shipment',
                        FRA='Livraison directe';
            Editable = false;
        }
        field(74;"Gen. Bus. Posting Group";Code[10])
        {
            CaptionML = ENU='Gen. Bus. Posting Group',
                        FRA='Groupe compta. marché';
            TableRelation = "Gen. Business Posting Group";
        }
        field(75;"Gen. Prod. Posting Group";Code[10])
        {
            CaptionML = ENU='Gen. Prod. Posting Group',
                        FRA='Groupe compta. produit';
            TableRelation = "Gen. Product Posting Group";
        }
        field(77;"VAT Calculation Type";Option)
        {
            CaptionML = ENU='VAT Calculation Type',
                        FRA='Mode calcul TVA';
            Editable = false;
            OptionCaptionML = ENU='Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax',
                              FRA='Normal,Intracomm.,Correctif,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(78;"Transaction Type";Code[10])
        {
            CaptionML = ENU='Transaction Type',
                        FRA='Nature transaction';
            TableRelation = "Transaction Type";
        }
        field(79;"Transport Method";Code[10])
        {
            CaptionML = ENU='Transport Method',
                        FRA='Mode de transport';
            TableRelation = "Transport Method";
        }
        field(80;"Attached to Line No.";Integer)
        {
            CaptionML = ENU='Attached to Line No.',
                        FRA='Attaché à la ligne n°';
            Editable = false;
            TableRelation = "Purchase Line"."Line No." WHERE (Document Type=FIELD(Document Type),
                                                              Document No.=FIELD(Document No.));
        }
        field(81;"Entry Point";Code[10])
        {
            CaptionML = ENU='Entry Point',
                        FRA='Pays provenance';
            TableRelation = "Entry/Exit Point";
        }
        field(82;"Area";Code[10])
        {
            CaptionML = ENU='Area',
                        FRA='Dépt destination/provenance';
            TableRelation = Area;
        }
        field(83;"Transaction Specification";Code[10])
        {
            CaptionML = ENU='Transaction Specification',
                        FRA='Régime';
            TableRelation = "Transaction Specification";
        }
        field(85;"Tax Area Code";Code[20])
        {
            CaptionML = ENU='Tax Area Code',
                        FRA='Code zone recouvrement';
            TableRelation = "Tax Area";
        }
        field(86;"Tax Liable";Boolean)
        {
            CaptionML = ENU='Tax Liable',
                        FRA='Soumis à recouvrement';
        }
        field(87;"Tax Group Code";Code[10])
        {
            CaptionML = ENU='Tax Group Code',
                        FRA='Code groupe taxes';
            TableRelation = "Tax Group";
        }
        field(88;"Use Tax";Boolean)
        {
            CaptionML = ENU='Use Tax',
                        FRA='Use Tax';
        }
        field(89;"VAT Bus. Posting Group";Code[10])
        {
            CaptionML = ENU='VAT Bus. Posting Group',
                        FRA='Groupe compta. marché TVA';
            TableRelation = "VAT Business Posting Group";
        }
        field(90;"VAT Prod. Posting Group";Code[10])
        {
            CaptionML = ENU='VAT Prod. Posting Group',
                        FRA='Groupe compta. produit TVA';
            TableRelation = "VAT Product Posting Group";
        }
        field(91;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            Editable = false;
            TableRelation = Currency;
        }
        field(92;"Outstanding Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Outstanding Amount (LCY)',
                        FRA='Montant en commande DS';
            Editable = false;
        }
        field(93;"Amt. Rcd. Not Invoiced (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Amt. Rcd. Not Invoiced (LCY)',
                        FRA='Montant reçu non fact. DS';
            Editable = false;
        }
        field(95;"Reserved Quantity";Decimal)
        {
            CalcFormula = Sum("Reservation Entry".Quantity WHERE (Source ID=FIELD(Document No.),
                                                                  Source Ref. No.=FIELD(Line No.),
                                                                  Source Type=CONST(39),
                                                                  Source Subtype=FIELD(Document Type),
                                                                  Reservation Status=CONST(Reservation)));
            CaptionML = ENU='Reserved Quantity',
                        FRA='Quantité réservée';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(97;"Blanket Order No.";Code[20])
        {
            CaptionML = ENU='Blanket Order No.',
                        FRA='N° commande ouverte';
            TableRelation = "Purchase Header".No. WHERE (Document Type=CONST(Blanket Order));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(98;"Blanket Order Line No.";Integer)
        {
            CaptionML = ENU='Blanket Order Line No.',
                        FRA='N° ligne cde ouverte';
            TableRelation = "Purchase Line"."Line No." WHERE (Document Type=CONST(Blanket Order),
                                                              Document No.=FIELD(Blanket Order No.));
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(99;"VAT Base Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='VAT Base Amount',
                        FRA='Montant base TVA';
            Editable = false;
        }
        field(100;"Unit Cost";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            CaptionML = ENU='Unit Cost',
                        FRA='Coût unitaire';
            Editable = false;
        }
        field(101;"System-Created Entry";Boolean)
        {
            CaptionML = ENU='System-Created Entry',
                        FRA='Écriture système';
            Editable = false;
        }
        field(103;"Line Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Line Amount',
                        FRA='Montant ligne';
        }
        field(104;"VAT Difference";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='VAT Difference',
                        FRA='Différence TVA';
            Editable = false;
        }
        field(105;"Inv. Disc. Amount to Invoice";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Inv. Disc. Amount to Invoice',
                        FRA='Montant rem. fact. à facturer';
            Editable = false;
        }
        field(106;"VAT Identifier";Code[10])
        {
            CaptionML = ENU='VAT Identifier',
                        FRA='Identifiant TVA';
            Editable = false;
        }
        field(107;"IC Partner Ref. Type";Option)
        {
            CaptionML = ENU='IC Partner Ref. Type',
                        FRA='Type de réf. du partenaire IC';
            OptionCaptionML = ENU=' ,G/L Account,Item,,,Charge (Item),Cross Reference,Common Item No.,Vendor Item No.',
                              FRA=' ,Compte général,Article,,,Frais annexes,Référence externe,N° article commun,Référence fournisseur';
            OptionMembers = " ","G/L Account",Item,,,"Charge (Item)","Cross Reference","Common Item No.","Vendor Item No.";
        }
        field(108;"IC Partner Reference";Code[20])
        {
            CaptionML = ENU='IC Partner Reference',
                        FRA='Référence du partenaire IC';

            trigger OnLookup();
            var
                ICGLAccount : Record "410";
                ItemCrossReference : Record "5717";
                ItemVendorCatalog : Record "99";
            begin
            end;
        }
        field(109;"Prepayment %";Decimal)
        {
            CaptionML = ENU='Prepayment %',
                        FRA='% acompte';
            DecimalPlaces = 0:5;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate();
            var
                GenPostingSetup : Record "252";
                GLAcc : Record "15";
            begin
            end;
        }
        field(110;"Prepmt. Line Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Prepmt. Line Amount',
                        FRA='Montant ligne acompte';
            MinValue = 0;
        }
        field(111;"Prepmt. Amt. Inv.";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Prepmt. Amt. Inv.',
                        FRA='Fact. montant acompte';
            Editable = false;
        }
        field(112;"Prepmt. Amt. Incl. VAT";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Prepmt. Amt. Incl. VAT',
                        FRA='Montant acompte TTC';
            Editable = false;
        }
        field(113;"Prepayment Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Prepayment Amount',
                        FRA='Montant acompte';
            Editable = false;
        }
        field(114;"Prepmt. VAT Base Amt.";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Prepmt. VAT Base Amt.',
                        FRA='Montant base TVA acompte';
            Editable = false;
        }
        field(115;"Prepayment VAT %";Decimal)
        {
            CaptionML = ENU='Prepayment VAT %',
                        FRA='% TVA acompte';
            DecimalPlaces = 0:5;
            Editable = false;
            MinValue = 0;
        }
        field(116;"Prepmt. VAT Calc. Type";Option)
        {
            CaptionML = ENU='Prepmt. VAT Calc. Type',
                        FRA='Mode calc. TVA acompte';
            Editable = false;
            OptionCaptionML = ENU='Normal VAT,Reverse Charge VAT,Full VAT,Sales Tax',
                              FRA='Normal,Intracomm.,Correctif,Sales Tax';
            OptionMembers = "Normal VAT","Reverse Charge VAT","Full VAT","Sales Tax";
        }
        field(117;"Prepayment VAT Identifier";Code[10])
        {
            CaptionML = ENU='Prepayment VAT Identifier',
                        FRA='Identifiant TVA acompte';
            Editable = false;
        }
        field(118;"Prepayment Tax Area Code";Code[20])
        {
            CaptionML = ENU='Prepayment Tax Area Code',
                        FRA='Code zone recouvrement acompte';
            TableRelation = "Tax Area";
        }
        field(119;"Prepayment Tax Liable";Boolean)
        {
            CaptionML = ENU='Prepayment Tax Liable',
                        FRA='Acompte soumis à recouvrement';
        }
        field(120;"Prepayment Tax Group Code";Code[10])
        {
            CaptionML = ENU='Prepayment Tax Group Code',
                        FRA='Code groupe taxes acompte';
            TableRelation = "Tax Group";
        }
        field(121;"Prepmt Amt to Deduct";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Prepmt Amt to Deduct',
                        FRA='Montant acompte à déduire';
            MinValue = 0;
        }
        field(122;"Prepmt Amt Deducted";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Prepmt Amt Deducted',
                        FRA='Montant acompte déduit';
            Editable = false;
        }
        field(123;"Prepayment Line";Boolean)
        {
            CaptionML = ENU='Prepayment Line',
                        FRA='Ligne acompte';
            Editable = false;
        }
        field(124;"Prepmt. Amount Inv. Incl. VAT";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Prepmt. Amount Inv. Incl. VAT',
                        FRA='Fact. montant acompte TTC';
            Editable = false;
        }
        field(129;"Prepmt. Amount Inv. (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Prepmt. Amount Inv. (LCY)',
                        FRA='Montant acompte facturé DS';
            Editable = false;
        }
        field(130;"IC Partner Code";Code[20])
        {
            CaptionML = ENU='IC Partner Code',
                        FRA='Code du partenaire IC';
            TableRelation = "IC Partner";
        }
        field(132;"Prepmt. VAT Amount Inv. (LCY)";Decimal)
        {
            CaptionML = ENU='Prepmt. VAT Amount Inv. (LCY)',
                        FRA='Montant TVA acompte facturé DS';
            Editable = false;
        }
        field(135;"Prepayment VAT Difference";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Prepayment VAT Difference',
                        FRA='Différence TVA acompte';
            Editable = false;
        }
        field(136;"Prepmt VAT Diff. to Deduct";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Prepmt VAT Diff. to Deduct',
                        FRA='Différence TVA acompte à déduire';
            Editable = false;
        }
        field(137;"Prepmt VAT Diff. Deducted";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Prepmt VAT Diff. Deducted',
                        FRA='Différence TVA acompte déduite';
            Editable = false;
        }
        field(140;"Outstanding Amt. Ex. VAT (LCY)";Decimal)
        {
            CaptionML = ENU='Outstanding Amt. Ex. VAT (LCY)',
                        FRA='Montant en commande TVA DS';
        }
        field(141;"A. Rcd. Not Inv. Ex. VAT (LCY)";Decimal)
        {
            CaptionML = ENU='A. Rcd. Not Inv. Ex. VAT (LCY)',
                        FRA='Montant reçu non facturé TVA DS';
        }
        field(480;"Dimension Set ID";Integer)
        {
            CaptionML = ENU='Dimension Set ID',
                        FRA='ID ensemble de dimensions';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(1001;"Job Task No.";Code[20])
        {
            CaptionML = ENU='Job Task No.',
                        FRA='N° tâche projet';
            TableRelation = "Job Task"."Job Task No." WHERE (Job No.=FIELD(Job No.));
        }
        field(1002;"Job Line Type";Option)
        {
            CaptionML = ENU='Job Line Type',
                        FRA='Type ligne projet';
            OptionCaptionML = ENU=' ,Schedule,Contract,Both Schedule and Contract',
                              FRA=' ,Planifié,Contrat,Planifié et contrat';
            OptionMembers = " ",Schedule,Contract,"Both Schedule and Contract";
        }
        field(1003;"Job Unit Price";Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Job Unit Price',
                        FRA='Prix unitaire projet';
        }
        field(1004;"Job Total Price";Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Job Total Price',
                        FRA='Prix total projet';
            Editable = false;
        }
        field(1005;"Job Line Amount";Decimal)
        {
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CaptionML = ENU='Job Line Amount',
                        FRA='Montant ligne projet';
        }
        field(1006;"Job Line Discount Amount";Decimal)
        {
            AutoFormatExpression = "Job Currency Code";
            AutoFormatType = 1;
            BlankZero = true;
            CaptionML = ENU='Job Line Discount Amount',
                        FRA='Montant remise ligne projet';
        }
        field(1007;"Job Line Discount %";Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Job Line Discount %',
                        FRA='% remise ligne projet';
            DecimalPlaces = 0:5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(1008;"Job Unit Price (LCY)";Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Job Unit Price (LCY)',
                        FRA='Prix unitaire projet DS';
            Editable = false;
        }
        field(1009;"Job Total Price (LCY)";Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Job Total Price (LCY)',
                        FRA='Prix total projet DS';
            Editable = false;
        }
        field(1010;"Job Line Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CaptionML = ENU='Job Line Amount (LCY)',
                        FRA='Montant ligne projet DS';
            Editable = false;
        }
        field(1011;"Job Line Disc. Amount (LCY)";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CaptionML = ENU='Job Line Disc. Amount (LCY)',
                        FRA='Montant remise ligne projet DS';
            Editable = false;
        }
        field(1012;"Job Currency Factor";Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Job Currency Factor',
                        FRA='Facteur devise projet';
        }
        field(1013;"Job Currency Code";Code[20])
        {
            CaptionML = ENU='Job Currency Code',
                        FRA='Code devise projet';
        }
        field(1019;"Job Planning Line No.";Integer)
        {
            BlankZero = true;
            CaptionML = ENU='Job Planning Line No.',
                        FRA='N° ligne planning projet';

            trigger OnLookup();
            var
                JobPlanningLine : Record "1003";
            begin
            end;

            trigger OnValidate();
            var
                JobPlanningLine : Record "1003";
            begin
            end;
        }
        field(1030;"Job Remaining Qty.";Decimal)
        {
            CaptionML = ENU='Job Remaining Qty.',
                        FRA='Quantité travail à accomplir';
            DecimalPlaces = 0:5;

            trigger OnValidate();
            var
                JobPlanningLine : Record "1003";
            begin
            end;
        }
        field(1031;"Job Remaining Qty. (Base)";Decimal)
        {
            CaptionML = ENU='Job Remaining Qty. (Base)',
                        FRA='Quantité travail à accomplir (base)';
        }
        field(5401;"Prod. Order No.";Code[20])
        {
            CaptionML = ENU='Prod. Order No.',
                        FRA='N° ordre de fabrication';
            Editable = false;
            TableRelation = "Production Order".No. WHERE (Status=CONST(Released));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(5402;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code variante';
            TableRelation = IF (Type=CONST(Item)) "Item Variant".Code WHERE (Item No.=FIELD(No.));
        }
        field(5403;"Bin Code";Code[20])
        {
            CaptionML = ENU='Bin Code',
                        FRA='Code emplacement';
            TableRelation = IF (Document Type=FILTER(Order|Invoice),
                                Quantity=FILTER(<0)) "Bin Content"."Bin Code" WHERE (Location Code=FIELD(Location Code),
                                                                                     Item No.=FIELD(No.),
                                                                                     Variant Code=FIELD(Variant Code))
                                                                                     ELSE IF (Document Type=FILTER(Return Order|Credit Memo),
                                                                                              Quantity=FILTER(>=0)) "Bin Content"."Bin Code" WHERE (Location Code=FIELD(Location Code),
                                                                                                                                                    Item No.=FIELD(No.),
                                                                                                                                                    Variant Code=FIELD(Variant Code))
                                                                                                                                                    ELSE Bin.Code WHERE (Location Code=FIELD(Location Code));

            trigger OnLookup();
            var
                WMSManagement : Codeunit "7302";
                BinCode : Code[20];
            begin
            end;

            trigger OnValidate();
            var
                WMSManagement : Codeunit "7302";
            begin
            end;
        }
        field(5404;"Qty. per Unit of Measure";Decimal)
        {
            CaptionML = ENU='Qty. per Unit of Measure',
                        FRA='Quantité par unité';
            DecimalPlaces = 0:5;
            Editable = false;
            InitValue = 1;
        }
        field(5407;"Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Unit of Measure Code',
                        FRA='Code unité';
            TableRelation = IF (Type=CONST(Item)) "Item Unit of Measure".Code WHERE (Item No.=FIELD(No.))
                            ELSE "Unit of Measure";

            trigger OnValidate();
            var
                UnitOfMeasureTranslation : Record "5402";
            begin
            end;
        }
        field(5415;"Quantity (Base)";Decimal)
        {
            CaptionML = ENU='Quantity (Base)',
                        FRA='Quantité (base)';
            DecimalPlaces = 0:5;
        }
        field(5416;"Outstanding Qty. (Base)";Decimal)
        {
            CaptionML = ENU='Outstanding Qty. (Base)',
                        FRA='Quantité ouverte (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(5417;"Qty. to Invoice (Base)";Decimal)
        {
            CaptionML = ENU='Qty. to Invoice (Base)',
                        FRA='Qté à facturer (base)';
            DecimalPlaces = 0:5;
        }
        field(5418;"Qty. to Receive (Base)";Decimal)
        {
            CaptionML = ENU='Qty. to Receive (Base)',
                        FRA='Qté à recevoir (base)';
            DecimalPlaces = 0:5;
        }
        field(5458;"Qty. Rcd. Not Invoiced (Base)";Decimal)
        {
            CaptionML = ENU='Qty. Rcd. Not Invoiced (Base)',
                        FRA='Qté reçue non facturée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(5460;"Qty. Received (Base)";Decimal)
        {
            CaptionML = ENU='Qty. Received (Base)',
                        FRA='Quantité reçue (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(5461;"Qty. Invoiced (Base)";Decimal)
        {
            CaptionML = ENU='Qty. Invoiced (Base)',
                        FRA='Quantité facturée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(5495;"Reserved Qty. (Base)";Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Quantity (Base)" WHERE (Source Type=CONST(39),
                                                                           Source Subtype=FIELD(Document Type),
                                                                           Source ID=FIELD(Document No.),
                                                                           Source Ref. No.=FIELD(Line No.),
                                                                           Reservation Status=CONST(Reservation)));
            CaptionML = ENU='Reserved Qty. (Base)',
                        FRA='Quantité réservée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5600;"FA Posting Date";Date)
        {
            CaptionML = ENU='FA Posting Date',
                        FRA='Date compta. immo.';
        }
        field(5601;"FA Posting Type";Option)
        {
            CaptionML = ENU='FA Posting Type',
                        FRA='Type compta. immo.';
            OptionCaptionML = ENU=' ,Acquisition Cost,Maintenance',
                              FRA=' ,Coût acquisition,Maintenance';
            OptionMembers = " ","Acquisition Cost",Maintenance;
        }
        field(5602;"Depreciation Book Code";Code[10])
        {
            CaptionML = ENU='Depreciation Book Code',
                        FRA='Code loi d''amortissement';
            TableRelation = "Depreciation Book";
        }
        field(5603;"Salvage Value";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Salvage Value',
                        FRA='Valeur résiduelle';
        }
        field(5605;"Depr. until FA Posting Date";Boolean)
        {
            CaptionML = ENU='Depr. until FA Posting Date',
                        FRA='Amort. jusqu''à date compta.';
        }
        field(5606;"Depr. Acquisition Cost";Boolean)
        {
            CaptionML = ENU='Depr. Acquisition Cost',
                        FRA='Amortir coût acquisition';
        }
        field(5609;"Maintenance Code";Code[10])
        {
            CaptionML = ENU='Maintenance Code',
                        FRA='Code maintenance';
            TableRelation = Maintenance;
        }
        field(5610;"Insurance No.";Code[20])
        {
            CaptionML = ENU='Insurance No.',
                        FRA='N° assurance';
            TableRelation = Insurance;
        }
        field(5611;"Budgeted FA No.";Code[20])
        {
            CaptionML = ENU='Budgeted FA No.',
                        FRA='N° immo. budgétée';
            TableRelation = "Fixed Asset";
        }
        field(5612;"Duplicate in Depreciation Book";Code[10])
        {
            CaptionML = ENU='Duplicate in Depreciation Book',
                        FRA='Dupliquer dans lois amort.';
            TableRelation = "Depreciation Book";
        }
        field(5613;"Use Duplication List";Boolean)
        {
            CaptionML = ENU='Use Duplication List',
                        FRA='Utiliser liste duplication';
        }
        field(5700;"Responsibility Center";Code[10])
        {
            CaptionML = ENU='Responsibility Center',
                        FRA='Centre de gestion';
            Editable = false;
            TableRelation = "Responsibility Center";
        }
        field(5705;"Cross-Reference No.";Code[20])
        {
            CaptionML = ENU='Cross-Reference No.',
                        FRA='Référence externe';

            trigger OnValidate();
            var
                ReturnedCrossRef : Record "5717";
            begin
            end;
        }
        field(5706;"Unit of Measure (Cross Ref.)";Code[10])
        {
            CaptionML = ENU='Unit of Measure (Cross Ref.)',
                        FRA='Unité référence externe';
            TableRelation = IF (Type=CONST(Item)) "Item Unit of Measure".Code WHERE (Item No.=FIELD(No.));
        }
        field(5707;"Cross-Reference Type";Option)
        {
            CaptionML = ENU='Cross-Reference Type',
                        FRA='Type référence externe';
            OptionCaptionML = ENU=' ,Customer,Vendor,Bar Code',
                              FRA=' ,Client,Fournisseur,Code barre';
            OptionMembers = " ",Customer,Vendor,"Bar Code";
        }
        field(5708;"Cross-Reference Type No.";Code[30])
        {
            CaptionML = ENU='Cross-Reference Type No.',
                        FRA='N° type référence externe';
        }
        field(5709;"Item Category Code";Code[10])
        {
            CaptionML = ENU='Item Category Code',
                        FRA='Code catégorie article';
            TableRelation = "Item Category";
        }
        field(5710;Nonstock;Boolean)
        {
            CaptionML = ENU='Nonstock',
                        FRA='Non stocké';
        }
        field(5711;"Purchasing Code";Code[10])
        {
            CaptionML = ENU='Purchasing Code',
                        FRA='Procédure achat';
            TableRelation = Purchasing;
        }
        field(5712;"Product Group Code";Code[10])
        {
            CaptionML = ENU='Product Group Code',
                        FRA='Code groupe produits';
            TableRelation = "Product Group".Code WHERE (Item Category Code=FIELD(Item Category Code));
        }
        field(5713;"Special Order";Boolean)
        {
            CaptionML = ENU='Special Order',
                        FRA='Commande spéciale';
        }
        field(5714;"Special Order Sales No.";Code[20])
        {
            CaptionML = ENU='Special Order Sales No.',
                        FRA='N° vente cde spéciale';
            TableRelation = IF (Special Order=CONST(Yes)) "Sales Header".No. WHERE (Document Type=CONST(Order));
        }
        field(5715;"Special Order Sales Line No.";Integer)
        {
            CaptionML = ENU='Special Order Sales Line No.',
                        FRA='N° ligne vente cde spéciale';
            TableRelation = IF (Special Order=CONST(Yes)) "Sales Line"."Line No." WHERE (Document Type=CONST(Order),
                                                                                         Document No.=FIELD(Special Order Sales No.));
        }
        field(5750;"Whse. Outstanding Qty. (Base)";Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Warehouse Receipt Line"."Qty. Outstanding (Base)" WHERE (Source Type=CONST(39),
                                                                                        Source Subtype=FIELD(Document Type),
                                                                                        Source No.=FIELD(Document No.),
                                                                                        Source Line No.=FIELD(Line No.)));
            CaptionML = ENU='Whse. Outstanding Qty. (Base)',
                        FRA='Qté restante entrepôt (base)';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5752;"Completely Received";Boolean)
        {
            CaptionML = ENU='Completely Received',
                        FRA='Entièrement réceptionné';
            Editable = false;
        }
        field(5790;"Requested Receipt Date";Date)
        {
            CaptionML = ENU='Requested Receipt Date',
                        FRA='Date réception demandée';
        }
        field(5791;"Promised Receipt Date";Date)
        {
            CaptionML = ENU='Promised Receipt Date',
                        FRA='Date réception confirmée';
        }
        field(5792;"Lead Time Calculation";DateFormula)
        {
            CaptionML = ENU='Lead Time Calculation',
                        FRA='Délai de réappro.';
        }
        field(5793;"Inbound Whse. Handling Time";DateFormula)
        {
            CaptionML = ENU='Inbound Whse. Handling Time',
                        FRA='Délai enlogement';
        }
        field(5794;"Planned Receipt Date";Date)
        {
            CaptionML = ENU='Planned Receipt Date',
                        FRA='Date planifiée de réception';
        }
        field(5795;"Order Date";Date)
        {
            CaptionML = ENU='Order Date',
                        FRA='Date commande';
        }
        field(5800;"Allow Item Charge Assignment";Boolean)
        {
            CaptionML = ENU='Allow Item Charge Assignment',
                        FRA='Autoriser affectation frais annexes';
            InitValue = true;
        }
        field(5801;"Qty. to Assign";Decimal)
        {
            CalcFormula = Sum("Item Charge Assignment (Purch)"."Qty. to Assign" WHERE (Document Type=FIELD(Document Type),
                                                                                       Document No.=FIELD(Document No.),
                                                                                       Document Line No.=FIELD(Line No.)));
            CaptionML = ENU='Qty. to Assign',
                        FRA='Qté à affecter';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5802;"Qty. Assigned";Decimal)
        {
            CalcFormula = Sum("Item Charge Assignment (Purch)"."Qty. Assigned" WHERE (Document Type=FIELD(Document Type),
                                                                                      Document No.=FIELD(Document No.),
                                                                                      Document Line No.=FIELD(Line No.)));
            CaptionML = ENU='Qty. Assigned',
                        FRA='Qté affectée';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5803;"Return Qty. to Ship";Decimal)
        {
            CaptionML = ENU='Return Qty. to Ship',
                        FRA='Qté retour à expédier';
            DecimalPlaces = 0:5;
        }
        field(5804;"Return Qty. to Ship (Base)";Decimal)
        {
            CaptionML = ENU='Return Qty. to Ship (Base)',
                        FRA='Qté retour à expédier (base)';
            DecimalPlaces = 0:5;
        }
        field(5805;"Return Qty. Shipped Not Invd.";Decimal)
        {
            CaptionML = ENU='Return Qty. Shipped Not Invd.',
                        FRA='Qté ret. expédiée non facturée';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(5806;"Ret. Qty. Shpd Not Invd.(Base)";Decimal)
        {
            CaptionML = ENU='Ret. Qty. Shpd Not Invd.(Base)',
                        FRA='Qté ret. expéd. non fact. (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(5807;"Return Shpd. Not Invd.";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Return Shpd. Not Invd.',
                        FRA='Expédition retour non facturée';
            Editable = false;

            trigger OnValidate();
            var
                Currency2 : Record "4";
            begin
            end;
        }
        field(5808;"Return Shpd. Not Invd. (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Return Shpd. Not Invd. (LCY)',
                        FRA='Expédition retour non facturée DS';
            Editable = false;
        }
        field(5809;"Return Qty. Shipped";Decimal)
        {
            CaptionML = ENU='Return Qty. Shipped',
                        FRA='Qté retour expédiée';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(5810;"Return Qty. Shipped (Base)";Decimal)
        {
            CaptionML = ENU='Return Qty. Shipped (Base)',
                        FRA='Qté retour expédiée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(6600;"Return Shipment No.";Code[20])
        {
            CaptionML = ENU='Return Shipment No.',
                        FRA='N° expédition retour';
            Editable = false;
        }
        field(6601;"Return Shipment Line No.";Integer)
        {
            CaptionML = ENU='Return Shipment Line No.',
                        FRA='N° ligne expédition retour';
            Editable = false;
        }
        field(6608;"Return Reason Code";Code[10])
        {
            CaptionML = ENU='Return Reason Code',
                        FRA='Code motif retour';
            TableRelation = "Return Reason";
        }
        field(50000;"quantité proforma";Decimal)
        {
        }
        field(50001;"Prix Proforma";Decimal)
        {
        }
        field(50002;"existe proforma";Boolean)
        {
        }
        field(50003;"Modifier Qte";Boolean)
        {
        }
        field(50004;"Modifier Prix";Boolean)
        {
        }
        field(60024;Vider;Boolean)
        {
        }
        field(60025;"exist in cmd";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Line No.")
        {
            MaintainSIFTIndex = false;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        PurchCommentLine : Record "43";
    begin
    end;
}

