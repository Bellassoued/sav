page 50170 "Transfer Order Inter Société"
{
    // version NAVW111.00.00.23572,T180001

    //  T180001 ZM 05/10/2018 : upgrade

    CaptionML = ENU='Transfer Order',
                FRA='Ordre de transfert';
    PageType = Document;
    PromotedActionCategoriesML = ENU='New,Process,Report,Release,Posting,Order,Documents',
                                 FRA='Nouveau,Traiter,État,Lancer,Comptabilisation,Ordre,Documents';
    RefreshOnActivate = true;
    SourceTable = Table5740;

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            FRA='Général';
                field("No.";"No.")
                {
                    ApplicationArea = Location;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the number of the involved entry or record, according to the specified number series.',
                                FRA='Spécifie le numéro de l''écriture ou de l''enregistrement concerné, en fonction de la souche de numéros spécifiée.';
                    Visible = DocNoVisible;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                    ApplicationArea = Location;
                    Editable = (Status = Status::Open) AND EnableTransferFields;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the code of the location that items are transferred from.',
                                FRA='Spécifie le code du magasin à partir duquel les articles sont transférés.';
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                    ApplicationArea = Location;
                    Editable = (Status = Status::Open) AND EnableTransferFields;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the code of the location that the items are transferred to.',
                                FRA='Spécifie le code du magasin vers lequel les articles sont transférés.';
                }
                field("In-Transit Code";"In-Transit Code")
                {
                    ApplicationArea = Location;
                    Editable = EnableTransferFields;
                    Enabled = (NOT "Direct Transfer") AND (Status = Status::Open);
                    ToolTipML = ENU='Specifies the in-transit code for the transfer order, such as a shipping agent.',
                                FRA='Spécifie le code transit de l''ordre de transfert, par exemple un transporteur.';
                }
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the posting date of the transfer order.',
                                FRA='Spécifie la date comptabilisation de l''ordre de transfert.';

                    trigger OnValidate();
                    begin
                        PostingDateOnAfterValidate;
                    end;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Location;
                    Editable = EnableTransferFields;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 1 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Location;
                    Editable = EnableTransferFields;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 2 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';
                }
                field("Assigned User ID";"Assigned User ID")
                {
                    ApplicationArea = Location;
                    Editable = BlnRespMag;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the ID of the user who is responsible for the document.',
                                FRA='Spécifie le code de l''utilisateur qui est responsable du document.';
                }
                field(Status;Status)
                {
                    ApplicationArea = Location;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies whether the transfer order is open or has been released for warehouse handling.',
                                FRA='Spécifie si l''ordre de transfert est ouvert ou a été lancé pour la gestion entrepôt.';
                }
                field("Autoriser Transporteur";"Autoriser Transporteur")
                {
                    CaptionML = ENU='Autorisation Transfert',
                                FRA='Autorisation Transfert';

                    trigger OnValidate();
                    begin
                        TESTFIELD("Code transporteur");
                    end;
                }
                field("Completely Shipped";"Completely Shipped")
                {
                }
                field("Completely Received";"Completely Received")
                {
                }
                field(cloturer;cloturer)
                {
                }
                field("Reception No";"Reception No")
                {
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Source Type";"Source Type")
                {
                    Editable = false;
                }
                field("Source No";"Source No")
                {
                    Caption = 'Bon de Commande';
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field(Retour;Retour)
                {
                    Editable = false;
                }
                field("Item Source Location";"Item Source Location")
                {
                }
                field("Créer par";"Créer par")
                {
                    Editable = false;
                }
                field(VIN;VIN)
                {
                }
                field("No. Colis";"No. Colis")
                {
                    Editable = false;
                }
                field("No Facture Fournisseur";"No Facture Fournisseur")
                {
                    Editable = false;
                }
                field("No. Arrivage PR";"No. Arrivage PR")
                {
                    Editable = false;
                }
                field("Periorité";Periority)
                {
                    Editable = Blnpriorite;
                }
                field("Transfer inter succursale";"Transfer inter succursale")
                {
                }
                field("Code transporteur";"Code transporteur")
                {
                }
                field("Ressource affectée";"Ressource affectée")
                {
                }
                field("Nom ressource affectée";"Nom ressource affectée")
                {
                }
                field(Réservation;Réservation)
                {

                    trigger OnValidate();
                    begin
                        TESTFIELD("Créer par",USERID);
                    end;
                }
                field("Sur Commande";"Sur Commande")
                {
                }
                field("Centre Gestion Cmd Vente";"Centre Gestion Cmd Vente")
                {
                }
                field("No Commande Vente";"No Commande Vente")
                {
                }
            }
            part(TransferLines;50171)
            {
                ApplicationArea = Location;
                SubPageLink = Document No.=FIELD(No.),
                              Derived From Line No.=CONST(0);
                UpdatePropagation = Both;
            }
            group(Shipment)
            {
                CaptionML = ENU='Shipment',
                            FRA='Expédition';
                Editable = (Status = Status::Open) AND EnableTransferFields;
                field("Shipment Date";"Shipment Date")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.',
                                FRA='Spécifie quand les articles du document sont expédiés ou ont été expédiés. Une date d''expédition est généralement calculée à partir d''une date de livraison demandée avec un délai de sécurité.';

                    trigger OnValidate();
                    begin
                        ShipmentDateOnAfterValidate;
                    end;
                }
                field("Outbound Whse. Handling Time";"Outbound Whse. Handling Time")
                {
                    ApplicationArea = Warehouse;
                    ToolTipML = ENU='Specifies a date formula for the time it takes to get items ready to ship from this location. The time element is used in the calculation of the delivery date as follows: Shipment Date + Outbound Warehouse Handling Time = Planned Shipment Date + Shipping Time = Planned Delivery Date.',
                                FRA='Spécifie une formule date pour le délai nécessaire pour que des articles soient prêts pour expédition à partir de ce magasin. L''élément de temps est utilisé dans le calcul de la date de livraison comme suit : Date expédition + délai désenlogement = Date expédition planifiée + délai expédition = Date livraison planifiée.';

                    trigger OnValidate();
                    begin
                        OutboundWhseHandlingTimeOnAfte;
                    end;
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the delivery conditions of the related shipment, such as free on board (FOB).',
                                FRA='Spécifie les conditions de livraison de l''expédition associée, telles que Franco bord (FAB).';
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the code for the shipping agent who is transporting the items.',
                                FRA='Spécifie le code du transporteur des articles.';

                    trigger OnValidate();
                    begin
                        ShippingAgentCodeOnAfterValida;
                    end;
                }
                field("Shipping Agent Service Code";"Shipping Agent Service Code")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the code for the service, such as a one-day delivery, that is offered by the shipping agent.',
                                FRA='Spécifie le code pour le service, telle qu''une livraison sous 24 heures, assurée par un transporteur.';

                    trigger OnValidate();
                    begin
                        ShippingAgentServiceCodeOnAfte;
                    end;
                }
                field("Shipping Time";"Shipping Time")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies how long it takes from when the items are shipped from the warehouse to when they are delivered.',
                                FRA='Spécifie le délai nécessaire entre le moment de l''expédition des articles à partir de l''entrepôt et la livraison.';

                    trigger OnValidate();
                    begin
                        ShippingTimeOnAfterValidate;
                    end;
                }
                field("Shipping Advice";"Shipping Advice")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies an instruction to the warehouse that ships the items, for example, that it is acceptable to do partial shipment.',
                                FRA='Spécifie une instruction à l''entrepôt qui expédie les articles, par exemple, le fait qu''une expédition partielle est acceptable.';

                    trigger OnValidate();
                    begin
                        IF "Shipping Advice" <> xRec."Shipping Advice" THEN
                          IF NOT CONFIRM(Text000,FALSE,FIELDCAPTION("Shipping Advice")) THEN
                            ERROR('');
                    end;
                }
                field("Receipt Date";"Receipt Date")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the date that you expect the transfer-to location to receive the shipment.',
                                FRA='Spécifie la date à laquelle le magasin destination transfert doit réceptionner l''expédition.';

                    trigger OnValidate();
                    begin
                        ReceiptDateOnAfterValidate;
                    end;
                }
            }
            group("Transfer-from")
            {
                CaptionML = ENU='Transfer-from',
                            FRA='Prov. transfert';
                Editable = (Status = Status::Open) AND EnableTransferFields;
                field("Transfer-from Name";"Transfer-from Name")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the name of the sender at the location that the items are transferred from.',
                                FRA='Spécifie le nom de l''expéditeur dans le magasin à partir duquel les articles sont transférés.';
                }
                field("Transfer-from Name 2";"Transfer-from Name 2")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies an additional part of the name of the sender at the location that the items are transferred from.',
                                FRA='Spécifie un complément au nom de l''expéditeur dans le magasin à partir duquel les articles sont transférés.';
                }
                field("Transfer-from Address";"Transfer-from Address")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the address of the location that the items are transferred from.',
                                FRA='Spécifie l''adresse du magasin à partir duquel les articles sont transférés.';
                }
                field("Transfer-from Address 2";"Transfer-from Address 2")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies an additional part of the address of the location that items are transferred from.',
                                FRA='Spécifie un complément à l''adresse du magasin à partir duquel les articles sont transférés.';
                }
                field("Transfer-from Post Code";"Transfer-from Post Code")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the postal code of the location that the items are transferred from.',
                                FRA='Spécifie le code postal du magasin à partir duquel les articles sont transférés.';
                }
                field("Transfer-from City";"Transfer-from City")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the city of the location that the items are transferred from.',
                                FRA='Spécifie la ville du magasin à partir duquel les articles sont transférés.';
                }
                field("Transfer-from Contact";"Transfer-from Contact")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the name of the contact person at the location that the items are transferred from.',
                                FRA='Spécifie le nom du contact dans le magasin à partir duquel les articles sont transférés.';
                }
                field("EXP Depuis Mobile";"EXP Depuis Mobile")
                {
                }
                field("Completely Shipped CAB";"Completely Shipped CAB")
                {
                }
            }
            group("Transfer-to")
            {
                CaptionML = ENU='Transfer-to',
                            FRA='Dest. transfert';
                Editable = (Status = Status::Open) AND EnableTransferFields;
                field("Transfer-to Name";"Transfer-to Name")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the name of the recipient at the location that the items are transferred to.',
                                FRA='Spécifie le nom du destinataire dans le magasin vers lequel les articles sont transférés.';
                }
                field("Transfer-to Name 2";"Transfer-to Name 2")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies an additional part of the name of the recipient at the location that the items are transferred to.',
                                FRA='Spécifie un complément au nom du destinataire dans le magasin vers lequel les articles sont transférés.';
                }
                field("Transfer-to Address";"Transfer-to Address")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the address of the location that the items are transferred to.',
                                FRA='Spécifie l''adresse du magasin vers lequel les articles sont transférés.';
                }
                field("Transfer-to Address 2";"Transfer-to Address 2")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies an additional part of the address of the location that the items are transferred to.',
                                FRA='Spécifie un complément à l''adresse du magasin vers lequel les articles sont transférés.';
                }
                field("Transfer-to Post Code";"Transfer-to Post Code")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the postal code of the location that the items are transferred to.',
                                FRA='Spécifie le code postal du magasin vers lequel les articles sont transférés.';
                }
                field("Transfer-to City";"Transfer-to City")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the city of the location that items are transferred to.',
                                FRA='Spécifie la ville du magasin vers lequel les articles sont transférés.';
                }
                field("Transfer-to Contact";"Transfer-to Contact")
                {
                    ApplicationArea = Location;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the name of the contact person at the location that items are transferred to.',
                                FRA='Spécifie le nom du contact dans le magasin vers lequel les articles sont transférés.';
                }
                field("Inbound Whse. Handling Time";"Inbound Whse. Handling Time")
                {
                    ApplicationArea = Warehouse;
                    ToolTipML = ENU='Specifies the time it takes to make items part of available inventory, after the items have been posted as received.',
                                FRA='Indique le temps nécessaire pour que les articles soient inclus dans le stock disponible une fois les articles validés.';

                    trigger OnValidate();
                    begin
                        InboundWhseHandlingTimeOnAfter;
                    end;
                }
                field("RCP depuis Mobile";"RCP depuis Mobile")
                {
                }
            }
            group("Foreign Trade")
            {
                CaptionML = ENU='Foreign Trade',
                            FRA='International';
                Editable = (Status = Status::Open) AND EnableTransferFields;
                field("Transaction Type";"Transaction Type")
                {
                    ApplicationArea = Advanced;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the type of transaction that the document represents, for the purpose of reporting to INTRASTAT.',
                                FRA='Spécifie le type de transaction que représente le document, à des fins de compte-rendu intracommunautaire.';
                }
                field("Transaction Specification";"Transaction Specification")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies a specification of the document''s transaction, for the purpose of reporting to INTRASTAT.',
                                FRA='Spécifie une spécification de la transaction du document, à des fins de compte-rendu intracommunautaire.';
                }
                field("Transport Method";"Transport Method")
                {
                    ApplicationArea = Advanced;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the transport method, for the purpose of reporting to INTRASTAT.',
                                FRA='Spécifie le mode de transport, à des fins de compte-rendu intracommunautaire.';
                }
                field(Area;Area)
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the area of the customer or vendor, for the purpose of reporting to INTRASTAT.',
                                FRA='Spécifie la zone du client ou du fournisseur, à des fins de compte-rendu intracommunautaire.';
                }
                field("Entry/Exit Point";"Entry/Exit Point")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the code of either the port of entry at which the items passed into your country/region, or the port of exit.',
                                FRA='Spécifie le code du port d''entrée par lequel les articles sont entrés dans votre pays/région ou du port de sortie.';
                }
            }
        }
        area(factboxes)
        {
            systempart(;Links)
            {
                Visible = false;
            }
            systempart(;Notes)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("O&rder")
            {
                CaptionML = ENU='O&rder',
                            FRA='O&rdre';
                Image = "Order";
                action(Statistics)
                {
                    ApplicationArea = Location;
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedOnly = true;
                    RunObject = Page 5755;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'F7';
                    ToolTipML = ENU='View statistical information about the transfer order, such as the quantity and total weight transferred.',
                                FRA='Affichez des informations statistiques sur l''ordre de transfert, telles que la quantité et le poids total transféré.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 5750;
                    RunPageLink = Document Type=CONST(Transfer Order),
                                  No.=FIELD(No.);
                    ToolTipML = ENU='View or add comments for the record.',
                                FRA='Affichez ou ajoutez des commentaires pour l''enregistrement.';
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348=R;
                    ApplicationArea = Location;
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedOnly = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTipML = ENU='View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.',
                                FRA='Affichez ou modifiez les axes analytiques, tels que la zone, le projet ou le département que vous pouvez affecter aux documents vente et achat afin de distribuer les coûts et analyser l''historique des transactions.';

                    trigger OnAction();
                    begin
                        ShowDocDim;
                        CurrPage.SAVERECORD;
                    end;
                }
            }
            group(Documents)
            {
                CaptionML = ENU='Documents',
                            FRA='Documents';
                Image = Documents;
                action("S&hipments")
                {
                    ApplicationArea = Location;
                    CaptionML = ENU='S&hipments',
                                FRA='&Expédition';
                    Image = Shipment;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedOnly = true;
                    RunObject = Page 5752;
                    RunPageLink = Transfer Order No.=FIELD(No.);
                    ToolTipML = ENU='View related posted transfer shipments.',
                                FRA='Afficher des expéditions transfert enregistrées associées.';
                }
                action("Re&ceipts")
                {
                    ApplicationArea = Location;
                    CaptionML = ENU='Re&ceipts',
                                FRA='&Réception';
                    Image = PostedReceipts;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedOnly = true;
                    RunObject = Page 5753;
                    RunPageLink = Transfer Order No.=FIELD(No.);
                    ToolTipML = ENU='View related posted transfer receipts.',
                                FRA='Afficher des réceptions transfert enregistrées associées.';
                }
                action("Proposer Article")
                {
                    Promoted = true;

                    trigger OnAction();
                    begin
                        //<<CT16V001 ZM 15/05/2016

                        TESTFIELD("Transfer-from Code");
                        TESTFIELD("Transfer-to Code");
                        TESTFIELD("In-Transit Code");
                        CLEAR(RecGPagePropArticle);
                        //Type Document Ordre de transfert
                        RecGTypeDoc:=3;
                        RecGPagePropArticle.SetPurchaseRequest(Rec."No.",RecGTypeDoc);
                        RecGPagePropArticle.RUNMODAL();
                        //>>CT16V001 ZM 15/05/2016
                    end;
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
                action("Whse. Shi&pments")
                {
                    ApplicationArea = Warehouse;
                    CaptionML = ENU='Whse. Shi&pments',
                                FRA='E&xpéditions entrep.';
                    Image = Shipment;
                    RunObject = Page 7341;
                    RunPageLink = Source Type=CONST(5741),
                                  Source Subtype=CONST(0),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.);
                    ToolTipML = ENU='View outbound items that have been shipped with warehouse activities for the transfer order.',
                                FRA='Affichez les éléments sortants qui ont été expédiés avec des activités entrepôt pour l''ordre de transfert.';
                }
                action("&Whse. Receipts")
                {
                    ApplicationArea = Warehouse;
                    CaptionML = ENU='&Whse. Receipts',
                                FRA='Ré&ceptions entrep.';
                    Image = Receipt;
                    RunObject = Page 7342;
                    RunPageLink = Source Type=CONST(5741),
                                  Source Subtype=CONST(1),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.);
                    ToolTipML = ENU='View inbound items that have been received with warehouse activities for the transfer order.',
                                FRA='Affichez les éléments entrants qui ont été reçus avec des activités entrepôt pour l''ordre de transfert.';
                }
                action("In&vt. Put-away/Pick Lines")
                {
                    ApplicationArea = Warehouse;
                    CaptionML = ENU='In&vt. Put-away/Pick Lines',
                                FRA='Lignes prélè&v./rangement stock';
                    Image = PickLines;
                    RunObject = Page 5774;
                    RunPageLink = Source Document=FILTER(Inbound Transfer|Outbound Transfer),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Document,Source No.,Location Code);
                    ToolTipML = ENU='View items that are inbound or outbound on inventory put-away or inventory pick documents for the transfer order.',
                                FRA='Affichez les éléments entrants ou sortants sur les documents rangement stock ou prélèvement stock pour l''ordre de transfert.';
                }
            }
        }
        area(processing)
        {
            action("&Print")
            {
                ApplicationArea = Location;
                CaptionML = ENU='&Print',
                            FRA='&Imprimer demande piéces';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTipML = ENU='Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.',
                            FRA='Préparez-vous à imprimer le document. Une fenêtre de sélection de l''état pour le document s''ouvre et vous permet d''indiquer les éléments à imprimer.';

                trigger OnAction();
                var
                    DocPrint : Codeunit "229";
                    LRepTransferOrder : Report "50050";
                    LRecTransferOrder : Record "5740";
                    LRecLocation : Record "14";
                begin
                    //DocPrint.PrintTransferHeader(Rec);

                    CLEAR(LRepTransferOrder);
                    LRecLocation.RESET;
                    LRecLocation.GET("Transfer-to Code");
                    //MESSAGE('Location');
                    LRepTransferOrder.FctPropagerNoReception(LRecLocation."Centre de Gestion");
                    //MESSAGE('Propager');
                    LRecTransferOrder.SETRANGE("No.","No.");
                    LRecTransferOrder.FINDFIRST;
                    LRepTransferOrder.SETTABLEVIEW(LRecTransferOrder);
                    LRepTransferOrder.RUN;

                    //MESSAGE('Location');
                end;
            }
            action("Report Retour Piece")
            {
                CaptionML = ENU='&Print',
                            FRA='&Imprimer retour piéces';
                Ellipsis = true;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    DocPrint : Codeunit "229";
                begin
                    //<<CT16V001 ZM 15/05/2016
                    CLEAR(RecGtrsferOrder);
                    RecGtrsferOrder.SETRANGE(RecGtrsferOrder."No.","No.");
                    REPORT.RUNMODAL(REPORT::"Retour Piece",TRUE,FALSE,RecGtrsferOrder);
                    //>>CT16V001 ZM 15/05/2016
                end;
            }
            action("Imprimer Préparation interne")
            {
                Caption = 'Imprimer Préparation interne';
                Image = PrintChecklistReport;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    //<<CT16V001 ZM 15/05/2016
                    CLEAR(RecGtrsferOrder);
                    RecGtrsferOrder.SETRANGE(RecGtrsferOrder."No.","No.");
                    REPORT.RUNMODAL(REPORT::"Préparation commande interne",TRUE,FALSE,RecGtrsferOrder);
                    //>>CT16V001 ZM 15/05/2016
                end;
            }
            action("Imprimer Réception Transfert")
            {
                Caption = 'Imprimer Réception Transfert';
                Image = PrintChecklistReport;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    //<<CT16V001 ZM 15/05/2016
                    CLEAR(RecGtrsferOrder);
                    RecGtrsferOrder.SETRANGE(RecGtrsferOrder."No.","No.");
                    REPORT.RUNMODAL(REPORT::"Bordereau de Trsf CHQ - NEW",TRUE,FALSE,RecGtrsferOrder);
                    //>>CT16V001 ZM 15/05/2016
                end;
            }
            group(Release)
            {
                CaptionML = ENU='Release',
                            FRA='Lancer';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Location;
                    CaptionML = ENU='Re&lease',
                                FRA='&Lancer';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    RunObject = Codeunit 5708;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTipML = ENU='Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.',
                                FRA='Lancer le document à l''étape suivante du traitement. Lorsqu''un document est lancé, il est inclus dans tous les calculs de disponibilité à partir de la date de réception prévue des articles.';
                }
                action("Reo&pen")
                {
                    ApplicationArea = Location;
                    CaptionML = ENU='Reo&pen',
                                FRA='Ré&ouvrir';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTipML = ENU='Reopen the transfer order after being released for warehouse handling.',
                                FRA='Rouvrez l''ordre de transfert après son lancement pour la gestion entrepôt.';

                    trigger OnAction();
                    var
                        ReleaseTransferDoc : Codeunit "5708";
                    begin
                        ReleaseTransferDoc.Reopen(Rec);
                    end;
                }
                action("Notifié")
                {
                    Image = Note;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        //<<CT16V001 ZM 15/05/2016
                        IF Location.GET("Transfer-from Code") AND (Location."Control Transfert") THEN BEGIN
                         IF (Location.GET("Transfer-to Code")) AND (Location."Control Transfert") THEN BEGIN
                          WarehouseEmployee.RESET;
                          IF WarehouseEmployee.GET(USERID,"Transfer-from Code") THEN BEGIN
                            TESTFIELD(Status,Status::Released);
                            VALIDATE(Status,Status::Notifié);
                            "Date Notification" :=CURRENTDATETIME;
                            "Notifié par" := USERID;
                            MODIFY;
                          END ELSE ERROR(TXT50000,"Transfer-from Code");
                        END; END;
                        //>>CT16V001 ZM 15/05/2016
                    end;
                }
                action("Traité")
                {
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        //<<CT16V001 ZM 15/05/2016
                        IF Location.GET("Transfer-from Code") AND (Location."Control Transfert") THEN BEGIN
                         IF (Location.GET("Transfer-to Code")) AND (Location."Control Transfert") THEN BEGIN
                          WarehouseEmployee.RESET;
                          IF WarehouseEmployee.GET(USERID,"Transfer-from Code") THEN BEGIN
                            TESTFIELD(Status,Status::"Encours De Traitement");
                            VALIDATE(Status,Status::Traité);
                            "Date Fin Traitement" := CURRENTDATETIME;
                            "Traité par" := USERID;
                            MODIFY;
                          END ELSE ERROR(TXT50000,"Transfer-from Code");
                        END; END;
                        //>>CT16V001 ZM 15/05/2016
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("Disponibilité article")
                {
                    Caption = 'Disponibilité article';
                    Image = Accounts;
                    Promoted = true;

                    trigger OnAction();
                    var
                        LCUItemavailability : Codeunit "70000";
                        LRecAvailibilityItem : Record "70006";
                        LPagItemAvailability : Page "70009";
                        RecTransferLine : Record "5741";
                    begin
                        //<< CT16V0002 ZMN 28/07/2016
                        RecTransferLine.RESET;
                        RecTransferLine.SETRANGE("Document No.","No.");
                        IF RecTransferLine.FINDFIRST THEN
                          REPEAT
                            RecTransferLine.TESTFIELD("Transfer-from Code");
                            RecTransferLine.TESTFIELD(Quantity);
                            LCUItemavailability.SetSalesOrderInfo(RecTransferLine.Quantity-RecTransferLine."Qty Demandée",RecTransferLine."Line No.",
                                            RecTransferLine."Document No.",RecTransferLine."Transfer-from Code");
                            LCUItemavailability.FctStartSearchForItem(RecTransferLine."Item No.");
                          UNTIL RecTransferLine.NEXT=0;
                        // "Remaining Qty to Order"
                        CLEAR(LPagItemAvailability);
                        LPagItemAvailability.SETTABLEVIEW(LRecAvailibilityItem);
                        LPagItemAvailability.SETRECORD(LRecAvailibilityItem);
                        IF LPagItemAvailability.RUNMODAL = ACTION::LookupOK THEN;
                        //>> CT16V0002 ZMN 28/07/2016
                    end;
                }
                action("Create Whse. S&hipment")
                {
                    AccessByPermission = TableData 7320=R;
                    ApplicationArea = Warehouse;
                    CaptionML = ENU='Create Whse. S&hipment',
                                FRA='Créer e&xpédition entrep.';
                    Image = NewShipment;
                    ToolTipML = ENU='Create a warehouse shipment to start a pick a ship process according to an advanced warehouse configuration.',
                                FRA='Créer une expédition entrepôt pour démarrer un traitement de prélèvement ou d''expédition en fonction d''une configuration entrepôt avancée.';

                    trigger OnAction();
                    var
                        GetSourceDocOutbound : Codeunit "5752";
                    begin
                        GetSourceDocOutbound.CreateFromOutbndTransferOrder(Rec);
                    end;
                }
                action("Create &Whse. Receipt")
                {
                    AccessByPermission = TableData 7316=R;
                    ApplicationArea = Warehouse;
                    CaptionML = ENU='Create &Whse. Receipt',
                                FRA='Créer &réception entrepôt';
                    Image = NewReceipt;
                    ToolTipML = ENU='Create a warehouse receipt to start a receive and put-away process according to an advanced warehouse configuration.',
                                FRA='Créer une réception entrepôt pour démarrer un traitement à la fois de réception entrepôt et de rangement en fonction d''une configuration entrepôt avancée.';

                    trigger OnAction();
                    var
                        GetSourceDocInbound : Codeunit "5751";
                    begin
                        GetSourceDocInbound.CreateFromInbndTransferOrder(Rec);
                    end;
                }
                action("Create Inventor&y Put-away/Pick")
                {
                    ApplicationArea = Warehouse;
                    CaptionML = ENU='Create Inventor&y Put-away/Pick',
                                FRA='Créer prélèv./rangement stoc&k';
                    Ellipsis = true;
                    Image = CreateInventoryPickup;
                    ToolTipML = ENU='Create an inventory put-away or inventory pick to handle items on the document with a basic warehouse process that does not require warehouse receipt or shipment documents.',
                                FRA='Créez un rangement stock ou un prélèvement stock pour gérer les articles figurant sur le document avec un processus entrepôt de base qui ne nécessite pas de documents de réception ou d''expédition entrepôt.';

                    trigger OnAction();
                    begin
                        CreateInvtPutAwayPick;
                    end;
                }
                action("Get Bin Content")
                {
                    AccessByPermission = TableData 7302=R;
                    ApplicationArea = Warehouse;
                    CaptionML = ENU='Get Bin Content',
                                FRA='Extraire contenu emplacement';
                    Ellipsis = true;
                    Image = GetBinContent;
                    ToolTipML = ENU='Use a function to create transfer lines with items to put away or pick based on the actual content in the specified bin.',
                                FRA='Utilisez une fonction pour créer des lignes transfert avec les articles à ranger ou prélever en fonction du contenu véritable de l''emplacement spécifié.';

                    trigger OnAction();
                    var
                        BinContent : Record "7302";
                        GetBinContent : Report "7391";
                    begin
                        BinContent.SETRANGE("Location Code","Transfer-from Code");
                        GetBinContent.SETTABLEVIEW(BinContent);
                        GetBinContent.InitializeTransferHeader(Rec);
                        GetBinContent.RUNMODAL;
                    end;
                }
                action("Préconisation Transfert")
                {
                    Image = PickLines;

                    trigger OnAction();
                    begin
                        //<<CT16V001 ZM 15/05/2016

                        TESTFIELD("Transfer-to Code");
                        TESTFIELD("Transfer-from Code");

                        CLEAR(PrécOdreTrans);
                        PrécOdreTrans.SetMagasinPréconisation("Transfer-to Code","Transfer-from Code");
                        PrécOdreTrans.SetNumTransfert("No.");
                        PrécOdreTrans.RUN();
                        //>>CT16V001 ZM 15/05/2016
                    end;
                }
            }
            group("P&osting")
            {
                CaptionML = ENU='P&osting',
                            FRA='&Validation';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Location;
                    CaptionML = ENU='P&ost',
                                FRA='&Valider';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'F9';
                    ToolTipML = ENU='Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.',
                                FRA='Finalisez le document ou la feuille en validant les montants et les quantités sur les comptes concernés dans la comptabilité de la société.';

                    trigger OnAction();
                    var
                        CdeNoColis : Code[10];
                    begin
                        IF Réservation THEN
                          ERROR('Cette demande est pour réservation. Merci de contacter le demandeur.');
                        CODEUNIT.RUN(CODEUNIT::"TransferOrder-Post (Yes/No)",Rec);
                        IF NOT DisableEditDirectTransfer THEN
                          DisableEditDirectTransfer := HasShippedItems;

                        CdeNoColis := "No. Colis";
                        RecPostedWhseReceiptHeader.RESET;
                        RecPostedWhseReceiptHeader.SETRANGE("No. Colis",CdeNoColis);
                        IF RecPostedWhseReceiptHeader.FINDFIRST THEN
                          BEGIN
                            RecPostedWhseReceiptHeader."Order de transfer Validé" := TRUE;
                            RecPostedWhseReceiptHeader."Order de transfer Réceptionnée" := TRUE;
                            RecPostedWhseReceiptHeader.MODIFY;
                          END;
                    end;
                }
                action("Post PDA")
                {

                    trigger OnAction();
                    var
                        PostTransfetOrderPDA : Codeunit "70002";
                        CdeNoColis : Code[20];
                    begin
                        CdeNoColis := "No. Colis";
                        PostTransfetOrderPDA.FctPostTransferOrder("No.",COMPANYNAME);
                        RecPostedWhseReceiptHeader.RESET;
                        RecPostedWhseReceiptHeader.SETRANGE("No. Colis",CdeNoColis);
                        IF RecPostedWhseReceiptHeader.FINDFIRST THEN
                          BEGIN
                            RecPostedWhseReceiptHeader."Order de transfer Validé" := TRUE;
                            RecPostedWhseReceiptHeader."Order de transfer Réceptionnée" := TRUE;
                            RecPostedWhseReceiptHeader.MODIFY;
                          END;
                    end;
                }
                action(PostAndPrint)
                {
                    ApplicationArea = Location;
                    CaptionML = ENU='Post and &Print',
                                FRA='Valider et i&mprimer';
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ShortCutKey = 'Shift+F9';
                    ToolTipML = ENU='Finalize and prepare to print the document or journal. The values and quantities are posted to the related accounts. A report request window where you can specify what to include on the print-out.',
                                FRA='Finaliser et préparer l''impression du document ou de la feuille. Les valeurs et les quantités sont validées en fonction des comptes associés. Une fenêtre de demande d''état où vous pouvez spécifier ce qu''il faut inclure sur l''élément à imprimer.';

                    trigger OnAction();
                    var
                        CdeNoColis : Code[10];
                    begin
                        IF Réservation THEN
                          ERROR('Cette demande est pour réservation. Merci de contacter le demandeur.');
                        CODEUNIT.RUN(CODEUNIT::"TransferOrder-Post + Print",Rec);
                        IF NOT DisableEditDirectTransfer THEN
                          DisableEditDirectTransfer := HasShippedItems;

                        RecPostedWhseReceiptHeader.RESET;
                        RecPostedWhseReceiptHeader.SETRANGE("No. Colis",CdeNoColis);
                        IF RecPostedWhseReceiptHeader.FINDFIRST THEN
                          BEGIN
                            RecPostedWhseReceiptHeader."Order de transfer Validé"  := TRUE;
                            RecPostedWhseReceiptHeader."Order de transfer Réceptionnée" := TRUE;
                            RecPostedWhseReceiptHeader.MODIFY;
                          END;
                    end;
                }
                action("Create Transfert Order Source Location")
                {
                    Caption = 'Créastion Ordre Transfert du magasin source';
                    Image = NewTransferOrder;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        CuStockFunctions : Codeunit "50000";
                    begin
                        //<<CT16V001 ZM 15/05/2016
                        CuStockFunctions.CreateTransOrderFromTransOrder("No.");
                        //>>CT16V001 ZM 15/05/2016
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Inventory - Inbound Transfer")
            {
                ApplicationArea = Warehouse;
                CaptionML = ENU='Inventory - Inbound Transfer',
                            FRA='Stocks : Enlogement transfert';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedOnly = true;
                RunObject = Report 5702;
                ToolTipML = ENU='View which items are currently on inbound transfer orders.',
                            FRA='Affichez les articles figurant actuellement sur des ordres de transfert enlogement.';
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        IF NOT DisableEditDirectTransfer THEN
          DisableEditDirectTransfer := "Direct Transfer" AND HasTransferLines;
    end;

    trigger OnAfterGetRecord();
    begin
        EnableTransferFields := NOT IsPartiallyShipped;
        RecUserSetup.GET(USERID);
        BlnRespMag := RecUserSetup."Responsable Magasin";
        Blnpriorite := RecUserSetup."Autorisation Priorité Picking";
        "Transfer inter succursale" := TRUE;
    end;

    trigger OnDeleteRecord() : Boolean;
    begin
        TESTFIELD(Status,Status::Open);
    end;

    trigger OnInit();
    begin
        BlnRespMag :=  FALSE
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Transfer inter succursale" := TRUE;
    end;

    trigger OnOpenPage();
    begin
        SetDocNoVisible;
        EnableTransferFields := NOT IsPartiallyShipped;
        RecUserSetup.GET(USERID);
        BlnRespMag := RecUserSetup."Responsable Magasin";
        Blnpriorite := RecUserSetup."Autorisation Priorité Picking";
        "Transfer inter succursale" := TRUE;
    end;

    var
        Text000 : TextConst ENU='Do you want to change %1 in all related records in the warehouse?',FRA='Souhaitez-vous modifier %1 dans tous les enregistrements associés de l''entrepôt ?';
        DocNoVisible : Boolean;
        DisableEditDirectTransfer : Boolean;
        EnableTransferFields : Boolean;
        RecGPagePropArticle : Page "60010";
        RecGTypeDoc : Integer;
        RecGtrsferOrder : Record "5740";
        WarehouseEmployee : Record "7301";
        TXT50000 : Label 'Vous n''avez pas le droit sur la magasin %1';
        Location : Record "14";
        "PrécOdreTrans" : Page "50071";
        Choix : Integer;
        OptionDate : Label 'Semaine,Mois,Année';
        GRecReceptionSAV : Record "60008";
        BlnRespMag : Boolean;
        RecUserSetup : Record "91";
        RecPostedWhseReceiptHeader : Record "7318";
        Blnpriorite : Boolean;

    local procedure PostingDateOnAfterValidate();
    begin
        CurrPage.TransferLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure ShipmentDateOnAfterValidate();
    begin
        CurrPage.TransferLines.PAGE.UpdateForm(FALSE);
    end;

    local procedure ShippingAgentServiceCodeOnAfte();
    begin
        CurrPage.TransferLines.PAGE.UpdateForm(FALSE);
    end;

    local procedure ShippingAgentCodeOnAfterValida();
    begin
        CurrPage.TransferLines.PAGE.UpdateForm(FALSE);
    end;

    local procedure ShippingTimeOnAfterValidate();
    begin
        CurrPage.TransferLines.PAGE.UpdateForm(FALSE);
    end;

    local procedure OutboundWhseHandlingTimeOnAfte();
    begin
        CurrPage.TransferLines.PAGE.UpdateForm(FALSE);
    end;

    local procedure ReceiptDateOnAfterValidate();
    begin
        CurrPage.TransferLines.PAGE.UpdateForm(FALSE);
    end;

    local procedure InboundWhseHandlingTimeOnAfter();
    begin
        CurrPage.TransferLines.PAGE.UpdateForm(FALSE);
    end;

    local procedure SetDocNoVisible();
    var
        DocumentNoVisibility : Codeunit "1400";
    begin
        DocNoVisible := DocumentNoVisibility.TransferOrderNoIsVisible;
    end;

    local procedure IsPartiallyShipped() : Boolean;
    var
        TransferLine : Record "5741";
    begin
        TransferLine.SETRANGE("Document No.","No.");
        TransferLine.SETFILTER("Quantity Shipped",'> 0');
        EXIT(NOT TransferLine.ISEMPTY);
    end;
}

