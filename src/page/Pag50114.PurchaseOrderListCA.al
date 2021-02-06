page 50114 "Purchase Order List CA"
{
    // version NAVW111.00.00.23572

    // CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Purchase Orders',
                FRA='Commandes achat';
    CardPageID = "Purchase Order 2";
    DataCaptionFields = "Buy-from Vendor No.";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = Table38;
    SourceTableView = WHERE(Document Type=CONST(Order),
                            Order Type=FILTER(Frais Généraux));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies the number of the involved entry or record, according to the specified number series.',
                                FRA='Spécifie le numéro de l''écriture ou de l''enregistrement concerné, en fonction de la souche de numéros spécifiée.';
                }
                field("Posting Date";"Posting Date")
                {
                    Visible = false;
                }
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Buy-from Vendor No.";"Buy-from Vendor No.")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the name of the vendor who delivered the items.',
                                FRA='Spécifie le nom du fournisseur qui a livré les articles.';
                }
                field("Pay-to Name";"Pay-to Name")
                {
                    Visible = false;
                }
                field("Reception No";"Reception No")
                {
                    Caption = 'Num OR';
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Sales Service Order No";"Sales Service Order No")
                {
                }
                field(Status;Status)
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field(Amount;Amount)
                {
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("Assigned User ID";"Assigned User ID")
                {
                }
                field("Order Address Code";"Order Address Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the order address of the related vendor.',
                                FRA='Spécifie l''adresse commande du fournisseur associé.';
                    Visible = false;
                }
                field("Buy-from Vendor Name";"Buy-from Vendor Name")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies the name of the vendor who delivered the items.',
                                FRA='Spécifie le nom du fournisseur qui a livré les articles.';
                }
                field("Vendor Authorization No.";"Vendor Authorization No.")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the compensation agreement identification number, sometimes referred to as the RMA No. (Returns Materials Authorization).',
                                FRA='Spécifie le numéro d''identification d''un accord de compensation. Ce numéro est parfois appelé numéro d''autorisation de retour de matériel (RMA).';
                }
                field("Buy-from Post Code";"Buy-from Post Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the post code of the vendor who delivered the items.',
                                FRA='Spécifie le code postal du fournisseur qui a livré les articles.';
                    Visible = false;
                }
                field("Buy-from Country/Region Code";"Buy-from Country/Region Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the city of the vendor who delivered the items.',
                                FRA='Spécifie la ville du fournisseur qui a livré les articles.';
                    Visible = false;
                }
                field("Buy-from Contact";"Buy-from Contact")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the name of the contact person at the vendor who delivered the items.',
                                FRA='Spécifie le nom de la personne à contacter chez le fournisseur qui a livré les articles.';
                    Visible = false;
                }
                field("Pay-to Vendor No.";"Pay-to Vendor No.")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the number of the vendor that you received the invoice from.',
                                FRA='Spécifie le numéro du fournisseur qui vous a fourni la facture.';
                    Visible = false;
                }
                field("Pay-to Post Code";"Pay-to Post Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the post code of the vendor that you received the invoice from.',
                                FRA='Spécifie le code postal du fournisseur qui vous a fourni la facture.';
                    Visible = false;
                }
                field("Pay-to Country/Region Code";"Pay-to Country/Region Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the country/region code of the address.',
                                FRA='Spécifie le code pays/la région de l''adresse.';
                    Visible = false;
                }
                field("Pay-to Contact";"Pay-to Contact")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the name of the person to contact about an invoice from this vendor.',
                                FRA='Spécifie le nom de la personne à contacter au sujet d''une facture émise par ce fournisseur.';
                    Visible = false;
                }
                field("Ship-to Code";"Ship-to Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.',
                                FRA='Spécifie un code pour une adresse secondaire de livraison si vous souhaitez expédier vers une autre adresse que celle qui a été saisie automatiquement. Ce champ est également utilisé en cas de livraison directe.';
                    Visible = false;
                }
                field("Ship-to Name";"Ship-to Name")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the name of the customer at the address that the items are shipped to.',
                                FRA='Spécifie le nom du client à l''adresse à laquelle les articles sont expédiés.';
                    Visible = false;
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the postal code of the address that the items are shipped to.',
                                FRA='Spécifie le code postal de l''adresse à laquelle les articles sont expédiés.';
                    Visible = false;
                }
                field("Ship-to Country/Region Code";"Ship-to Country/Region Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the country/region code of the address that the items are shipped to.',
                                FRA='Spécifie le code pays/région de l''adresse à laquelle les articles sont expédiés.';
                    Visible = false;
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the name of the contact person at the address that the items are shipped to.',
                                FRA='Spécifie le nom du contact à l''adresse à laquelle les articles sont expédiés.';
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 1 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 2 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies a code for the location where you want the items to be placed when they are received.',
                                FRA='Spécifie un code pour le magasin dans lequel vous souhaitez que les articles soient stockés lorsqu''ils sont réceptionnés.';
                }
                field("Purchaser Code";"Purchaser Code")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies which purchaser is assigned to the vendor.',
                                FRA='Spécifie l''acheteur affecté au fournisseur.';
                    Visible = false;
                }
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies the code of the currency of the amounts on the purchase lines.',
                                FRA='Spécifie le code de la devise des montants figurant sur les lignes achat.';
                    Visible = false;
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.',
                                FRA='Spécifie une formule qui calcule la date d''échéance du paiement, la date d''escompte et le montant de l''escompte.';
                    Visible = false;
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies when the purchase invoice is due for payment.',
                                FRA='Spécifie la date à laquelle la facture achat doit être payée.';
                    Visible = false;
                }
                field("Payment Discount %";"Payment Discount %")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the payment discount percent granted if payment is made on or before the date in the Pmt. Discount Date field.',
                                FRA='Spécifie le pourcentage escompte accordé si le paiement est effectué au plus tard à la date saisie dans le champ Date d''escompte.';
                    Visible = false;
                }
                field("Payment Method Code";"Payment Method Code")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies how to make payment, such as with bank transfer, cash,  or check.',
                                FRA='Spécifie le mode de paiement, par exemple, par virement bancaire, en espèces ou par chèque.';
                    Visible = false;
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the delivery conditions of the related shipment, such as free on board (FOB).',
                                FRA='Spécifie les conditions de livraison de l''expédition associée, telles que Franco bord (FAB).';
                    Visible = false;
                }
                field("Requested Receipt Date";"Requested Receipt Date")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies the date that you want the vendor to deliver to the ship-to address. The value in the field is used to calculate the latest date you can order the items to have them delivered on the requested receipt date. If you do not need delivery on a specific date, you can leave the field blank.',
                                FRA='Spécifie la date à laquelle vous souhaitez que le fournisseur livre les articles à l''adresse destinataire. La valeur du champ est utilisée pour calculer la date limite de commande garantissant la livraison des articles à la date de réception demandée. Si vous ne souhaitez pas indiquer une date de livraison, vous pouvez laisser ce champ vide.';
                    Visible = false;
                }
                field("Job Queue Status";"Job Queue Status")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies the status of a job queue entry that handles the posting of purchase orders.',
                                FRA='Spécifie le statut d''une écriture file d''attente des travaux qui gère la validation des commandes achat.';
                    Visible = JobQueueActive;
                }
                field("Amount Received Not Invoiced excl. VAT (LCY)";"A. Rcd. Not Inv. Ex. VAT (LCY)")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the amount excluding VAT for the items on the order that have been received but are not yet invoiced.',
                                FRA='Spécifie le montant hors TVA des articles de la commande qui ont été réceptionnés mais pas encore facturés.';
                    Visible = false;
                }
                field("Amount Received Not Invoiced (LCY)";"Amt. Rcd. Not Invoiced (LCY)")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the sum, in LCY, for items that have been received but have not yet been invoiced. The value in the Amt. Rcd. Not Invoiced (LCY) field is used for entries in the Purchase Line table of document type Order to calculate and update the contents of this field.',
                                FRA='Spécifie la somme, dans la devise société, des articles reçus qui n''ont pas été facturés. La valeur du champ Montant reçu non fact. DS est utilisée pour les écritures dans la table Ligne achat du type de document Commande pour calculer et mettre à jour la valeur de ce champ.';
                    Visible = false;
                }
                field("No dossier";"No dossier")
                {
                }
                field("Vendor Order No.";"Vendor Order No.")
                {
                }
                field("Reste à Recevoir";"Reste à Recevoir")
                {
                }
                field("Service Type";"Service Type")
                {
                    Editable = false;
                }
                field("Order Type";"Order Type")
                {
                    Editable = false;
                }
                field("No. L.C";"No. L.C")
                {
                }
                field("Pays de provenance";"Pays de provenance")
                {
                }
                field("Request No.";"Request No.")
                {
                }
            }
        }
        area(factboxes)
        {
            part(IncomingDocAttachFactBox;193)
            {
                ApplicationArea = Suite;
                ShowFilter = false;
                Visible = false;
            }
            part(;9093)
            {
                ApplicationArea = Suite;
                SubPageLink = No.=FIELD(Buy-from Vendor No.),
                              Date Filter=FIELD(Date Filter);
            }
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
                Visible = false;
                action("Importer liste collisage")
                {
                    Image = ImportLog;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecRecoupprofachat : Record "60020";
                    begin
                          PAGE.RUN(PAGE::ImportCollisage);

                           //XmlImportListeCollisage.RUN;
                    end;
                }
                action(Dimensions)
                {
                    AccessByPermission = TableData 348=R;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTipML = ENU='View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.',
                                FRA='Afficher ou modifier les axes analytiques, tels que la zone, le projet ou le département que vous pouvez affecter aux documents vente et achat afin de distribuer les coûts et analyser l''historique des transactions.';

                    trigger OnAction();
                    begin
                        ShowDocDim;
                    end;
                }
                action(Statistics)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Statistics',
                                FRA='Statistiques';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F7';
                    ToolTipML = ENU='View statistical information, such as the value of posted entries, for the record.',
                                FRA='Affichez les informations statistiques telles que la valeur des écritures validées pour l''enregistrement.';

                    trigger OnAction();
                    begin
                        OpenPurchaseOrderStatistics;
                    end;
                }
                action(Approvals)
                {
                    AccessByPermission = TableData 454=R;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Approvals',
                                FRA='Approbations';
                    Image = Approvals;
                    ToolTipML = ENU='View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.',
                                FRA='Affichez une liste des enregistrements en attente d''approbation. Par exemple, vous pouvez voir qui a demandé l''approbation de l''enregistrement, quand il a été envoyé et quand son approbation est due.';

                    trigger OnAction();
                    var
                        WorkflowsEntriesBuffer : Record "832";
                    begin
                        WorkflowsEntriesBuffer.RunWorkflowEntriesPage(RECORDID,DATABASE::"Purchase Header","Document Type","No.");
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    RunObject = Page 66;
                    RunPageLink = Document Type=FIELD(Document Type),
                                  No.=FIELD(No.),
                                  Document Line No.=CONST(0);
                    ToolTipML = ENU='View or add comments for the record.',
                                FRA='Affichez ou ajoutez des commentaires pour l''enregistrement.';
                }
            }
            group(Documents)
            {
                CaptionML = ENU='Documents',
                            FRA='Documents';
                Image = Documents;
                Visible = false;
                action(Receipts)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Receipts',
                                FRA='Réceptions';
                    Image = PostedReceipts;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page 145;
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                    ToolTipML = ENU='View a list of posted purchase receipts for the order.',
                                FRA='Afficher la liste des réceptions achat validées pour la commande achat.';
                }
                action(PostedPurchaseInvoices)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Invoices',
                                FRA='Factures';
                    Image = Invoice;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page 146;
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                    ToolTipML = ENU='View a list of ongoing purchase invoices for the order.',
                                FRA='Afficher la liste des factures achat en cours pour la commande.';
                }
                action(PostedPurchasePrepmtInvoices)
                {
                    ApplicationArea = Prepayments;
                    CaptionML = ENU='Prepa&yment Invoices',
                                FRA='Factures acom&pte';
                    Image = PrepaymentInvoice;
                    RunObject = Page 146;
                    RunPageLink = Prepayment Order No.=FIELD(No.);
                    RunPageView = SORTING(Prepayment Order No.);
                    ToolTipML = ENU='View related posted sales invoices that involve a prepayment. ',
                                FRA='Afficher les factures vente validées impliquant un acompte. ';
                }
                action("Prepayment Credi&t Memos")
                {
                    ApplicationArea = Prepayments;
                    CaptionML = ENU='Prepayment Credi&t Memos',
                                FRA='A&voirs acompte';
                    Image = PrepaymentCreditMemo;
                    RunObject = Page 147;
                    RunPageLink = Prepayment Order No.=FIELD(No.);
                    RunPageView = SORTING(Prepayment Order No.);
                    ToolTipML = ENU='View related posted sales credit memos that involve a prepayment. ',
                                FRA='Afficher les avoirs vente validés impliquant un acompte. ';
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Enabled = false;
                Image = Warehouse;
                Visible = false;
                action("In&vt. Put-away/Pick Lines")
                {
                    ApplicationArea = Warehouse;
                    CaptionML = ENU='In&vt. Put-away/Pick Lines',
                                FRA='Lignes prélè&v./rangement stock';
                    Image = PickLines;
                    RunObject = Page 5774;
                    RunPageLink = Source Document=CONST(Purchase Order),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Document,Source No.,Location Code);
                    ToolTipML = ENU='View items that are inbound or outbound on inventory put-away or inventory pick documents for the transfer order.',
                                FRA='Afficher les éléments entrants ou sortants sur les documents rangement stock ou prélèvement stock pour l''ordre de transfert.';
                }
                action("Whse. Receipt Lines")
                {
                    ApplicationArea = Warehouse;
                    CaptionML = ENU='Whse. Receipt Lines',
                                FRA='Lignes réception entrep.';
                    Image = ReceiptLines;
                    RunObject = Page 7342;
                    RunPageLink = Source Type=CONST(39),
                                  Source Subtype=FIELD(Document Type),
                                  Source No.=FIELD(No.);
                    RunPageView = SORTING(Source Type,Source Subtype,Source No.,Source Line No.);
                    ToolTipML = ENU='View ongoing warehouse receipts for the document, in advanced warehouse configurations.',
                                FRA='Afficher les réceptions entrepôt en cours pour le document, dans les configurations entrepôt avancées.';
                }
            }
        }
        area(processing)
        {
            group(Print)
            {
                CaptionML = ENU='Print',
                            FRA='Imprimer';
                Image = Print;
                action(Print)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='&Print',
                                FRA='&Imprimer';
                    Ellipsis = true;
                    Enabled = false;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTipML = ENU='Prepare to print the document. The report request window for the document opens where you can specify what to include on the print-out.',
                                FRA='Préparez-vous à imprimer le document. La fenêtre de sélection de l''état pour le document s''ouvre et vous permet d''indiquer les éléments à imprimer.';
                    Visible = false;

                    trigger OnAction();
                    var
                        PurchaseHeader : Record "38";
                    begin
                        PurchaseHeader := Rec;
                        CurrPage.SETSELECTIONFILTER(PurchaseHeader);
                        PurchaseHeader.PrintRecords(TRUE);
                    end;
                }
                action(Send)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Send',
                                FRA='Envoyer';
                    Ellipsis = true;
                    Image = SendToMultiple;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    ToolTipML = ENU='Prepare to send the document according to the vendor''s sending profile, such as attached to an email. The Send document to window opens first so you can confirm or select a sending profile.',
                                FRA='Préparez-vous à envoyer le document en fonction du profil d''envoi du fournisseur, par exemple en pièce jointe d''un e-mail. La fenêtre Envoyer le document à s''ouvre en premier pour que vous puissiez confirmer ou sélectionner un profil d''envoi.';
                    Visible = false;

                    trigger OnAction();
                    var
                        PurchaseHeader : Record "38";
                    begin
                        PurchaseHeader := Rec;
                        CurrPage.SETSELECTIONFILTER(PurchaseHeader);
                        PurchaseHeader.SendRecords;
                    end;
                }
                action("Imprimer Bon Commande ST")
                {
                    Image = ServiceMan;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        PurchaseHeader : Record "38";
                    begin
                        //<<---NM280317--------
                        PurchaseHeader.RESET;
                        PurchaseHeader.SETRANGE("No.","No.");
                        IF PurchaseHeader.FINDFIRST THEN
                           REPORT.RUN(REPORT::"Bon Commande Sous Traitance",TRUE,TRUE,PurchaseHeader);
                        //>>---NM280317--------
                    end;
                }
                action("Imprimer Commande Achat")
                {
                    Image = PRINT;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        PurchaseHeader : Record "38";
                    begin
                        //<<---NM280317--------
                        PurchaseHeader.RESET;
                        PurchaseHeader.SETRANGE("No.","No.");
                        IF PurchaseHeader.FINDFIRST THEN
                           REPORT.RUN(60251,TRUE,TRUE,PurchaseHeader);
                        //>>---NM280317--------
                    end;
                }
            }
            group(Release)
            {
                CaptionML = ENU='Release',
                            FRA='Lancer';
                Image = ReleaseDoc;
                action(Release)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Re&lease',
                                FRA='&Lancer';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTipML = ENU='Release the document to the next stage of processing. When a document is released, it will be included in all availability calculations from the expected receipt date of the items. You must reopen the document before you can make changes to it.',
                                FRA='Lancer le document à l''étape suivante du traitement. Lorsqu''un document est lancé, il est inclus dans tous les calculs de disponibilité à partir de la date de réception prévue des articles.';

                    trigger OnAction();
                    var
                        ReleasePurchDoc : Codeunit "415";
                    begin
                        ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Re&open',
                                FRA='R&ouvrir';
                    Image = ReOpen;
                    ToolTipML = ENU='Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed',
                                FRA='Rouvrez le document pour le modifier après son approbation. Les documents approuvés ont le statut Lancé et doivent être ouverts pour pouvoir être modifiés';

                    trigger OnAction();
                    var
                        ReleasePurchDoc : Codeunit "415";
                    begin
                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("Create auto Commande Achat PR")
                {
                    Enabled = false;
                    Image = CreateInteraction;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    var
                        MgtAures : Codeunit "70003";
                    begin
                        MgtAures.FctCreateautoPOPR;
                    end;
                }
                action("Send IC Purchase Order")
                {
                    AccessByPermission = TableData 410=R;
                    ApplicationArea = Intercompany;
                    CaptionML = ENU='Send IC Purchase Order',
                                FRA='Envoyer commande achat IC';
                    Image = IntercompanyOrder;
                    ToolTipML = ENU='Send the document to the intercompany outbox or directly to the intercompany partner if automatic transaction sending is enabled.',
                                FRA='Envoyer le document vers la boîte d''envoi intersociétés ou directement vers le partenaire intersociétés si l''envoi de transaction automatique est activé.';

                    trigger OnAction();
                    var
                        ICInOutboxMgt : Codeunit "427";
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                          ICInOutboxMgt.SendPurchDoc(Rec,FALSE);
                    end;
                }
            }
            group("Request Approval")
            {
                CaptionML = ENU='Request Approval',
                            FRA='Approbation demande achat';
                Enabled = false;
                Visible = false;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Send A&pproval Request',
                                FRA='Envoyer demande d''a&pprobation';
                    Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTipML = ENU='Request approval of the document.',
                                FRA='Demander l''approbation du document.';

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        IF ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
                          ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Cancel Approval Re&quest',
                                FRA='Annuler demande d''appro&bation';
                    Enabled = CanCancelApprovalForRecord OR CanCancelApprovalForFlow;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTipML = ENU='Cancel the approval request.',
                                FRA='Annulez la demande d''approbation.';

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                        WorkflowWebhookManagement : Codeunit "1543";
                    begin
                        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        WorkflowWebhookManagement.FindAndCancel(RECORDID);
                    end;
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Enabled = false;
                Image = Warehouse;
                Visible = false;
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
                        GetSourceDocInbound.CreateFromPurchOrder(Rec);

                        IF NOT FIND('=><') THEN
                          INIT;
                    end;
                }
                action("Create Inventor&y Put-away/Pick")
                {
                    AccessByPermission = TableData 7340=R;
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

                        IF NOT FIND('=><') THEN
                          INIT;
                    end;
                }
            }
            group("P&osting")
            {
                CaptionML = ENU='P&osting',
                            FRA='&Validation';
                Image = Post;
                Visible = false;
                action(TestReport)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Test Report',
                                FRA='Impression test';
                    Ellipsis = true;
                    Image = TestReport;
                    ToolTipML = ENU='View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.',
                                FRA='Afficher une impression test afin que vous puissiez trouver et corriger toutes les erreurs avant de procéder à la validation effective de la feuille ou du document.';

                    trigger OnAction();
                    begin
                        ReportPrint.PrintPurchHeader(Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='P&ost',
                                FRA='&Valider';
                    Ellipsis = true;
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    ToolTipML = ENU='Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.',
                                FRA='Finalisez le document ou la feuille en validant les montants et les quantités sur les comptes concernés dans la comptabilité de la société.';

                    trigger OnAction();
                    var
                        PurchaseHeader : Record "38";
                        ApplicationAreaSetup : Record "9178";
                        PurchaseBatchPostMgt : Codeunit "1372";
                        BatchProcessingMgt : Codeunit "1380";
                        BatchPostParameterTypes : Codeunit "1370";
                        LinesInstructionMgt : Codeunit "1320";
                    begin
                        TestTopost;
                        IF ApplicationAreaSetup.IsFoundationEnabled THEN
                          LinesInstructionMgt.PurchaseCheckAllLinesHaveQuantityAssigned(Rec);

                        CurrPage.SETSELECTIONFILTER(PurchaseHeader);

                        IF PurchaseHeader.COUNT > 1 THEN BEGIN
                          BatchProcessingMgt.AddParameter(BatchPostParameterTypes.Invoice,TRUE);
                          BatchProcessingMgt.AddParameter(BatchPostParameterTypes.Receive,TRUE);

                          PurchaseBatchPostMgt.SetBatchProcessor(BatchProcessingMgt);
                          PurchaseBatchPostMgt.RunWithUI(PurchaseHeader,COUNT,ReadyToPostQst);
                        END ELSE
                          SendToPosting(CODEUNIT::"Purch.-Post (Yes/No)");
                    end;
                }
                action(Preview)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Preview Posting',
                                FRA='Aperçu compta.';
                    Image = ViewPostedOrder;
                    ToolTipML = ENU='Review the different types of entries that will be created when you post the document or journal.',
                                FRA='Examinez les différents types d''écritures qui seront créés lorsque vous validez le document ou la feuille.';

                    trigger OnAction();
                    var
                        PurchPostYesNo : Codeunit "91";
                    begin
                        PurchPostYesNo.Preview(Rec);
                    end;
                }
                action(PostAndPrint)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Post and &Print',
                                FRA='Valider et i&mprimer';
                    Ellipsis = true;
                    Enabled = false;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';
                    ToolTipML = ENU='Finalize and prepare to print the document or journal. The values and quantities are posted to the related accounts. A report request window where you can specify what to include on the print-out.',
                                FRA='Finalisez et préparez-vous à imprimer le document ou la feuille. Les valeurs et les quantités sont validées en fonction des comptes associés. Une fenêtre de demande d''état où vous pouvez spécifier ce qu''il faut inclure sur l''élément à imprimer.';
                    Visible = false;

                    trigger OnAction();
                    begin
                        TestTopost;
                        SendToPosting(CODEUNIT::"Purch.-Post + Print");
                    end;
                }
                action(PostBatch)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Post &Batch',
                                FRA='Valider par l&ot';
                    Ellipsis = true;
                    Enabled = false;
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTipML = ENU='Post several documents at once. A report request window opens where you can specify which documents to post.',
                                FRA='Valider plusieurs documents à la fois. Une fenêtre de la sélection de l''état s''ouvre. Vous pouvez y préciser quels sont les documents à valider.';
                    Visible = false;

                    trigger OnAction();
                    begin
                        TestTopost;
                        REPORT.RUNMODAL(REPORT::"Batch Post Purchase Orders",TRUE,TRUE,Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action(RemoveFromJobQueue)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Remove From Job Queue',
                                FRA='Supprimer de la file d''attente des travaux';
                    Image = RemoveLine;
                    ToolTipML = ENU='Remove the scheduled processing of this record from the job queue.',
                                FRA='Supprimez le traitement planifié de cet enregistrement à partir de la file d''attente des travaux.';
                    Visible = JobQueueActive;

                    trigger OnAction();
                    begin
                        CancelBackgroundPosting;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        SetControlAppearance;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
    end;

    trigger OnFindRecord(Which : Text) : Boolean;
    var
        NextRecNotFound : Boolean;
    begin
        IF NOT FIND(Which) THEN
          EXIT(FALSE);

        IF ShowHeader THEN
          EXIT(TRUE);

        REPEAT
          NextRecNotFound := NEXT <= 0;
          IF ShowHeader THEN
            EXIT(TRUE);
        UNTIL NextRecNotFound;

        EXIT(FALSE);
    end;

    trigger OnNextRecord(Steps : Integer) : Integer;
    var
        NewStepCount : Integer;
    begin
        REPEAT
          NewStepCount := NEXT(Steps);
        UNTIL (NewStepCount = 0) OR ShowHeader;

        EXIT(NewStepCount);
    end;

    trigger OnOpenPage();
    var
        PurchasesPayablesSetup : Record "312";
    begin
        IF GETFILTER(Receive) <> '' THEN
          FilterPartialReceived;
        IF GETFILTER(Invoice) <> '' THEN
          FilterPartialInvoiced;

        SetSecurityFilterOnRespCenter;

        JobQueueActive := PurchasesPayablesSetup.JobQueueActive;

        CopyBuyFromVendorFilter;
    end;

    var
        ReportPrint : Codeunit "228";
        [InDataSet]
        JobQueueActive : Boolean;
        OpenApprovalEntriesExist : Boolean;
        XmlImportListeCollisage : XMLport "50006";
        CanCancelApprovalForRecord : Boolean;
        SkipLinesWithoutVAT : Boolean;
        ReadyToPostQst : TextConst Comment='%1 - selected count, %2 - total count',ENU='%1 out of %2 selected orders are ready for post. \Do you want to continue and post them?',FRA='%1 sur %2 commandes sélectionnées sont prêtes pour validation. \Voulez-vous continuer et les valider ?';
        CanRequestApprovalForFlow : Boolean;
        CanCancelApprovalForFlow : Boolean;

    local procedure SetControlAppearance();
    var
        ApprovalsMgmt : Codeunit "1535";
        WorkflowWebhookManagement : Codeunit "1543";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);

        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);

        WorkflowWebhookManagement.GetCanRequestAndCanCancel(RECORDID,CanRequestApprovalForFlow,CanCancelApprovalForFlow);
    end;

    [Scope('Personalization')]
    procedure SkipShowingLinesWithoutVAT();
    begin
        SkipLinesWithoutVAT := TRUE;
    end;

    local procedure ShowHeader() : Boolean;
    var
        CashFlowManagement : Codeunit "841";
    begin
        IF NOT SkipLinesWithoutVAT THEN
          EXIT(TRUE);

        EXIT(CashFlowManagement.GetTaxAmountFromPurchaseOrder(Rec) <> 0);
    end;

    local procedure TestTopost();
    var
        LRecReceptionSAV : Record "60008";
    begin
        IF "Reception No"<>'' THEN BEGIN
          LRecReceptionSAV.RESET;
          LRecReceptionSAV.SETRANGE("Reception No","Reception No");
          IF LRecReceptionSAV.FINDFIRST THEN
            LRecReceptionSAV.TESTFIELD("Status SR",LRecReceptionSAV."Status SR"::Facturée);
        END;
    end;
}

