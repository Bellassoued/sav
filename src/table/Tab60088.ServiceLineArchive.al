table 60088 "Service Line Archive"
{
    // version NAVW111.00.00.23019,T180001

    // //<< RAD - ne pas autoriser d'ajout de lignes s'il existe une livraison
    // //SM MAZDA06
    // T180001 ZM 05/10/2018 : upgrade

    CaptionML = ENU='Service Line',
                FRA='Ligne service';
    DrillDownPageID = 5904;
    LookupPageID = 5904;
    Permissions = TableData 60029=rimd;

    fields
    {
        field(1;"Document Type";Option)
        {
            CaptionML = ENU='Document Type',
                        FRA='Type document';
            OptionCaptionML = ENU='Quote,Order,Invoice,Credit Memo',
                              FRA='Devis,Commande,Facture,Avoir';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo";
        }
        field(2;"Customer No.";Code[20])
        {
            CaptionML = ENU='Customer No.',
                        FRA='N° client';
            Editable = true;
            TableRelation = Customer;
        }
        field(3;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° document';
            TableRelation = "Service Header".No. WHERE (Document Type=FIELD(Document Type));
        }
        field(4;"Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne';
        }
        field(5;Type;Option)
        {
            CaptionML = ENU='Type',
                        FRA='Type';
            OptionCaptionML = ENU=' ,Item,Subcontracting,MO,G/L Account',
                              FRA=' ,Article,Sous-Traitance,Coût,Compte général';
            OptionMembers = " ",Item,Resource,Cost,"G/L Account";

            trigger OnValidate();
            var
                LRecReceptionSAV : Record "60008";
                LRecServiceHeader : Record "5900";
            begin
            end;
        }
        field(6;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            TableRelation = IF (Type=CONST(" ")) "Standard Text"
                            ELSE IF (Type=CONST(G/L Account)) "G/L Account"
                            ELSE IF (Type=CONST(Item)) Item
                            ELSE IF (Type=CONST(Resource)) Resource
                            ELSE IF (Type=CONST(Cost)) "Service Cost" WHERE (N Modele=FIELD(NO.  Vehicle));
            ValidateTableRelation = false;

            trigger OnLookup();
            var
                LKRStandardText : Record "7";
                LKPStandardTextCodes : Page "8";
                LKRItem : Record "27";
                LKPItemList : Page "31";
                LKRResource : Record "156";
                LKPResourceList : Page "77";
                LKRServiceCost : Record "5905";
                LKPServiceCosts : Page "5910";
                LKRGLAccount : Record "15";
                LKPGLAccountList : Page "18";
                LKRLaborStandardTime : Record "60029";
                LKPLaborStandardTime : Page "50042";
                RecLServiceItem : Record "5940";
                LRecServiceCost : Record "5905";
                LPageServiceCosts : Page "5910";
            begin
            end;

            trigger OnValidate();
            var
                RecLServiceLine : Record "5902";
                ServiceLineDiscount : Record "60033";
                BillToCustNo : Record "18";
                LRecItemMaster : Record "70007";
                RecInventorySetup : Record "313";
                LPagConfigurateurFicheArticle : Page "60186";
                LRecServiceHeader : Record "5900";
            begin
            end;
        }
        field(7;"Location Code";Code[10])
        {
            CaptionML = ENU='Location Code',
                        FRA='Code magasin';
            TableRelation = Location;
        }
        field(8;"Posting Group";Code[20])
        {
            CaptionML = ENU='Posting Group',
                        FRA='Groupe comptabilisation';
            Editable = false;
            TableRelation = IF (Type=CONST(Item)) "Inventory Posting Group";
        }
        field(11;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Description';
        }
        field(12;"Description 2";Text[50])
        {
            CaptionML = ENU='Description 2',
                        FRA='Description 2';
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

            trigger OnValidate();
            var
                ItemLedgEntry : Record "32";
            begin
            end;
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
        field(18;"Qty. to Ship";Decimal)
        {
            CaptionML = ENU='Qty. to Ship',
                        FRA='Qté à expédier';
            DecimalPlaces = 0:5;
        }
        field(22;"Unit Price";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            CaptionML = ENU='Unit Price',
                        FRA='Prix unitaire';
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
            AccessByPermission = TableData 27=R;
            CaptionML = ENU='Appl.-to Item Entry',
                        FRA='Écr. article à lettrer';

            trigger OnValidate();
            var
                ItemLedgEntry : Record "32";
            begin
            end;
        }
        field(40;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            CaptionML = ENU='Shortcut Dimension 1 Code',
                        FRA='Code raccourci axe 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1),
                                                          Blocked=CONST(No));
        }
        field(41;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            CaptionML = ENU='Shortcut Dimension 2 Code',
                        FRA='Code raccourci axe 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2),
                                                          Blocked=CONST(No));
        }
        field(42;"Customer Price Group";Code[10])
        {
            CaptionML = ENU='Customer Price Group',
                        FRA='Groupe prix client';
            Editable = false;
            TableRelation = "Customer Price Group";
        }
        field(45;"Job No.";Code[20])
        {
            CaptionML = ENU='Job No.',
                        FRA='N° projet';
            TableRelation = Job.No. WHERE (Bill-to Customer No.=FIELD(Bill-to Customer No.));

            trigger OnValidate();
            var
                Job : Record "167";
            begin
            end;
        }
        field(46;"Job Task No.";Code[20])
        {
            CaptionML = ENU='Job Task No.',
                        FRA='N° tâche projet';
            TableRelation = "Job Task"."Job Task No." WHERE (Job No.=FIELD(Job No.));
        }
        field(47;"Job Line Type";Option)
        {
            CaptionML = ENU='Job Line Type',
                        FRA='Type ligne projet';
            OptionCaptionML = ENU=' ,Budget,Billable,Both Budget and Billable',
                              FRA=' ,Budget,Facturable,Budget et Facturable';
            OptionMembers = " ",Budget,Billable,"Both Budget and Billable";
        }
        field(52;"Work Type Code";Code[10])
        {
            CaptionML = ENU='Work Type Code',
                        FRA='Code type travail';
            TableRelation = "Work Type";

            trigger OnValidate();
            var
                WorkType : Record "200";
            begin
            end;
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
        field(58;"Qty. Shipped Not Invoiced";Decimal)
        {
            CaptionML = ENU='Qty. Shipped Not Invoiced',
                        FRA='Qté livrée non facturée';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(59;"Shipped Not Invoiced";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Shipped Not Invoiced',
                        FRA='Livré non facturé';
            Editable = false;

            trigger OnValidate();
            var
                Currency2 : Record "4";
            begin
            end;
        }
        field(60;"Quantity Shipped";Decimal)
        {
            CaptionML = ENU='Quantity Shipped',
                        FRA='Qté expédiée';
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
        field(63;"Shipment No.";Code[20])
        {
            CaptionML = ENU='Shipment No.',
                        FRA='N° expédition';

            trigger OnLookup();
            var
                ServShptHeader : Record "5990";
            begin
            end;

            trigger OnValidate();
            var
                ServShptHeader : Record "5990";
                ServDocReg : Record "5936";
            begin
            end;
        }
        field(64;"Shipment Line No.";Integer)
        {
            CaptionML = ENU='Shipment Line No.',
                        FRA='N° ligne livraison';
            Editable = false;
        }
        field(68;"Bill-to Customer No.";Code[20])
        {
            CaptionML = ENU='Bill-to Customer No.',
                        FRA='N° client facturé';
            Editable = true;
            TableRelation = Customer;
        }
        field(69;"Inv. Discount Amount";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Inv. Discount Amount',
                        FRA='Montant remise facture';
            Editable = false;
        }
        field(74;"Gen. Bus. Posting Group";Code[20])
        {
            CaptionML = ENU='Gen. Bus. Posting Group',
                        FRA='Groupe compta. marché';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate();
            var
                GenBusPostingGroup : Record "250";
            begin
            end;
        }
        field(75;"Gen. Prod. Posting Group";Code[20])
        {
            CaptionML = ENU='Gen. Prod. Posting Group',
                        FRA='Groupe compta. produit';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate();
            var
                GenProdPostingGroup : Record "251";
            begin
            end;
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
            TableRelation = "Service Line"."Line No." WHERE (Document Type=FIELD(Document Type),
                                                             Document No.=FIELD(Document No.));
        }
        field(81;"Exit Point";Code[10])
        {
            CaptionML = ENU='Exit Point',
                        FRA='Pays destination';
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
        field(87;"Tax Group Code";Code[20])
        {
            CaptionML = ENU='Tax Group Code',
                        FRA='Code groupe taxes';
            TableRelation = "Tax Group";
        }
        field(88;"VAT Clause Code";Code[20])
        {
            CaptionML = ENU='VAT Clause Code',
                        FRA='Code clause TVA';
            TableRelation = "VAT Clause";
        }
        field(89;"VAT Bus. Posting Group";Code[20])
        {
            CaptionML = ENU='VAT Bus. Posting Group',
                        FRA='Groupe compta. marché TVA';
            TableRelation = "VAT Business Posting Group";
        }
        field(90;"VAT Prod. Posting Group";Code[20])
        {
            CaptionML = ENU='VAT Prod. Posting Group',
                        FRA='Groupe compta. produit TVA';
            TableRelation = "VAT Product Posting Group";

            trigger OnValidate();
            var
                VATPostingSetup : Record "325";
            begin
            end;
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
        field(93;"Shipped Not Invoiced (LCY)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Shipped Not Invoiced (LCY)',
                        FRA='Livré non facturé DS';
            Editable = false;
        }
        field(95;"Reserved Quantity";Decimal)
        {
            CalcFormula = -Sum("Reservation Entry".Quantity WHERE (Source ID=FIELD(Document No.),
                                                                   Source Ref. No.=FIELD(Line No.),
                                                                   Source Type=CONST(5902),
                                                                   Source Subtype=FIELD(Document Type),
                                                                   Reservation Status=CONST(Reservation)));
            CaptionML = ENU='Reserved Quantity',
                        FRA='Quantité réservée';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(96;Reserve;Option)
        {
            CaptionML = ENU='Reserve',
                        FRA='Réserver';
            OptionCaptionML = ENU='Never,Optional,Always',
                              FRA='Jamais,Manuel,Toujours';
            OptionMembers = Never,Optional,Always;
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
        field(106;"VAT Identifier";Code[20])
        {
            CaptionML = ENU='VAT Identifier',
                        FRA='Identifiant TVA';
            Editable = false;
        }
        field(480;"Dimension Set ID";Integer)
        {
            CaptionML = ENU='Dimension Set ID',
                        FRA='ID ensemble de dimensions';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(950;"Time Sheet No.";Code[20])
        {
            CaptionML = ENU='Time Sheet No.',
                        FRA='N° feuille de temps';
            TableRelation = "Time Sheet Header";
        }
        field(951;"Time Sheet Line No.";Integer)
        {
            CaptionML = ENU='Time Sheet Line No.',
                        FRA='N° de ligne de la feuille de temps';
            TableRelation = "Time Sheet Line"."Line No." WHERE (Time Sheet No.=FIELD(Time Sheet No.));
        }
        field(952;"Time Sheet Date";Date)
        {
            CaptionML = ENU='Time Sheet Date',
                        FRA='Date de la feuille de temps';
            TableRelation = "Time Sheet Detail".Date WHERE (Time Sheet No.=FIELD(Time Sheet No.),
                                                            Time Sheet Line No.=FIELD(Time Sheet Line No.));
        }
        field(1019;"Job Planning Line No.";Integer)
        {
            AccessByPermission = TableData 167=R;
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
            AccessByPermission = TableData 167=R;
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
        field(1032;"Job Remaining Total Cost";Decimal)
        {
            AccessByPermission = TableData 167=R;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Job Remaining Total Cost',
                        FRA='Coût total travail à accomplir';
            Editable = false;
        }
        field(1033;"Job Remaining Total Cost (LCY)";Decimal)
        {
            AccessByPermission = TableData 167=R;
            AutoFormatType = 1;
            CaptionML = ENU='Job Remaining Total Cost (LCY)',
                        FRA='Coût total travail à accomplir DS';
            Editable = false;
        }
        field(1034;"Job Remaining Line Amount";Decimal)
        {
            AccessByPermission = TableData 167=R;
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CaptionML = ENU='Job Remaining Line Amount',
                        FRA='Montant ligne travail à accomplir';
            Editable = false;
        }
        field(5402;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code variante';
            TableRelation = IF (Type=CONST(Item)) "Item Variant".Code WHERE (Item No.=FIELD(No.));

            trigger OnValidate();
            var
                ItemVariant : Record "5401";
            begin
            end;
        }
        field(5403;"Bin Code";Code[20])
        {
            CaptionML = ENU='Bin Code',
                        FRA='Code emplacement';
            TableRelation = IF (Document Type=FILTER(Order|Invoice),
                                Location Code=FILTER(<>''),
                                Type=CONST(Item)) "Bin Content"."Bin Code" WHERE (Location Code=FIELD(Location Code),
                                                                                  Item No.=FIELD(No.),
                                                                                  Variant Code=FIELD(Variant Code))
                                                                                  ELSE IF (Document Type=FILTER(Credit Memo),
                                                                                           Location Code=FILTER(<>''),
                                                                                           Type=CONST(Item)) Bin.Code WHERE (Location Code=FIELD(Location Code));

            trigger OnLookup();
            var
                WMSManagement : Codeunit "7302";
                BinCode : Code[20];
            begin
            end;

            trigger OnValidate();
            var
                WMSManagement : Codeunit "7302";
                WhseIntegrationManagement : Codeunit "7317";
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
        field(5405;Planned;Boolean)
        {
            CaptionML = ENU='Planned',
                        FRA='Planifié';
            Editable = false;
        }
        field(5407;"Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Unit of Measure Code',
                        FRA='Code unité';
            TableRelation = IF (Type=CONST(Item)) "Item Unit of Measure".Code WHERE (Item No.=FIELD(No.))
                            ELSE IF (Type=CONST(Resource)) "Resource Unit of Measure".Code WHERE (Resource No.=FIELD(No.))
                            ELSE "Unit of Measure";

            trigger OnValidate();
            var
                UnitOfMeasure : Record "204";
                UnitOfMeasureTranslation : Record "5402";
                ResUnitofMeasure : Record "205";
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
        field(5418;"Qty. to Ship (Base)";Decimal)
        {
            CaptionML = ENU='Qty. to Ship (Base)',
                        FRA='Qté à expédier (base)';
            DecimalPlaces = 0:5;
        }
        field(5458;"Qty. Shipped Not Invd. (Base)";Decimal)
        {
            CaptionML = ENU='Qty. Shipped Not Invd. (Base)',
                        FRA='Qté livrée non facturée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(5460;"Qty. Shipped (Base)";Decimal)
        {
            CaptionML = ENU='Qty. Shipped (Base)',
                        FRA='Qté expédiée (base)';
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
            CalcFormula = -Sum("Reservation Entry"."Quantity (Base)" WHERE (Source ID=FIELD(Document No.),
                                                                            Source Ref. No.=FIELD(Line No.),
                                                                            Source Type=CONST(5902),
                                                                            Source Subtype=FIELD(Document Type),
                                                                            Reservation Status=CONST(Reservation)));
            CaptionML = ENU='Reserved Qty. (Base)',
                        FRA='Quantité réservée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5700;"Responsibility Center";Code[10])
        {
            CaptionML = ENU='Responsibility Center',
                        FRA='Centre de gestion';
            Editable = false;
            TableRelation = "Responsibility Center";
        }
        field(5702;"Substitution Available";Boolean)
        {
            CalcFormula = Exist("Item Substitution" WHERE (Type=CONST(Item),
                                                           No.=FIELD(No.),
                                                           Substitute Type=CONST(Item)));
            CaptionML = ENU='Substitution Available',
                        FRA='Substitut disponible';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5709;"Item Category Code";Code[20])
        {
            CaptionML = ENU='Item Category Code',
                        FRA='Code catégorie article';
            TableRelation = "Item Category";
        }
        field(5710;Nonstock;Boolean)
        {
            CaptionML = ENU='Nonstock',
                        FRA='Non stocké';
            Editable = false;
        }
        field(5712;"Product Group Code";Code[10])
        {
            CaptionML = ENU='Product Group Code',
                        FRA='Code groupe produits';
            ObsoleteReason = 'Product Groups became first level children of Item Categories.';
            ObsoleteState = Pending;
            TableRelation = "Product Group".Code WHERE (Item Category Code=FIELD(Item Category Code));
            ValidateTableRelation = false;
        }
        field(5750;"Whse. Outstanding Qty. (Base)";Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Warehouse Shipment Line"."Qty. Outstanding (Base)" WHERE (Source Type=CONST(5902),
                                                                                         Source Subtype=FIELD(Document Type),
                                                                                         Source No.=FIELD(Document No.),
                                                                                         Source Line No.=FIELD(Line No.)));
            CaptionML = ENU='Whse. Outstanding Qty. (Base)',
                        FRA='Qté restante entrepôt (base)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5752;"Completely Shipped";Boolean)
        {
            CaptionML = ENU='Completely Shipped',
                        FRA='Entièrement expédiée';
            Editable = false;
        }
        field(5790;"Requested Delivery Date";Date)
        {
            CaptionML = ENU='Requested Delivery Date',
                        FRA='Date livraison demandée';
        }
        field(5791;"Promised Delivery Date";Date)
        {
            CaptionML = ENU='Promised Delivery Date',
                        FRA='Date livraison confirmée';
        }
        field(5792;"Shipping Time";DateFormula)
        {
            AccessByPermission = TableData 5790=R;
            CaptionML = ENU='Shipping Time',
                        FRA='Délai d''expédition';
        }
        field(5794;"Planned Delivery Date";Date)
        {
            CaptionML = ENU='Planned Delivery Date',
                        FRA='Date livraison planifiée';
        }
        field(5796;"Shipping Agent Code";Code[10])
        {
            AccessByPermission = TableData 5790=R;
            CaptionML = ENU='Shipping Agent Code',
                        FRA='Code transporteur';
            TableRelation = "Shipping Agent";
        }
        field(5797;"Shipping Agent Service Code";Code[10])
        {
            CaptionML = ENU='Shipping Agent Service Code',
                        FRA='Code prestation transporteur';
            TableRelation = "Shipping Agent Services".Code WHERE (Shipping Agent Code=FIELD(Shipping Agent Code));

            trigger OnValidate();
            var
                ShippingAgentServices : Record "5790";
            begin
            end;
        }
        field(5811;"Appl.-from Item Entry";Integer)
        {
            AccessByPermission = TableData 27=R;
            CaptionML = ENU='Appl.-from Item Entry',
                        FRA='Écriture article à lettrer';
            MinValue = 0;

            trigger OnValidate();
            var
                ItemLedgEntry : Record "32";
            begin
            end;
        }
        field(5902;"Service Item No.";Code[20])
        {
            CaptionML = ENU='Service Item No.',
                        FRA='N° article de service';
            TableRelation = "Service Item".No.;
        }
        field(5903;"Appl.-to Service Entry";Integer)
        {
            AccessByPermission = TableData 27=R;
            CaptionML = ENU='Appl.-to Service Entry',
                        FRA='Ecr. service à lettrer';
            Editable = false;
        }
        field(5904;"Service Item Line No.";Integer)
        {
            CaptionML = ENU='Service Item Line No.',
                        FRA='N° ligne article de service';
            TableRelation = "Service Item Line"."Line No." WHERE (Document Type=FIELD(Document Type),
                                                                  Document No.=FIELD(Document No.));
        }
        field(5905;"Service Item Serial No.";Code[20])
        {
            CaptionML = ENU='Service Item Serial No.',
                        FRA='N° de série article de service';
        }
        field(5906;"Service Item Line Description";Text[50])
        {
            CalcFormula = Lookup("Service Item Line".Description WHERE (Document Type=FIELD(Document Type),
                                                                        Document No.=FIELD(Document No.),
                                                                        Line No.=FIELD(Service Item Line No.)));
            CaptionML = ENU='Service Item Line Description',
                        FRA='Description ligne article de service';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5907;"Serv. Price Adjmt. Gr. Code";Code[10])
        {
            CaptionML = ENU='Serv. Price Adjmt. Gr. Code',
                        FRA='Code groupe ajust. prix serv.';
            Editable = false;
            TableRelation = "Service Price Adjustment Group";
        }
        field(5908;"Posting Date";Date)
        {
            CaptionML = ENU='Posting Date',
                        FRA='Date comptabilisation';
        }
        field(5909;"Order Date";Date)
        {
            CaptionML = ENU='Order Date',
                        FRA='Date commande';
            Editable = false;
        }
        field(5910;"Needed by Date";Date)
        {
            CaptionML = ENU='Needed by Date',
                        FRA='Requis par date';
        }
        field(5916;"Ship-to Code";Code[10])
        {
            CaptionML = ENU='Ship-to Code',
                        FRA='Code destinataire';
            Editable = false;
            TableRelation = "Ship-to Address".Code WHERE (Customer No.=FIELD(Customer No.));
        }
        field(5917;"Qty. to Consume";Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Qty. to Consume',
                        FRA='Qté à consommer';
            DecimalPlaces = 0:5;
        }
        field(5918;"Quantity Consumed";Decimal)
        {
            CaptionML = ENU='Quantity Consumed',
                        FRA='Quantité consommée';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(5919;"Qty. to Consume (Base)";Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Qty. to Consume (Base)',
                        FRA='Qté à consommer (base)';
            DecimalPlaces = 0:5;
        }
        field(5920;"Qty. Consumed (Base)";Decimal)
        {
            CaptionML = ENU='Qty. Consumed (Base)',
                        FRA='Qté consommée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(5928;"Service Price Group Code";Code[10])
        {
            CaptionML = ENU='Service Price Group Code',
                        FRA='Code groupe tarifs service';
            TableRelation = "Service Price Group";
        }
        field(5929;"Fault Area Code";Code[10])
        {
            CaptionML = ENU='Fault Area Code',
                        FRA='Code zone panne';
            TableRelation = "Fault Area";
        }
        field(5930;"Symptom Code";Code[10])
        {
            CaptionML = ENU='Symptom Code',
                        FRA='Code symptôme';
            TableRelation = "Symptom Code";
        }
        field(5931;"Fault Code";Code[10])
        {
            CaptionML = ENU='Fault Code',
                        FRA='Code panne';
            TableRelation = "Fault Code".Code WHERE (Fault Area Code=FIELD(Fault Area Code),
                                                     Symptom Code=FIELD(Symptom Code));
        }
        field(5932;"Resolution Code";Code[10])
        {
            CaptionML = ENU='Resolution Code',
                        FRA='Code solution';
            TableRelation = "Resolution Code";
        }
        field(5933;"Exclude Warranty";Boolean)
        {
            CaptionML = ENU='Exclude Warranty',
                        FRA='Exclure garantie';
            Editable = false;
        }
        field(5934;Warranty;Boolean)
        {
            CaptionML = ENU='Warranty',
                        FRA='Garantie';
            Editable = false;
        }
        field(5936;"Contract No.";Code[20])
        {
            CaptionML = ENU='Contract No.',
                        FRA='N° contrat';
            TableRelation = "Service Contract Header"."Contract No." WHERE (Contract Type=CONST(Contract));

            trigger OnLookup();
            var
                ServContractHeader : Record "5965";
            begin
            end;

            trigger OnValidate();
            var
                Res : Record "156";
                ServCost : Record "5905";
                ContractGroup : Record "5966";
                ContractServDisc : Record "5972";
                ServContractHeader : Record "5965";
            begin
            end;
        }
        field(5938;"Contract Disc. %";Decimal)
        {
            CaptionML = ENU='Contract Disc. %',
                        FRA='% remise contrat';
            DecimalPlaces = 0:5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5939;"Warranty Disc. %";Decimal)
        {
            CaptionML = ENU='Warranty Disc. %',
                        FRA='% remise garantie';
            DecimalPlaces = 0:5;
            MaxValue = 100;
            MinValue = 0;
        }
        field(5965;"Component Line No.";Integer)
        {
            CaptionML = ENU='Component Line No.',
                        FRA='N° ligne composant';
        }
        field(5966;"Spare Part Action";Option)
        {
            CaptionML = ENU='Spare Part Action',
                        FRA='Action pièce de rechange';
            OptionCaptionML = ENU=' ,Permanent,Temporary,Component Replaced,Component Installed',
                              FRA=' ,Permanent,Temporaire,Composant remplacé,Composant installé';
            OptionMembers = " ",Permanent,"Temporary","Component Replaced","Component Installed";
        }
        field(5967;"Fault Reason Code";Code[10])
        {
            CaptionML = ENU='Fault Reason Code',
                        FRA='Code motif panne';
            TableRelation = "Fault Reason Code";

            trigger OnValidate();
            var
                NewWarranty : Boolean;
                OldExcludeContractDiscount : Boolean;
            begin
            end;
        }
        field(5968;"Replaced Item No.";Code[20])
        {
            CaptionML = ENU='Replaced Item No.',
                        FRA='N° article remplacé';
            TableRelation = IF (Replaced Item Type=CONST(Item)) Item
                            ELSE IF (Replaced Item Type=CONST(Service Item)) "Service Item";
        }
        field(5969;"Exclude Contract Discount";Boolean)
        {
            CaptionML = ENU='Exclude Contract Discount',
                        FRA='Exclure remise contrat';
            Editable = true;
        }
        field(5970;"Replaced Item Type";Option)
        {
            CaptionML = ENU='Replaced Item Type',
                        FRA='Type article remplacé';
            OptionCaptionML = ENU=' ,Service Item,Item',
                              FRA=' ,Article service,Article';
            OptionMembers = " ","Service Item",Item;
        }
        field(5994;"Price Adjmt. Status";Option)
        {
            CaptionML = ENU='Price Adjmt. Status',
                        FRA='Statut ajust. prix';
            Editable = false;
            OptionCaptionML = ENU=' ,Adjusted,Modified',
                              FRA=' ,Ajusté,Modifié';
            OptionMembers = " ",Adjusted,Modified;
        }
        field(5997;"Line Discount Type";Option)
        {
            CaptionML = ENU='Line Discount Type',
                        FRA='Type remise ligne';
            Editable = false;
            OptionCaptionML = ENU=' ,Warranty Disc.,Contract Disc.,Line Disc.,Manual',
                              FRA=' ,Remise garantie,Remise contrat,Remise ligne,Manuelle';
            OptionMembers = " ","Warranty Disc.","Contract Disc.","Line Disc.",Manual;
        }
        field(5999;"Copy Components From";Option)
        {
            CaptionML = ENU='Copy Components From',
                        FRA='Copier les composants à partir de';
            OptionCaptionML = ENU='None,Item BOM,Old Service Item,Old Serv.Item w/o Serial No.',
                              FRA='Aucun,Nomenclature article,Ancien article de service,Ancien article de serv. sans n° de série';
            OptionMembers = "None","Item BOM","Old Service Item","Old Serv.Item w/o Serial No.";
        }
        field(6608;"Return Reason Code";Code[10])
        {
            CaptionML = ENU='Return Reason Code',
                        FRA='Code motif retour';
            TableRelation = "Return Reason";

            trigger OnValidate();
            var
                ReturnReason : Record "6635";
            begin
            end;
        }
        field(7001;"Allow Line Disc.";Boolean)
        {
            CaptionML = ENU='Allow Line Disc.',
                        FRA='Autoriser remise ligne';
            InitValue = true;
        }
        field(7002;"Customer Disc. Group";Code[20])
        {
            CaptionML = ENU='Customer Disc. Group',
                        FRA='Groupe rem. client';
            TableRelation = "Customer Discount Group";
        }
        field(7300;"Qty. Picked";Decimal)
        {
            CaptionML = ENU='Qty. Picked',
                        FRA='Qté prélevée';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(7301;"Qty. Picked (Base)";Decimal)
        {
            CaptionML = ENU='Qty. Picked (Base)',
                        FRA='Qté prélevée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(7302;"Completely Picked";Boolean)
        {
            CaptionML = ENU='Completely Picked',
                        FRA='Entièrement prélévé';
            Editable = false;
        }
        field(7303;"Pick Qty. (Base)";Decimal)
        {
            CaptionML = ENU='Pick Qty. (Base)',
                        FRA='Prélever qté (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(60000;"Qty TransferOrder To Receive";Decimal)
        {
            CalcFormula = Sum("Transfer Line".Quantity WHERE (No Service Order=FIELD(Document No.),
                                                              Item No.=FIELD(No.),
                                                              Transfer-to Code=FIELD(Location Code),
                                                              Derived From Line No.=CONST(0)));
            CaptionML = ENU='Qtty on Transfer Order',
                        FRA='Qté Ordre de Transfert à Réceptionner';
            Description = 'SM MAZDA06 FILTER MAG Aller';
            FieldClass = FlowField;
        }
        field(60001;"Qty To Order";Decimal)
        {
            Caption = 'Qté à demander';
        }
        field(60002;Status;Option)
        {
            CaptionML = ENU='Status',
                        FRA='Statut';
            OptionCaptionML = ENU='Approved,Rejected',
                              FRA='Accepté,Rejeté';
            OptionMembers = Approved,Rejected;
        }
        field(60003;"Remaining Qty to Order";Decimal)
        {
            Caption = 'Qté Restante à commander';
            Editable = true;
        }
        field(60004;"Qty Received";Decimal)
        {
            CalcFormula = Sum("Transfer Receipt Line".Quantity WHERE (Source No=FIELD(Document No.),
                                                                      Item No.=FIELD(No.),
                                                                      Transfer-to Code=FIELD(Location Code)));
            Caption = 'Qté Réceptionnée';
            Description = 'SM MAZDA06 FILTER MAG Aller';
            FieldClass = FlowField;
        }
        field(60005;"Qty Shipped";Decimal)
        {
            CalcFormula = Sum("Transfer Shipment Line".Quantity WHERE (Item No.=FIELD(No.),
                                                                       Source No=FIELD(Document No.),
                                                                       Transfer-to Code=FIELD(Location Code)));
            Caption = 'Qté Expediée';
            Description = 'SM MAZDA06 FILTER MAG Aller';
            FieldClass = FlowField;
        }
        field(60006;"Qte Current Location AND Doc";Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE (Item No.=FIELD(No.),
                                                                  From No Service Order=FIELD(Document No.),
                                                                  Location Code=FIELD(Location Code)));
            Caption = 'Qté Mag et Doc Encours';
            Description = 'SM MAZDA06 From Item Ledger Entry';
            FieldClass = FlowField;
        }
        field(60007;"Ordered Qty";Decimal)
        {
            Caption = 'Qté Demandée';
            Description = 'SM MAZDA06 Calculer pour affichage';
        }
        field(60008;"Qty Received Transfert Order";Decimal)
        {
            CalcFormula = Sum("Transfer Line"."Quantity Received" WHERE (No Service Order=FIELD(Document No.),
                                                                         Item No.=FIELD(No.),
                                                                         Transfer-to Code=FIELD(Location Code),
                                                                         Derived From Line No.=CONST(0)));
            CaptionML = ENU='Qtty on Transfer Order',
                        FRA='Qté Réceptionnée Ordre de transfert';
            Description = 'SM MAZDA06 FILTER MAG Aller';
            FieldClass = FlowField;
        }
        field(60009;"Qty TransferOrder To Ship";Decimal)
        {
            CalcFormula = Sum("Transfer Line".Quantity WHERE (No Service Order=FIELD(Document No.),
                                                              Item No.=FIELD(No.),
                                                              Transfer-from Code=FIELD(Location Code),
                                                              Derived From Line No.=CONST(0)));
            CaptionML = ENU='Qtty on Transfer Order',
                        FRA='Qté Ordre de Transfert à Expédier';
            Description = 'SM MAZDA06 FILTER MAG Retour';
            FieldClass = FlowField;
        }
        field(60010;"Qty Shipped Transfert Order";Decimal)
        {
            CalcFormula = Sum("Transfer Line"."Quantity Shipped" WHERE (No Service Order=FIELD(Document No.),
                                                                        Item No.=FIELD(No.),
                                                                        Transfer-from Code=FIELD(Location Code),
                                                                        Derived From Line No.=CONST(0)));
            CaptionML = ENU='Qtty on Transfer Order',
                        FRA='Qté Expédiée Ordre de transfert';
            Description = 'SM MAZDA06 FILTER MAG Retour';
            FieldClass = FlowField;
        }
        field(60011;"Qty Received Returned";Decimal)
        {
            CalcFormula = Sum("Transfer Receipt Line".Quantity WHERE (Source No=FIELD(Document No.),
                                                                      Item No.=FIELD(No.),
                                                                      Transfer-from Code=FIELD(Location Code)));
            Caption = 'Qté Réceptionnée Retour';
            Description = 'SM MAZDA06 FILTER MAG Retour';
            FieldClass = FlowField;
        }
        field(60012;"Qty Shipped Returned";Decimal)
        {
            CalcFormula = Sum("Transfer Shipment Line".Quantity WHERE (Item No.=FIELD(No.),
                                                                       Source No=FIELD(Document No.),
                                                                       Transfer-from Code=FIELD(Location Code)));
            Caption = 'Qté Expediée Retour';
            Description = 'SM MAZDA06 FILTER MAG Retour';
            FieldClass = FlowField;
        }
        field(60100;"Special Order Service";Boolean)
        {
            Caption = 'Commande spéciale Service';
            Description = 'SM MAZDA07';
        }
        field(60101;"Special Order Purchase No.";Code[20])
        {
            Caption = 'N° commande achat spéciale';
            Description = 'SM MAZDA07';
            TableRelation = IF (Special Order Service=CONST(Yes)) "Purchase Header".No.;
        }
        field(60102;"Special Order Purch. Line No.";Integer)
        {
            Caption = 'N° ligne commande achat spéciale';
            Description = 'SM MAZDA07';
        }
        field(60104;"Buy-from Vendor No.";Code[20])
        {
            CaptionML = ENU='Buy-from Vendor No.',
                        FRA='N° fournisseur';
            Description = 'SM MAZDA07';
            TableRelation = Vendor;
        }
        field(60105;"Qty Purchase Line";Decimal)
        {
            CalcFormula = Sum("Purchase Line".Quantity WHERE (Document Type=CONST(Order),
                                                              Document No.=FIELD(Special Order Purchase No.),
                                                              Line No.=FIELD(Special Order Purch. Line No.)));
            Caption = 'Qté sur ligne commande achat';
            Description = 'SM MAZDA07';
            FieldClass = FlowField;
        }
        field(60106;"Qty Received Purchase Line";Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Quantity Received" WHERE (Document Type=CONST(Order),
                                                                         Document No.=FIELD(Special Order Purchase No.),
                                                                         Line No.=FIELD(Special Order Purch. Line No.)));
            Caption = 'Qté Réceptionné  sur ligne commande achat';
            Description = 'SM MAZDA07';
            FieldClass = FlowField;
        }
        field(60107;"Qty Received Purchase";Decimal)
        {
            CalcFormula = Sum("Purch. Rcpt. Line".Quantity WHERE (Order No.=FIELD(Special Order Purchase No.),
                                                                  Order Line No.=FIELD(Special Order Purch. Line No.)));
            Caption = 'Qté Réceptionné Achat';
            Description = 'SM MAZDA07';
            FieldClass = FlowField;
        }
        field(60108;ToRecreate;Boolean)
        {
            Description = 'SM MAZDA08';
        }
        field(60109;"Defaulting Item";Option)
        {
            Caption = 'Pièce Défaillante';
            Description = 'SM MAZDA19';
            OptionMembers = " ","Principale Pièce","Pièce Annexe";
        }
        field(62000;"ID DM Set";Code[20])
        {
            Description = 'SM DM V1';
        }
        field(70000;"No. article KIT";Code[20])
        {
            Description = 'ADD KK numéro article assemblage';
            Editable = false;
        }
        field(70001;"Qty par KIT";Decimal)
        {
            Description = 'ADD KK Quantité nomenclature assemblage s''il s''agit d''un article kit';
        }
        field(70002;"Reception No";Code[20])
        {
            CalcFormula = Lookup("Service Header"."Reception No" WHERE (Document Type=FIELD(Document Type),
                                                                        No.=FIELD(Document No.)));
            CaptionML = ENU='Receive No.',
                        FRA='N° Ordre de réparation';
            Description = 'Modif KT180517 FlowField';
            FieldClass = FlowField;
        }
        field(70003;"Pièce d'origine";Boolean)
        {
            CalcFormula = Lookup(Item."Pièce d'origine" WHERE (Pièce d'origine=FILTER(Yes),
                                                               No.=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(70004;"No. Order de Transfert";Code[20])
        {
        }
        field(70005;"CompanyOrder Transfert";Text[50])
        {
        }
        field(70009;"Nature Piece";Option)
        {
            Description = 'PR0021';
            OptionCaptionML = FRA=' ,SCD,NFP,EST,685,VIN,LST',
                              ENG=' ,SCD,NFP,EST,685,VIN,LST';
            OptionMembers = " ",SCD,NFP,EST,"685",VIN,LST;
        }
        field(70010;"Libéllé Nature Pièce";Option)
        {
            OptionCaption = '" ,Pièce sur Commande,Pièce n''est plus fournie par AC,Pièce en échange standard,Pièce avec déclaration 685,Nécessite n° VIN,Liste complexe"';
            OptionMembers = " ","Pièce sur Commande","Pièce n'est plus fournie par AC","Pièce en échange standard","Pièce avec déclaration 685","Nécessite n° VIN","Liste complexe";
        }
        field(70110;"Forcer No Ligne";Boolean)
        {
            Description = 'SM Temporary';
        }
        field(70111;"Nom Fournisseur";Text[50])
        {
            CalcFormula = Lookup(Vendor.Name WHERE (No.=FIELD(Buy-from Vendor No.)));
            Description = 'NM100317';
            FieldClass = FlowField;
        }
        field(70112;"Garantie approuvée";Boolean)
        {
        }
        field(70113;"Complément";Boolean)
        {
        }
        field(70115;"Qte Current POS ADJUST";Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE (Item No.=FIELD(No.),
                                                                  From No Service Order=FIELD(Document No.),
                                                                  Location Code=FIELD(Location Code),
                                                                  Entry Type=FILTER(Positive Adjmt.|Negative Adjmt.)));
            Caption = 'Qté Mag et Doc Encours';
            Description = 'SM MAZDA06 From Item Ledger Entry';
            FieldClass = FlowField;
        }
        field(70116;"Non Demandable du Mag";Boolean)
        {
            Description = 'SM180917';
        }
        field(70117;Version;Integer)
        {
        }
        field(70118;NbrImpressions;Integer)
        {
        }
        field(70119;"Imprimé";Boolean)
        {
        }
        field(70120;"A imprimer";Boolean)
        {
        }
        field(70121;"Qtée Manquant";Decimal)
        {
            Description = 'SM161217';
        }
        field(70122;"Date Manquant";DateTime)
        {
            Description = 'SM161217';
        }
        field(70123;"Facturer Marge Négative";Boolean)
        {
            CaptionML = ENU='Facturer Marge Négative',
                        FRA='Dérogation coût';
            Description = 'KT180118';
        }
        field(70130;"Manufacturer Code";Code[10])
        {
            CaptionML = ENU='Manufacturer Code',
                        FRA='Code fabricant';
            DataClassification = ToBeClassified;
            TableRelation = Manufacturer;
        }
        field(70132;"Pièce Urgent";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'ZMN LVI 18012018';

            trigger OnValidate();
            var
                LRecListArticleCmdUrg : Record "60094";
                Itemavailability : Codeunit "70000";
                TypeDoc : Option PR,VN,Service;
            begin
            end;
        }
        field(70134;"Product Code";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'Product Code';
        }
        field(70135;"EPM Non Reorder Code";Code[1])
        {
            DataClassification = ToBeClassified;
            Description = 'This code contains the actual reject code from the parts master';
        }
        field(70136;Compagnon;Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'NM211118-TOYOA';
            TableRelation = Resource.No. WHERE (Type=CONST(Person));

            trigger OnValidate();
            var
                ServiceOrderAllocation : Record "5950";
            begin
            end;
        }
        field(70137;"Nom compagnon";Text[50])
        {
            DataClassification = ToBeClassified;
            Description = 'NM211118-TOYOA';
        }
        field(70138;ETA;Date)
        {
            CaptionML = ENU='Esimated time of arrival',
                        FRA='Date d''arrivée prévue';
            DataClassification = ToBeClassified;
            Description = 'KT 10042019';
        }
        field(70139;ATD;Date)
        {
            CaptionML = ENU='Actual time of departure',
                        FRA='Date de départ réelle';
            DataClassification = ToBeClassified;
            Description = 'KT 10042019';
        }
        field(70140;ATA;Date)
        {
            CaptionML = ENU='Actual time of arrival',
                        FRA='Date d''arrivée réelle';
            DataClassification = ToBeClassified;
            Description = 'KT 10042019';
        }
        field(70141;ETD;Date)
        {
            CaptionML = ENU='Esimated time of departure',
                        FRA='Date de départ prévue';
            DataClassification = ToBeClassified;
            Description = 'KT 10042019';
        }
        field(70142;"Estimated Time For Delivery";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 29042019';
            OptionCaptionML = ENU=' ,2 to 3 weeks,4 to 5 weeks,6 to 8 weeks,More than 8 weeks',
                              FRA=' ,2 à 3 semaines,4 à 5 semaines,6 à 8 semaines,Plus que 8 semaines';
            OptionMembers = " ","1","2","3","4","5","6","7","8","9";
        }
        field(80000;"Expédition Annulée";Boolean)
        {
            Caption = 'Expédition Annulée';
            DataClassification = ToBeClassified;
            Description = 'NM211118-TOYOA';
        }
        field(80015;"Processed Item No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(90090;"Sur Commande (urgent)";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(90091;"NO.  Vehicle";Code[100])
        {
            Description = 'AK020419';
            FieldClass = Normal;
        }
        field(90092;"No. Version";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Line No.","No. Version")
        {
            SumIndexFields = Amount,"Amount Including VAT","Outstanding Amount","Shipped Not Invoiced","Outstanding Amount (LCY)","Shipped Not Invoiced (LCY)","Line Amount";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        ServiceLine2 : Record "5902";
        WhseValidateSourceLine : Codeunit "5777";
        RecServiceLineTMP2 : Record "5902" temporary;
        RecLServiceMgtSetup : Record "5911";
        RecLServiceHeader : Record "5900";
    begin
    end;

    trigger OnInsert();
    var
        RecLServiceLine : Record "5902";
        RecLServiceHeader : Record "5900";
    begin
    end;

    trigger OnModify();
    var
        RecLServiceLine : Record "5902";
    begin
    end;

    var
        Text000 : TextConst ENU='You cannot invoice more than %1 units.',FRA='Vous ne pouvez pas facturer plus de %1 unité(s).';
        Text001 : TextConst ENU='You cannot invoice more than %1 base units.',FRA='Vous ne pouvez pas facturer plus de %1 unité(s) de base.';
        Text002 : TextConst ENU='You cannot rename a %1.',FRA='Vous ne pouvez pas renommer l''enregistrement %1.';
        Text003 : TextConst ENU='must not be less than %1',FRA='ne doit pas être inférieur(e) à %1';
        Text004 : TextConst ENU='You must confirm %1 %2, because %3 is not equal to %4 in %5 %6.',FRA='Vous devez confirmer le %1 %2, car le %3 n''est pas égale à %4 dans l''%5 %6.';
        Text005 : TextConst ENU='The update has been interrupted to respect the warning.',FRA='La mise à jour a été interrompue pour respecter l''alerte.';
        Text006 : TextConst ENU='Replace Component,New Component,Ignore',FRA='Remplacer composant,Nouveau composant,Ignorer';
        Text007 : TextConst ENU='You must select a %1.',FRA='Vous devez sélectionner un %1.';
        Text008 : TextConst ENU='You cannot change the value of the %1 field because the %2 field in the Fault Reason Codes window contains a check mark for the %3 %4.',FRA='Vous ne pouvez pas modifier le champ %1, car le champ %2 de la fenêtre Codes motif panne possède un champ %3 %4 actif.';
        Text009 : TextConst ENU='You have changed the value of the field %1.\Do you want to continue ?',FRA='Vous avez modifié la valeur du champ %1.\Souhaitez-vous continuer ?';
        Text010 : TextConst ENU='%1 cannot be less than %2.',FRA='%1 doit être supérieur(e) à %2.';
        Text011 : TextConst ENU='When replacing a %1 the quantity must be 1.',FRA='Si vous remplacez un(e) %1, la quantité doit être à 1.';
        Text012 : TextConst ENU='Automatic reservation is not possible.\Do you want to reserve items manually?',FRA='La réservation automatique n''est pas possible.\Souhaitez-vous réserver les articles manuellement ?';
        Text013 : TextConst ENU=' must be 0 when %1 is %2.',FRA=' doit être 0 quand %1 est %2.';
        Text015 : TextConst ENU='You have already selected %1 %2 for replacement.',FRA='Vous avez déjà choisi %1 %2 en remplacement.';
        Text016 : TextConst ENU='You cannot ship more than %1 units.',FRA='Vous ne pouvez pas expédier plus de %1 unité(s).';
        Text017 : TextConst ENU='You cannot ship more than %1 base units.',FRA='Vous ne pouvez pas expédier plus de %1 unité(s) de base.';
        Text018 : TextConst ENU='%1 %2 is greater than %3 and was adjusted to %4.',FRA='%1 %2 est supérieur(e) au %3 et a été ajusté au %4.';
        CompAlreadyReplacedErr : TextConst Comment='%1 = Line No.',ENU='The component that you selected has already been replaced in service line %1.',FRA='Le composant que vous avez sélectionné a déjà été remplacé dans la ligne de service %1.';
        ServMgtSetup : Record "5911";
        ServiceLine : Record "5902";
        ServHeader : Record "5900";
        ServItem : Record "5940";
        ServItemLine : Record "5901";
        Item : Record "27";
        Resource : Record "156";
        Location : Record "14";
        FaultReasonCode : Record "5917";
        Currency : Record "4";
        CurrExchRate : Record "330";
        TempTrackingSpecification : Record "336" temporary;
        SKU : Record "5700";
        DimMgt : Codeunit "408";
        SalesTaxCalculate : Codeunit "398";
        UOMMgt : Codeunit "5402";
        NonstockItemMgt : Codeunit "5703";
        ReserveServLine : Codeunit "99000842";
        WhseValidateSourceLine : Codeunit "5777";
        Select : Integer;
        FullAutoReservation : Boolean;
        HideReplacementDialog : Boolean;
        Text022 : TextConst ENU='The %1 cannot be greater than the %2 set on the %3.',FRA='Le %1 ne peut pas être supérieur au %2 défini sur le %3.';
        Text023 : TextConst ENU='You must enter a serial number.',FRA='Vous devez entrer un numéro de série.';
        ReplaceServItemAction : Boolean;
        Text026 : TextConst ENU='When replacing or creating a service item component you may only enter a whole number into the %1 field.',FRA='Lorsque vous remplacez ou créez un composant article de service, vous ne pouvez entrer qu''un entier dans le champ %1.';
        Text027 : TextConst ENU='The %1 %2 with a check mark in the %3 field cannot be entered if the service line type is other than Item or Resource.',FRA='Le/la %1 %2 activé(e) dans le champ %3 ne peut pas être entré(e) si le type de ligne service est différent d''Article ou de Ressource.';
        Text028 : TextConst ENU='You cannot consume more than %1 units.',FRA='Vous ne pouvez pas consommer plus de %1 unités.';
        Text029 : TextConst ENU='must be positive',FRA='doit être de signe positif';
        Text030 : TextConst ENU='must be negative',FRA='doit être de signe négatif';
        Text031 : TextConst ENU='You must specify %1.',FRA='Vous devez spécifier une valeur %1.';
        Text032 : TextConst ENU='You cannot consume more than %1 base units.',FRA='Vous ne pouvez pas consommer plus de %1 unités de base.';
        Text033 : TextConst ENU='The line you are trying to change has the adjusted price.\',FRA='La ligne que vous tentez de modifier a le prix ajusté.\';
        Text034 : TextConst ENU='Do you want to continue?',FRA='Souhaitez-vous continuer ?';
        Text035 : TextConst ENU='Warehouse',FRA='Entrepôt';
        Text036 : TextConst ENU='Inventory',FRA='Stocks';
        Text037 : TextConst ENU='You cannot change %1 when %2 is %3 and %4 is positive.',FRA='Vous ne pouvez pas modifier %1 si %2 est %3 et si %4 est de signe positif.';
        Text038 : TextConst ENU='You cannot change %1 when %2 is %3 and %4 is negative.',FRA='Vous ne pouvez pas modifier %1 si %2 est %3 et si %4 est de signe négatif.';
        Text039 : TextConst ENU='You cannot return more than %1 units for %2 %3.',FRA='Vous ne pouvez pas retourner plus de %1 unité(s) pour %2 %3.';
        Text040 : TextConst ENU='You must use form %1 to enter %2, if item tracking is used.',FRA='Si vous utilisez la traçabilité, vous devez employer le formulaire %1 pour entrer %2.';
        Text041 : TextConst ENU='There were no Resource Lines to split.',FRA='Aucune ligne ressource ne doit être éclatée.';
        Text042 : TextConst ENU='When posting the Applied to Ledger Entry %1 will be opened first',FRA='Lors de la validation, l''écriture comptable lettrée %1 s''ouvre d''abord';
        HideCostWarning : Boolean;
        HideWarrantyWarning : Boolean;
        Text043 : TextConst ENU='You cannot change the value of the %1 field manually if %2 for this line is %3.',FRA='Vous ne pouvez pas modifier manuellement la valeur du champ %1 si %2 pour cette ligne est %3.';
        Text044 : TextConst ENU='Do you want to split the resource line and use it to create resource lines\for the other service items with divided amounts?',FRA='Souhaitez vous répartir la ligne ressource et l''utiliser pour créer des lignes ressource\pour les autres articles de service avec un montant partagé ?';
        Text045 : TextConst ENU='You cannot delete this service line because one or more service entries exist for this line.',FRA='Impossible de supprimer cette ligne service car une ou plusieurs écritures service existent pour cette ligne.';
        Text046 : TextConst ENU='You cannot change the %1 when the %2 has been filled in.',FRA='Vous ne pouvez pas modifier le champ %1 lorsque le champ %2 a été renseigné.';
        Text047 : TextConst ENU='%1 can only be set when %2 is set.',FRA='%1 ne peut être déterminé que si %2 est défini.';
        Text048 : TextConst ENU='%1 cannot be changed when %2 is set.',FRA='%1 ne peut pas être modifié si %2 est défini.';
        Text049 : TextConst Comment='Example: Inventory put-away is required for Line 50000.',ENU='%1 is required for %2 = %3.',FRA='%1 est nécessaire pour %2 = %3.';
        Text050 : TextConst ENU='\The entered information may be disregarded by warehouse operations.',FRA='\Les informations entrées peuvent être ignorées par les opérations de distribution.';
        StatusCheckSuspended : Boolean;
        Text051 : TextConst ENU='You cannot add an item line.',FRA='Vous ne pouvez pas ajouter une ligne article.';
        Text052 : TextConst ENU='You cannot change the %1 field because one or more service entries exist for this line.',FRA='Vous ne pouvez pas modifier le champ %1 car il existe une ou plusieurs écritures service pour cette ligne.';
        Text053 : TextConst ENU='You cannot modify the service line because one or more service entries exist for this line.',FRA='Vous ne pouvez pas modifier la ligne service car il existe au moins une écriture service pour cette ligne.';
        IsCustCrLimitChecked : Boolean;
        LocationChangedMsg : TextConst Comment='%1 = Item No., %2 = Item serial No., %3 = Location code',ENU='Item %1 with serial number %2 is stored on location %3. The Location Code field on the service line will be updated.',FRA='L''article %1 avec le n° de série %2 est stocké dans le magasin %3. Le champ Code magasin de la ligne service va être mis à jour.';
        LineDiscountPctErr : TextConst ENU='The value in the Line Discount % field must be between 0 and 100.',FRA='La valeur du champ % remise ligne doit être comprise entre 0 et 100.';
        TXT50000 : Label 'Vous ne pouvez pas créer deux lignes avec le même code article %1.';
        TXT50001 : Label 'Vous ne pouvez pas supprimer une ligne avec avec une Qté demandée ou Qté expédiée différente de Zéro.';
        RecGLaborStdTime : Record "60029";
        TXT50002 : Label 'Vous ne pouvez pas modifier une ligne avec avec une Qté demandée différente de Zéro.';
        TXT50003 : Label 'Vous ne pouvez pas créer deux lignes avec le même code Ressource %1.';
        TXT50004 : Label 'Vous n''avez pas l''autorisation approbation Garantie.';
        RecLUserSetup : Record "91";
        TXT50005 : Label 'Ligne doit être de type Article.';
        CSTError001 : Label 'Vous ne pouvez pas ajouter de nouveaux lignes, une Expedition validé (%1) existe déja!';
        DMManagement : Codeunit "50005";
        GLSetup : Record "98";
        RecGInventorySetup : Record "313";
        Txt50006 : Label 'Cette fonction ne peut être appeler depuis la société %1.';
        GRecPurchaseHeader : Record "38";
        Txt50007 : Label 'Suppression interdite après création de commande d''achat';
        ShowReplcmt : Boolean;
        WithoutReplcmtWindow : Boolean;
        ReplcmtChains : Record "70095";
        ReplcmtChains2 : Record "70095";
        ReplcmtByLocation : Page "70279";
        TXT50008 : Label 'L''Article %1 a été remplacée.  Voulez-vous voir le remplacement ?';
        TXT50009 : Label 'Voulez-vous voir le remplacement ?';
        CduItemavailability : Codeunit "70000";
        ServiceItemLineKK : Record "5901";
        ServiceCostAK : Record "5905";
        TxtErr001 : Label '"Il existe plusieurs campagnes promotionnelles encours ! Veuillez contacter votre administrateur ! "';
        CompagneDisCount : Decimal;
        Itemavailability : Codeunit "70000";
}

