page 50172 "Transfer Orders Inter Société"
{
    // version NAVW111.00.00.23572,T180001

    // T180001 ZM 05/10/2018 : upgrade

    CaptionML = ENU='Transfer Orders',
                FRA='Ordres de transfert Inter Société';
    CardPageID = "Transfer Order Inter Société";
    Editable = false;
    PageType = List;
    PromotedActionCategoriesML = ENU='New,Process,Report,Release,Posting,Order,Documents',
                                 FRA='Nouveau,Traiter,État,Lancer,Comptabilisation,Ordre,Documents';
    SourceTable = Table5740;
    SourceTableView = SORTING(No.)
                      WHERE(Transfer inter succursale=FILTER(Yes));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Posting Date";"Posting Date")
                {
                }
                field("No.";"No.")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the number of the involved entry or record, according to the specified number series.',
                                FRA='Spécifie le numéro de l''écriture ou de l''enregistrement concerné, en fonction de la souche de numéros spécifiée.';
                }
                field("Reception No";"Reception No")
                {
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Source No";"Source No")
                {
                    CaptionML = ENU='Num Commande',
                                FRA='Num Commande';
                }
                field("No Service Order";"No Service Order")
                {
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the code of the location that items are transferred from.',
                                FRA='Spécifie le code du magasin à partir duquel les articles sont transférés.';
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the code of the location that the items are transferred to.',
                                FRA='Spécifie le code du magasin vers lequel les articles sont transférés.';
                }
                field("In-Transit Code";"In-Transit Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the in-transit code for the transfer order, such as a shipping agent.',
                                FRA='Spécifie le code transit de l''ordre de transfert, par exemple un transporteur.';
                }
                field(Status;Status)
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies whether the transfer order is open or has been released for warehouse handling.',
                                FRA='Spécifie si l''ordre de transfert est ouvert ou a été lancé pour la gestion entrepôt.';
                }
                field(VIN;VIN)
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Direct Transfer";"Direct Transfer")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies that the transfer does not use an in-transit location.',
                                FRA='Spécifie que le transfert n''utilise pas de magasin de transit.';
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
                field("Assigned User ID";"Assigned User ID")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the ID of the user who is responsible for the document.',
                                FRA='Spécifie le code de l''utilisateur qui est responsable du document.';
                    Visible = NOT IsFoundationEnabled;
                }
                field("Shipment Date";"Shipment Date")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.',
                                FRA='Spécifie quand les articles du document sont expédiés ou ont été expédiés. Une date d''expédition est généralement calculée à partir d''une date de livraison demandée avec un délai de sécurité.';
                    Visible = false;
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the delivery conditions of the related shipment, such as free on board (FOB).',
                                FRA='Spécifie les conditions de livraison de l''expédition associée, telles que Franco bord (FAB).';
                    Visible = false;
                }
                field("Shipping Agent Code";"Shipping Agent Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the code for the shipping agent who is transporting the items.',
                                FRA='Spécifie le code du transporteur des articles.';
                    Visible = false;
                }
                field("Shipping Advice";"Shipping Advice")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies an instruction to the warehouse that ships the items, for example, that it is acceptable to do partial shipment.',
                                FRA='Spécifie une instruction à l''entrepôt qui expédie les articles, par exemple, le fait qu''une expédition partielle est acceptable.';
                    Visible = false;
                }
                field("Receipt Date";"Receipt Date")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the date that you expect the transfer-to location to receive the shipment.',
                                FRA='Spécifie la date à laquelle le magasin destination transfert doit réceptionner l''expédition.';
                    Visible = false;
                }
                field("Client PR";"Client PR")
                {
                }
                field(Retour;Retour)
                {
                    Editable = false;
                }
                field("Client SAV";"Client SAV")
                {
                }
                field("Completely Shipped";"Completely Shipped")
                {
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
                            FRA='C&ommande';
                Image = "Order";
                action(Statistics)
                {
                    ApplicationArea = Advanced;
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
                    ApplicationArea = Dimensions;
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
                                FRA='E&xpéditions';
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
                                FRA='Ré&ceptions';
                    Image = PostedReceipts;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedOnly = true;
                    RunObject = Page 5753;
                    RunPageLink = Transfer Order No.=FIELD(No.);
                    ToolTipML = ENU='View related posted transfer receipts.',
                                FRA='Afficher des réceptions transfert enregistrées associées.';
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
                action("Transfer Routes")
                {
                    ApplicationArea = Location;
                    CaptionML = ENU='Transfer Routes',
                                FRA='Acheminements transfert';
                    Image = Setup;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedOnly = true;
                    RunObject = Page 5747;
                    ToolTipML = ENU='View the list of transfer routes that are set up to transfer items from one location to another.',
                                FRA='Affichez la liste des acheminements transfert paramétrés pour transférer les articles d''un magasin à un autre.';
                }
            }
        }
        area(processing)
        {
            action("&Print")
            {
                ApplicationArea = Advanced;
                CaptionML = ENU='&Print',
                            FRA='&Imprimer';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTipML = ENU='Prepare to print the document. A report request window for the document opens where you can specify what to include on the print-out.',
                            FRA='Préparez-vous à imprimer le document. Une fenêtre de sélection de l''état pour le document s''ouvre et vous permet d''indiquer les éléments à imprimer.';

                trigger OnAction();
                var
                    DocPrint : Codeunit "229";
                begin
                    DocPrint.PrintTransferHeader(Rec);
                end;
            }
            group(Release)
            {
                CaptionML = ENU='Release',
                            FRA='Lancer';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Advanced;
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
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Reo&pen',
                                FRA='&Rouvrir';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTipML = ENU='Reopen the transfer order after being released for warehouse handling.',
                                FRA='Rouvrir l''ordre de transfert après son lancement pour la gestion entrepôt.';

                    trigger OnAction();
                    var
                        ReleaseTransferDoc : Codeunit "5708";
                    begin
                        ReleaseTransferDoc.Reopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("Créer Auto Transfer Order")
                {
                    Caption = 'Créer Auto Transfer Order';
                    Image = CreateDocument;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin

                        //ADD EM 13/03/2017
                        MgtAures1.FctCreateautoTransferOrderPR;
                    end;
                }
                action("Create Whse. S&hipment")
                {
                    AccessByPermission = TableData 7320=R;
                    ApplicationArea = Warehouse;
                    CaptionML = ENU='Create Whse. S&hipment',
                                FRA='Créer e&xpédition entrepôt';
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
                    Image = CreatePutawayPick;
                    ToolTipML = ENU='Create an inventory put-away or inventory pick to handle items on the document according to a basic warehouse configuration that does not require warehouse receipt or shipment documents.',
                                FRA='Créer un rangement stock ou un prélèvement stock pour gérer les articles figurant sur le document en fonction d''une configuration entrepôt de base qui ne nécessite pas de documents de réception ou d''expédition entrepôt.';

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
                    begin
                        CODEUNIT.RUN(CODEUNIT::"TransferOrder-Post (Yes/No)",Rec);
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
                    begin
                        CODEUNIT.RUN(CODEUNIT::"TransferOrder-Post + Print",Rec);
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Inventory - Inbound Transfer")
            {
                ApplicationArea = Location;
                CaptionML = ENU='Inventory - Inbound Transfer',
                            FRA='Stocks : Enlogement transfert';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 5702;
                ToolTipML = ENU='View which items are currently on inbound transfer orders.',
                            FRA='Affichez les articles figurant actuellement sur des ordres de transfert enlogement.';
            }
            action("&Print")
            {
                CaptionML = ENU='&Print',
                            FRA='&Imprimer demande piéces';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

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
                PromotedCategory = New;

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
        }
    }

    trigger OnAfterGetRecord();
    begin
        ReceptionSAV.RESET;
        ReceptionSAV.SETRANGE("Reception No",Rec."Reception No");
        IF ReceptionSAV.FINDFIRST THEN BEGIN
          ServiceItem.RESET;
          ServiceItem.SETRANGE("Serial No.",ReceptionSAV.VIN);
          IF ServiceItem.FINDFIRST THEN;
        END;
    end;

    trigger OnInit();
    var
        ApplicationAreaSetup : Record "9178";
    begin
        IsFoundationEnabled := ApplicationAreaSetup.IsFoundationEnabled;
    end;

    var
        IsFoundationEnabled : Boolean;
        MgtAures1 : Codeunit "70003";
        RecGtrsferOrder : Record "5740";
        ServiceItem : Record "5940";
        ReceptionSAV : Record "60008";
}

