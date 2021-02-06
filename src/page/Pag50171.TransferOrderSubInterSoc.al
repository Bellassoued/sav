page 50171 "Transfer Order Sub Inter Soc."
{
    // version NAVW111.00.00.19846,T180001

    // T180001 ZM 05/10/2018 : upgrade

    AutoSplitKey = true;
    CaptionML = ENU='Lines',
                FRA='Lignes';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = Table5741;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Item No.";"Item No.")
                {
                    ApplicationArea = Location;
                    StyleExpr = LineColor;
                    ToolTipML = ENU='Specifies the number of the item that will be transferred.',
                                FRA='Indique le numéro de l''article qui va être transféré.';

                    trigger OnValidate();
                    begin
                        //<<CT16V001 ZM 15/05/2016
                        CLEAR(RecGItem);
                        IF RecGItem.GET("Item No.") THEN
                          BEGIN
                            StockLocal   :=  RecGItem.CalcStockConsolidé("Item No.","Transfer-from Code","Variant Code");
                            StockDistant :=  RecGItem.CalcStockConsolidé("Item No.","Transfer-to Code","Variant Code");
                          END;
                        //DecStock := FctCalcStockDispoMag;
                        DecGStock :=  FctCalcTotalStockDispoMag("Transfer-from Code");
                        //DecStockTotalDispo := LCduItemavailability.FctCalcStockDispoTotal("Item No.");
                        //DecStockTotalDispoProj := LCduItemavailability.FctCalcStockProjeterDispoTotal("Item No.");
                        /* a pres la verification du slim
                        TransferHeader.RESET;
                        TransferHeader.GET("Document No.");
                        Location.GET(TransferHeader."Transfer-from Code");
                        IF Location."Control Transfert" THEN BEGIN
                          IF TransferHeader.Status = TransferHeader.Status::Notifié THEN BEGIN
                             IF NOT WarehouseEmployee.GET(USERID,TransferHeader."Transfer-from Code") THEN
                                ERROR(TXT50000,TransferHeader."Transfer-from Code");
                          END;
                        END;
                        */

                    end;
                }
                field(Replaced;Replaced)
                {
                }
                field("Variant Code";"Variant Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the variant of the item on the line.',
                                FRA='Indique la variante de l''article sur la ligne.';
                    Visible = false;
                }
                field("Planning Flexibility";"Planning Flexibility")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies whether the supply represented by this line is considered by the planning system when calculating action messages.',
                                FRA='Spécifie si l''approvisionnement représenté par cette ligne est pris en compte par le système de planification lors du calcul des messages d''action.';
                    Visible = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies a description of the entry.',
                                FRA='Spécifie une description de l''écriture.';
                }
                field("Transfer-from Bin Code";"Transfer-from Bin Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTipML = ENU='Specifies the code for the bin that the items are transferred from.',
                                FRA='Spécifie le code de l''emplacement à partir duquel les articles sont transférés.';
                    Visible = false;
                }
                field("Transfer-To Bin Code";"Transfer-To Bin Code")
                {
                    ApplicationArea = Warehouse;
                    ToolTipML = ENU='Specifies the code for the bin that the items are transferred to.',
                                FRA='Spécifie le code de l''emplacement vers lequel les articles sont transférés.';
                    Visible = false;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Location;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the quantity of the item that will be processed as the document stipulates.',
                                FRA='Indique la quantité de l''article qui sera traitée sur la base des indications du document.';
                }
                field("Reserved Quantity Inbnd.";"Reserved Quantity Inbnd.")
                {
                    ApplicationArea = Advanced;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the quantity of the item reserved at the transfer-to location.',
                                FRA='Indique la quantité de l''article réservée dans le magasin destination transfert.';
                }
                field("Reserved Quantity Shipped";"Reserved Quantity Shipped")
                {
                    ApplicationArea = Advanced;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies how many units on the shipped transfer order are reserved.',
                                FRA='Spécifie combien d''unités sur l''ordre de transfert expédié sont réservées.';
                }
                field("Reserved Quantity Outbnd.";"Reserved Quantity Outbnd.")
                {
                    ApplicationArea = Advanced;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies the quantity of the item reserved at the transfer-from location.',
                                FRA='Indique la quantité de l''article réservée dans le magasin provenance transfert.';
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.',
                                FRA='Spécifie la manière dont chaque unité de l''article ou de la ressource est mesurée, par exemple en unités ou en heures. Par défaut, la valeur du champ Unité de base de la fiche article ou la ressource est insérée.';
                }
                field("Qty Demandée";"Qty Demandée")
                {
                    Editable = false;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the name of the item or resource''s unit of measure, such as piece or hour.',
                                FRA='Spécifie le nom de l''unité de mesure de l''article ou de la ressource, par exemple pièce ou heure.';
                    Visible = false;
                }
                field("Qty. to Ship";"Qty. to Ship")
                {
                    ApplicationArea = Location;
                    BlankZero = true;
                    Style = Attention;
                    StyleExpr = TRUE;
                    ToolTipML = ENU='Specifies the quantity of items that remain to be shipped.',
                                FRA='Spécifie la quantité d''articles restant à expédier.';

                    trigger OnValidate();
                    begin
                        //<<CT16V001 ZM 15/05/2016
                        /* a pres la verification du slim
                        TransferHeader.RESET;
                        TransferHeader.GET("Document No.");
                        Location.GET(TransferHeader."Transfer-from Code");
                        IF Location."Control Transfert" THEN BEGIN
                          IF (Location.GET("Transfer-to Code")) AND (Location."Control Transfert") THEN BEGIN
                          IF TransferHeader.Status = TransferHeader.Status::Notifié THEN BEGIN
                             IF NOT WarehouseEmployee.GET(USERID,TransferHeader."Transfer-from Code") THEN
                                ERROR(TXT50000,TransferHeader."Transfer-from Code");
                          END;
                        END; END;
                        */

                    end;
                }
                field("Quantity Shipped";"Quantity Shipped")
                {
                    ApplicationArea = Location;
                    BlankZero = true;
                    Style = Favorable;
                    StyleExpr = TRUE;
                    ToolTipML = ENU='Specifies how many units of the item on the line have been posted as shipped.',
                                FRA='Spécifie le nombre d''unités de l''article sur la ligne qui ont déjà été validées comme expédiées.';

                    trigger OnDrillDown();
                    var
                        TransShptLine : Record "5745";
                    begin
                        TESTFIELD("Document No.");
                        TESTFIELD("Item No.");
                        TransShptLine.SETCURRENTKEY("Transfer Order No.","Item No.","Shipment Date");
                        TransShptLine.SETRANGE("Transfer Order No.","Document No.");
                        TransShptLine.SETRANGE("Item No.","Item No.");
                        PAGE.RUNMODAL(0,TransShptLine);
                    end;
                }
                field("Qty. to Receive";"Qty. to Receive")
                {
                    ApplicationArea = Location;
                    BlankZero = true;
                    Editable = NOT "Direct Transfer";
                    ToolTipML = ENU='Specifies the quantity of items that remains to be received.',
                                FRA='Indique la quantité d''articles restant à recevoir.';
                }
                field("Quantity Received";"Quantity Received")
                {
                    ApplicationArea = Location;
                    BlankZero = true;
                    ToolTipML = ENU='Specifies how many units of the item on the line have been posted as received.',
                                FRA='Spécifie le nombre d''unités de l''article sur la ligne qui ont déjà été validées comme reçues.';

                    trigger OnDrillDown();
                    var
                        TransRcptLine : Record "5747";
                    begin
                        TESTFIELD("Document No.");
                        TESTFIELD("Item No.");
                        TransRcptLine.SETCURRENTKEY("Transfer Order No.","Item No.","Receipt Date");
                        TransRcptLine.SETRANGE("Transfer Order No.","Document No.");
                        TransRcptLine.SETRANGE("Item No.","Item No.");
                        PAGE.RUNMODAL(0,TransRcptLine);
                    end;
                }
                field("Shipment Date";"Shipment Date")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.',
                                FRA='Spécifie quand les articles du document sont expédiés ou ont été expédiés. Une date d''expédition est généralement calculée à partir d''une date de livraison demandée avec un délai de sécurité.';
                }
                field("Receipt Date";"Receipt Date")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the date that you expect the transfer-to location to receive the shipment.',
                                FRA='Spécifie la date à laquelle le magasin destination transfert doit réceptionner l''expédition.';
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the code for the shipping agent who is transporting the items.',
                                FRA='Spécifie le code du transporteur des articles.';
                    Visible = false;
                }
                field("Shipping Agent Service Code";"Shipping Agent Service Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the code for the service, such as a one-day delivery, that is offered by the shipping agent.',
                                FRA='Spécifie le code pour le service, telle qu''une livraison sous 24 heures, assurée par un transporteur.';
                    Visible = false;
                }
                field("Shipping Time";"Shipping Time")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies how long it takes from when the items are shipped from the warehouse to when they are delivered.',
                                FRA='Spécifie le délai nécessaire entre le moment de l''expédition des articles à partir de l''entrepôt et la livraison.';
                    Visible = false;
                }
                field("Outbound Whse. Handling Time";"Outbound Whse. Handling Time")
                {
                    ApplicationArea = Warehouse;
                    ToolTipML = ENU='Specifies a date formula for the time it takes to get items ready to ship from this location. The time element is used in the calculation of the delivery date as follows: Shipment Date + Outbound Warehouse Handling Time = Planned Shipment Date + Shipping Time = Planned Delivery Date.',
                                FRA='Spécifie une formule date pour le délai nécessaire pour que des articles soient prêts pour expédition à partir de ce magasin. L''élément de temps est utilisé dans le calcul de la date de livraison comme suit : Date expédition + délai désenlogement = Date expédition planifiée + délai expédition = Date livraison planifiée.';
                    Visible = false;
                }
                field("Inbound Whse. Handling Time";"Inbound Whse. Handling Time")
                {
                    ApplicationArea = Warehouse;
                    ToolTipML = ENU='Specifies the time it takes to make items part of available inventory, after the items have been posted as received.',
                                FRA='Spécifie le temps nécessaire pour que les articles soient inclus dans le stock disponible une fois les articles validés.';
                    Visible = false;
                }
                field("Appl.-to Item Entry";"Appl.-to Item Entry")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the number of the item ledger entry that the document or journal line is applied to.',
                                FRA='Spécifie le numéro de l''écriture comptable article avec laquelle la ligne feuille ou document est lettrée.';
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 1 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 2 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';
                    Visible = false;
                }
                field(ShortcutDimCode[3];ShortcutDimCode[3])
                {
                    ApplicationArea = Location;
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(3),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(3,ShortcutDimCode[3]);
                    end;
                }
                field(ShortcutDimCode[4];ShortcutDimCode[4])
                {
                    ApplicationArea = Location;
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(4),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(4,ShortcutDimCode[4]);
                    end;
                }
                field(ShortcutDimCode[5];ShortcutDimCode[5])
                {
                    ApplicationArea = Location;
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(5),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(5,ShortcutDimCode[5]);
                    end;
                }
                field(ShortcutDimCode[6];ShortcutDimCode[6])
                {
                    ApplicationArea = Location;
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(6),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(6,ShortcutDimCode[6]);
                    end;
                }
                field(ShortcutDimCode[7];ShortcutDimCode[7])
                {
                    ApplicationArea = Location;
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(7),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(7,ShortcutDimCode[7]);
                    end;
                }
                field(ShortcutDimCode[8];ShortcutDimCode[8])
                {
                    ApplicationArea = Location;
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(8),
                                                                  Dimension Value Type=CONST(Standard),
                                                                  Blocked=CONST(No));
                    Visible = false;

                    trigger OnValidate();
                    begin
                        ValidateShortcutDimCode(8,ShortcutDimCode[8]);
                    end;
                }
                field("Document No.";"Document No.")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field(StockLocal;StockLocal)
                {
                    Caption = 'St Provenance Transfer';
                    Editable = false;
                }
                field(StockDistant;StockDistant)
                {
                    Caption = 'St DestinationTransfer';
                    Editable = false;
                }
                field(Chassi;Chassi)
                {
                }
                field("Non Livré";"Non Livré")
                {
                }
                field("CAB Mouvment";"CAB Mouvment")
                {
                }
                field("Qty Scanner à réceptionner";"Qty Scanner à réceptionner")
                {
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                }
                field("Par Défaut";"Par Défaut")
                {
                }
                field("Pour Stock";"Pour Stock")
                {
                }
                field("Pour Vente";"Pour Vente")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action(Reserve)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='&Reserve',
                                FRA='&Réserver';
                    Image = Reserve;
                    ToolTipML = ENU='Reserve the quantity that is required on the document line that you opened this window for.',
                                FRA='Réserver la quantité qui est requise sur la ligne document pour laquelle vous avez ouvert cette fenêtre.';

                    trigger OnAction();
                    begin
                        FIND;
                        ShowReservation;
                    end;
                }
            }
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                Image = Line;
                group("Item Availability by")
                {
                    CaptionML = ENU='Item Availability by',
                                FRA='Disponibilité article par';
                    Image = ItemAvailability;
                    action("Event")
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Event',
                                    FRA='Événement';
                        Image = "Event";
                        ToolTipML = ENU='View how the actual and the projected available balance of an item will develop over time according to supply and demand events.',
                                    FRA='Affichez le développement du niveau de stock réel et prévisionnel d''un article dans le temps en fonction des événements de l''offre et de la demande.';

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromTransLine(Rec,ItemAvailFormsMgt.ByEvent);
                        end;
                    }
                    action(Period)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Period',
                                    FRA='Période';
                        Image = Period;
                        ToolTipML = ENU='Show the projected quantity of the item over time according to time periods, such as day, week, or month.',
                                    FRA='Affichez la quantité prévisionnelle de l''article dans le temps en fonction de périodes de temps, par exemple jour, semaine ou mois.';

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromTransLine(Rec,ItemAvailFormsMgt.ByPeriod);
                        end;
                    }
                    action(Variant)
                    {
                        ApplicationArea = Advanced;
                        CaptionML = ENU='Variant',
                                    FRA='Variante';
                        Image = ItemVariant;
                        ToolTipML = ENU='View or edit the item''s variants. Instead of setting up each color of an item as a separate item, you can set up the various colors as variants of the item.',
                                    FRA='Afficher ou modifier les variantes article. Au lieu de créer chaque couleur pour un article en tant qu''article séparé, vous pouvez spécifier les différentes couleurs comme variantes de l''article.';

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromTransLine(Rec,ItemAvailFormsMgt.ByVariant);
                        end;
                    }
                    action(Location)
                    {
                        AccessByPermission = TableData 14=R;
                        ApplicationArea = Location;
                        CaptionML = ENU='Location',
                                    FRA='Magasin';
                        Image = Warehouse;
                        ToolTipML = ENU='View the actual and projected quantity of the item per location.',
                                    FRA='Afficher la quantité réelle et prévisionnelle de l''article par magasin.';

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromTransLine(Rec,ItemAvailFormsMgt.ByLocation);
                        end;
                    }
                    action("BOM Level")
                    {
                        ApplicationArea = Advanced;
                        CaptionML = ENU='BOM Level',
                                    FRA='Niveau nomenclature';
                        Image = BOMLevel;
                        ToolTipML = ENU='View availability figures for items on bills of materials that show how many units of a parent item you can make based on the availability of child items.',
                                    FRA='Affichez les chiffres de disponibilité pour les articles de nomenclature qui indiquent combien d''unités d''un parent vous pouvez effectuer sur la base de la disponibilité des éléments enfant.';

                        trigger OnAction();
                        begin
                            ItemAvailFormsMgt.ShowItemAvailFromTransLine(Rec,ItemAvailFormsMgt.ByBOM);
                        end;
                    }
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348=R;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTipML = ENU='View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.',
                                FRA='Affichez ou modifiez les axes analytiques, tels que la zone, le projet ou le département que vous pouvez affecter aux documents vente et achat afin de distribuer les coûts et analyser l''historique des transactions.';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                    end;
                }
                group("Item &Tracking Lines")
                {
                    CaptionML = ENU='Item &Tracking Lines',
                                FRA='Lignes &traçabilité';
                    Image = AllLines;
                    action(Shipment)
                    {
                        ApplicationArea = ItemTracking;
                        CaptionML = ENU='Shipment',
                                    FRA='Expédition';
                        Image = Shipment;
                        ToolTipML = ENU='View or edit serial numbers and lot numbers that are assigned to the item on the document or journal line.',
                                    FRA='Afficher ou modifier des numéros de série et de lot qui sont affectés à l''article sur le document ou la ligne feuille.';

                        trigger OnAction();
                        begin
                            OpenItemTrackingLines(0);
                        end;
                    }
                    action(Receipt)
                    {
                        ApplicationArea = ItemTracking;
                        CaptionML = ENU='Receipt',
                                    FRA='Réception';
                        Image = Receipt;
                        ToolTipML = ENU='View or edit serial numbers and lot numbers that are assigned to the item on the document or journal line.',
                                    FRA='Afficher ou modifier des numéros de série et de lot qui sont affectés à l''article sur le document ou la ligne feuille.';

                        trigger OnAction();
                        begin
                            OpenItemTrackingLines(1);
                        end;
                    }
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        //<<CT16V001 ZM 15/05/2016
        Stylish := FALSE;
        IF Replaced THEN
          Stylish := TRUE;
        //>>CT16V001 ZM 15/05/2016
        LineColor :='';
        DecGStock :=  FctCalcTotalStockDispoMag("Transfer-from Code") ;
        IF DecGStock  <= Quantity  THEN
          LineColor := 'Unfavorable'
          ELSE
           LineColor :='Favorable';
    end;

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        //<<CT16V001 ZM 15/05/2016

        //<<ZMNN 08/06/2017
        FctEditQty;
        //>>ZMNN 08/06/20174
        CLEAR(RecGItem);
        IF RecGItem.GET("Item No.") THEN
        BEGIN
           StockLocal   :=  RecGItem.CalcStockConsolidé("Item No.","Transfer-from Code","Variant Code");
           StockDistant :=  RecGItem.CalcStockConsolidé("Item No.","Transfer-to Code","Variant Code");
        END;
        //SM
        Stylish := FALSE;
        IF Replaced THEN
          Stylish := TRUE;
        //>>CT16V001 ZM 15/05/2016
        //DecStock := FctCalcStockDispoMag;
        LineColor := '';
        DecGStock :=  FctCalcTotalStockDispoMag("Transfer-from Code");
        //DecStockTotalDispo := LCduItemavailability.FctCalcStockDispoTotal("Item No.");
        //DecStockTotalDispoProj := LCduItemavailability.FctCalcStockProjeterDispoTotal("Item No.");
        IF DecGStock  <= Quantity  THEN
          LineColor := 'Unfavorable'
          ELSE
           LineColor :='Favorable';
    end;

    trigger OnDeleteRecord() : Boolean;
    var
        ReserveTransferLine : Codeunit "99000836";
    begin
        COMMIT;
        IF NOT ReserveTransferLine.DeleteLineConfirm(Rec) THEN
          EXIT(FALSE);
        ReserveTransferLine.DeleteLine(Rec);
    end;

    trigger OnInit();
    begin
        BlnEditQty := FALSE;
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        //<<CT16V001 ZM 15/05/2016
        /* a pres la verification du slim
        TransferHeader.RESET;
        TransferHeader.GET("Document No.");
        Location.GET(TransferHeader."Transfer-from Code");
        IF Location."Control Transfert" THEN BEGIN
          IF (Location.GET("Transfer-to Code")) AND (Location."Control Transfert") THEN BEGIN
          IF TransferHeader.Status = TransferHeader.Status::Notifié THEN BEGIN
             IF NOT WarehouseEmployee.GET(USERID,TransferHeader."Transfer-from Code") THEN
                ERROR(TXT50000,TransferHeader."Transfer-from Code");
          END;
        END; END;
        */

    end;

    trigger OnModifyRecord() : Boolean;
    begin
        //<<CT16V001 ZM 15/05/2016
        /* a pres la verification du slim
        TransferHeader.RESET;
        TransferHeader.GET("Document No.");
        Location.GET(TransferHeader."Transfer-from Code");
        IF Location."Control Transfert" THEN BEGIN
          IF (Location.GET("Transfer-to Code")) AND (Location."Control Transfert") THEN BEGIN
          IF TransferHeader.Status = TransferHeader.Status::Notifié THEN BEGIN
             IF NOT WarehouseEmployee.GET(USERID,TransferHeader."Transfer-from Code") THEN
                ERROR(TXT50000,TransferHeader."Transfer-from Code");
          END;
        END; END;
        */

    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        CLEAR(ShortcutDimCode);
        FctEditQty;
        //<<CT16V001 ZM 15/05/2016
        /* a pres la verification du slim
        TransferHeader.RESET;
        TransferHeader.GET("Document No.");
        Location.GET(TransferHeader."Transfer-from Code");
        IF Location."Control Transfert" THEN BEGIN
          IF (Location.GET("Transfer-to Code")) AND (Location."Control Transfert") THEN BEGIN
          IF TransferHeader.Status = TransferHeader.Status::Notifié THEN BEGIN
             IF NOT WarehouseEmployee.GET(USERID,TransferHeader."Transfer-from Code") THEN
                ERROR(TXT50000,TransferHeader."Transfer-from Code");
          END;
        END; END;
        */

    end;

    var
        ItemAvailFormsMgt : Codeunit "353";
        ShortcutDimCode : array [8] of Code[20];
        StockLocal : Decimal;
        StockDistant : Decimal;
        RecGItem : Record "27";
        [InDataSet]
        Stylish : Boolean;
        WarehouseEmployee : Record "7301";
        TransferHeader : Record "5740";
        ModifTransfert : Boolean;
        TXT50000 : Label 'Vous n''''avez pas le droit sur la magasin %1';
        Location : Record "14";
        DecGStock : Decimal;
        DecStockTotalDispo : Decimal;
        DecStockTotalDispoProj : Decimal;
        LCduItemavailability : Codeunit "70000";
        DecStock : Decimal;
        LineColor : Text;
        BlnEditQty : Boolean;
        RecTransHeader : Record "5740";

    [Scope('Personalization')]
    procedure UpdateForm(SetSaveRecord : Boolean);
    begin
        CurrPage.UPDATE(SetSaveRecord);
    end;

    local procedure FctEditQty();
    begin
        //TESTFIELD("Document No.");
        IF "Document No." <> RecTransHeader."No." THEN
          BEGIN
            IF RecTransHeader.GET("Document No.") THEN
              BEGIN
                IF RecTransHeader."Source No" = '' THEN
                   BlnEditQty := TRUE
                  ELSE
                    BlnEditQty := FALSE;
              END;
            END;
    end;
}

