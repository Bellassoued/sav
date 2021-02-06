table 60074 "Transfer Line Return"
{
    // version RT001

    CaptionML = ENU='Transfer Line',
                FRA='Ligne transfert';
    DrillDownPageID = 5749;
    LookupPageID = 5749;

    fields
    {
        field(1;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° document';
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
            TableRelation = Item WHERE (Type=CONST(Inventory));

            trigger OnValidate();
            var
                TempTransferLine : Record "60074" temporary;
                LRecItemJournalLine : Record "83";
            begin
                TESTFIELD("Quantity Shipped",0);


                TempTransferLine := Rec;
                INIT;
                "Item No." := TempTransferLine."Item No.";
                IF "Item No." = '' THEN
                  EXIT;

                GetTransHeader;
                GetItem;
                GetDefaultBin("Transfer-from Code","Transfer-to Code");

                Item.TESTFIELD(Blocked,FALSE);

                VALIDATE(Description,Item.Description);
                VALIDATE("Gen. Prod. Posting Group",Item."Gen. Prod. Posting Group");
                VALIDATE("Inventory Posting Group",Item."Inventory Posting Group");
                VALIDATE("Unit of Measure Code",Item."Base Unit of Measure");
                VALIDATE("Gross Weight",Item."Gross Weight");
                VALIDATE("Net Weight",Item."Net Weight");
                VALIDATE("Unit Volume",Item."Unit Volume");
                VALIDATE("Units per Parcel",Item."Units per Parcel");
                VALIDATE("Description 2",Item."Description 2");
                VALIDATE(Quantity,xRec.Quantity);
                "Item Category Code" := Item."Item Category Code";
                "Product Group Code" := Item."Product Group Code";

                "Par Défaut":= LRecItemJournalLine. FctCheckdefaultBin("Transfer-to Code","Item No.","Variant Code","Transfer-To Bin Code");

                //CreateDim(DATABASE::Item,"Item No.");
                //DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
            end;
        }
        field(4;Quantity;Decimal)
        {
            CaptionML = ENU='Quantity',
                        FRA='Quantité';
            DecimalPlaces = 0:5;
            MinValue = 0;

            trigger OnValidate();
            begin
                /*
                IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                IF Quantity <> 0 THEN
                  TESTFIELD("Item No.");
                
                IF Quantity < 0 THEN
                   ERROR('Quantité négative non autoriser!');
                
                "Quantity (Base)" := CalcBaseQty(Quantity);
                IF ((Quantity * "Quantity Shipped") < 0) OR
                   (ABS(Quantity) < ABS("Quantity Shipped"))
                THEN
                  FIELDERROR(Quantity,STRSUBSTNO(Text002,FIELDCAPTION("Quantity Shipped")));
                IF (("Quantity (Base)" * "Qty. Shipped (Base)") < 0) OR
                   (ABS("Quantity (Base)") < ABS("Qty. Received (Base)"))
                THEN
                  FIELDERROR("Quantity (Base)",STRSUBSTNO(Text002,FIELDCAPTION("Qty. Shipped (Base)")));
                InitQtyInTransit;
                InitOutstandingQty;
                InitQtyToShip;
                InitQtyToReceive;
                CheckItemAvailable(FIELDNO(Quantity));
                
                ReserveTransferLine.VerifyQuantity(Rec,xRec);
                
                UpdateWithWarehouseShipReceive;
                
                WhseValidateSourceLine.TransLineVerifyChange(Rec,xRec);
                */

            end;
        }
        field(5;"Unit of Measure";Text[10])
        {
            CaptionML = ENU='Unit of Measure',
                        FRA='Unité';

            trigger OnValidate();
            begin
                //IF CurrFieldNo <> 0 THEN
                //  TestStatusOpen;
            end;
        }
        field(6;"Qty. to Ship";Decimal)
        {
            CaptionML = ENU='Qty. to Ship',
                        FRA='Qté à expédier';
            DecimalPlaces = 0:5;
            MinValue = 0;

            trigger OnValidate();
            begin
                /*GetLocation("Transfer-from Code");
                IF CurrFieldNo <> 0 THEN BEGIN
                  IF Location."Require Shipment" AND
                     ("Qty. to Ship" <> 0)
                  THEN
                    CheckWarehouse("Transfer-from Code",FALSE);
                  WhseValidateSourceLine.TransLineVerifyChange(Rec,xRec);
                END;
                
                IF "Qty. to Ship" > "Outstanding Quantity" THEN
                  IF "Outstanding Quantity" > 0 THEN
                    ERROR(
                      Text005,
                      "Outstanding Quantity")
                  ELSE
                    ERROR(Text006);
                "Qty. to Ship (Base)" := CalcBaseQty("Qty. to Ship");
                */

            end;
        }
        field(7;"Qty. to Receive";Decimal)
        {
            CaptionML = ENU='Qty. to Receive',
                        FRA='Qté à recevoir';
            DecimalPlaces = 0:5;
            MinValue = 0;

            trigger OnValidate();
            begin
                /*GetLocation("Transfer-to Code");
                IF CurrFieldNo <> 0 THEN BEGIN
                  IF Location."Require Receive" AND
                     ("Qty. to Receive" <> 0)
                  THEN
                    CheckWarehouse("Transfer-to Code",TRUE);
                  WhseValidateSourceLine.TransLineVerifyChange(Rec,xRec);
                END;
                
                {IF "Qty. to Receive" > "Qty. in Transit" THEN
                  IF "Qty. in Transit" > 0 THEN
                    ERROR(
                      Text008,
                      "Qty. in Transit")
                  ELSE
                    ERROR(Text009);}
                "Qty. to Receive (Base)" := CalcBaseQty("Qty. to Receive");
                */

            end;
        }
        field(8;"Quantity Shipped";Decimal)
        {
            CaptionML = ENU='Quantity Shipped',
                        FRA='Qté expédiée';
            DecimalPlaces = 0:5;
            Editable = false;

            trigger OnValidate();
            begin
                /*"Qty. Shipped (Base)" := CalcBaseQty("Quantity Shipped");
                InitQtyInTransit;
                InitOutstandingQty;
                InitQtyToShip;
                InitQtyToReceive;
                */

            end;
        }
        field(9;"Quantity Received";Decimal)
        {
            CaptionML = ENU='Quantity Received',
                        FRA='Quantité reçue';
            DecimalPlaces = 0:5;
            Editable = false;

            trigger OnValidate();
            begin
                /*"Qty. Received (Base)" := CalcBaseQty("Quantity Received");
                InitQtyInTransit;
                InitOutstandingQty;
                InitQtyToReceive;
                */

            end;
        }
        field(10;Status;Option)
        {
            CaptionML = ENU='Status',
                        FRA='Statut';
            Editable = false;
            OptionCaptionML = ENU='Open,Released',
                              FRA='Ouvert,Lancé';
            OptionMembers = Open,Released;
        }
        field(11;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            CaptionML = ENU='Shortcut Dimension 1 Code',
                        FRA='Code raccourci axe 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));

            trigger OnValidate();
            begin
                ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(12;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            CaptionML = ENU='Shortcut Dimension 2 Code',
                        FRA='Code raccourci axe 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2));

            trigger OnValidate();
            begin
                ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            end;
        }
        field(13;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
        }
        field(14;"Gen. Prod. Posting Group";Code[10])
        {
            CaptionML = ENU='Gen. Prod. Posting Group',
                        FRA='Groupe compta. produit';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate();
            begin
                /*IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;*/

            end;
        }
        field(15;"Inventory Posting Group";Code[10])
        {
            CaptionML = ENU='Inventory Posting Group',
                        FRA='Groupe compta. stock';
            TableRelation = "Inventory Posting Group";

            trigger OnValidate();
            begin
                /*IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;*/

            end;
        }
        field(16;"Quantity (Base)";Decimal)
        {
            CaptionML = ENU='Quantity (Base)',
                        FRA='Quantité (base)';
            DecimalPlaces = 0:5;
            MinValue = 0;

            trigger OnValidate();
            begin
                
                /*IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                TESTFIELD("Qty. per Unit of Measure",1);
                VALIDATE(Quantity,"Quantity (Base)");*/

            end;
        }
        field(17;"Outstanding Qty. (Base)";Decimal)
        {
            CaptionML = ENU='Outstanding Qty. (Base)',
                        FRA='Quantité ouverte (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(18;"Qty. to Ship (Base)";Decimal)
        {
            CaptionML = ENU='Qty. to Ship (Base)',
                        FRA='Qté à expédier (base)';
            DecimalPlaces = 0:5;
            MinValue = 0;

            trigger OnValidate();
            begin
                /*TESTFIELD("Qty. per Unit of Measure",1);
                VALIDATE("Qty. to Ship","Qty. to Ship (Base)");*/

            end;
        }
        field(19;"Qty. Shipped (Base)";Decimal)
        {
            CaptionML = ENU='Qty. Shipped (Base)',
                        FRA='Qté expédiée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(20;"Qty. to Receive (Base)";Decimal)
        {
            CaptionML = ENU='Qty. to Receive (Base)',
                        FRA='Qté à recevoir (base)';
            DecimalPlaces = 0:5;
            MinValue = 0;

            trigger OnValidate();
            begin
                /*TESTFIELD("Qty. per Unit of Measure",1);
                VALIDATE("Qty. to Receive","Qty. to Receive (Base)");*/

            end;
        }
        field(21;"Qty. Received (Base)";Decimal)
        {
            CaptionML = ENU='Qty. Received (Base)',
                        FRA='Quantité reçue (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(22;"Qty. per Unit of Measure";Decimal)
        {
            CaptionML = ENU='Qty. per Unit of Measure',
                        FRA='Quantité par unité';
            DecimalPlaces = 0:5;
            Editable = false;
            InitValue = 1;
        }
        field(23;"Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Unit of Measure Code',
                        FRA='Code unité';
            TableRelation = "Item Unit of Measure".Code WHERE (Item No.=FIELD(Item No.));

            trigger OnValidate();
            var
                UnitOfMeasure : Record "204";
                UOMMgt : Codeunit "5402";
            begin
                /*IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                TESTFIELD("Quantity Shipped",0);
                TESTFIELD("Qty. Shipped (Base)",0);
                TESTFIELD("Quantity Received",0);
                TESTFIELD("Qty. Received (Base)",0);
                ReserveTransferLine.VerifyChange(Rec,xRec);
                WhseValidateSourceLine.TransLineVerifyChange(Rec,xRec);
                IF "Unit of Measure Code" = '' THEN
                  "Unit of Measure" := ''
                ELSE BEGIN
                  IF NOT UnitOfMeasure.GET("Unit of Measure Code") THEN
                    UnitOfMeasure.INIT;
                  "Unit of Measure" := UnitOfMeasure.Description;
                END;
                GetItem;
                VALIDATE("Qty. per Unit of Measure",UOMMgt.GetQtyPerUnitOfMeasure(Item,"Unit of Measure Code"));
                "Gross Weight" := Item."Gross Weight" * "Qty. per Unit of Measure";
                "Net Weight" := Item."Net Weight" * "Qty. per Unit of Measure";
                "Unit Volume" := Item."Unit Volume" * "Qty. per Unit of Measure";
                "Units per Parcel" := ROUND(Item."Units per Parcel" / "Qty. per Unit of Measure",0.00001);
                VALIDATE(Quantity);
                */

            end;
        }
        field(24;"Outstanding Quantity";Decimal)
        {
            CaptionML = ENU='Outstanding Quantity',
                        FRA='Quantité restante';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(25;"Gross Weight";Decimal)
        {
            CaptionML = ENU='Gross Weight',
                        FRA='Poids brut';
            DecimalPlaces = 0:5;
        }
        field(26;"Net Weight";Decimal)
        {
            CaptionML = ENU='Net Weight',
                        FRA='Poids net';
            DecimalPlaces = 0:5;
        }
        field(27;"Unit Volume";Decimal)
        {
            CaptionML = ENU='Unit Volume',
                        FRA='Volume unitaire';
            DecimalPlaces = 0:5;
        }
        field(30;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code variante';
            TableRelation = "Item Variant".Code WHERE (Item No.=FIELD(Item No.));

            trigger OnValidate();
            var
                ItemVariant : Record "5401";
            begin
                /*IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                ReserveTransferLine.VerifyChange(Rec,xRec);
                WhseValidateSourceLine.TransLineVerifyChange(Rec,xRec);
                
                IF "Variant Code" = '' THEN
                  EXIT;
                
                GetDefaultBin("Transfer-from Code","Transfer-to Code");
                ItemVariant.GET("Item No.","Variant Code");
                Description := ItemVariant.Description;
                "Description 2" := ItemVariant."Description 2";
                
                CheckItemAvailable(FIELDNO("Variant Code"));
                */

            end;
        }
        field(31;"Units per Parcel";Decimal)
        {
            CaptionML = ENU='Units per Parcel',
                        FRA='Conditionnement';
            DecimalPlaces = 0:5;
        }
        field(32;"Description 2";Text[50])
        {
            CaptionML = ENU='Description 2',
                        FRA='Désignation 2';
        }
        field(33;"In-Transit Code";Code[10])
        {
            CaptionML = ENU='In-Transit Code',
                        FRA='Code transit';
            Editable = false;
            TableRelation = Location WHERE (Use As In-Transit=CONST(Yes));

            trigger OnValidate();
            begin
                //TESTFIELD("Quantity Shipped",0);
            end;
        }
        field(34;"Qty. in Transit";Decimal)
        {
            CaptionML = ENU='Qty. in Transit',
                        FRA='Qté en transit';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(35;"Qty. in Transit (Base)";Decimal)
        {
            CaptionML = ENU='Qty. in Transit (Base)',
                        FRA='Qté en transit (base)';
            DecimalPlaces = 0:5;
            Editable = false;
        }
        field(36;"Transfer-from Code";Code[10])
        {
            CaptionML = ENU='Transfer-from Code',
                        FRA='Code prov. transfert';
            TableRelation = Location;

            trigger OnValidate();
            begin
                /*TESTFIELD("Quantity Shipped",0);
                IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                IF "Transfer-from Code" <> xRec."Transfer-from Code" THEN BEGIN
                  "Transfer-from Bin Code" := '';
                  GetDefaultBin("Transfer-from Code",'');
                END;
                
                CheckItemAvailable(FIELDNO("Transfer-from Code"));
                ReserveTransferLine.VerifyChange(Rec,xRec);
                UpdateWithWarehouseShipReceive;
                WhseValidateSourceLine.TransLineVerifyChange(Rec,xRec);
                */

            end;
        }
        field(37;"Transfer-to Code";Code[10])
        {
            CaptionML = ENU='Transfer-to Code',
                        FRA='Code dest. transfert';
            TableRelation = Location;

            trigger OnValidate();
            var
                LRecItemJournalLine : Record "83";
            begin
                /*TESTFIELD("Quantity Shipped",0);
                IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                IF "Transfer-to Code" <> xRec."Transfer-to Code" THEN BEGIN
                  "Transfer-To Bin Code" := '';
                  GetDefaultBin('',"Transfer-to Code");
                END;
                
                ReserveTransferLine.VerifyChange(Rec,xRec);
                UpdateWithWarehouseShipReceive;
                WhseValidateSourceLine.TransLineVerifyChange(Rec,xRec);
                "Par Défaut":= LRecItemJournalLine. FctCheckdefaultBin("Transfer-to Code","Item No.","Variant Code","Transfer-To Bin Code");
                */

            end;
        }
        field(38;"Shipment Date";Date)
        {
            CaptionML = ENU='Shipment Date',
                        FRA='Date d''expédition';

            trigger OnValidate();
            begin
                /*IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                TransferRoute.CalcReceiptDate("Shipment Date","Receipt Date",
                  "Shipping Time","Outbound Whse. Handling Time","Inbound Whse. Handling Time",
                  "Transfer-from Code","Transfer-to Code","Shipping Agent Code","Shipping Agent Service Code");
                CheckItemAvailable(FIELDNO("Shipment Date"));
                IF NOT TrackingBlocked THEN
                  CheckDateConflict.TransferLineCheck(Rec,CurrFieldNo <> 0,0);
                */

            end;
        }
        field(39;"Receipt Date";Date)
        {
            CaptionML = ENU='Receipt Date',
                        FRA='Date de réception';

            trigger OnValidate();
            begin
                /*IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                TransferRoute.CalcShipmentDate("Shipment Date","Receipt Date",
                  "Shipping Time","Outbound Whse. Handling Time","Inbound Whse. Handling Time",
                  "Transfer-from Code","Transfer-to Code","Shipping Agent Code","Shipping Agent Service Code");
                CheckItemAvailable(FIELDNO("Shipment Date"));
                IF NOT TrackingBlocked THEN
                  CheckDateConflict.TransferLineCheck(Rec,CurrFieldNo <> 0,1);
                */

            end;
        }
        field(40;"Derived From Line No.";Integer)
        {
            CaptionML = ENU='Derived From Line No.',
                        FRA='Issue de ligne n°';
            TableRelation = "Transfer Line"."Line No." WHERE (Document No.=FIELD(Document No.));
        }
        field(41;"Shipping Agent Code";Code[10])
        {
            AccessByPermission = TableData 5790=R;
            CaptionML = ENU='Shipping Agent Code',
                        FRA='Code transporteur';
            TableRelation = "Shipping Agent";

            trigger OnValidate();
            begin
                /*IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                IF "Shipping Agent Code" <> xRec."Shipping Agent Code" THEN
                  VALIDATE("Shipping Agent Service Code",'');
                  */

            end;
        }
        field(42;"Shipping Agent Service Code";Code[10])
        {
            CaptionML = ENU='Shipping Agent Service Code',
                        FRA='Code prestation transporteur';
            TableRelation = "Shipping Agent Services".Code WHERE (Shipping Agent Code=FIELD(Shipping Agent Code));

            trigger OnValidate();
            begin
                /*IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                TransferRoute.GetShippingTime(
                  "Transfer-from Code","Transfer-to Code",
                  "Shipping Agent Code","Shipping Agent Service Code",
                  "Shipping Time");
                TransferRoute.CalcReceiptDate("Shipment Date","Receipt Date",
                  "Shipping Time","Outbound Whse. Handling Time","Inbound Whse. Handling Time",
                  "Transfer-from Code","Transfer-to Code","Shipping Agent Code","Shipping Agent Service Code");
                CheckItemAvailable(FIELDNO("Shipping Agent Service Code"));
                */

            end;
        }
        field(43;"Appl.-to Item Entry";Integer)
        {
            AccessByPermission = TableData 27=R;
            CaptionML = ENU='Appl.-to Item Entry',
                        FRA='Écr. article à lettrer';

            trigger OnLookup();
            begin
                //SelectItemEntry(FIELDNO("Appl.-to Item Entry"));
            end;

            trigger OnValidate();
            var
                ItemLedgEntry : Record "32";
                ItemTrackingLines : Page "6510";
            begin
                /*IF "Appl.-to Item Entry" <> 0 THEN BEGIN
                  TESTFIELD(Quantity);
                  ItemLedgEntry.GET("Appl.-to Item Entry");
                  ItemLedgEntry.TESTFIELD(Positive,TRUE);
                  IF (ItemLedgEntry."Lot No." <> '') OR (ItemLedgEntry."Serial No." <> '') THEN
                    ERROR(MustUseTrackingErr,ItemTrackingLines.CAPTION,FIELDCAPTION("Appl.-to Item Entry"));
                  IF ABS("Qty. to Ship (Base)") > ItemLedgEntry.Quantity THEN
                    ERROR(ShippingMoreUnitsThanReceivedErr,ItemLedgEntry.Quantity,ItemLedgEntry."Document No.");
                
                  ItemLedgEntry.TESTFIELD("Location Code","Transfer-from Code");
                  IF NOT ItemLedgEntry.Open THEN
                    MESSAGE(LedgEntryWillBeOpenedMsg,"Appl.-to Item Entry");
                END;
                */

            end;
        }
        field(50;"Reserved Quantity Inbnd.";Decimal)
        {
            CalcFormula = Sum("Reservation Entry".Quantity WHERE (Source ID=FIELD(Document No.),
                                                                  Source Ref. No.=FIELD(Line No.),
                                                                  Source Type=CONST(5741),
                                                                  Source Subtype=CONST(1),
                                                                  Source Prod. Order Line=FIELD(Derived From Line No.),
                                                                  Reservation Status=CONST(Reservation)));
            CaptionML = ENU='Reserved Quantity Inbnd.',
                        FRA='Qté réservée enlogement';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(51;"Reserved Quantity Outbnd.";Decimal)
        {
            CalcFormula = -Sum("Reservation Entry".Quantity WHERE (Source ID=FIELD(Document No.),
                                                                   Source Ref. No.=FIELD(Line No.),
                                                                   Source Type=CONST(5741),
                                                                   Source Subtype=CONST(0),
                                                                   Source Prod. Order Line=FIELD(Derived From Line No.),
                                                                   Reservation Status=CONST(Reservation)));
            CaptionML = ENU='Reserved Quantity Outbnd.',
                        FRA='Qté réservée désenlogement';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(52;"Reserved Qty. Inbnd. (Base)";Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Quantity (Base)" WHERE (Source ID=FIELD(Document No.),
                                                                           Source Ref. No.=FIELD(Line No.),
                                                                           Source Type=CONST(5741),
                                                                           Source Subtype=CONST(1),
                                                                           Source Prod. Order Line=FIELD(Derived From Line No.),
                                                                           Reservation Status=CONST(Reservation)));
            CaptionML = ENU='Reserved Qty. Inbnd. (Base)',
                        FRA='Qté réservée enlogement (base)';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(53;"Reserved Qty. Outbnd. (Base)";Decimal)
        {
            CalcFormula = -Sum("Reservation Entry"."Quantity (Base)" WHERE (Source ID=FIELD(Document No.),
                                                                            Source Ref. No.=FIELD(Line No.),
                                                                            Source Type=CONST(5741),
                                                                            Source Subtype=CONST(0),
                                                                            Source Prod. Order Line=FIELD(Derived From Line No.),
                                                                            Reservation Status=CONST(Reservation)));
            CaptionML = ENU='Reserved Qty. Outbnd. (Base)',
                        FRA='Qté réservée désenlogement (base)';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(54;"Shipping Time";DateFormula)
        {
            AccessByPermission = TableData 5790=R;
            CaptionML = ENU='Shipping Time',
                        FRA='Délai d''expédition';

            trigger OnValidate();
            begin
                /*IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                TransferRoute.CalcReceiptDate("Shipment Date","Receipt Date",
                  "Shipping Time","Outbound Whse. Handling Time","Inbound Whse. Handling Time",
                  "Transfer-from Code","Transfer-to Code","Shipping Agent Code","Shipping Agent Service Code");
                */

            end;
        }
        field(55;"Reserved Quantity Shipped";Decimal)
        {
            CalcFormula = Sum("Reservation Entry".Quantity WHERE (Source ID=FIELD(Document No.),
                                                                  Source Ref. No.=FILTER(<>0),
                                                                  Source Type=CONST(5741),
                                                                  Source Subtype=CONST(1),
                                                                  Source Prod. Order Line=FIELD(Line No.),
                                                                  Reservation Status=CONST(Reservation)));
            CaptionML = ENU='Reserved Quantity Shipped',
                        FRA='Quantité réservée livrée';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(56;"Reserved Qty. Shipped (Base)";Decimal)
        {
            CalcFormula = Sum("Reservation Entry"."Quantity (Base)" WHERE (Source ID=FIELD(Document No.),
                                                                           Source Ref. No.=FILTER(<>0),
                                                                           Source Type=CONST(5741),
                                                                           Source Subtype=CONST(1),
                                                                           Source Prod. Order Line=FIELD(Line No.),
                                                                           Reservation Status=CONST(Reservation)));
            CaptionML = ENU='Reserved Qty. Shipped (Base)',
                        FRA='Qté réservée livrée (base)';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(480;"Dimension Set ID";Integer)
        {
            CaptionML = ENU='Dimension Set ID',
                        FRA='ID ensemble de dimensions';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup();
            begin
                ShowDimensions;
            end;
        }
        field(5704;"Item Category Code";Code[10])
        {
            CaptionML = ENU='Item Category Code',
                        FRA='Code catégorie article';
            TableRelation = "Item Category";
        }
        field(5707;"Product Group Code";Code[10])
        {
            CaptionML = ENU='Product Group Code',
                        FRA='Code groupe produits';
            TableRelation = "Product Group".Code WHERE (Item Category Code=FIELD(Item Category Code));
        }
        field(5750;"Whse. Inbnd. Otsdg. Qty (Base)";Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Warehouse Receipt Line"."Qty. Outstanding (Base)" WHERE (Source Type=CONST(5741),
                                                                                        Source Subtype=CONST(1),
                                                                                        Source No.=FIELD(Document No.),
                                                                                        Source Line No.=FIELD(Line No.)));
            CaptionML = ENU='Whse. Inbnd. Otsdg. Qty (Base)',
                        FRA='Qté restante entrepôt enlogement (Base)';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5751;"Whse Outbnd. Otsdg. Qty (Base)";Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Warehouse Shipment Line"."Qty. Outstanding (Base)" WHERE (Source Type=CONST(5741),
                                                                                         Source Subtype=CONST(0),
                                                                                         Source No.=FIELD(Document No.),
                                                                                         Source Line No.=FIELD(Line No.)));
            CaptionML = ENU='Whse Outbnd. Otsdg. Qty (Base)',
                        FRA='Qté restante entrepôt désenlogement (Base)';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(5752;"Completely Shipped";Boolean)
        {
            CaptionML = ENU='Completely Shipped',
                        FRA='Entièrement expédiée';
            Editable = false;
        }
        field(5753;"Completely Received";Boolean)
        {
            CaptionML = ENU='Completely Received',
                        FRA='Entièrement réceptionné';
            Editable = false;
        }
        field(5793;"Outbound Whse. Handling Time";DateFormula)
        {
            CaptionML = ENU='Outbound Whse. Handling Time',
                        FRA='Délai désenlogement';

            trigger OnValidate();
            begin
                /*IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                TransferRoute.CalcReceiptDate("Shipment Date","Receipt Date",
                  "Shipping Time","Outbound Whse. Handling Time","Inbound Whse. Handling Time",
                  "Transfer-from Code","Transfer-to Code","Shipping Agent Code","Shipping Agent Service Code");
                */

            end;
        }
        field(5794;"Inbound Whse. Handling Time";DateFormula)
        {
            CaptionML = ENU='Inbound Whse. Handling Time',
                        FRA='Délai enlogement';

            trigger OnValidate();
            begin
                /*IF CurrFieldNo <> 0 THEN
                  TestStatusOpen;
                TransferRoute.CalcReceiptDate("Shipment Date","Receipt Date",
                  "Shipping Time","Outbound Whse. Handling Time","Inbound Whse. Handling Time",
                  "Transfer-from Code","Transfer-to Code","Shipping Agent Code","Shipping Agent Service Code");
                */

            end;
        }
        field(7300;"Transfer-from Bin Code";Code[20])
        {
            CaptionML = ENU='Transfer-from Bin Code',
                        FRA='Transf. du code emplacement';
            TableRelation = "Bin Content"."Bin Code" WHERE (Location Code=FIELD(Transfer-from Code),
                                                            Item No.=FIELD(Item No.),
                                                            Variant Code=FIELD(Variant Code));

            trigger OnValidate();
            begin
                /*IF "Transfer-from Bin Code" <> xRec."Transfer-from Bin Code" THEN BEGIN
                  TESTFIELD("Transfer-from Code");
                  IF "Transfer-from Bin Code" <> '' THEN BEGIN
                    GetLocation("Transfer-from Code");
                    Location.TESTFIELD("Bin Mandatory");
                    Location.TESTFIELD("Directed Put-away and Pick",FALSE);
                    GetBin("Transfer-from Code","Transfer-from Bin Code");
                    TESTFIELD("Transfer-from Code",Bin."Location Code");
                    HandleDedicatedBin(TRUE);
                  END;
                END;
                */

            end;
        }
        field(7301;"Transfer-To Bin Code";Code[20])
        {
            CaptionML = ENU='Transfer-To Bin Code',
                        FRA='Transf. vers code emplacement';
            TableRelation = Bin.Code WHERE (Location Code=FIELD(Transfer-to Code));

            trigger OnValidate();
            begin
                /*IF "Transfer-To Bin Code" <> xRec."Transfer-To Bin Code" THEN BEGIN
                  TESTFIELD("Transfer-to Code");
                  IF "Transfer-To Bin Code" <> '' THEN BEGIN
                    GetLocation("Transfer-to Code");
                    Location.TESTFIELD("Bin Mandatory");
                    Location.TESTFIELD("Directed Put-away and Pick",FALSE);
                    GetBin("Transfer-to Code","Transfer-To Bin Code");
                    TESTFIELD("Transfer-to Code",Bin."Location Code");
                  END;
                END;
                */

            end;
        }
        field(60000;"Reception No";Code[20])
        {
            CaptionML = ENU='Receive No.',
                        FRA='Reception N°';
        }
        field(60001;"Type Reception";Option)
        {
            OptionMembers = "Reception Rapide","Reception Grand Reparation",VN;
        }
        field(60002;"No Service Order";Code[20])
        {
        }
        field(60006;"Source Type";Option)
        {
            OptionCaption = ',Vente PR,Vente VN,Assemblage VN,Service Rapide,Grande réparation,VN';
            OptionMembers = ,"Vente PR","Vente VN","Assemblage VN","Service Rapide","Grande réparation",VN;
        }
        field(60007;"Source No";Code[20])
        {
        }
        field(60008;"From Order Line No";Integer)
        {
            Description = 'SM MAZDA06';
        }
        field(60009;"From Service Item Line";Integer)
        {
            Description = 'SM MAZDA06';
        }
        field(60010;Retour;Boolean)
        {
            Description = 'SM MAZDA06';
        }
        field(60011;InterCompany;Boolean)
        {
            Description = 'SM MAZDA06';
        }
        field(60012;Replaced;Boolean)
        {
            Caption = 'Remplacé';
            Description = 'SM MAZDA10';
        }
        field(60013;Chassi;Text[30])
        {
            Description = 'GMED 11 06 14';
        }
        field(60014;Client;Code[30])
        {
            Description = 'GMED 11 06 14';
        }
        field(60015;"Non Livré";Boolean)
        {
            Description = 'SM PVN MAZDA988';
        }
        field(60016;"Date Livraison Retardé";DateTime)
        {
            Description = 'SM PVN MAZDA988';
        }
        field(60017;"Livraison Retardé  Par";Code[50])
        {
            Description = 'SM PVN MAZDA988';
        }
        field(70000;"CAB Mouvment";Decimal)
        {
            CalcFormula = Sum("CAB Mouvement".Qté WHERE (Code magasin De=FIELD(Transfer-from Code),
                                                         Code Casier De=FIELD(Transfer-from Bin Code),
                                                         Code a barre=FIELD(Item No.),
                                                         No. Order Transfert=FIELD(Document No.),
                                                         Type Mouvement Transfert=CONST(Expedition)));
            CaptionML = ENU='Qty Scanner à Expédier',
                        FRA='Qty Scanner à Expédier';
            FieldClass = FlowField;
        }
        field(70001;"Qty Demandée";Decimal)
        {
        }
        field(70002;"Par Défaut";Boolean)
        {

            trigger OnValidate();
            var
                LRecItemJournalLine : Record "83";
            begin
                //LRecItemJournalLine.FctChangedefaultBin("Transfer-to Code","Item No.","Variant Code","Transfer-To Bin Code",TRUE,"Unit of Measure");
            end;
        }
        field(70003;"Qty Scanner à réceptionner";Decimal)
        {
            CalcFormula = Sum("CAB Mouvement".Qté WHERE (Code a barre=FIELD(Item No.),
                                                         No. Order Transfert=FIELD(Document No.),
                                                         Type Mouvement Transfert=CONST(Reception)));
            FieldClass = FlowField;
        }
        field(70004;"Code Famille";Code[20])
        {
            Description = 'PR0018';
            TableRelation = Famille.Code WHERE (Code Index=FIELD(Code Index),
                                                Code Segment=FIELD(Code Segment));
        }
        field(70005;"Code Index";Code[20])
        {
            Description = 'PR0018';
            TableRelation = Index."Code Index";
        }
        field(70006;"Code Segment";Code[20])
        {
            Description = 'PR0018';
            TableRelation = Segment."Code Segment" WHERE (Code Index=FIELD(Code Index));
        }
        field(70007;Poids;Decimal)
        {
            Caption = 'Poids Net (Kg)';
            Description = 'PR0017';
        }
        field(70008;Volume;Decimal)
        {
            Description = 'PR0017';
        }
        field(70009;"Qty Scanner RCP";Decimal)
        {
        }
        field(70010;"Code Pickeur AMB";Code[50])
        {
            TableRelation = "User Setup";
        }
        field(70011;"OLD Prevent Negative Inventory";Option)
        {
            CaptionML = ENU='Prevent Negative Inventory',
                        FRA='Éviter stock négatif';
            OptionCaptionML = ENU='Default,No,Yes',
                              FRA='Par défaut,Non,Oui';
            OptionMembers = Default,No,Yes;
        }
        field(70012;PreventNegativeInvIsChanged;Boolean)
        {
            Description = 'SM 141017';
        }
        field(99000755;"Planning Flexibility";Option)
        {
            CaptionML = ENU='Planning Flexibility',
                        FRA='Flexibilité planification';
            OptionCaptionML = ENU='Unlimited,None',
                              FRA='Illimitée,Aucune';
            OptionMembers = Unlimited,"None";

            trigger OnValidate();
            begin
                /*IF "Planning Flexibility" <> xRec."Planning Flexibility" THEN
                  ReserveTransferLine.UpdatePlanningFlexibility(Rec);
                  */

            end;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
        }
        key(Key2;"Transfer-to Code",Status,"Derived From Line No.","Item No.","Variant Code","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","Receipt Date","In-Transit Code")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Qty. in Transit (Base)","Outstanding Qty. (Base)";
        }
        key(Key3;"Transfer-from Code",Status,"Derived From Line No.","Item No.","Variant Code","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code","Shipment Date","In-Transit Code")
        {
            MaintainSIFTIndex = false;
            SumIndexFields = "Outstanding Qty. (Base)";
        }
        key(Key4;"Item No.","Variant Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        ItemChargeAssgntPurch : Record "5805";
    begin
        TestStatusOpen;
    end;

    trigger OnInsert();
    var
        TransLine2 : Record "60074";
    begin
        TestStatusOpen;
        TransLine2.RESET;
        TransLine2.SETFILTER("Document No.","Document No.");
        IF TransLine2.FINDLAST THEN
          "Line No." := TransLine2."Line No." + 10000;

        CLEAR(RecTransferHeader);
        RecTransferHeader.SETRANGE(RecTransferHeader."No.","Document No.");
        IF RecTransferHeader.FINDFIRST THEN
        BEGIN
           "Source Type":=  RecTransferHeader."Source Type" ;
           "Source No" :=  RecTransferHeader."Source No" ;
           "Reception No" := RecTransferHeader."Reception No" ;
           //SM
           "Type Reception"         := RecTransferHeader."Type Reception";
           "No Service Order"       := RecTransferHeader."Source No";
           Retour                   := RecTransferHeader.Retour;
           InterCompany             := RecTransferHeader.InterCompany;
           //END SM
        END;
        //>>CT16V001 ZM 15/05/2016
    end;

    trigger OnRename();
    begin
        ERROR(Text001,TABLECAPTION);
    end;

    var
        Text001 : TextConst ENU='You cannot rename a %1.',FRA='Vous ne pouvez pas renommer l''enregistrement %1.';
        Text002 : TextConst ENU='must not be less than %1',FRA='ne doit pas être inférieur(e) à %1';
        Text003 : TextConst ENU='Warehouse %1 is required for %2 = %3.',FRA='Le entrepôt %1 est nécessaire pour %2 = %3.';
        Text004 : TextConst ENU='\The entered information may be disregarded by warehouse operations.',FRA='\Les informations entrées peuvent être ignorées par les opérations de distribution.';
        Text005 : TextConst ENU='You cannot ship more than %1 units.',FRA='Vous ne pouvez pas expédier plus de %1 unité(s).';
        Text006 : TextConst ENU='All items have been shipped.',FRA='Tous les articles ont été expédiés.';
        Text008 : TextConst ENU='You cannot receive more than %1 units.',FRA='Vous ne pouvez pas recevoir plus de %1 unité(s).';
        Text009 : TextConst ENU='No items are currently in transit.',FRA='Aucun article n''est en transit.';
        Text011 : TextConst ENU='Outbound,Inbound',FRA='Désenlogement,Enlogement';
        Text012 : TextConst ENU='You have changed one or more dimensions on the %1, which is already shipped. When you post the line with the changed dimension to General Ledger, amounts on the Inventory Interim account will be out of balance when reported per dimension.\\Do you want to keep the changed dimension?',FRA='Vous avez modifié un ou plusieurs axes analytiques dans %1, qui a déjà été expédié. Lorsque vous validez la ligne avec l''axe analytique modifié dans la comptabilité, les montants du compte d''attente stock présentent un déséquilibre si un état est généré par axe analytique.\\Voulez-vous conserver l''axe analytique modifié ?';
        Text013 : TextConst ENU='Cancelled.',FRA='Annulé.';
        TransferRoute : Record "5742";
        Item : Record "27";
        TransHeader : Record "60073";
        Location : Record "14";
        Bin : Record "7354";
        Reservation : Page "498";
        DimMgt : Codeunit "408";
        WhseValidateSourceLine : Codeunit "5777";
        ReserveTransferLine : Codeunit "99000836";
        CheckDateConflict : Codeunit "99000815";
        WMSManagement : Codeunit "7302";
        TrackingBlocked : Boolean;
        MustUseTrackingErr : TextConst Comment='%1 = Form Name, %2 = Value to Enter',ENU='You must use form %1 to enter %2, if item tracking is used.',FRA='Si vous utilisez la traçabilité, vous devez employer le formulaire %1 pour entrer %2.';
        LedgEntryWillBeOpenedMsg : TextConst Comment='%1 = Entry No.',ENU='When posting the Applied to Ledger Entry %1 will be opened first.',FRA='Lors de la validation, l''écriture comptable lettrée %1 s''ouvre d''abord.';
        ShippingMoreUnitsThanReceivedErr : TextConst Comment='%1 = Quantity Value, %2 = Document No.',ENU='You cannot ship more than the %1 units that you have received for document no. %2.',FRA='Vous ne pouvez pas expédier plus que les %1 unités que vous avez reçues pour le document n° %2.';
        RecTransferHeader : Record "60073";

    local procedure InitOutstandingQty();
    begin
        /*"Outstanding Quantity" := Quantity - "Quantity Shipped";
        "Outstanding Qty. (Base)" := "Quantity (Base)" - "Qty. Shipped (Base)";
        "Completely Shipped" := (Quantity <> 0) AND ("Outstanding Quantity" = 0);
        */

    end;

    local procedure InitQtyToShip();
    begin
        /*"Qty. to Ship" := "Outstanding Quantity";
        "Qty. to Ship (Base)" := "Outstanding Qty. (Base)";
        */

    end;

    local procedure InitQtyToReceive();
    begin
        /*"Qty. to Receive" := "Qty. in Transit";
        "Qty. to Receive (Base)" := "Qty. in Transit (Base)";
        */

    end;

    local procedure InitQtyInTransit();
    begin
        /*"Qty. in Transit" := "Quantity Shipped" - "Quantity Received";
        "Qty. in Transit (Base)" := "Qty. Shipped (Base)" - "Qty. Received (Base)";
        "Completely Received" := (Quantity <> 0) AND (Quantity = "Quantity Received");
        */

    end;

    local procedure CalcBaseQty(Qty : Decimal) : Decimal;
    begin
        /*TESTFIELD("Qty. per Unit of Measure");
        EXIT(ROUND(Qty * "Qty. per Unit of Measure",0.00001));
        */

    end;

    local procedure GetTransHeader();
    begin
        /*TESTFIELD("Document No.");
        IF "Document No" <> TransHeader."No." THEN
          TransHeader.GET("Document No.");
        
        TransHeader.TESTFIELD("Shipment Date");
        TransHeader.TESTFIELD("Receipt Date");
        TransHeader.TESTFIELD("Transfer-from Code");
        TransHeader.TESTFIELD("Transfer-to Code");
        TransHeader.TESTFIELD("In-Transit Code");
        "In-Transit Code" := TransHeader."In-Transit Code";
        "Transfer-from Code" := TransHeader."Transfer-from Code";
        "Transfer-to Code" := TransHeader."Transfer-to Code";
        "Shipment Date" := TransHeader."Shipment Date";
        "Receipt Date" := TransHeader."Receipt Date";
        "Shipping Agent Code" := TransHeader."Shipping Agent Code";
        "Shipping Agent Service Code" := TransHeader."Shipping Agent Service Code";
        "Shipping Time" := TransHeader."Shipping Time";
        "Outbound Whse. Handling Time" := TransHeader."Outbound Whse. Handling Time";
        "Inbound Whse. Handling Time" := TransHeader."Inbound Whse. Handling Time";
        Status := TransHeader.Status;*/

    end;

    local procedure GetItem();
    begin
        TESTFIELD("Item No.");
        IF "Item No." <> Item."No." THEN
          Item.GET("Item No.");
    end;

    procedure BlockDynamicTracking(SetBlock : Boolean);
    begin
        TrackingBlocked := SetBlock;
        ReserveTransferLine.Block(SetBlock);
    end;

    procedure ShowDimensions();
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID",STRSUBSTNO('%1 %2 %3',TABLECAPTION,"Document No.","Line No."));
        VerifyItemLineDim;
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
    end;

    local procedure CreateDim(Type1 : Integer;No1 : Code[20]);
    var
        SourceCodeSetup : Record "242";
        TableID : array [10] of Integer;
        No : array [10] of Code[20];
    begin
        SourceCodeSetup.GET;
        TableID[1] := Type1;
        No[1] := No1;
        "Shortcut Dimension 1 Code" := '';
        "Shortcut Dimension 2 Code" := '';
        "Dimension Set ID" :=
          DimMgt.GetDefaultDimID(
            TableID,No,SourceCodeSetup.Transfer,
            "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code",TransHeader."Dimension Set ID",DATABASE::Item);
    end;

    procedure ValidateShortcutDimCode(FieldNumber : Integer;var ShortcutDimCode : Code[20]);
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
        VerifyItemLineDim;
    end;

    procedure LookupShortcutDimCode(FieldNumber : Integer;var ShortcutDimCode : Code[20]);
    begin
        DimMgt.LookupDimValueCode(FieldNumber,ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber,ShortcutDimCode);
    end;

    procedure ShowShortcutDimCode(var ShortcutDimCode : array [8] of Code[20]);
    begin
        DimMgt.GetShortcutDimensions("Dimension Set ID",ShortcutDimCode);
    end;

    local procedure CheckItemAvailable(CalledByFieldNo : Integer);
    var
        ItemCheckAvail : Codeunit "311";
    begin
        /*IF (CurrFieldNo <> 0) AND
           (CurrFieldNo = CalledByFieldNo) AND
           ("Item No." <> '') AND
           ("Outstanding Quantity" > 0)
        THEN
          IF ItemCheckAvail.TransferLineCheck(Rec) THEN
            ItemCheckAvail.RaiseUpdateInterruptedError;
        */

    end;

    procedure OpenItemTrackingLines(Direction : Option Outbound,Inbound);
    begin
        /*TESTFIELD("Item No.");
        TESTFIELD("Quantity (Base)");
        
        ReserveTransferLine.CallItemTracking(Rec,Direction);
        */

    end;

    local procedure TestStatusOpen();
    begin
        /*TESTFIELD("Document No.");
        IF TransHeader."No." <> "Document No." THEN
          TransHeader.GET("Document No.");
        TransHeader.TESTFIELD(Status,TransHeader.Status::Open);
        */

    end;

    procedure ShowReservation();
    var
        OptionNumber : Integer;
    begin
        /*TESTFIELD("Item No.");
        CLEAR(Reservation);
        OptionNumber := STRMENU(Text011);
        IF OptionNumber > 0 THEN BEGIN
          Reservation.SetTransLine(Rec,OptionNumber - 1);
          Reservation.RUNMODAL;
        END;
        */

    end;

    procedure UpdateWithWarehouseShipReceive();
    begin
        /*IF Location.RequireShipment("Transfer-from Code") THEN
          VALIDATE("Qty. to Ship",0)
        ELSE
          VALIDATE("Qty. to Ship","Outstanding Quantity");
        
        IF Location.RequireReceive("Transfer-to Code") THEN
          VALIDATE("Qty. to Receive",0)
        ELSE
          VALIDATE("Qty. to Receive","Qty. in Transit");
        */

    end;

    local procedure CheckWarehouse(LocationCode : Code[10];Receive : Boolean);
    var
        ShowDialog : Option " ",Message,Error;
        DialogText : Text[50];
    begin
        /*GetLocation(LocationCode);
        IF Location."Directed Put-away and Pick" THEN BEGIN
          ShowDialog := ShowDialog::Error;
          IF Receive THEN
            DialogText := Location.GetRequirementText(Location.FIELDNO("Require Receive"))
          ELSE
            DialogText := Location.GetRequirementText(Location.FIELDNO("Require Shipment"));
        END ELSE BEGIN
          IF Receive AND (Location."Require Receive" OR Location."Require Put-away") THEN BEGIN
            IF WhseValidateSourceLine.WhseLinesExist(
                 DATABASE::"Transfer Line",
                 1,
                 "Document No.",
                 "Line No.",
                 0,
                 Quantity)
            THEN
              ShowDialog := ShowDialog::Error
            ELSE
              IF Location."Require Receive" THEN
                ShowDialog := ShowDialog::Message;
            IF Location."Require Receive" THEN
              DialogText := Location.GetRequirementText(Location.FIELDNO("Require Receive"))
            ELSE
              DialogText := Location.GetRequirementText(Location.FIELDNO("Require Put-away"));
          END;
        
          IF NOT Receive AND (Location."Require Shipment" OR Location."Require Pick") THEN BEGIN
            IF WhseValidateSourceLine.WhseLinesExist(
                 DATABASE::"Transfer Line",
                 0,
                 "Document No.",
                 "Line No.",
                 0,
                 Quantity)
            THEN
              ShowDialog := ShowDialog::Error
            ELSE
              IF Location."Require Shipment" THEN
                ShowDialog := ShowDialog::Message;
            IF Location."Require Shipment" THEN
              DialogText := Location.GetRequirementText(Location.FIELDNO("Require Shipment"))
            ELSE
              DialogText := Location.GetRequirementText(Location.FIELDNO("Require Pick"));
          END;
        END;
        
        CASE ShowDialog OF
          ShowDialog::Message:
            MESSAGE(Text003 + Text004,DialogText,FIELDCAPTION("Line No."),"Line No.");
          ShowDialog::Error:
            ERROR(Text003,DialogText,FIELDCAPTION("Line No."),"Line No.");
        END;
        */

    end;

    local procedure GetLocation(LocationCode : Code[10]);
    begin
        IF Location.Code <> LocationCode THEN
          Location.GET(LocationCode);
    end;

    local procedure GetBin(LocationCode : Code[10];BinCode : Code[20]);
    begin
        IF BinCode = '' THEN
          CLEAR(Bin)
        ELSE
          IF Bin.Code <> BinCode THEN
            Bin.GET(LocationCode,BinCode);
    end;

    local procedure GetDefaultBin(FromLocationCode : Code[10];ToLocationCode : Code[10]);
    begin
        IF (FromLocationCode <> '') AND ("Item No." <> '') THEN BEGIN
          GetLocation(FromLocationCode);
          IF Location."Bin Mandatory" AND NOT Location."Directed Put-away and Pick" THEN BEGIN
            WMSManagement.GetDefaultBin("Item No.","Variant Code",FromLocationCode,"Transfer-from Bin Code");
            HandleDedicatedBin(FALSE);
          END;
        END;

        IF (ToLocationCode <> '') AND ("Item No." <> '') THEN BEGIN
          GetLocation(ToLocationCode);
          IF Location."Bin Mandatory" AND NOT Location."Directed Put-away and Pick" THEN
            WMSManagement.GetDefaultBin("Item No.","Variant Code",ToLocationCode,"Transfer-To Bin Code");
        END;
    end;

    procedure IsInbound() : Boolean;
    begin
        EXIT("Quantity (Base)" < 0);
    end;

    local procedure HandleDedicatedBin(IssueWarning : Boolean);
    var
        WhseIntegrationMgt : Codeunit "7317";
    begin
        IF NOT IsInbound AND ("Quantity (Base)" <> 0) THEN
          WhseIntegrationMgt.CheckIfBinDedicatedOnSrcDoc("Transfer-from Code","Transfer-from Bin Code",IssueWarning);
    end;

    procedure FilterLinesWithItemToPlan(var Item : Record "27";IsReceipt : Boolean;IsSupplyForPlanning : Boolean);
    begin
        RESET;
        SETCURRENTKEY("Item No.");
        SETRANGE("Item No.",Item."No.");
        SETFILTER("Variant Code",Item.GETFILTER("Variant Filter"));
        IF NOT IsSupplyForPlanning THEN
          SETRANGE("Derived From Line No.",0);
        IF IsReceipt THEN BEGIN
          SETFILTER("Transfer-to Code",Item.GETFILTER("Location Filter"));
          SETFILTER("Receipt Date",Item.GETFILTER("Date Filter"))
        END ELSE BEGIN
          SETFILTER("Transfer-from Code",Item.GETFILTER("Location Filter"));
          SETFILTER("Shipment Date",Item.GETFILTER("Date Filter"));
          SETFILTER("Outstanding Qty. (Base)",'<>0');
        END;
        SETFILTER("Shortcut Dimension 1 Code",Item.GETFILTER("Global Dimension 1 Filter"));
        SETFILTER("Shortcut Dimension 2 Code",Item.GETFILTER("Global Dimension 2 Filter"));
    end;

    procedure FindLinesWithItemToPlan(var Item : Record "27";IsReceipt : Boolean;IsSupplyForPlanning : Boolean) : Boolean;
    begin
        FilterLinesWithItemToPlan(Item,IsReceipt,IsSupplyForPlanning);
        EXIT(FIND('-'));
    end;

    procedure LinesWithItemToPlanExist(var Item : Record "27";IsReceipt : Boolean) : Boolean;
    begin
        FilterLinesWithItemToPlan(Item,IsReceipt,FALSE);
        EXIT(NOT ISEMPTY);
    end;

    local procedure VerifyItemLineDim();
    begin
        IF IsShippedDimChanged THEN
          ConfirmShippedDimChange;
    end;

    procedure IsShippedDimChanged() : Boolean;
    begin
        EXIT(("Dimension Set ID" <> xRec."Dimension Set ID") AND
          (("Quantity Shipped" <> 0) OR ("Qty. Shipped (Base)" <> 0)));
    end;

    procedure ConfirmShippedDimChange() : Boolean;
    begin
        IF NOT CONFIRM(Text012,FALSE,TABLECAPTION) THEN
          ERROR(Text013);

        EXIT(TRUE);
    end;

    local procedure SelectItemEntry(CurrentFieldNo : Integer);
    var
        ItemLedgEntry : Record "32";
        TransferLine2 : Record "5741";
    begin
        /*ItemLedgEntry.SETRANGE("Item No.","Item No.");
        IF "Transfer-from Code" <> '' THEN
          ItemLedgEntry.SETRANGE("Location Code","Transfer-from Code");
        ItemLedgEntry.SETRANGE("Variant Code","Variant Code");
        
        ItemLedgEntry.SETRANGE(Positive,TRUE);
        ItemLedgEntry.SETRANGE(Open,TRUE);
        
        IF PAGE.RUNMODAL(PAGE::"Item Ledger Entries",ItemLedgEntry) = ACTION::LookupOK THEN BEGIN
          TransferLine2 := Rec;
          TransferLine2.VALIDATE("Appl.-to Item Entry",ItemLedgEntry."Entry No.");
          CheckItemAvailable(CurrentFieldNo);
          Rec := TransferLine2;
        END;
        */

    end;

    procedure CalcStockEconAuto() DecGStockEA : Decimal;
    var
        RecGInvSetup : Record "313";
        RecGItem : Record "27";
        RecGUsersetup : Record "91";
    begin
        //<< ZMN 13/03/2017 - Calculer Stock Economic Auto

          IF RecGUsersetup.GET(UPPERCASE(USERID)) THEN
            BEGIN
              RecGInvSetup.GET;
              IF COMPANYNAME <> (RecGInvSetup."Socité stock consolidé") THEN
                  RecGItem.CHANGECOMPANY(RecGInvSetup."Socité stock consolidé");

              IF RecGItem.GET("Item No.") THEN
                BEGIN
                  RecGItem.SETRANGE("Location Filter",RecGUsersetup."Mag Reservation/Defaut");
                  IF "Variant Code" <> '' THEN
                    RecGItem.SETRANGE(RecGItem."Variant Filter","Variant Code");
                  RecGItem.CALCFIELDS(Inventory);
                  DecGStockEA :=  RecGItem.Inventory;
                END ;
            END;

        //>> ZMN 13/03/2017
    end;

    procedure FctCalcTotalStockDispoMag() DecGStockEA : Decimal;
    var
        RecGInvSetup : Record "313";
        RecGItem : Record "27";
        RecGUsersetup : Record "91";
        LRecCompany : Record "2000000006";
        RecGItem2 : Record "27";
    begin
        //<< ZMN 13/03/2017 - Calculer Stock
        LRecCompany.RESET;
        IF LRecCompany.FINDSET THEN
          REPEAT
              RecGUsersetup.CHANGECOMPANY(LRecCompany.Name);
              IF RecGUsersetup.GET(UPPERCASE(USERID)) THEN
                BEGIN
                  RecGItem.CHANGECOMPANY(LRecCompany.Name);
                  RecGItem2.RESET;
                  RecGItem2.CHANGECOMPANY(LRecCompany.Name);
                  IF RecGItem.GET("Item No.") THEN
                    BEGIN
                      IF RecGItem2.GET("Item No.") THEN
                        BEGIN
                          RecGItem.SETRANGE("Location Filter",RecGUsersetup."Mag Reservation/Defaut");
                          IF "Variant Code" <> '' THEN
                            RecGItem.SETRANGE(RecGItem."Variant Filter","Variant Code");
                          RecGItem.CALCFIELDS(Inventory);
                          RecGItem2.CALCFIELDS( "Qty. on Sales Order","Qty. on Service Order");
                          DecGStockEA +=  RecGItem.Inventory - (RecGItem2."Qty. on Service Order" + RecGItem2."Qty. on Sales Order");
                            END;
                    END ;
                END;
           UNTIL LRecCompany.NEXT =0;
        //>> ZMN 13/03/2017
    end;

    procedure FctCalcStockDispoMag() DecGStockEA : Decimal;
    var
        RecGInvSetup : Record "313";
        RecGItem : Record "27";
        RecGUsersetup : Record "91";
        LRecCompany : Record "2000000006";
        RecGItem2 : Record "27";
    begin
        //<< ZMN 13/03/2017 - Calculer Stock
        IF RecGUsersetup.GET(UPPERCASE(USERID)) THEN
          BEGIN
            RecGItem2.RESET;
            IF RecGItem.GET("Item No.") THEN
              BEGIN
                IF RecGItem2.GET("Item No.") THEN
                  BEGIN
                    RecGItem.SETRANGE("Location Filter",RecGUsersetup."Mag Reservation/Defaut");
                    IF "Variant Code" <> '' THEN
                      RecGItem.SETRANGE(RecGItem."Variant Filter","Variant Code");
                    RecGItem.CALCFIELDS(Inventory);
                    RecGItem2.CALCFIELDS( "Qty. on Sales Order","Qty. on Service Order");
                    DecGStockEA +=  RecGItem.Inventory - (RecGItem2."Qty. on Service Order" + RecGItem2."Qty. on Sales Order");
                      END;
              END ;
          END;
        //>> ZMN 13/03/2017
    end;
}

