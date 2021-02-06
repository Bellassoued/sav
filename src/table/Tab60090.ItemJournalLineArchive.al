table 60090 "Item Journal Line Archive"
{
    // version NAVW19.00.00.45834,NAVFR9.00.00.45834,CT16V001

    CaptionML = ENU='Item Journal Line',
                FRA='Ligne feuille article';
    DrillDownPageID = 519;
    LookupPageID = 519;

    fields
    {
        field(1;"Journal Template Name";Code[10])
        {
            CaptionML = ENU='Journal Template Name',
                        FRA='Nom modèle feuille';
            TableRelation = "Item Journal Template";
        }
        field(2;"Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne';
        }
        field(3;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.',
                        FRA='N° article';
            TableRelation = Item;

            trigger OnValidate();
            var
                ProdOrderLine : Record "5406";
                ProdOrderComp : Record "5407";
            begin
            end;
        }
        field(4;"Posting Date";Date)
        {
            CaptionML = ENU='Posting Date',
                        FRA='Date comptabilisation';

            trigger OnValidate();
            var
                CheckDateConflict : Codeunit "99000815";
            begin
            end;
        }
        field(5;"Entry Type";Option)
        {
            CaptionML = ENU='Entry Type',
                        FRA='Type écriture';
            OptionCaptionML = ENU='Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer,Consumption,Output, ,Assembly Consumption,Assembly Output',
                              FRA='Achat,Vente,Positif (ajust.),Négatif (ajust.),Transfert,Consommation,Production, ,Consommation d''assemblage,Résultat d''assemblage';
            OptionMembers = Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output," ","Assembly Consumption","Assembly Output";
        }
        field(6;"Source No.";Code[20])
        {
            CaptionML = ENU='Source No.',
                        FRA='N° origine';
            Editable = false;
            TableRelation = IF (Source Type=CONST(Customer)) Customer WHERE (Statut=FILTER(Validated))
                            ELSE IF (Source Type=CONST(Vendor)) Vendor WHERE (Statut=FILTER(Validé))
                            ELSE IF (Source Type=CONST(Item)) Item;
        }
        field(7;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° document';
        }
        field(8;Description;Text[100])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
        }
        field(9;"Location Code";Code[10])
        {
            CaptionML = ENU='Location Code',
                        FRA='Code magasin';
            TableRelation = Location;
        }
        field(10;"Inventory Posting Group";Code[10])
        {
            CaptionML = ENU='Inventory Posting Group',
                        FRA='Groupe compta. stock';
            Editable = false;
            TableRelation = "Inventory Posting Group";
        }
        field(11;"Source Posting Group";Code[10])
        {
            CaptionML = ENU='Source Posting Group',
                        FRA='Groupe compta. origine';
            Editable = false;
            TableRelation = IF (Source Type=CONST(Customer)) "Customer Posting Group"
                            ELSE IF (Source Type=CONST(Vendor)) "Vendor Posting Group"
                            ELSE IF (Source Type=CONST(Item)) "Inventory Posting Group";
        }
        field(13;Quantity;Decimal)
        {
            CaptionML = ENU='Quantity',
                        FRA='Quantité';
            DecimalPlaces = 0:5;

            trigger OnValidate();
            var
                CallWhseCheck : Boolean;
            begin
            end;
        }
        field(15;"Invoiced Quantity";Decimal)
        {
            CaptionML = ENU='Invoiced Quantity',
                        FRA='Quantité facturée';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(16;"Unit Amount";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Unit Amount',
                        FRA='Montant unitaire';
        }
        field(17;"Unit Cost";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Unit Cost',
                        FRA='Coût unitaire';
        }
        field(18;Amount;Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Amount',
                        FRA='Montant';
        }
        field(22;"Discount Amount";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Discount Amount',
                        FRA='Montant remise';
            Editable = false;
        }
        field(23;"Salespers./Purch. Code";Code[10])
        {
            CaptionML = ENU='Salespers./Purch. Code',
                        FRA='Code vendeur/acheteur';
            TableRelation = Salesperson/Purchaser;
        }
        field(26;"Source Code";Code[10])
        {
            CaptionML = ENU='Source Code',
                        FRA='Code journal';
            TableRelation = "Source Code";
        }
        field(29;"Applies-to Entry";Integer)
        {
            CaptionML = ENU='Applies-to Entry',
                        FRA='Ecriture lettrage';

            trigger OnValidate();
            var
                ItemLedgEntry : Record "32";
                ItemTrackingLines : Page "6510";
            begin
            end;
        }
        field(32;"Item Shpt. Entry No.";Integer)
        {
            CaptionML = ENU='Item Shpt. Entry No.',
                        FRA='N° séquence expéd. article';
            Editable = false;
        }
        field(34;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            CaptionML = ENU='Shortcut Dimension 1 Code',
                        FRA='Code raccourci axe 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));
        }
        field(35;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            CaptionML = ENU='Shortcut Dimension 2 Code',
                        FRA='Code raccourci axe 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2));
        }
        field(37;"Indirect Cost %";Decimal)
        {
            CaptionML = ENU='Indirect Cost %',
                        FRA='% coût indirect';
            DecimalPlaces = 0:5;
            MinValue = 0;
        }
        field(39;"Source Type";Option)
        {
            CaptionML = ENU='Source Type',
                        FRA='Type origine';
            Editable = false;
            OptionCaptionML = ENU=' ,Customer,Vendor,Item',
                              FRA=' ,Client,Fournisseur,Article';
            OptionMembers = " ",Customer,Vendor,Item;
        }
        field(41;"Journal Batch Name";Code[10])
        {
            CaptionML = ENU='Journal Batch Name',
                        FRA='Nom feuille';
            TableRelation = "Item Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name));
        }
        field(42;"Reason Code";Code[10])
        {
            CaptionML = ENU='Reason Code',
                        FRA='Code motif';
            TableRelation = "Reason Code";
        }
        field(43;"Recurring Method";Option)
        {
            BlankZero = true;
            CaptionML = ENU='Recurring Method',
                        FRA='Mode abonnement';
            OptionCaptionML = ENU=',Fixed,Variable',
                              FRA=',Fixe,Variable';
            OptionMembers = ,"Fixed",Variable;
        }
        field(44;"Expiration Date";Date)
        {
            CaptionML = ENU='Expiration Date',
                        FRA='Date d''expiration';
        }
        field(45;"Recurring Frequency";DateFormula)
        {
            CaptionML = ENU='Recurring Frequency',
                        FRA='Périodicité abonnement';
        }
        field(46;"Drop Shipment";Boolean)
        {
            AccessByPermission = TableData 223=R;
            CaptionML = ENU='Drop Shipment',
                        FRA='Livraison directe';
            Editable = false;
        }
        field(47;"Transaction Type";Code[10])
        {
            CaptionML = ENU='Transaction Type',
                        FRA='Nature transaction';
            TableRelation = "Transaction Type";
        }
        field(48;"Transport Method";Code[10])
        {
            CaptionML = ENU='Transport Method',
                        FRA='Mode de transport';
            TableRelation = "Transport Method";
        }
        field(49;"Country/Region Code";Code[10])
        {
            CaptionML = ENU='Country/Region Code',
                        FRA='Code pays/région';
            TableRelation = Country/Region;
        }
        field(50;"New Location Code";Code[10])
        {
            CaptionML = ENU='New Location Code',
                        FRA='Nouveau code magasin';
            TableRelation = Location;
        }
        field(51;"New Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1,';
            CaptionML = ENU='New Shortcut Dimension 1 Code',
                        FRA='Nouveau code raccourci axe 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));
        }
        field(52;"New Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2,';
            CaptionML = ENU='New Shortcut Dimension 2 Code',
                        FRA='Nouveau code raccourci axe 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2));
        }
        field(53;"Qty. (Calculated)";Decimal)
        {
            CaptionML = ENU='Qty. (Calculated)',
                        FRA='Qté (calculée)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(54;"Qty. (Phys. Inventory)";Decimal)
        {
            CaptionML = ENU='Qty. (Phys. Inventory)',
                        FRA='Qté (constatée)';
            DecimalPlaces = 0:5;
        }
        field(55;"Last Item Ledger Entry No.";Integer)
        {
            CaptionML = ENU='Last Item Ledger Entry No.',
                        FRA='Dern. n° écriture comptable article';
            Editable = false;
            TableRelation = "Item Ledger Entry";
            //This property is currently not supported
            //TestTableRelation = false;
        }
        field(56;"Phys. Inventory";Boolean)
        {
            CaptionML = ENU='Phys. Inventory',
                        FRA='Inventaire phys.';
            Editable = false;
        }
        field(57;"Gen. Bus. Posting Group";Code[10])
        {
            CaptionML = ENU='Gen. Bus. Posting Group',
                        FRA='Groupe compta. marché';
            TableRelation = "Gen. Business Posting Group";
        }
        field(58;"Gen. Prod. Posting Group";Code[10])
        {
            CaptionML = ENU='Gen. Prod. Posting Group',
                        FRA='Groupe compta. produit';
            TableRelation = "Gen. Product Posting Group";
        }
        field(59;"Entry/Exit Point";Code[10])
        {
            CaptionML = ENU='Entry/Exit Point',
                        FRA='Pays destination/provenance';
            TableRelation = "Entry/Exit Point";
        }
        field(60;"Document Date";Date)
        {
            CaptionML = ENU='Document Date',
                        FRA='Date document';
        }
        field(62;"External Document No.";Code[35])
        {
            CaptionML = ENU='External Document No.',
                        FRA='N° doc. externe';
        }
        field(63;"Area";Code[10])
        {
            CaptionML = ENU='Area',
                        FRA='Dépt destination/provenance';
            TableRelation = Area;
        }
        field(64;"Transaction Specification";Code[10])
        {
            CaptionML = ENU='Transaction Specification',
                        FRA='Régime';
            TableRelation = "Transaction Specification";
        }
        field(65;"Posting No. Series";Code[10])
        {
            CaptionML = ENU='Posting No. Series',
                        FRA='Souches de n° validation';
            TableRelation = "No. Series";
        }
        field(68;"Reserved Quantity";Decimal)
        {
            AccessByPermission = TableData 120=R;
            CalcFormula = Sum("Reservation Entry".Quantity WHERE (Source ID=FIELD(Journal Template Name),
                                                                  Source Ref. No.=FIELD(Line No.),
                                                                  Source Type=CONST(83),
                                                                  Source Subtype=FIELD(Entry Type),
                                                                  Source Batch Name=FIELD(Journal Batch Name),
                                                                  Source Prod. Order Line=CONST(0),
                                                                  Reservation Status=CONST(Reservation)));
            CaptionML = ENU='Reserved Quantity',
                        FRA='Quantité réservée';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(72;"Unit Cost (ACY)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Unit Cost (ACY)',
                        FRA='Coût unitaire DR';
            Editable = false;
        }
        field(73;"Source Currency Code";Code[10])
        {
            AccessByPermission = TableData 223=R;
            CaptionML = ENU='Source Currency Code',
                        FRA='Code devise origine';
            Editable = false;
            TableRelation = Currency;
        }
        field(79;"Document Type";Option)
        {
            CaptionML = ENU='Document Type',
                        FRA='Type document';
            OptionCaptionML = ENU=' ,Sales Shipment,Sales Invoice,Sales Return Receipt,Sales Credit Memo,Purchase Receipt,Purchase Invoice,Purchase Return Shipment,Purchase Credit Memo,Transfer Shipment,Transfer Receipt,Service Shipment,Service Invoice,Service Credit Memo,Posted Assembly',
                              FRA=' ,Expédition vente,Facture vente,Réception retour vente,Avoir vente,Réception achat,Facture achat,Expédition retour achat,Avoir achat,Expédition transfert,Réception transfert,Expédition service,Facture service,Avoir service,Assemblage validé';
            OptionMembers = " ","Sales Shipment","Sales Invoice","Sales Return Receipt","Sales Credit Memo","Purchase Receipt","Purchase Invoice","Purchase Return Shipment","Purchase Credit Memo","Transfer Shipment","Transfer Receipt","Service Shipment","Service Invoice","Service Credit Memo","Posted Assembly";
        }
        field(80;"Document Line No.";Integer)
        {
            CaptionML = ENU='Document Line No.',
                        FRA='N° ligne document';
        }
        field(90;"Order Type";Option)
        {
            CaptionML = ENU='Order Type',
                        FRA='Type de commande';
            Editable = false;
            OptionCaptionML = ENU=' ,Production,Transfer,Service,Assembly',
                              FRA=' ,Production,Transfert,Service,Assemblage';
            OptionMembers = " ",Production,Transfer,Service,Assembly;
        }
        field(91;"Order No.";Code[20])
        {
            CaptionML = ENU='Order No.',
                        FRA='N° commande';
            TableRelation = IF (Order Type=CONST(Production)) "Production Order".No. WHERE (Status=CONST(Released));

            trigger OnValidate();
            var
                AssemblyHeader : Record "900";
                ProdOrder : Record "5405";
                ProdOrderLine : Record "5406";
            begin
            end;
        }
        field(92;"Order Line No.";Integer)
        {
            CaptionML = ENU='Order Line No.',
                        FRA='N° ligne commande';
            TableRelation = IF (Order Type=CONST(Production)) "Prod. Order Line"."Line No." WHERE (Status=CONST(Released),
                                                                                                   Prod. Order No.=FIELD(Order No.));

            trigger OnValidate();
            var
                ProdOrderLine : Record "5406";
            begin
            end;
        }
        field(480;"Dimension Set ID";Integer)
        {
            CaptionML = ENU='Dimension Set ID',
                        FRA='ID ensemble de dimensions';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(481;"New Dimension Set ID";Integer)
        {
            CaptionML = ENU='New Dimension Set ID',
                        FRA='ID du nouvel ensemble de dimensions';
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(904;"Assemble to Order";Boolean)
        {
            CaptionML = ENU='Assemble to Order',
                        FRA='Assembler pour commande';
            Editable = false;
        }
        field(1000;"Job No.";Code[20])
        {
            CaptionML = ENU='Job No.',
                        FRA='N° projet';
        }
        field(1001;"Job Task No.";Code[20])
        {
            CaptionML = ENU='Job Task No.',
                        FRA='N° tâche projet';
        }
        field(1002;"Job Purchase";Boolean)
        {
            CaptionML = ENU='Job Purchase',
                        FRA='Achat projet';
        }
        field(1030;"Job Contract Entry No.";Integer)
        {
            CaptionML = ENU='Job Contract Entry No.',
                        FRA='N° séquence contrat projet';
            Editable = false;
        }
        field(5402;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code variante';
            TableRelation = "Item Variant".Code WHERE (Item No.=FIELD(Item No.));
        }
        field(5403;"Bin Code";Code[20])
        {
            CaptionML = ENU='Bin Code',
                        FRA='Code emplacement';
            TableRelation = IF (Entry Type=FILTER(Purchase|Positive Adjmt.|Output),
                                Quantity=FILTER(>=0)) Bin.Code WHERE (Location Code=FIELD(Location Code),
                                                                      Item Filter=FIELD(Item No.),
                                                                      Variant Filter=FIELD(Variant Code))
                                                                      ELSE IF (Entry Type=FILTER(Purchase|Positive Adjmt.|Output),
                                                                               Quantity=FILTER(<0)) "Bin Content"."Bin Code" WHERE (Location Code=FIELD(Location Code),
                                                                                                                                    Item No.=FIELD(Item No.),
                                                                                                                                    Variant Code=FIELD(Variant Code))
                                                                                                                                    ELSE IF (Entry Type=FILTER(Sale|Negative Adjmt.|Transfer|Consumption),
                                                                                                                                             Quantity=FILTER(>0)) "Bin Content"."Bin Code" WHERE (Location Code=FIELD(Location Code),
                                                                                                                                                                                                  Item No.=FIELD(Item No.),
                                                                                                                                                                                                  Variant Code=FIELD(Variant Code))
                                                                                                                                                                                                  ELSE IF (Entry Type=FILTER(Sale|Negative Adjmt.|Transfer|Consumption),
                                                                                                                                                                                                           Quantity=FILTER(<=0)) Bin.Code WHERE (Location Code=FIELD(Location Code),
                                                                                                                                                                                                                                                 Item Filter=FIELD(Item No.),
                                                                                                                                                                                                                                                 Variant Filter=FIELD(Variant Code));

            trigger OnValidate();
            var
                ProdOrderComp : Record "5407";
                WhseIntegrationMgt : Codeunit "7317";
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
        field(5406;"New Bin Code";Code[20])
        {
            CaptionML = ENU='New Bin Code',
                        FRA='Nouveau code emplacement';
            TableRelation = Bin.Code WHERE (Location Code=FIELD(New Location Code),
                                            Item Filter=FIELD(Item No.),
                                            Variant Filter=FIELD(Variant Code));

            trigger OnValidate();
            var
                WhseIntegrationMgt : Codeunit "7317";
            begin
            end;
        }
        field(5407;"Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Unit of Measure Code',
                        FRA='Code unité';
            TableRelation = "Item Unit of Measure".Code WHERE (Item No.=FIELD(Item No.));
        }
        field(5408;"Derived from Blanket Order";Boolean)
        {
            CaptionML = ENU='Derived from Blanket Order',
                        FRA='Issue de commande ouverte';
            Editable = false;
        }
        field(5413;"Quantity (Base)";Decimal)
        {
            CaptionML = ENU='Quantity (Base)',
                        FRA='Quantité (base)';
            DecimalPlaces = 0:5;
        }
        field(5415;"Invoiced Qty. (Base)";Decimal)
        {
            CaptionML = ENU='Invoiced Qty. (Base)',
                        FRA='Quantité facturée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(5468;"Reserved Qty. (Base)";Decimal)
        {
            AccessByPermission = TableData 120=R;
            CalcFormula = Sum("Reservation Entry"."Quantity (Base)" WHERE (Source ID=FIELD(Journal Template Name),
                                                                           Source Ref. No.=FIELD(Line No.),
                                                                           Source Type=CONST(83),
                                                                           Source Subtype=FIELD(Entry Type),
                                                                           Source Batch Name=FIELD(Journal Batch Name),
                                                                           Source Prod. Order Line=CONST(0),
                                                                           Reservation Status=CONST(Reservation)));
            CaptionML = ENU='Reserved Qty. (Base)',
                        FRA='Quantité réservée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5560;Level;Integer)
        {
            CaptionML = ENU='Level',
                        FRA='Niveau';
            Editable = false;
        }
        field(5561;"Flushing Method";Option)
        {
            CaptionML = ENU='Flushing Method',
                        FRA='Méthode consommation';
            Editable = false;
            OptionCaptionML = ENU='Manual,Forward,Backward,Pick + Forward,Pick + Backward',
                              FRA='Manuelle,Pré-déduction,Post-déduction,Prélèvement + Pré-déduction,Prélèvement + Post-déduction';
            OptionMembers = Manual,Forward,Backward,"Pick + Forward","Pick + Backward";
        }
        field(5562;"Changed by User";Boolean)
        {
            CaptionML = ENU='Changed by User',
                        FRA='Modifié par l''utilisateur';
            Editable = false;
        }
        field(5700;"Cross-Reference No.";Code[20])
        {
            CaptionML = ENU='Cross-Reference No.',
                        FRA='Référence externe';
        }
        field(5701;"Originally Ordered No.";Code[20])
        {
            AccessByPermission = TableData 5715=R;
            CaptionML = ENU='Originally Ordered No.',
                        FRA='N° article substitué';
            TableRelation = Item;
        }
        field(5702;"Originally Ordered Var. Code";Code[10])
        {
            AccessByPermission = TableData 5715=R;
            CaptionML = ENU='Originally Ordered Var. Code',
                        FRA='Code variante substitué';
            TableRelation = "Item Variant".Code WHERE (Item No.=FIELD(Originally Ordered No.));
        }
        field(5703;"Out-of-Stock Substitution";Boolean)
        {
            CaptionML = ENU='Out-of-Stock Substitution',
                        FRA='Substitution sur rupture';
        }
        field(5704;"Item Category Code";Code[10])
        {
            CaptionML = ENU='Item Category Code',
                        FRA='Code catégorie article';
            TableRelation = "Item Category";
        }
        field(5705;Nonstock;Boolean)
        {
            CaptionML = ENU='Nonstock',
                        FRA='Non stocké';
        }
        field(5706;"Purchasing Code";Code[10])
        {
            AccessByPermission = TableData 223=R;
            CaptionML = ENU='Purchasing Code',
                        FRA='Procédure achat';
            TableRelation = Purchasing;
        }
        field(5707;"Product Group Code";Code[10])
        {
            CaptionML = ENU='Product Group Code',
                        FRA='Code groupe produits';
            TableRelation = "Product Group".Code WHERE (Item Category Code=FIELD(Item Category Code));
        }
        field(5791;"Planned Delivery Date";Date)
        {
            CaptionML = ENU='Planned Delivery Date',
                        FRA='Date livraison planifiée';
        }
        field(5793;"Order Date";Date)
        {
            CaptionML = ENU='Order Date',
                        FRA='Date commande';
        }
        field(5800;"Value Entry Type";Option)
        {
            CaptionML = ENU='Value Entry Type',
                        FRA='Type écriture valeur';
            OptionCaptionML = ENU='Direct Cost,Revaluation,Rounding,Indirect Cost,Variance',
                              FRA='Coût direct,Réévaluation,Arrondi,Coût indirect,Écart';
            OptionMembers = "Direct Cost",Revaluation,Rounding,"Indirect Cost",Variance;
        }
        field(5801;"Item Charge No.";Code[20])
        {
            CaptionML = ENU='Item Charge No.',
                        FRA='N° frais annexes';
            TableRelation = "Item Charge";
        }
        field(5802;"Inventory Value (Calculated)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Inventory Value (Calculated)',
                        FRA='Valeur stock (calculée)';
            Editable = false;
        }
        field(5803;"Inventory Value (Revalued)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Inventory Value (Revalued)',
                        FRA='Valeur stock (réévaluée)';
            MinValue = 0;
        }
        field(5804;"Variance Type";Option)
        {
            CaptionML = ENU='Variance Type',
                        FRA='Type écart';
            OptionCaptionML = ENU=' ,Purchase,Material,Capacity,Capacity Overhead,Manufacturing Overhead',
                              FRA=' ,Achat,Matière,Opératoire,Frais généraux opératoires,Frais généraux matière';
            OptionMembers = " ",Purchase,Material,Capacity,"Capacity Overhead","Manufacturing Overhead";
        }
        field(5805;"Inventory Value Per";Option)
        {
            CaptionML = ENU='Inventory Value Per',
                        FRA='Valeur stock par';
            Editable = false;
            OptionCaptionML = ENU=' ,Item,Location,Variant,Location and Variant',
                              FRA=' ,Article,Magasin,Variante,Magasin et variante';
            OptionMembers = " ",Item,Location,Variant,"Location and Variant";
        }
        field(5806;"Partial Revaluation";Boolean)
        {
            CaptionML = ENU='Partial Revaluation',
                        FRA='Réévaluation partielle';
            Editable = false;
        }
        field(5807;"Applies-from Entry";Integer)
        {
            CaptionML = ENU='Applies-from Entry',
                        FRA='Lettrage à partir écriture';
            MinValue = 0;

            trigger OnValidate();
            var
                ItemLedgEntry : Record "32";
                ItemTrackingLines : Page "6510";
            begin
            end;
        }
        field(5808;"Invoice No.";Code[20])
        {
            CaptionML = ENU='Invoice No.',
                        FRA='N° facture';
        }
        field(5809;"Unit Cost (Calculated)";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Unit Cost (Calculated)',
                        FRA='Coût unitaire (calculé)';
            Editable = false;
        }
        field(5810;"Unit Cost (Revalued)";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Unit Cost (Revalued)',
                        FRA='Coût unitaire (réévalué)';
            MinValue = 0;
        }
        field(5811;"Applied Amount";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Applied Amount',
                        FRA='Montant lettré';
            Editable = false;
        }
        field(5812;"Update Standard Cost";Boolean)
        {
            CaptionML = ENU='Update Standard Cost',
                        FRA='MAJ coût standard';
        }
        field(5813;"Amount (ACY)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Amount (ACY)',
                        FRA='Montant DR';
        }
        field(5817;Correction;Boolean)
        {
            CaptionML = ENU='Correction',
                        FRA='Correction';
        }
        field(5818;Adjustment;Boolean)
        {
            CaptionML = ENU='Adjustment',
                        FRA='Ajustement';
        }
        field(5819;"Applies-to Value Entry";Integer)
        {
            CaptionML = ENU='Applies-to Value Entry',
                        FRA='Ecriture valeur lettrage';
        }
        field(5820;"Invoice-to Source No.";Code[20])
        {
            CaptionML = ENU='Invoice-to Source No.',
                        FRA='N° origine facturation';
            TableRelation = IF (Source Type=CONST(Customer)) Customer
                            ELSE IF (Source Type=CONST(Vendor)) Vendor;
        }
        field(5830;Type;Option)
        {
            AccessByPermission = TableData 99000758=R;
            CaptionML = ENU='Type',
                        FRA='Type';
            OptionCaptionML = ENU='Work Center,Machine Center, ,Resource',
                              FRA='Centre de charge,Poste de charge, ,Ressource';
            OptionMembers = "Work Center","Machine Center"," ",Resource;
        }
        field(5831;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            TableRelation = IF (Type=CONST(Machine Center)) "Machine Center"
                            ELSE IF (Type=CONST(Work Center)) "Work Center"
                            ELSE IF (Type=CONST(Resource)) Resource;

            trigger OnValidate();
            var
                Resource : Record "156";
            begin
            end;
        }
        field(5838;"Operation No.";Code[10])
        {
            CaptionML = ENU='Operation No.',
                        FRA='N° opération';
            TableRelation = IF (Order Type=CONST(Production)) "Prod. Order Routing Line"."Operation No." WHERE (Status=CONST(Released),
                                                                                                                Prod. Order No.=FIELD(Order No.),
                                                                                                                Routing No.=FIELD(Routing No.),
                                                                                                                Routing Reference No.=FIELD(Routing Reference No.));

            trigger OnValidate();
            var
                ProdOrderRtngLine : Record "5409";
            begin
            end;
        }
        field(5839;"Work Center No.";Code[20])
        {
            CaptionML = ENU='Work Center No.',
                        FRA='N° centre de charge';
            Editable = false;
            TableRelation = "Work Center";
        }
        field(5841;"Setup Time";Decimal)
        {
            AccessByPermission = TableData 99000758=R;
            CaptionML = ENU='Setup Time',
                        FRA='Temps de préparation';
            DecimalPlaces = 0:5;
        }
        field(5842;"Run Time";Decimal)
        {
            AccessByPermission = TableData 99000758=R;
            CaptionML = ENU='Run Time',
                        FRA='Temps d''exécution';
            DecimalPlaces = 0:5;
        }
        field(5843;"Stop Time";Decimal)
        {
            AccessByPermission = TableData 99000758=R;
            CaptionML = ENU='Stop Time',
                        FRA='Temps d''arrêt';
            DecimalPlaces = 0:5;
        }
        field(5846;"Output Quantity";Decimal)
        {
            AccessByPermission = TableData 99000758=R;
            CaptionML = ENU='Output Quantity',
                        FRA='Quantité produite';
            DecimalPlaces = 0:5;
        }
        field(5847;"Scrap Quantity";Decimal)
        {
            AccessByPermission = TableData 99000758=R;
            CaptionML = ENU='Scrap Quantity',
                        FRA='Quantité perte';
            DecimalPlaces = 0:5;
        }
        field(5849;"Concurrent Capacity";Decimal)
        {
            AccessByPermission = TableData 99000758=R;
            CaptionML = ENU='Concurrent Capacity',
                        FRA='Capacité simultanée';
            DecimalPlaces = 0:5;

            trigger OnValidate();
            var
                TotalTime : Integer;
            begin
            end;
        }
        field(5851;"Setup Time (Base)";Decimal)
        {
            CaptionML = ENU='Setup Time (Base)',
                        FRA='Temps de préparation (base)';
            DecimalPlaces = 0:5;
        }
        field(5852;"Run Time (Base)";Decimal)
        {
            CaptionML = ENU='Run Time (Base)',
                        FRA='Temps d''exécution (base)';
            DecimalPlaces = 0:5;
        }
        field(5853;"Stop Time (Base)";Decimal)
        {
            CaptionML = ENU='Stop Time (Base)',
                        FRA='Temps d''arrêt (base)';
            DecimalPlaces = 0:5;
        }
        field(5856;"Output Quantity (Base)";Decimal)
        {
            CaptionML = ENU='Output Quantity (Base)',
                        FRA='Quantité produite (base)';
            DecimalPlaces = 0:5;
        }
        field(5857;"Scrap Quantity (Base)";Decimal)
        {
            CaptionML = ENU='Scrap Quantity (Base)',
                        FRA='Quantité perte (base)';
            DecimalPlaces = 0:5;
        }
        field(5858;"Cap. Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Cap. Unit of Measure Code',
                        FRA='Code unité capacité';
            TableRelation = IF (Type=CONST(Resource)) "Resource Unit of Measure".Code WHERE (Resource No.=FIELD(No.))
                            ELSE "Capacity Unit of Measure";

            trigger OnValidate();
            var
                ProdOrderRtngLine : Record "5409";
            begin
            end;
        }
        field(5859;"Qty. per Cap. Unit of Measure";Decimal)
        {
            CaptionML = ENU='Qty. per Cap. Unit of Measure',
                        FRA='Quantité par unité capacité';
            DecimalPlaces = 0:5;
        }
        field(5873;"Starting Time";Time)
        {
            AccessByPermission = TableData 99000758=R;
            CaptionML = ENU='Starting Time',
                        FRA='Heure début';
        }
        field(5874;"Ending Time";Time)
        {
            AccessByPermission = TableData 99000758=R;
            CaptionML = ENU='Ending Time',
                        FRA='Heure fin';
        }
        field(5882;"Routing No.";Code[20])
        {
            CaptionML = ENU='Routing No.',
                        FRA='N° gamme';
            Editable = false;
            TableRelation = "Routing Header";
        }
        field(5883;"Routing Reference No.";Integer)
        {
            CaptionML = ENU='Routing Reference No.',
                        FRA='N° référence gamme';
        }
        field(5884;"Prod. Order Comp. Line No.";Integer)
        {
            CaptionML = ENU='Prod. Order Comp. Line No.',
                        FRA='N° ligne composant O.F.';
            TableRelation = IF (Order Type=CONST(Production)) "Prod. Order Component"."Line No." WHERE (Status=CONST(Released),
                                                                                                        Prod. Order No.=FIELD(Order No.),
                                                                                                        Prod. Order Line No.=FIELD(Order Line No.));
        }
        field(5885;Finished;Boolean)
        {
            AccessByPermission = TableData 99000758=R;
            CaptionML = ENU='Finished',
                        FRA='Terminé';
        }
        field(5887;"Unit Cost Calculation";Option)
        {
            CaptionML = ENU='Unit Cost Calculation',
                        FRA='Unité de coût';
            OptionCaptionML = ENU='Time,Units',
                              FRA='Temps,Quantité';
            OptionMembers = Time,Units;
        }
        field(5888;Subcontracting;Boolean)
        {
            CaptionML = ENU='Subcontracting',
                        FRA='Sous-traitance';
        }
        field(5895;"Stop Code";Code[10])
        {
            CaptionML = ENU='Stop Code',
                        FRA='Code arrêt';
            TableRelation = Stop;
        }
        field(5896;"Scrap Code";Code[10])
        {
            CaptionML = ENU='Scrap Code',
                        FRA='Code rebut';
            TableRelation = Scrap;
        }
        field(5898;"Work Center Group Code";Code[10])
        {
            CaptionML = ENU='Work Center Group Code',
                        FRA='Code groupe centres de charge';
            Editable = false;
            TableRelation = "Work Center Group";
        }
        field(5899;"Work Shift Code";Code[10])
        {
            CaptionML = ENU='Work Shift Code',
                        FRA='Code équipe';
            TableRelation = "Work Shift";
        }
        field(6500;"Serial No.";Code[20])
        {
            CaptionML = ENU='Serial No.',
                        FRA='N° de série';
            Editable = false;
        }
        field(6501;"Lot No.";Code[20])
        {
            CaptionML = ENU='Lot No.',
                        FRA='N° lot';
            Editable = false;
        }
        field(6502;"Warranty Date";Date)
        {
            CaptionML = ENU='Warranty Date',
                        FRA='Date garantie';
            Editable = false;
        }
        field(6503;"New Serial No.";Code[20])
        {
            CaptionML = ENU='New Serial No.',
                        FRA='Nouveau n° de série';
            Editable = false;
        }
        field(6504;"New Lot No.";Code[20])
        {
            CaptionML = ENU='New Lot No.',
                        FRA='Nouveau n° lot';
            Editable = false;
        }
        field(6505;"New Item Expiration Date";Date)
        {
            CaptionML = ENU='New Item Expiration Date',
                        FRA='Nouvelle date péremption article';
        }
        field(6506;"Item Expiration Date";Date)
        {
            CaptionML = ENU='Item Expiration Date',
                        FRA='Date péremption article';
            Editable = false;
        }
        field(6600;"Return Reason Code";Code[10])
        {
            CaptionML = ENU='Return Reason Code',
                        FRA='Code motif retour';
            TableRelation = "Return Reason";
        }
        field(7315;"Warehouse Adjustment";Boolean)
        {
            CaptionML = ENU='Warehouse Adjustment',
                        FRA='Ajustement entrepôt';
        }
        field(7380;"Phys Invt Counting Period Code";Code[10])
        {
            CaptionML = ENU='Phys Invt Counting Period Code',
                        FRA='Code période inventaire stock';
            Editable = false;
            TableRelation = "Phys. Invt. Counting Period";
        }
        field(7381;"Phys Invt Counting Period Type";Option)
        {
            CaptionML = ENU='Phys Invt Counting Period Type',
                        FRA='Type période inventaire';
            Editable = false;
            OptionCaptionML = ENU=' ,Item,SKU',
                              FRA=' ,Article,Point de stock';
            OptionMembers = " ",Item,SKU;
        }
        field(10800;"Shipment Method Code";Code[10])
        {
            CaptionML = ENU='Shipment Method Code',
                        FRA='Code condition livraison';
            TableRelation = "Shipment Method";
        }
        field(50000;"No dossier";Code[20])
        {
            CaptionML = ENU='Transit Folder No.',
                        FRA='N° Dossier Transit';
            TableRelation = "Dossiers Transit";
        }
        field(51000;"Apply Fodec";Boolean)
        {
            Description = 'STD V1.0';
        }
        field(51001;"Amount Fodec";Decimal)
        {
            Description = 'STD V1.0';
        }
        field(60000;"Count 1";Decimal)
        {
            Caption = 'Comptage 1';
            Description = 'SM MAZDA860';
        }
        field(60001;"CPT1 Posted";Boolean)
        {
            Caption = 'Comptage 1 Validé';
            Description = 'SM MAZDA860';
        }
        field(60002;"Count 2";Decimal)
        {
            Caption = 'Comptage 2';
            Description = 'SM MAZDA860';
        }
        field(60003;"CPT2 Posted";Boolean)
        {
            Caption = 'Comptage 2 Validé';
            Description = 'SM MAZDA860';
        }
        field(60004;"Count 3";Decimal)
        {
            Caption = 'Comptage 3';
            Description = 'SM MAZDA860';
        }
        field(60005;"CPT3 Posted";Boolean)
        {
            Caption = 'Comptage 3 Validé';
            Description = 'SM MAZDA860';
        }
        field(60006;"Ecart CPT1 / CPT2";Decimal)
        {
            Description = 'SM MAZDA860';
        }
        field(60007;"Ecart CPT3 / Calc";Decimal)
        {
            Description = 'SM MAZDA860';
        }
        field(60008;"Phys. Inventory To Post";Decimal)
        {
            Caption = 'Inventaire physique à valider';
            Description = 'SM MAZDA860';
        }
        field(60009;"From No Service Order";Code[20])
        {
            Description = 'SM';
        }
        field(60010;"From Order Source Type";Option)
        {
            Description = 'SM';
            OptionCaption = ',Vente PR,Vente VN,Assemblage VN,Service Rapide,Grande réparation,VN';
            OptionMembers = ,"Vente PR","Vente VN","Assemblage VN","Service Rapide","Grande réparation",VN;
        }
        field(60011;"From Order No";Code[20])
        {
            Description = 'SM';
        }
        field(60012;"From Order Line No";Integer)
        {
            Description = 'SM';
        }
        field(60013;"From Service Item Line";Integer)
        {
            Description = 'SM';
            TableRelation = "Service Item".No.;
        }
        field(60014;"From Transfert VN";Code[20])
        {
            Description = 'SM MAZDA456';
        }
        field(60020;"Line Locked";Boolean)
        {
            Caption = 'Ligne Verrouillé Inventaire';
            Description = 'SM MAZDA860';
        }
        field(60021;"Inventory Document No.";Code[20])
        {
            Caption = 'No Document Inventaire';
            Description = 'SM MAZDA860';
        }
        field(60022;"Locked Date";DateTime)
        {
            Caption = 'Date Verrouillage Ligne';
            Description = 'SM MAZDA860';
        }
        field(60023;"Initial Qty. (Calculated)";Decimal)
        {
            Caption = 'Qté (calculée) Initiale';
            Description = 'SM MAZDA860';
        }
        field(60024;"Initiate Calc. Date";DateTime)
        {
            Caption = 'Date Initiation Calcule';
            Description = 'SM MAZDA860';
        }
        field(60025;"Modifier Comptage 1";Boolean)
        {
            Description = 'KK MAZDA860';
        }
        field(60026;"Modifier Comptage 2";Boolean)
        {
            Description = 'KK MAZDA860';
        }
        field(60027;"Modifier Comptage 3";Boolean)
        {
            Description = 'KK MAZDA860';
        }
        field(60028;"Ecart Final";Decimal)
        {
            Description = 'KK MAZDA860';
        }
        field(60029;"Inventaire validé";Boolean)
        {
            Description = 'KK MAZDA860';
        }
        field(61000;"Responsibility Center";Code[10])
        {
            CaptionML = ENU='Responsibility Center',
                        FRA='Centre de gestion';
            Description = 'SM MAZDA671';
            TableRelation = "Responsibility Center";
        }
        field(61001;"Purchaser Code";Code[10])
        {
            CaptionML = ENU='Purchaser Code',
                        FRA='Code acheteur';
            Description = 'SM MAZDA671';
            TableRelation = Salesperson/Purchaser;
        }
        field(70000;"User ID";Code[50])
        {
            TableRelation = "User Setup";
        }
        field(70006;"Code Famille";Code[20])
        {
            TableRelation = Famille;
        }
        field(70007;"Code Index";Code[20])
        {
            TableRelation = Index."Code Index";
        }
        field(70008;"Code Segment";Code[20])
        {
            TableRelation = Segment."Code Segment";
        }
        field(70034;"Promotion 2";Boolean)
        {
        }
        field(70035;"Type Commande Achat";Option)
        {
            OptionCaptionML = ENU=' ,Réappro,Préconisation,Compagne,Outillage,Ferme',
                              FRA=' ,Réappro,Préconisation,Compagne,Outillage,Ferme';
            OptionMembers = " ","Réappro","Préconisation",Compagne,Outillage,Ferme;
        }
        field(70036;"Par Defaut";Boolean)
        {
        }
        field(70037;"Qty. En Casier";Decimal)
        {
            CalcFormula = Sum("Warehouse Entry".Quantity WHERE (Location Code=FIELD(Location Code),
                                                                Bin Code=FIELD(Bin Code),
                                                                Item No.=FIELD(Item No.)));
            FieldClass = FlowField;
        }
        field(70048;Promotion;Boolean)
        {
        }
        field(70049;DGX;Boolean)
        {
        }
        field(70050;Urgent;Boolean)
        {
        }
        field(70051;"Vendor Cr. Memo No.";Code[35])
        {
            CaptionML = ENU='Vendor Cr. Memo No.',
                        FRA='N° avoir fournisseur';
        }
        field(70052;"Date Avoir Fournisseur";Date)
        {
        }
        field(70053;"Vendor Invoice No.";Code[35])
        {
            CaptionML = ENU='Vendor Invoice No.',
                        FRA='N° facture fournisseur';
        }
        field(70054;"No. Colis";Code[20])
        {
            Description = 'ZMN';
        }
        field(70055;"No. Arrivage PR";Code[20])
        {
            Description = 'ZMN';
        }
        field(70056;"No dossier VN";Code[20])
        {
            CaptionML = ENU='Transit Folder No.',
                        FRA='N° Dossier Transit';
            Description = 'ADD RH pour dossier VN a  la place de No Dossier pour les P.R';
            TableRelation = "Dossiers Transit"."N° Dossier";
        }
        field(70057;"Date Facture Fournisseur";Date)
        {
        }
        field(70058;"Purch. Order Type";Option)
        {
            OptionCaption = ',PR,VN,Service,Frais Généraux,Marketing,Projet';
            OptionMembers = ,PR,VN,Service,"Frais Généraux",Marketing,Projet;
        }
        field(70059;"No. Expedition";Code[20])
        {
        }
        field(70060;"No. Ligne Expedition";Integer)
        {
        }
        field(70061;"No. L.Crédit";Code[20])
        {
        }
        field(70062;"Date Reception En transit";Date)
        {
        }
        field(70063;VIN;Code[20])
        {

            trigger OnLookup();
            var
                "LPagVéhiculesRéservées" : Page "50070";
                LRecReservationVue : Record "60049";
                ReservEntry : Record "337";
                TrackingSpecification : Record "336";
                ReservMgt : Codeunit "99000845";
                CreateReservEntry : Codeunit "99000830";
                LRecItemJournalLine : Record "83";
                IntLineNo : Integer;
            begin
            end;

            trigger OnValidate();
            var
                ReservationVue : Record "60049";
                "VéhiculesStockForRecl" : Page "70278";
                ItemLedgerEntry : Record "32";
                CreateReservEntry : Codeunit "99000830";
                LRecItemJournalLine : Record "83";
                IntLineNo : Integer;
                LPagItemReclassJournal : Page "393";
            begin
            end;
        }
        field(70064;"Par Defaut INV";Boolean)
        {
        }
        field(70065;"Niveau Casier INV";Integer)
        {
        }
        field(70066;"Alternative Item No.";Code[20])
        {
            CaptionML = ENU='Alternative Item No.',
                        FRA='Référence de remplacement';
            TableRelation = Item;
        }
        field(70067;"S0 Sotck Consolidé par casier";Decimal)
        {
        }
        field(70068;"S Stock Consolidé par Magasin";Decimal)
        {
        }
        field(70069;"Désignation Magasin";Text[100])
        {
        }
        field(70071;"Date Création";DateTime)
        {
        }
        field(70072;"Créer par";Code[50])
        {
        }
        field(70073;"Date de Clôture";DateTime)
        {
        }
        field(70074;"Clôturé par";Code[50])
        {
        }
        field(70075;Phase;Option)
        {
            OptionCaptionML = ENU=' ,Ouvert,Comptage 1,Comptage 2,Comptage 3,Clôturé',
                              FRA=' ,Ouvert,Comptage 1,Comptage 2,Comptage 3,Clôturé';
            OptionMembers = " ",Ouvert,"Comptage 1","Comptage 2","Comptage 3","Clôturé";
        }
        field(70076;"Déscription Inventaire";Text[100])
        {
        }
        field(70077;"Q1 Total Qté Lue Cpt 1";Decimal)
        {
            CalcFormula = Sum("Item Journal Line"."Count 1" WHERE (Journal Template Name=FIELD(Journal Template Name),
                                                                   Journal Batch Name=FIELD(Journal Batch Name),
                                                                   Item No.=FIELD(Item No.)));
            FieldClass = FlowField;
        }
        field(70078;"Q2 Total Qté Lue Cpt 2";Decimal)
        {
            CalcFormula = Sum("Item Journal Line"."Count 2" WHERE (Journal Template Name=FIELD(Journal Template Name),
                                                                   Journal Batch Name=FIELD(Journal Batch Name),
                                                                   Item No.=FIELD(Item No.)));
            FieldClass = FlowField;
        }
        field(70079;"Q3 Total Qté Lue Cpt 3";Decimal)
        {
            CalcFormula = Sum("Item Journal Line"."Count 3" WHERE (Journal Template Name=FIELD(Journal Template Name),
                                                                   Journal Batch Name=FIELD(Journal Batch Name),
                                                                   Item No.=FIELD(Item No.)));
            FieldClass = FlowField;
        }
        field(70080;"E1 Ind Ecart Cpt1";Boolean)
        {
        }
        field(70081;"E2 Ind Ecart Cpt2";Boolean)
        {
        }
        field(70082;"User 1";Code[50])
        {
        }
        field(70083;"user 2";Code[50])
        {
        }
        field(70084;"user 3";Code[50])
        {
        }
        field(70085;"Date 1";DateTime)
        {
        }
        field(70086;"Date 2";DateTime)
        {
        }
        field(70087;"Date 3";DateTime)
        {
        }
        field(70088;"Article Avec D";Code[20])
        {
            TableRelation = Item;
        }
        field(70089;"Emplacement par defaut";Code[10])
        {
        }
        field(70090;"Stock Auto";Decimal)
        {
        }
        field(70091;"Inventaire Physique";Boolean)
        {
        }
        field(70164;"Compteur Ligne";Integer)
        {
            Description = 'SM 181217';
        }
        field(70165;"Version No";Integer)
        {
            Description = 'SM 190118';
        }
        field(99000755;"Overhead Rate";Decimal)
        {
            CaptionML = ENU='Overhead Rate',
                        FRA='Frais généraux';
            DecimalPlaces = 0:5;
        }
        field(99000756;"Single-Level Material Cost";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Single-Level Material Cost',
                        FRA='Coût matière mono-niveau';
        }
        field(99000757;"Single-Level Capacity Cost";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Single-Level Capacity Cost',
                        FRA='Coût opératoire mono-niveau';
        }
        field(99000758;"Single-Level Subcontrd. Cost";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Single-Level Subcontrd. Cost',
                        FRA='Coût s/traitance mono-niveau';
        }
        field(99000759;"Single-Level Cap. Ovhd Cost";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Single-Level Cap. Ovhd Cost',
                        FRA='Frais gén. opérat. mono-niv.';
        }
        field(99000760;"Single-Level Mfg. Ovhd Cost";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Single-Level Mfg. Ovhd Cost',
                        FRA='Frais gén. matière mono-niv.';
        }
        field(99000761;"Rolled-up Material Cost";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Rolled-up Material Cost',
                        FRA='Coût matière multi-niveau';
        }
        field(99000762;"Rolled-up Capacity Cost";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Rolled-up Capacity Cost',
                        FRA='Coût opératoire multi-niveau';
        }
        field(99000763;"Rolled-up Subcontracted Cost";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Rolled-up Subcontracted Cost',
                        FRA='Coût s/traitance multi-niv.';
        }
        field(99000764;"Rolled-up Mfg. Ovhd Cost";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Rolled-up Mfg. Ovhd Cost',
                        FRA='Frais gén. matière multi-niv.';
        }
        field(99000765;"Rolled-up Cap. Overhead Cost";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Rolled-up Cap. Overhead Cost',
                        FRA='Frais gén. opérat. multi-niv.';
        }
    }

    keys
    {
        key(Key1;"Journal Template Name","Journal Batch Name","Line No.","Version No")
        {
            MaintainSIFTIndex = false;
        }
        key(Key2;"Entry Type","Item No.","Variant Code","Location Code","Bin Code","Posting Date")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Quantity (Base)";
        }
        key(Key3;"Entry Type","Item No.","Variant Code","New Location Code","New Bin Code","Posting Date")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Quantity (Base)";
        }
        key(Key4;"Item No.","Posting Date")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        ERROR('Interdit')
    end;

    trigger OnInsert();
    var
        InventoryPage : Page "69069";
    begin
    end;
}

