page 60363 "Purchase Order PEIN"
{
    // version NAVW111.00.00.23572

    // T180001 KT 19/10/2018 : upgrade

    CaptionML = ENU='Purchase Order',
                FRA='Commande achat';
    PageType = Document;
    PromotedActionCategoriesML = ENU='New,Process,Report,Approve,Release,Posting,Prepare,Invoice,Request Approval,Print',
                                 FRA='Nouveau,Traiter,État,Approuver,Lancer,Comptabilisation,Préparer,Facturer,Demander une approbation,Imprimer';
    RefreshOnActivate = true;
    SourceTable = Table38;
    SourceTableView = WHERE(Document Type=FILTER(Order));

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
                    ApplicationArea = Suite;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the number of the involved entry or record, according to the specified number series.',
                                FRA='Spécifie le numéro de l''écriture ou de l''enregistrement concerné, en fonction de la souche de numéros spécifiée.';

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field("Buy-from Vendor No.";"Buy-from Vendor No.")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Vendor No.',
                                FRA='N° fournisseur';
                    Importance = Additional;
                    NotBlank = true;
                    ToolTipML = ENU='Specifies the number of the vendor who delivers the products.',
                                FRA='Spécifie le numéro du fournisseur qui livre les produits.';

                    trigger OnValidate();
                    begin
                        OnAfterValidateBuyFromVendorNo(Rec,xRec);
                        CurrPage.UPDATE;
                    end;
                }
                field("Buy-from Vendor Name";"Buy-from Vendor Name")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Vendor Name',
                                FRA='Nom fournisseur';
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTipML = ENU='Specifies the name of the vendor who delivers the products.',
                                FRA='Spécifie le nom du fournisseur qui livre les produits.';

                    trigger OnValidate();
                    begin
                        OnAfterValidateBuyFromVendorNo(Rec,xRec);
                        CurrPage.UPDATE;
                    end;
                }
                group("Buy-from")
                {
                    CaptionML = ENU='Buy-from',
                                FRA='Fournisseur';
                    field("Buy-from Address";"Buy-from Address")
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Address',
                                    FRA='Adresse';
                        Importance = Additional;
                        ToolTipML = ENU='Specifies the vendor''s buy-from address.',
                                    FRA='Spécifie l''adresse fournisseur du fournisseur.';
                    }
                    field("Buy-from Address 2";"Buy-from Address 2")
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Address 2',
                                    FRA='Adresse (2ème ligne)';
                        Importance = Additional;
                        ToolTipML = ENU='Specifies an additional part of the vendor''s buy-from address.',
                                    FRA='Spécifie un complément à l''adresse fournisseur du fournisseur.';
                    }
                    field("Buy-from Post Code";"Buy-from Post Code")
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Post Code',
                                    FRA='Code postal';
                        Importance = Additional;
                        ToolTipML = ENU='Specifies the postal code.',
                                    FRA='Spécifie le code postal.';
                    }
                    field("Buy-from City";"Buy-from City")
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='City',
                                    FRA='Ville';
                        Importance = Additional;
                        ToolTipML = ENU='Specifies the city of the vendor on the purchase document.',
                                    FRA='Spécifie la ville du fournisseur sur le document achat.';
                    }
                    field("Buy-from Contact No.";"Buy-from Contact No.")
                    {
                        ApplicationArea = Advanced;
                        CaptionML = ENU='Contact No.',
                                    FRA='N° contact';
                        Importance = Additional;
                        ToolTipML = ENU='Specifies the number of contact person of the vendor''s buy-from.',
                                    FRA='Spécifie le numéro de la personne à contacter chez le fournisseur auprès duquel vous effectuez vos achats.';
                    }
                }
                field("Buy-from Contact";"Buy-from Contact")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Contact',
                                FRA='Contact';
                    Editable = "Buy-from Vendor No." <> '';
                    ToolTipML = ENU='Specifies the name of the person to contact about an order from this vendor.',
                                FRA='Spécifie le nom de la personne à contacter au sujet d''une commande émise par ce fournisseur.';
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies the date when the related document was created.',
                                FRA='Spécifie la date de création du document associé.';
                }
                field("Posting Date";"Posting Date")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the posting date of the record.',
                                FRA='Spécifie la date comptabilisation de l''enregistrement.';
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies when the related purchase invoice must be paid.',
                                FRA='Spécifie la date à laquelle la facture achat doit être payée.';
                }
                field("Type Cmd Achat";"Type Cmd Achat")
                {
                }
                field("Type Transport";"Type Transport")
                {
                }
                field("Type Order";"Type Order")
                {
                }
                field("Type FD";"Type FD")
                {
                }
                field("Vendor Invoice No.";"Vendor Invoice No.")
                {
                    ApplicationArea = Suite;
                    ShowMandatory = VendorInvoiceNoMandatory;
                    ToolTipML = ENU='Specifies the document number of the original document you received from the vendor. You can require the document number for posting, or let it be optional. By default, it''s required, so that this document references the original. Making document numbers optional removes a step from the posting process. For example, if you attach the original invoice as a PDF, you might not need to enter the document number. To specify whether document numbers are required, in the Purchases & Payables Setup window, select or clear the Ext. Doc. No. Mandatory field.',
                                FRA='Spécifie le numéro du document original reçu du fournisseur. Vous pouvez exiger le numéro de document pour validation ou le laisser facultatif. Par défaut, il est obligatoire afin que ce document fasse référence à l''original. Rendre les numéros de document facultatifs supprime une étape du processus de validation. Par exemple, si vous joignez la facture originale au format PDF, il est possible que vous ne deviez pas entrer le numéro de document. Pour spécifier si les numéros de document sont obligatoires, dans la fenêtre Paramètres achats, activez ou désactivez le champ N° doc. ext. obligatoire.';
                }
                field("Date Facture Fournisseur";"Date Facture Fournisseur")
                {
                }
                field("Purchaser Code";"Purchaser Code")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies which purchaser is assigned to the vendor.',
                                FRA='Spécifie l''acheteur affecté au fournisseur.';

                    trigger OnValidate();
                    begin
                        PurchaserCodeOnAfterValidate;
                    end;
                }
                field("No. of Archived Versions";"No. of Archived Versions")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the number of archived versions for this document.',
                                FRA='Spécifie le nombre de versions archivées de ce document.';
                    Visible = false;
                }
                field("Order Date";"Order Date")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the date when the order was created.',
                                FRA='Spécifie la date à laquelle la commande a été créée.';
                }
                field("Quote No.";"Quote No.")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the quote number for the purchase order.',
                                FRA='Spécifie le numéro de devis pour la commande achat.';
                }
                field("Vendor Order No.";"Vendor Order No.")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the vendor''s order number.',
                                FRA='Spécifie le numéro de commande du fournisseur.';
                }
                field("Vendor Shipment No.";"Vendor Shipment No.")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the vendor''s shipment number.',
                                FRA='Spécifie le numéro de bon de livraison fournisseur.';
                }
                field("Date BL. Fournisseur";"Date BL. Fournisseur")
                {
                }
                field("Order Address Code";"Order Address Code")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Alternate Vendor Address Code',
                                FRA='Autre code adresse du fournisseur';
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the order address of the related vendor.',
                                FRA='Spécifie l''adresse commande du fournisseur associé.';
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.',
                                FRA='Spécifie le code du centre de gestion, tel qu''un centre de distribution, associé à l''utilisateur, la société, le client ou le fournisseur concerné.';
                }
                field("Assigned User ID";"Assigned User ID")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the ID of the user who is responsible for the document.',
                                FRA='Spécifie le code de l''utilisateur qui est responsable du document.';
                }
                field(Status;Status)
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies whether the record is open, waiting to be approved, invoiced for prepayment, or released to the next stage of processing.',
                                FRA='Spécifie si l''enregistrement est ouvert, en attente d''approbation, a été facturé pour acompte ou a été lancé pour l''étape suivante du traitement.';
                }
                field("Job Queue Status";"Job Queue Status")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the status of a job queue entry that handles the posting of purchase orders.',
                                FRA='Spécifie le statut d''une écriture file d''attente des travaux qui gère la validation des commandes achat.';
                    Visible = JobQueueUsed;
                }
                field("Location Code";"Location Code")
                {
                }
                field("No dossier VN";"No dossier VN")
                {
                }
                field("No dossier";"No dossier")
                {
                    Caption = 'No dossier PR';
                    Visible = true;
                }
                field("Reception No";"Reception No")
                {
                    Caption = 'Num OR';
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Sales Service Order No";"Sales Service Order No")
                {
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Campaign No.";"Campaign No.")
                {
                    Visible = BoolMarketing;
                }
                field("No. Expédition";"No. Expédition")
                {
                }
                field("Reason Code";"Reason Code")
                {
                    Editable = BolReasonCode;
                }
                field("Order Type";"Order Type")
                {
                    Editable = false;
                    Visible = true;
                }
                field("Service Type";"Service Type")
                {
                    Editable = false;
                }
                field("Type Commande Achat";"Type Commande Achat")
                {
                    Visible = false;
                }
                field(Promotion;Promotion)
                {
                    Visible = false;
                }
                field(DGX;DGX)
                {
                    CaptionML = ENU='DGX',
                                FRA='DGX';
                    Visible = false;
                }
                field("Non DGX";"Non DGX")
                {
                    Visible = false;
                }
                field(Urgent;Urgent)
                {
                    CaptionML = ENU='Urgent',
                                FRA='Urgent';
                    Visible = false;
                }
                field(Stock;Stock)
                {
                    Visible = false;
                }
                field(Amount;Amount)
                {
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("Total Poids";"Total Poids")
                {
                    Editable = false;
                }
                field("Total Longueur";"Total Longueur")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Total Largeur";"Total Largeur")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Total Hauteur";"Total Hauteur")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Total Volume";"Total Volume")
                {
                    Editable = false;
                }
                field("Nbre de lignes";"Nbre de lignes")
                {
                }
                field("Apply Stamp fiscal";"Apply Stamp fiscal")
                {
                }
                field("Invoice Discount Amount";"Invoice Discount Amount")
                {
                }
                field("Receiving No. Series";"Receiving No. Series")
                {
                    Editable = false;
                }
                field("Vendor Type";"Vendor Type")
                {
                }
            }
            part(PurchLines;54)
            {
                ApplicationArea = Suite;
                Editable = "Buy-from Vendor No." <> '';
                Enabled = "Buy-from Vendor No." <> '';
                SubPageLink = Document No.=FIELD(No.);
                UpdatePropagation = Both;
            }
            group("Invoice Details")
            {
                CaptionML = ENU='Invoice Details',
                            FRA='Détails facture';
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the currency of amounts on the purchase document.',
                                FRA='Spécifie la devise des montants sur le document achat.';

                    trigger OnAssistEdit();
                    begin
                        CLEAR(ChangeExchangeRate);
                        IF "Posting Date" <> 0D THEN
                          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date")
                        ELSE
                          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor",WORKDATE);
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                          VALIDATE("Currency Factor",ChangeExchangeRate.GetParameter);
                          CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;

                    trigger OnValidate();
                    begin
                        CurrPage.SAVERECORD;
                        PurchCalcDiscByType.ApplyDefaultInvoiceDiscount(0,Rec);
                    end;
                }
                field("Expected Receipt Date";"Expected Receipt Date")
                {
                    ApplicationArea = Suite;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the date you expect the items to be available in your warehouse. If you leave the field blank, it will be calculated as follows: Planned Receipt Date + Safety Lead Time + Inbound Warehouse Handling Time = Expected Receipt Date.',
                                FRA='Spécifie la date à laquelle les articles doivent être disponibles dans l''entrepôt. Si vous laissez ce champ vide, le calcul est effectué comme suit : Date planifiée de réception + Délai de sécurité + Délai enlogement + Date réception prévue.';
                }
                field("Prices Including VAT";"Prices Including VAT")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.',
                                FRA='Spécifie si les champs Prix unitaire et Montant ligne sur les lignes document vente doivent être affichés avec ou sans la TVA.';

                    trigger OnValidate();
                    begin
                        PricesIncludingVATOnAfterValid;
                    end;
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                    ApplicationArea = Suite;
                    ToolTipML = ENU='Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.',
                                FRA='Spécifie le détail TVA du client ou du fournisseur concerné pour lier les transactions effectuées pour cet enregistrement au compte général approprié en fonction des paramètres de comptabilisation TVA.';
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    ApplicationArea = Suite;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.',
                                FRA='Spécifie une formule qui calcule la date d''échéance du paiement, la date d''escompte et le montant de l''escompte.';
                }
                field("Payment Method Code";"Payment Method Code")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies how to make payment, such as with bank transfer, cash,  or check.',
                                FRA='Spécifie le mode de paiement, par exemple, par virement bancaire, en espèces ou par chèque.';
                }
                field("Transaction Type";"Transaction Type")
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the type of transaction that the document represents, for the purpose of reporting to INTRASTAT.',
                                FRA='Spécifie le type de transaction que représente le document, à des fins de compte-rendu intracommunautaire.';
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 1 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';

                    trigger OnValidate();
                    begin
                        ShortcutDimension1CodeOnAfterV;
                    end;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 2 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';

                    trigger OnValidate();
                    begin
                        ShortcutDimension2CodeOnAfterV;
                    end;
                }
                field("Payment Discount %";"Payment Discount %")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the payment discount percent granted if payment is made on or before the date in the Pmt. Discount Date field.',
                                FRA='Spécifie le pourcentage escompte accordé si le paiement est effectué au plus tard à la date saisie dans le champ Date d''escompte.';
                }
                field("Pmt. Discount Date";"Pmt. Discount Date")
                {
                    ApplicationArea = Suite;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the date on which the amount in the entry must be paid for a payment discount to be granted.',
                                FRA='Spécifie la date à laquelle le montant de l''écriture doit être payé pour obtenir un escompte sur la commande.';
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the delivery conditions of the related shipment, such as free on board (FOB).',
                                FRA='Spécifie les conditions de livraison de l''expédition associée, telles que Franco bord (FAB).';
                }
                field("Payment Reference";"Payment Reference")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the payment of the purchase invoice.',
                                FRA='Spécifie le paiement de la facture achat.';
                }
                field("Creditor No.";"Creditor No.")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the number of the vendor.',
                                FRA='Spécifie le numéro du fournisseur.';
                }
                field("On Hold";"On Hold")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies that the related entry represents an unpaid invoice for which either a payment suggestion, a reminder, or a finance charge memo exists.',
                                FRA='Spécifie que l''écriture associée représente une facture impayée pour laquelle une suggestion de paiement, une relance ou une facture d''intérêts existe.';
                }
                field("Bin Code";"Bin Code")
                {
                }
                field("Inbound Whse. Handling Time";"Inbound Whse. Handling Time")
                {
                    ApplicationArea = Warehouse;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies the time it takes to make items part of available inventory, after the items have been posted as received.',
                                FRA='Spécifie le temps nécessaire pour que les articles soient inclus dans le stock disponible une fois les articles validés.';
                }
                field("Lead Time Calculation";"Lead Time Calculation")
                {
                    ApplicationArea = Advanced;
                    Importance = Additional;
                    ToolTipML = ENU='Specifies a date formula for the amount of time it takes to replenish the item.',
                                FRA='Spécifie une formule de date pour le délai nécessaire au réapprovisionnement de l''article.';
                }
                field("Requested Receipt Date";"Requested Receipt Date")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the date that you want the vendor to deliver to the ship-to address.',
                                FRA='Spécifie la date à laquelle vous souhaitez que le fournisseur livre à l''adresse destinataire.';
                }
                field("Promised Receipt Date";"Promised Receipt Date")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the date that the vendor has promised to deliver the order.',
                                FRA='Spécifie la date à laquelle le fournisseur a promis de livrer la commande.';
                }
            }
            group("Shipping and Payment")
            {
                CaptionML = ENU='Shipping and Payment',
                            FRA='Expédition et paiement';
                group()
                {
                    group()
                    {
                        field(ShippingOptionWithLocation;ShipToOptions)
                        {
                            ApplicationArea = Basic,Suite;
                            CaptionML = ENU='Ship-to',
                                        FRA='Destinataire';
                            OptionCaptionML = ENU='Default (Company Address),Location,Customer Address,Custom Address',
                                              FRA='Par défaut (Adresse société),Magasin,Adresse client,Adresse personnalisée';
                            ToolTipML = ENU='Specifies the address that the products on the purchase document are shipped to. Default (Company Address): The same as the company address specified in the Company Information window. Location: One of the company''s location addresses. Custom Address: Any ship-to address that you specify in the fields below.',
                                        FRA='Spécifie l''adresse à laquelle les produits figurant sur le document achat sont expédiés. Par défaut (Adresse société) : identique à l''adresse société spécifiée dans la fenêtre Informations société. Magasin : une des adresses du magasin de la société. Adresse personnalisée : toute adresse destinataire que vous spécifiez dans les champs ci-dessous.';
                            Visible = ShowShippingOptionsWithLocation;

                            trigger OnValidate();
                            begin
                                ValidateShippingOption;
                            end;
                        }
                        field(ShippingOptionWithoutLocation;ShipToOptions)
                        {
                            ApplicationArea = Basic,Suite;
                            CaptionML = ENU='Ship-to',
                                        FRA='Destinataire';
                            HideValue = ShowShippingOptionsWithLocation AND (ShipToOptions = ShipToOptions::Location);
                            OptionCaptionML = ENU='Default (Company Address),,Customer Address,Custom Address',
                                              FRA='Par défaut (Adresse société),,Adresse client,Adresse personnalisée';
                            ToolTipML = ENU='Specifies the address that the products on the purchase document are shipped to. Default (Company Address): The same as the company address specified in the Company Information window. Custom Address: Any ship-to address that you specify in the fields below.',
                                        FRA='Spécifie l''adresse à laquelle les produits figurant sur le document achat sont expédiés. Par défaut (Adresse société) : identique à l''adresse société spécifiée dans la fenêtre Informations société. Adresse personnalisée : toute adresse destinataire que vous spécifiez dans les champs ci-dessous.';
                            Visible = NOT ShowShippingOptionsWithLocation;

                            trigger OnValidate();
                            begin
                                ValidateShippingOption
                            end;
                        }
                        group()
                        {
                            group()
                            {
                                Visible = ShipToOptions = ShipToOptions::Location;
                            }
                            group()
                            {
                                Visible = ShipToOptions = ShipToOptions::"Customer Address";
                                field("Sell-to Customer No.";"Sell-to Customer No.")
                                {
                                    ApplicationArea = Suite;
                                    CaptionML = ENU='Customer',
                                                FRA='Client';
                                    ToolTipML = ENU='Specifies the number of the customer that the items are shipped to directly from your vendor, as a drop shipment.',
                                                FRA='Spécifie le numéro du client à qui les articles sont livrés directement par votre fournisseur, en tant que livraison directe.';
                                }
                                field("Ship-to Code";"Ship-to Code")
                                {
                                    ApplicationArea = Suite;
                                    Editable = "Sell-to Customer No." <> '';
                                    ToolTipML = ENU='Specifies the code for another delivery address than the vendor''s own address, which is entered by default.',
                                                FRA='Spécifie le code d''une adresse de livraison différente de l''adresse du fournisseur, qui est entrée par défaut.';
                                }
                            }
                            field("Ship-to Name";"Ship-to Name")
                            {
                                ApplicationArea = Basic,Suite;
                                CaptionML = ENU='Name',
                                            FRA='Nom';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                Importance = Additional;
                                ToolTipML = ENU='Specifies the name of the company at the address that you want the items on the purchase document to be shipped to.',
                                            FRA='Spécifie le nom de la société située à l''adresse à laquelle vous voulez que les articles du document achat soient livrés.';
                            }
                            field("Ship-to Address";"Ship-to Address")
                            {
                                ApplicationArea = Basic,Suite;
                                CaptionML = ENU='Address',
                                            FRA='Adresse';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                Importance = Additional;
                                ToolTipML = ENU='Specifies the address that you want the items on the purchase document to be shipped to.',
                                            FRA='Spécifie l''adresse à laquelle vous voulez que les articles du document achat soient expédiés.';
                            }
                            field("Ship-to Address 2";"Ship-to Address 2")
                            {
                                ApplicationArea = Basic,Suite;
                                CaptionML = ENU='Address 2',
                                            FRA='Adresse (2ème ligne)';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                Importance = Additional;
                                ToolTipML = ENU='Specifies additional address information.',
                                            FRA='Spécifie des informations d''adresse supplémentaires.';
                            }
                            field("Ship-to Post Code";"Ship-to Post Code")
                            {
                                ApplicationArea = Basic,Suite;
                                CaptionML = ENU='Post Code',
                                            FRA='Code postal';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                Importance = Additional;
                                ToolTipML = ENU='Specifies the postal code of the address that you want the items on the purchase document to be shipped to.',
                                            FRA='Spécifie le code postal de l''adresse à laquelle vous voulez que les articles du document achat soient livrés.';
                            }
                            field("Ship-to City";"Ship-to City")
                            {
                                ApplicationArea = Basic,Suite;
                                CaptionML = ENU='City',
                                            FRA='Ville';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                Importance = Additional;
                                ToolTipML = ENU='Specifies the city of the vendor on the purchase document.',
                                            FRA='Spécifie la ville du fournisseur sur le document achat.';
                            }
                            field("Ship-to Country/Region Code";"Ship-to Country/Region Code")
                            {
                                ApplicationArea = Basic,Suite;
                                CaptionML = ENU='Country/Region',
                                            FRA='Pays/région';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                Importance = Additional;
                                ToolTipML = ENU='Specifies the country/region code of the address that you want the items on the purchase document to be shipped to.',
                                            FRA='Spécifie le code pays/région de l''adresse à laquelle vous voulez que les articles du document achat soient livrés.';
                            }
                            field("Ship-to Contact";"Ship-to Contact")
                            {
                                ApplicationArea = Basic,Suite;
                                CaptionML = ENU='Contact',
                                            FRA='Contact';
                                Editable = ShipToOptions = ShipToOptions::"Custom Address";
                                Importance = Additional;
                                ToolTipML = ENU='Specifies the name of a contact person for the address of the address that you want the items on the purchase document to be shipped to.',
                                            FRA='Spécifie le nom d''un contact pour l''adresse à laquelle vous voulez que les articles du document achat soient livrés.';
                            }
                        }
                    }
                }
                group()
                {
                    field(PayToOptions;PayToOptions)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Pay-to',
                                    FRA='Paiement';
                        OptionCaptionML = ENU='Default (Vendor),Another Vendor',
                                          FRA='Par défaut (Fournisseur),Autre fournisseur';
                        ToolTipML = ENU='Specifies the vendor that the purchase document will be paid to. Default (Vendor): The same as the vendor on the purchase document. Another Vendor: Any vendor that you specify in the fields below.',
                                    FRA='Spécifie le fournisseur auquel le document achat sera payé. Par défaut (Fournisseur) : identique au fournisseur figurant sur le document achat. Autre fournisseur : tout fournisseur que vous spécifiez dans les champs ci-dessous.';

                        trigger OnValidate();
                        begin
                            IF PayToOptions = PayToOptions::"Default (Vendor)" THEN
                              VALIDATE("Pay-to Vendor No.","Buy-from Vendor No.");
                        end;
                    }
                    group()
                    {
                        Visible = PayToOptions = PayToOptions::"Another Vendor";
                        field("Pay-to Name";"Pay-to Name")
                        {
                            ApplicationArea = Basic,Suite;
                            CaptionML = ENU='Name',
                                        FRA='Nom';
                            Importance = Promoted;
                            ToolTipML = ENU='Specifies the name of the vendor sending the invoice.',
                                        FRA='Spécifie le nom du fournisseur envoyant la facture.';
                        }
                        field("Pay-to Address";"Pay-to Address")
                        {
                            ApplicationArea = Basic,Suite;
                            CaptionML = ENU='Address',
                                        FRA='Adresse';
                            Editable = "Buy-from Vendor No." <> "Pay-to Vendor No.";
                            Enabled = "Buy-from Vendor No." <> "Pay-to Vendor No.";
                            Importance = Additional;
                            ToolTipML = ENU='Specifies the address of the vendor sending the invoice.',
                                        FRA='Spécifie l''adresse du fournisseur envoyant la facture.';
                        }
                        field("Pay-to Address 2";"Pay-to Address 2")
                        {
                            ApplicationArea = Basic,Suite;
                            CaptionML = ENU='Address 2',
                                        FRA='Adresse (2ème ligne)';
                            Editable = "Buy-from Vendor No." <> "Pay-to Vendor No.";
                            Enabled = "Buy-from Vendor No." <> "Pay-to Vendor No.";
                            Importance = Additional;
                            ToolTipML = ENU='Specifies additional address information.',
                                        FRA='Spécifie des informations d''adresse supplémentaires.';
                        }
                        field("Pay-to Post Code";"Pay-to Post Code")
                        {
                            ApplicationArea = Basic,Suite;
                            CaptionML = ENU='Post Code',
                                        FRA='Code postal';
                            Editable = "Buy-from Vendor No." <> "Pay-to Vendor No.";
                            Enabled = "Buy-from Vendor No." <> "Pay-to Vendor No.";
                            Importance = Additional;
                            ToolTipML = ENU='Specifies the postal code.',
                                        FRA='Spécifie le code postal.';
                        }
                        field("Pay-to City";"Pay-to City")
                        {
                            ApplicationArea = Basic,Suite;
                            CaptionML = ENU='City',
                                        FRA='Ville';
                            Editable = "Buy-from Vendor No." <> "Pay-to Vendor No.";
                            Enabled = "Buy-from Vendor No." <> "Pay-to Vendor No.";
                            Importance = Additional;
                            ToolTipML = ENU='Specifies the city of the vendor on the purchase document.',
                                        FRA='Spécifie la ville du fournisseur sur le document achat.';
                        }
                        field("Pay-to Contact No.";"Pay-to Contact No.")
                        {
                            ApplicationArea = Advanced;
                            CaptionML = ENU='Contact No.',
                                        FRA='N° contact';
                            Editable = "Buy-from Vendor No." <> "Pay-to Vendor No.";
                            Enabled = "Buy-from Vendor No." <> "Pay-to Vendor No.";
                            Importance = Additional;
                            ToolTipML = ENU='Specifies the number of contact person of the vendor''s buy-from.',
                                        FRA='Spécifie le numéro de la personne à contacter chez le fournisseur auprès duquel vous effectuez vos achats.';
                        }
                        field("Pay-to Contact";"Pay-to Contact")
                        {
                            ApplicationArea = Basic,Suite;
                            CaptionML = ENU='Contact',
                                        FRA='Contact';
                            Editable = "Buy-from Vendor No." <> "Pay-to Vendor No.";
                            Enabled = "Buy-from Vendor No." <> "Pay-to Vendor No.";
                            Importance = Additional;
                            ToolTipML = ENU='Specifies the name of the person to contact about an order from this vendor.',
                                        FRA='Spécifie le nom de la personne à contacter au sujet d''une commande émise par ce fournisseur.';
                        }
                    }
                }
            }
            group("Foreign Trade")
            {
                CaptionML = ENU='Foreign Trade',
                            FRA='International';
                field("Transaction Specification";"Transaction Specification")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies a specification of the document''s transaction, for the purpose of reporting to INTRASTAT.',
                                FRA='Spécifie une spécification de la transaction du document, à des fins de compte-rendu intracommunautaire.';
                }
                field("Transport Method";"Transport Method")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the transport method, for the purpose of reporting to INTRASTAT.',
                                FRA='Spécifie le mode de transport, à des fins de compte-rendu intracommunautaire.';
                }
                field("Entry Point";"Entry Point")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the code of the port of entry where the items pass into your country/region, for reporting to Intrastat.',
                                FRA='Spécifie le code du point d''entrée par lequel les articles ont pénétré dans votre pays/région, à des fins de compte-rendu à Intrastat.';
                }
                field(Area;Area)
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the area of the customer or vendor, for the purpose of reporting to INTRASTAT.',
                                FRA='Spécifie la zone du client ou du fournisseur, à des fins de compte-rendu intracommunautaire.';
                }
            }
            group(Prepayment)
            {
                CaptionML = ENU='Prepayment',
                            FRA='Acompte';
                field("Prepayment %";"Prepayment %")
                {
                    ApplicationArea = Prepayments;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the prepayment percentage to use to calculate the prepayment for sales.',
                                FRA='Spécifie le pourcentage d''acompte à utiliser pour calculer l''acompte pour les ventes.';

                    trigger OnValidate();
                    begin
                        Prepayment37OnAfterValidate;
                    end;
                }
                field("Compress Prepayment";"Compress Prepayment")
                {
                    ApplicationArea = Prepayments;
                    ToolTipML = ENU='Specifies that prepayments on the purchase order are combined if they have the same general ledger account for prepayments or the same dimensions.',
                                FRA='Spécifie que les acomptes sur la commande achat sont combinés s''ils ont le même compte général pour les acomptes ou les mêmes axes analytiques.';
                }
                field("Prepmt. Payment Terms Code";"Prepmt. Payment Terms Code")
                {
                    ApplicationArea = Prepayments;
                    ToolTipML = ENU='Specifies the code that represents the payment terms for prepayment invoices related to the purchase document.',
                                FRA='Spécifie le code qui représente les conditions de paiement pour les factures acompte en relation avec le document achat.';
                }
                field("Prepayment Due Date";"Prepayment Due Date")
                {
                    ApplicationArea = Prepayments;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies when the prepayment invoice for this purchase order is due.',
                                FRA='Spécifie quand la facture d''acompte de cette commande achat est due.';
                }
                field("Prepmt. Payment Discount %";"Prepmt. Payment Discount %")
                {
                    ApplicationArea = Prepayments;
                    ToolTipML = ENU='Specifies the payment discount percent granted on the prepayment if the vendor pays on or before the date entered in the Prepmt. Pmt. Discount Date field.',
                                FRA='Spécifie le pourcentage escompte accordé sur l''acompte si le fournisseur paie au plus tard à la date saisie dans le champ Date escompte acompte.';
                }
                field("Prepmt. Pmt. Discount Date";"Prepmt. Pmt. Discount Date")
                {
                    ApplicationArea = Prepayments;
                    ToolTipML = ENU='Specifies the last date the vendor can pay the prepayment invoice and still receive a payment discount on the prepayment amount.',
                                FRA='Spécifie la dernière date à laquelle le fournisseur peut payer la facture acompte et bénéficier d''un escompte sur le montant d''acompte.';
                }
                field("Vendor Cr. Memo No.";"Vendor Cr. Memo No.")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the number that the vendor uses for the purchase order.',
                                FRA='Spécifie le numéro utilisé par le fournisseur pour la commande achat.';
                }
            }
            group(Application)
            {
                CaptionML = ENU='Application',
                            FRA='Lettrage';
                field("Applies-to Doc. Type";"Applies-to Doc. Type")
                {
                }
                field("Applies-to Doc. No.";"Applies-to Doc. No.")
                {
                }
                field("Applies-to ID";"Applies-to ID")
                {
                }
            }
        }
        area(factboxes)
        {
            part(;9103)
            {
                ApplicationArea = Suite;
                SubPageLink = Table ID=CONST(38),
                              Document Type=FIELD(Document Type),
                              Document No.=FIELD(No.);
                Visible = OpenApprovalEntriesExistForCurrUser;
            }
            part(;9090)
            {
                ApplicationArea = Advanced;
                Provider = PurchLines;
                SubPageLink = No.=FIELD(No.);
                Visible = false;
            }
            part(ApprovalFactBox;9092)
            {
                ApplicationArea = Advanced;
                Visible = false;
            }
            part(;9093)
            {
                ApplicationArea = Advanced;
                SubPageLink = No.=FIELD(Buy-from Vendor No.);
                Visible = false;
            }
            part(;9094)
            {
                ApplicationArea = Advanced;
                SubPageLink = No.=FIELD(Pay-to Vendor No.);
            }
            part(IncomingDocAttachFactBox;193)
            {
                ApplicationArea = Advanced;
                ShowFilter = false;
                Visible = false;
            }
            part(;9095)
            {
                ApplicationArea = Advanced;
                SubPageLink = No.=FIELD(Buy-from Vendor No.);
            }
            part(;9096)
            {
                ApplicationArea = Advanced;
                SubPageLink = No.=FIELD(Pay-to Vendor No.);
                Visible = false;
            }
            part(;9100)
            {
                ApplicationArea = Suite;
                Provider = PurchLines;
                SubPageLink = Document Type=FIELD(Document Type),
                              Document No.=FIELD(Document No.),
                              Line No.=FIELD(Line No.);
            }
            part(WorkflowStatus;1528)
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatus;
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
                            FRA='&Commande';
                Image = "Order";
                action(Dimensions)
                {
                    AccessByPermission = TableData 348=R;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Enabled = "No." <> '';
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
                        CurrPage.SAVERECORD;
                    end;
                }
                action(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques DM';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        //<<CT16V001 ZM 15/05/2016
                        DMShowDimensions;
                        //>>CT16V001 ZM 15/05/2016
                    end;
                }
                action("Mise à jour Analytique Lignes")
                {

                    trigger OnAction();
                    var
                        DMDimensionSet : Record "60059";
                        DMManagement : Codeunit "50005";
                        DMDimensionSetDefault : Record "60059";
                        RecPurchaseLine : Record "39";
                        DMDimensionSetToDelete : Record "60059";
                        DimSetID : Code[20];
                    begin
                        //<<CT16V001 ZM 15/05/2016
                        TESTFIELD("ID DM Set");
                        DMDimensionSet.RESET;
                        DMDimensionSet.SETRANGE("Dimension Set ID","ID DM Set");
                        IF DMDimensionSet.FINDSET THEN BEGIN

                                RecPurchaseLine.RESET;
                                RecPurchaseLine.SETRANGE("Document Type","Document Type");
                                RecPurchaseLine.SETRANGE("Document No.","No.");
                                IF RecPurchaseLine.FINDSET THEN BEGIN
                                  REPEAT
                                    DimSetID := '';

                                    DMManagement.InsertDMDimensionSet(DMDimensionSetDefault,DimSetID,DMDimensionSet."Line No.",
                                     DMDimensionSet."Dimension Code",DMDimensionSet."Dimension Value Code",DMDimensionSet.Share);

                                    DimSetID := DMDimensionSetDefault."Dimension Set ID";

                                    IF DMDimensionSet.NEXT <> 0 THEN
                                    REPEAT
                                     DMManagement.InsertDMDimensionSet(DMDimensionSetDefault,DimSetID,DMDimensionSet."Line No.",
                                      DMDimensionSet."Dimension Code",DMDimensionSet."Dimension Value Code",DMDimensionSet.Share);
                                    UNTIL DMDimensionSet.NEXT = 0;
                                    DMDimensionSet.FINDFIRST;

                                    IF RecPurchaseLine."ID DM Set" <> '' THEN BEGIN
                                      DMDimensionSetToDelete.RESET;
                                      DMDimensionSetToDelete.SETRANGE("Dimension Set ID",RecPurchaseLine."ID DM Set");
                                      IF DMDimensionSetToDelete.FINDSET THEN
                                        DMDimensionSetToDelete.DELETEALL;
                                    END;

                                    RecPurchaseLine."ID DM Set" := DimSetID;
                                    RecPurchaseLine.MODIFY;
                                  UNTIL RecPurchaseLine.NEXT = 0;
                                END;



                        END ELSE BEGIN
                          ERROR('Affectation analytique vide');
                        END;
                        //>>CT16V001 ZM 15/05/2016
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
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                action(Vendor)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Vendor',
                                FRA='Fournisseur';
                    Enabled = "Buy-from Vendor No." <> '';
                    Image = EditLines;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    RunObject = Page 26;
                    RunPageLink = No.=FIELD(Buy-from Vendor No.);
                    ShortCutKey = 'Shift+F7';
                    ToolTipML = ENU='View or edit detailed information about the vendor on the purchase document.',
                                FRA='Afficher ou modifier des informations détaillées concernant le fournisseur sur le document achat.';
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
                action(Receipts)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Receipts',
                                FRA='Bons de réception';
                    Image = PostedReceipts;
                    RunObject = Page 145;
                    RunPageLink = Order No.=FIELD(No.);
                    RunPageView = SORTING(Order No.);
                    ToolTipML = ENU='View a list of posted purchase receipts for the order.',
                                FRA='Afficher la liste des réceptions achat validées pour la commande achat.';
                }
                action(Invoices)
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
                action(PostedPrepaymentInvoices)
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
                    Visible = false;
                }
                action(PostedPrepaymentCrMemos)
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
                    Visible = false;
                }
                action("Liste des erreurs Cmd Achat PR")
                {
                    Image = Error;
                    Promoted = true;
                    RunObject = Page 70062;
                    RunPageLink = No. Commande Achat=FIELD(No.);
                    Visible = false;
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
                separator()
                {
                }
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
                    Visible = false;
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
                separator()
                {
                }
                group("Dr&op Shipment")
                {
                    CaptionML = ENU='Dr&op Shipment',
                                FRA='Livraison &directe';
                    Image = Delivery;
                    action(Warehouse_GetSalesOrder)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Get &Sales Order',
                                    FRA='Ex&traire commande vente';
                        Image = "Order";
                        RunObject = Codeunit 76;
                        ToolTipML = ENU='Select the sales order that must be linked to the purchase order, for drop shipment or special order. ',
                                    FRA='Sélectionnez la commande vente à associer à la commande achat pour une livraison directe ou une commande spéciale. ';
                    }
                }
                group("Speci&al Order")
                {
                    CaptionML = ENU='Speci&al Order',
                                FRA='C&ommande spéciale';
                    Image = SpecialOrder;
                    action("Get &Sales Order")
                    {
                        AccessByPermission = TableData 110=R;
                        ApplicationArea = Advanced;
                        CaptionML = ENU='Get &Sales Order',
                                    FRA='Ex&traire commande vente';
                        Image = "Order";
                        ToolTipML = ENU='Select the sales order that must be linked to the purchase order, for drop shipment or special order. ',
                                    FRA='Sélectionnez la commande vente à associer à la commande achat pour une livraison directe ou une commande spéciale. ';

                        trigger OnAction();
                        var
                            PurchHeader : Record "38";
                            DistIntegration : Codeunit "5702";
                        begin
                            PurchHeader.COPY(Rec);
                            DistIntegration.GetSpecialOrders(PurchHeader);
                            Rec := PurchHeader;
                        end;
                    }
                }
            }
        }
        area(processing)
        {
            group(Approval)
            {
                CaptionML = ENU='Approval',
                            FRA='Approbation';
                Visible = false;
                action(Approve)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Approve',
                                FRA='Approuver';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTipML = ENU='Approve the requested changes.',
                                FRA='Approuvez les modifications demandées.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Reject',
                                FRA='Rejeter';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTipML = ENU='Reject the requested changes.',
                                FRA='Rejetez les modifications demandées.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Delegate',
                                FRA='Déléguer';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTipML = ENU='Delegate the requested changes to the substitute approver.',
                                FRA='Déléguez les modifications demandées à l''approbateur remplaçant.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(RECORDID);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Comments',
                                FRA='Commentaires';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTipML = ENU='View or add comments for the record.',
                                FRA='Afficher ou ajouter des commentaires pour l''enregistrement.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
            group(Release)
            {
                CaptionML = ENU='Release',
                            FRA='Lancer';
                Image = ReleaseDoc;
                separator()
                {
                }
                action(Release)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Re&lease',
                                FRA='&Lancer';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
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
                    Enabled = Status <> Status::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTipML = ENU='Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed',
                                FRA='Rouvrez le document pour le modifier après son approbation. Les documents approuvés ont le statut Lancé et doivent être ouverts pour pouvoir être modifiés.';

                    trigger OnAction();
                    var
                        ReleasePurchDoc : Codeunit "415";
                    begin
                        ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator()
                {
                }
                action("Générer Commande MAZDA")
                {
                    Caption = 'Générer Commande MAZDA';
                    Image = Export;
                    Promoted = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                         CLEAR(export);
                         export.SetDocNo("No.");
                         export.RUN;
                    end;
                }
                action("Export Cmd Achat")
                {
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        XmlportExportCommandeAchat : XMLport "50019";
                    begin
                        XmlportExportCommandeAchat.FctSetCmdAchatNo("No.");
                        XmlportExportCommandeAchat.RUN;
                    end;
                }
                action("Import Code 63")
                {
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ADDINCustTxtFile : Text;
                        ADDINXmlStream : InStream;
                        path : Text;
                        FileMgmt : Codeunit "419";
                        ImportListcolisFactTYT : XMLport "70071";
                        LFile : File;
                    begin
                        ADDINCustTxtFile := STRSUBSTNO('%1.csv','');
                        ADDINCustTxtFile := FileMgmt.OpenFileDialog('',ADDINCustTxtFile,'');

                        path := FileMgmt.GetDirectoryName(ADDINCustTxtFile);

                        LFile.OPEN(ADDINCustTxtFile);
                        LFile.CREATEINSTREAM(ADDINXmlStream);
                        CLEAR(ImportListcolisFactTYT);
                        ImportListcolisFactTYT.SETSOURCE(ADDINXmlStream);
                        ImportListcolisFactTYT.IMPORT;
                        LFile.CLOSE();
                    end;
                }
            }
            group(Print)
            {
                CaptionML = ENU='Print',
                            FRA='Imprimer';
                Image = Print;
                action("&Print")
                {
                    CaptionML = ENU='&Print',
                                FRA='&Imprimer';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        //ZMN MIG DocPrint.PrintPurchHeader(Rec);
                    end;
                }
                action("Imprimer Bon Commande ST")
                {
                    Image = ServiceMan;
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
                           REPORT.RUN(REPORT::"Bon Commande Sous Traitance",TRUE,TRUE,PurchaseHeader);
                        //>>---NM280317--------
                    end;
                }
            }
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("Créer Commande Intersociété PR")
                {
                    Image = Calculate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Vente Inter Societe" THEN
                          ERROR('vous n''avez pas le droit le lancer la facturation inter société')
                        ELSE
                          BEGIN
                            RecGPurchOrder.SETRANGE(RecGPurchOrder."Document Type",RecGPurchOrder."Document Type"::Order) ;
                            RecGPurchOrder.SETRANGE(RecGPurchOrder."No.","No.");
                            REPORT.RUNMODAL(REPORT::"Facturation intersociétéV2",TRUE,FALSE,RecGPurchOrder);
                         END;
                    end;
                }
                action("Créer Commande Intersociété2")
                {
                    Caption = 'Créer Commande Intersociété SAV';
                    Image = Calculate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Vente Inter Societe" THEN
                          ERROR('vous n''avez pas le droit le lancer la facturation inter société')
                        ELSE
                          BEGIN
                            RecGPurchOrder.SETRANGE(RecGPurchOrder."Document Type",RecGPurchOrder."Document Type"::Order) ;
                            RecGPurchOrder.SETRANGE(RecGPurchOrder."No.","No.");
                            REPORT.RUNMODAL(60215,TRUE,FALSE,RecGPurchOrder);
                         END;
                    end;
                }
                action("Actualiser Remise Ligne")
                {

                    trigger OnAction();
                    var
                        PurchaseLineDisc : Record "39";
                    begin
                        //SM 021217
                        PurchaseLineDisc.RESET;
                        PurchaseLineDisc.SETRANGE("Document Type","Document Type");
                        PurchaseLineDisc.SETRANGE("Document No.","No.");
                        IF PurchaseLineDisc.FINDSET THEN
                          REPEAT
                            PurchaseLineDisc.VALIDATE("Line Discount %",PurchaseLineDisc."Line Discount %");
                            PurchaseLineDisc.MODIFY
                          UNTIL PurchaseLineDisc.NEXT = 0;

                        //END SM
                    end;
                }
                action(CalculateInvoiceDiscount)
                {
                    AccessByPermission = TableData 24=R;
                    ApplicationArea = Suite;
                    CaptionML = ENU='Calculate &Invoice Discount',
                                FRA='C&alculer remise facture';
                    Image = CalculateInvoiceDiscount;
                    ToolTipML = ENU='Calculate the discount that can be granted based on all lines in the purchase document.',
                                FRA='Calculez la remise qui peut être accordée en fonction de toutes les lignes du document achat.';

                    trigger OnAction();
                    begin
                        ApproveCalcInvDisc;
                        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
                    end;
                }
                separator()
                {
                }
                action(GetRecurringPurchaseLines)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Get Recurring Purchase Lines',
                                FRA='Extraire les lignes achat récurrentes';
                    Ellipsis = true;
                    Image = VendorCode;
                    ToolTipML = ENU='Insert purchase document lines that you have set up for the vendor as recurring. Recurring purchase lines could be for a monthly replenishment order or a fixed freight expense.',
                                FRA='Insérez les lignes document achat que vous avez paramétrées comme récurrentes pour le fournisseur. Les lignes achat récurrentes peuvent représenter un ordre de réapprovisionnement mensuel ou une dépense de fret fixe.';
                    Visible = false;

                    trigger OnAction();
                    var
                        StdVendPurchCode : Record "175";
                    begin
                        StdVendPurchCode.InsertPurchLines(Rec);
                    end;
                }
                action("Proposer Article")
                {
                    Caption = 'Préconisation Achat PR';
                    Promoted = true;
                    Visible = false;

                    trigger OnAction();
                    begin

                        //<<CT16V001 ZM 15/05/2016 - Préconisation commande

                        CLEAR(RecGPagePropArticle);
                        RecGTypeDoc:=2;
                        RecGPagePropArticle.SetPurchaseRequest(Rec."No.",RecGTypeDoc);
                        RecGPagePropArticle.RUNMODAL();

                        //>>CT16V001 ZM 15/05/2016
                    end;
                }
                separator()
                {
                }
                action(CopyDocument)
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Copy Document',
                                FRA='Copier document';
                    Ellipsis = true;
                    Image = CopyDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTipML = ENU='Copy document lines and header information from another purchase document to this document. You can copy a posted purchase invoice into a new purchase invoice to quickly create a similar document.',
                                FRA='Copiez les lignes document et les informations d''en-tête d''un autre document achat vers celui-ci. Vous pouvez copier une facture achat enregistrée vers une nouvelle facture achat pour créer rapidement un document similaire.';

                    trigger OnAction();
                    begin
                        CopyPurchDoc.SetPurchHeader(Rec);
                        CopyPurchDoc.RUNMODAL;
                        CLEAR(CopyPurchDoc);
                        IF GET("Document Type","No.") THEN;
                    end;
                }
                action(MoveNegativeLines)
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Move Negative Lines',
                                FRA='Déplacer lignes négatives';
                    Ellipsis = true;
                    Image = MoveNegativeLines;
                    ToolTipML = ENU='Prepare to create a replacement sales order in a sales return process.',
                                FRA='Préparez-vous à créer une commande vente de remplacement dans un processus de retour vente.';
                    Visible = false;

                    trigger OnAction();
                    begin
                        CLEAR(MoveNegPurchLines);
                        MoveNegPurchLines.SetPurchHeader(Rec);
                        MoveNegPurchLines.RUNMODAL;
                        MoveNegPurchLines.ShowDocument;
                    end;
                }
                action("Mise à jour des prix")
                {
                    Caption = 'Mise à jour des prix';
                    RunObject = Page 60161;
                    Visible = false;
                }
                group("Dr&op Shipment")
                {
                    CaptionML = ENU='Dr&op Shipment',
                                FRA='Livrais&on directe';
                    Image = Delivery;
                    Visible = false;
                    action(Functions_GetSalesOrder)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Get &Sales Order',
                                    FRA='Ex&traire commande vente';
                        Image = "Order";
                        RunObject = Codeunit 76;
                        ToolTipML = ENU='Select the sales order that must be linked to the purchase order, for drop shipment or special order. ',
                                    FRA='Sélectionnez la commande vente à associer à la commande achat pour une livraison directe ou une commande spéciale. ';
                    }
                }
                group("Speci&al Order")
                {
                    CaptionML = ENU='Speci&al Order',
                                FRA='C&ommande spéciale';
                    Image = SpecialOrder;
                    action("Get &Sales Order")
                    {
                        AccessByPermission = TableData 110=R;
                        ApplicationArea = Advanced;
                        CaptionML = ENU='Get &Sales Order',
                                    FRA='Ex&traire commande vente';
                        Image = "Order";
                        ToolTipML = ENU='Select the sales order that must be linked to the purchase order, for drop shipment or special order. ',
                                    FRA='Sélectionnez la commande vente à associer à la commande achat pour une livraison directe ou une commande spéciale. ';

                        trigger OnAction();
                        var
                            PurchHeader : Record "38";
                            DistIntegration : Codeunit "5702";
                        begin
                            PurchHeader.COPY(Rec);
                            DistIntegration.GetSpecialOrders(PurchHeader);
                            Rec := PurchHeader;
                        end;
                    }
                }
                action("Archive Document")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Archi&ve Document',
                                FRA='Archi&ver document';
                    Image = Archive;
                    ToolTipML = ENU='Send the document to the archive, for example because it is too soon to delete it. Later, you delete or reprocess the archived document.',
                                FRA='Envoyer le document vers l''archive, par exemple, car il est trop tôt pour le supprimer. Ultérieurement, vous pouvez supprimer ou traiter à nouveau le document archivé.';

                    trigger OnAction();
                    begin
                        ArchiveManagement.ArchivePurchDocument(Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Send Intercompany Purchase Order")
                {
                    AccessByPermission = TableData 410=R;
                    ApplicationArea = Intercompany;
                    CaptionML = ENU='Send Intercompany Purchase Order',
                                FRA='Envoyer Commande achat intersociétés';
                    Image = IntercompanyOrder;
                    ToolTipML = ENU='Send the purchase order to the intercompany outbox or directly to the intercompany partner if automatic transaction sending is enabled.',
                                FRA='Envoyez la commande achat vers la boîte d''envoi intersociétés ou directement vers le partenaire intersociétés si l''envoi de transaction automatique est activé.';
                    Visible = false;

                    trigger OnAction();
                    var
                        ICInOutboxMgt : Codeunit "427";
                        ApprovalsMgmt : Codeunit "1535";
                    begin
                        IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                          ICInOutboxMgt.SendPurchDoc(Rec,FALSE);
                    end;
                }
                action("Mise à jour traçabilité")
                {
                    Image = UpdateXML;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        PurchaseLine : Record "39";
                        VNArrivage : Record "70015";
                        MgtAures : Codeunit "70003";
                        ReservationEntry : Record "337";
                    begin
                        //ADD KK 17092016
                        TESTFIELD("Order Type","Order Type"::VN);
                        IF CONFIRM(TXT50000) THEN BEGIN
                          PurchaseLine.RESET;
                          PurchaseLine.SETRANGE(Type,PurchaseLine.Type::Item);
                          PurchaseLine.SETRANGE("Document No.","No.");
                          PurchaseLine.SETRANGE("Quantity Received",0);
                          IF PurchaseLine.FINDFIRST THEN
                            REPEAT
                              PurchaseLine.TESTFIELD(CAF);
                              PurchaseLine.TESTFIELD("Location Code");
                              ReservationEntry.RESET;
                              VNArrivage.GET(PurchaseLine.CAF);
                              ReservationEntry.SETRANGE("Serial No.",VNArrivage.VIN);
                              ReservationEntry.SETRANGE("Source ID","No.");
                              IF ReservationEntry.ISEMPTY THEN
                                MgtAures.InsertTrackingReservation(PurchaseLine."No.",PurchaseLine."Variant Code",PurchaseLine."Location Code",
                                    PurchaseLine."Document No.",PurchaseLine."Line No.",VNArrivage.VIN);
                              //SM 031017
                              PurchaseLine."Date bateau visé VN" := VNArrivage."Date Emb. confirmée";
                              PurchaseLine.MODIFY;
                              //END SM
                            UNTIL PurchaseLine.NEXT=0;
                            MESSAGE(TXT50001);
                        END;
                        //END KK
                    end;
                }
                separator()
                {
                }
                group(IncomingDocument)
                {
                    CaptionML = ENU='Incoming Document',
                                FRA='Document entrant';
                    Image = Documents;
                    Visible = false;
                    action(IncomingDocCard)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='View Incoming Document',
                                    FRA='Afficher le document entrant';
                        Enabled = HasIncomingDocument;
                        Image = ViewOrder;
                        ToolTipML = ENU='View any incoming document records and file attachments that exist for the entry or document, for example for auditing purposes',
                                    FRA='Affichez tous les fichiers joints et tous les enregistrements de document entrant qui existent pour l''écriture ou le document, par exemple à des fins d''audit.';

                        trigger OnAction();
                        var
                            IncomingDocument : Record "130";
                        begin
                            IncomingDocument.ShowCardFromEntryNo("Incoming Document Entry No.");
                        end;
                    }
                    action(SelectIncomingDoc)
                    {
                        AccessByPermission = TableData 130=R;
                        ApplicationArea = Suite;
                        CaptionML = ENU='Select Incoming Document',
                                    FRA='Sélectionner le document entrant';
                        Image = SelectLineToApply;
                        ToolTipML = ENU='Select an incoming document record and file attachment that you want to link to the entry or document.',
                                    FRA='Sélectionnez un fichier joint ou un enregistrement de document entrant que vous voulez associer à l''écriture ou au document.';

                        trigger OnAction();
                        var
                            IncomingDocument : Record "130";
                        begin
                            VALIDATE("Incoming Document Entry No.",IncomingDocument.SelectIncomingDocument("Incoming Document Entry No.",RECORDID));
                        end;
                    }
                    action(IncomingDocAttachFile)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Create Incoming Document from File',
                                    FRA='Créer un document entrant à partir d''un fichier';
                        Ellipsis = true;
                        Enabled = CreateIncomingDocumentEnabled;
                        Image = Attach;
                        ToolTipML = ENU='Create an incoming document from a file that you select from the disk. The file will be attached to the incoming document record.',
                                    FRA='Créez un document entrant à partir d''un fichier que vous sélectionnez sur le disque. Le fichier sera joint à l''enregistrement de document entrant.';

                        trigger OnAction();
                        var
                            IncomingDocumentAttachment : Record "133";
                        begin
                            IncomingDocumentAttachment.NewAttachmentFromPurchaseDocument(Rec);
                        end;
                    }
                    action(RemoveIncomingDoc)
                    {
                        ApplicationArea = Suite;
                        CaptionML = ENU='Remove Incoming Document',
                                    FRA='Supprimer le document entrant';
                        Enabled = HasIncomingDocument;
                        Image = RemoveLine;
                        ToolTipML = ENU='Remove any incoming document records and file attachments.',
                                    FRA='Supprimer tous les fichiers joints et les enregistrements de document entrant.';

                        trigger OnAction();
                        var
                            IncomingDocument : Record "130";
                        begin
                            IF IncomingDocument.GET("Incoming Document Entry No.") THEN
                              IncomingDocument.RemoveLinkToRelatedRecord;
                            "Incoming Document Entry No." := 0;
                            MODIFY(TRUE);
                        end;
                    }
                }
            }
            group("Request Approval")
            {
                CaptionML = ENU='Request Approval',
                            FRA='Approbation demande achat';
                Visible = false;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Send A&pproval Request',
                                FRA='Envoyer demande d''a&pprobation';
                    Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
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
                    PromotedCategory = Category9;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTipML = ENU='Cancel the approval request.',
                                FRA='Annulez la demande d''approbation.';

                    trigger OnAction();
                    var
                        ApprovalsMgmt : Codeunit "1535";
                        WorkflowWebhookMgt : Codeunit "1543";
                    begin
                        ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                        WorkflowWebhookMgt.FindAndCancel(RECORDID);
                    end;
                }
                group(Flow)
                {
                    CaptionML = ENU='Flow',
                                FRA='Flow';
                    Image = Flow;
                    Visible = false;
                    action(CreateFlow)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='Create a Flow',
                                    FRA='Créer un flux de travail';
                        Image = Flow;
                        Promoted = true;
                        PromotedCategory = Category9;
                        PromotedOnly = true;
                        ToolTipML = ENU='Create a new Flow from a list of relevant Flow templates.',
                                    FRA='Créer un flux de travail à partir d''une liste de modèles de flux de travail appropriés.';
                        Visible = IsSaaS;

                        trigger OnAction();
                        var
                            FlowServiceManagement : Codeunit "6400";
                            FlowTemplateSelector : Page "6400";
                        begin
                            // Opens page 6400 where the user can use filtered templates to create new flows.
                            FlowTemplateSelector.SetSearchText(FlowServiceManagement.GetPurchasingTemplateFilter);
                            FlowTemplateSelector.RUN;
                        end;
                    }
                    action(SeeFlows)
                    {
                        ApplicationArea = Basic,Suite;
                        CaptionML = ENU='See my Flows',
                                    FRA='Afficher mes flux de travail';
                        Image = Flow;
                        Promoted = true;
                        PromotedCategory = Category9;
                        PromotedOnly = true;
                        RunObject = Page 6401;
                        ToolTipML = ENU='View and configure Flows that you created.',
                                    FRA='Affichez et configurez les flux de travail créés.';
                    }
                }
            }
            group(Warehouse)
            {
                CaptionML = ENU='Warehouse',
                            FRA='Entrepôt';
                Image = Warehouse;
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
                    Image = CreateInventoryPickup;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTipML = ENU='Create an inventory put-away or inventory pick to handle items on the document according to a basic warehouse configuration that does not require warehouse receipt or shipment documents.',
                                FRA='Créer un rangement stock ou un prélèvement stock pour gérer les articles figurant sur le document en fonction d''une configuration entrepôt de base qui ne nécessite pas de documents de réception ou d''expédition entrepôt.';

                    trigger OnAction();
                    begin
                        CreateInvtPutAwayPick;

                        IF NOT FIND('=><') THEN
                          INIT;
                    end;
                }
                separator()
                {
                }
            }
            group("P&osting")
            {
                CaptionML = ENU='P&osting',
                            FRA='&Validation';
                Image = Post;
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
                    begin
                        Post(CODEUNIT::"Purch.-Post (Yes/No)");
                    end;
                }
                action("Affecter lettre de crédit")
                {
                    Image = Allocations;

                    trigger OnAction();
                    begin
                        //__RH : Affectation nobligatoire de la L.C avant la validation de cmd de type VN pour le reste de la partie finance
                        CLEAR(MgtFinAures);
                        IF "Order Type"= "Order Type"::VN THEN
                        MgtFinAures.AffecterLettreCredit(Rec);
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
                action("Post and &Print")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Post and &Print',
                                FRA='Valider et i&mprimer';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+F9';
                    ToolTipML = ENU='Finalize and prepare to print the document or journal. The values and quantities are posted to the related accounts. A report request window where you can specify what to include on the print-out.',
                                FRA='Finalisez et préparez-vous à imprimer le document ou la feuille. Les valeurs et les quantités sont validées en fonction des comptes associés. Une fenêtre de demande d''état où vous pouvez spécifier ce qu''il faut inclure sur l''élément à imprimer.';

                    trigger OnAction();
                    var
                        RecPurchaseOrder : Record "38";
                        PurchaseLineDisc : Record "39";
                    begin
                        //ZMN MIG TestTopost;
                        Post(CODEUNIT::"Purch.-Post + Print");
                        //SM 021217
                        /*PurchaseLineDisc.RESET;
                        PurchaseLineDisc.SETRANGE("Document Type","Document Type");
                        PurchaseLineDisc.SETRANGE("Document No.","No.");
                        IF PurchaseLineDisc.FINDSET THEN
                          REPEAT
                            PurchaseLineDisc.VALIDATE("Line Discount %",PurchaseLineDisc."Line Discount %");
                            PurchaseLineDisc.MODIFY
                          UNTIL PurchaseLineDisc.NEXT = 0;
                        */
                        //END SM

                    end;
                }
                action("Test Report")
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
                action("Post &Batch")
                {
                    ApplicationArea = Advanced;
                    CaptionML = ENU='Post &Batch',
                                FRA='Valider par l&ot';
                    Ellipsis = true;
                    Image = PostBatch;
                    ToolTipML = ENU='Post several documents at once. A report request window opens where you can specify which documents to post.',
                                FRA='Valider plusieurs documents à la fois. Une fenêtre de la sélection de l''état s''ouvre. Vous pouvez y préciser quels sont les documents à valider.';

                    trigger OnAction();
                    begin
                        //ZMN MIG TestTopost;
                        REPORT.RUNMODAL(REPORT::"Batch Post Purchase Orders",TRUE,TRUE,Rec);
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                action("Remove From Job Queue")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='Remove From Job Queue',
                                FRA='Supprimer de la file d''attente des travaux';
                    Image = RemoveLine;
                    ToolTipML = ENU='Remove the scheduled processing of this record from the job queue.',
                                FRA='Supprimez le traitement planifié de cet enregistrement à partir de la file d''attente des travaux.';
                    Visible = JobQueueVisible;

                    trigger OnAction();
                    begin
                        CancelBackgroundPosting;
                    end;
                }
                separator()
                {
                }
                action("Clôturer Commande")
                {
                    Caption = 'Clôturer Commande';
                    Image = Close;

                    trigger OnAction();
                    begin
                        CLEAR(RecUserSetup);
                        RecUserSetup.GET(USERID);
                        RecUserSetup.TESTFIELD("Transf. Demande --> Commande");
                        IF CONFIRM('ëtes vous  sûre de vouloir clôturer cette commande achat',TRUE,FALSE) THEN
                        BEGIN
                         CLEAR(PurchaseRequestHeader);
                         CLEAR(PurchaseLine);
                         PurchaseLine.SETFILTER("Document No.",'%1',"No.");
                         PurchaseLine.SETFILTER("Qty. to Receive",'<>%1',0);
                         PurchaseLine.FINDFIRST;
                         REPEAT
                          CLEAR(PurchaseRequestLine);
                          PurchaseRequestLine.SETRANGE("Request No.","Request No.");
                          PurchaseRequestLine.SETRANGE("Line No.",PurchaseLine."Request Line No.");
                          PurchaseRequestLine.FINDFIRST;
                           BEGIN
                            PurchaseRequestLine."Montant budget ligne D.A" :=  PurchaseRequestLine."Montant budget ligne D.A" -PurchaseLine."Outstanding Amt. Ex. VAT (LCY)";
                            PurchaseRequestLine.MODIFY;
                           END;

                         UNTIL PurchaseLine.NEXT = 0;
                         "Commande clôturée" := TRUE;
                         MODIFY;
                        END;
                    end;
                }
                group("Prepa&yment")
                {
                    CaptionML = ENU='Prepa&yment',
                                FRA='Acom&pte';
                    Image = Prepayment;
                    Visible = false;
                    action("Prepayment Test &Report")
                    {
                        ApplicationArea = Prepayments;
                        CaptionML = ENU='Prepayment Test &Report',
                                    FRA='Impression &test acompte';
                        Ellipsis = true;
                        Image = PrepaymentSimulation;
                        ToolTipML = ENU='Preview the prepayment transactions that will results from posting the sales document as invoiced. ',
                                    FRA='Afficher un aperçu des transactions d''acompte qui vont résulter de la validation du document vente comme étant facturé. ';

                        trigger OnAction();
                        begin
                            ReportPrint.PrintPurchHeaderPrepmt(Rec);
                        end;
                    }
                    action(PostPrepaymentInvoice)
                    {
                        ApplicationArea = Prepayments;
                        CaptionML = ENU='Post Prepayment &Invoice',
                                    FRA='Valider &facture acompte';
                        Ellipsis = true;
                        Image = PrepaymentPost;
                        ToolTipML = ENU='Post the specified prepayment information. ',
                                    FRA='Valider les informations d''acompte spécifiées. ';

                        trigger OnAction();
                        var
                            ApprovalsMgmt : Codeunit "1535";
                            PurchPostYNPrepmt : Codeunit "445";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                              PurchPostYNPrepmt.PostPrepmtInvoiceYN(Rec,FALSE);
                        end;
                    }
                    action("Post and Print Prepmt. Invoic&e")
                    {
                        ApplicationArea = Prepayments;
                        CaptionML = ENU='Post and Print Prepmt. Invoic&e',
                                    FRA='Valider et imprimer factur&e acompte';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;
                        ToolTipML = ENU='Post the specified prepayment information and print the related report. ',
                                    FRA='Valider les informations d''acompte spécifiées et imprimez l''état associé. ';

                        trigger OnAction();
                        var
                            ApprovalsMgmt : Codeunit "1535";
                            PurchPostYNPrepmt : Codeunit "445";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                              PurchPostYNPrepmt.PostPrepmtInvoiceYN(Rec,TRUE);
                        end;
                    }
                    action(PostPrepaymentCreditMemo)
                    {
                        ApplicationArea = Prepayments;
                        CaptionML = ENU='Post Prepayment &Credit Memo',
                                    FRA='Valider &avoir acompte';
                        Ellipsis = true;
                        Image = PrepaymentPost;
                        ToolTipML = ENU='Create and post a credit memo for the specified prepayment information.',
                                    FRA='Créer et valider un avoir pour les informations d''acompte spécifiées.';

                        trigger OnAction();
                        var
                            ApprovalsMgmt : Codeunit "1535";
                            PurchPostYNPrepmt : Codeunit "445";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                              PurchPostYNPrepmt.PostPrepmtCrMemoYN(Rec,FALSE);
                        end;
                    }
                    action("Post and Print Prepmt. Cr. Mem&o")
                    {
                        ApplicationArea = Prepayments;
                        CaptionML = ENU='Post and Print Prepmt. Cr. Mem&o',
                                    FRA='Valider et imprimer av&oir acompte';
                        Ellipsis = true;
                        Image = PrepaymentPostPrint;
                        ToolTipML = ENU='Create and post a credit memo for the specified prepayment information and print the related report.',
                                    FRA='Créer et valider un avoir pour les informations d''acompte spécifiées et imprimez l''état associé.';

                        trigger OnAction();
                        var
                            ApprovalsMgmt : Codeunit "1535";
                            PurchPostYNPrepmt : Codeunit "445";
                        begin
                            IF ApprovalsMgmt.PrePostApprovalCheckPurch(Rec) THEN
                              PurchPostYNPrepmt.PostPrepmtCrMemoYN(Rec,TRUE);
                        end;
                    }
                }
            }
            group(Print)
            {
                CaptionML = ENU='Print',
                            FRA='Imprimer';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Suite;
                    CaptionML = ENU='&Print',
                                FRA='&Imprimer';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Category10;
                    ToolTipML = ENU='Prepare to print the document. The report request window for the document opens where you can specify what to include on the print-out.',
                                FRA='Préparez-vous à imprimer le document. La fenêtre de sélection de l''état pour le document s''ouvre et vous permet d''indiquer les éléments à imprimer.';

                    trigger OnAction();
                    var
                        PurchaseHeader : Record "38";
                    begin
                        PurchaseHeader := Rec;
                        CurrPage.SETSELECTIONFILTER(PurchaseHeader);
                        PurchaseHeader.PrintRecords(TRUE);
                    end;
                }
                action(SendCustom)
                {
                    ApplicationArea = Basic,Suite;
                    CaptionML = ENU='Send',
                                FRA='Envoyer';
                    Ellipsis = true;
                    Image = SendToMultiple;
                    Promoted = true;
                    PromotedCategory = Category10;
                    PromotedIsBig = true;
                    ToolTipML = ENU='Prepare to send the document according to the vendor''s sending profile, such as attached to an email. The Send document to window opens first so you can confirm or select a sending profile.',
                                FRA='Préparez-vous à envoyer le document en fonction du profil d''envoi du fournisseur, par exemple en pièce jointe d''un e-mail. La fenêtre Envoyer le document à s''ouvre en premier pour que vous puissiez confirmer ou sélectionner un profil d''envoi.';

                    trigger OnAction();
                    var
                        PurchaseHeader : Record "38";
                    begin
                        PurchaseHeader := Rec;
                        CurrPage.SETSELECTIONFILTER(PurchaseHeader);
                        PurchaseHeader.SendRecords;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        SetControlAppearance;
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        CurrPage.ApprovalFactBox.PAGE.UpdateApprovalEntriesFromSourceRecord(RECORDID);
        ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);

        RecWarehouseReceiptLine.RESET;
        RecWarehouseReceiptLine.SETRANGE("Source No.","No.");
        IF RecWarehouseReceiptLine.FINDFIRST THEN
          BolReasonCode := FALSE;
    end;

    trigger OnAfterGetRecord();
    begin
        CalculateCurrentShippingAndPayToOption;

        RecWarehouseReceiptLine.RESET;
        RecWarehouseReceiptLine.SETRANGE("Source No.","No.");
        IF RecWarehouseReceiptLine.FINDFIRST THEN
          BolReasonCode := FALSE
    end;

    trigger OnDeleteRecord() : Boolean;
    begin
        RecUserSetup.GET(USERID);
        IF NOT RecUserSetup."Supprimer commande achat" THEN
          ERROR('Vous ne pouvez pas supprimer une commande achat! Merci de contacter votre administrateur');
        CurrPage.SAVERECORD;
        EXIT(ConfirmDeletion);
    end;

    trigger OnInit();
    var
        PurchasesPayablesSetup : Record "312";
        DummyApplicationAreaSetup : Record "9178";
    begin
        JobQueueUsed := PurchasesPayablesSetup.JobQueueActive;
        SetExtDocNoMandatoryCondition;
        ShowShippingOptionsWithLocation := DummyApplicationAreaSetup.IsLocationEnabled OR DummyApplicationAreaSetup.IsAllDisabled;
        BolReasonCode := TRUE;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Responsibility Center" := UserMgt.GetPurchasesFilter;

        IF (NOT DocNoVisible) AND ("No." = '') THEN
          SetBuyFromVendorFromFilter;

        CalculateCurrentShippingAndPayToOption;

        //<<CT16V001 ZM 15/05/2016 - Ajout filtre par activité utilisateur
        "Order Type" := UserMgt.GetUserActivity(USERID);
        //>>CT16V001 ZM 15/05/2016
        "Vendor Type" :="Vendor Type"::"Frs. Peinture";
    end;

    trigger OnOpenPage();
    var
        PermissionManager : Codeunit "9002";
    begin
        SetDocNoVisible;
        IsSaaS := PermissionManager.SoftwareAsAService;
        /*
        RecUserSetup.GET(USERID);
        IF NOT RecUserSetup."Agent comptable" THEN
        IF UserMgt.GetPurchasesFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetPurchasesFilter);
          FILTERGROUP(0);
        END;
        */
        IF ("No." <> '') AND ("Buy-from Vendor No." = '') THEN
          DocumentIsPosted := (NOT GET("Document Type","No."));
        
        //<<CT16V001 ZM 15/05/2016 - Ajout filtre par activité utilisateur
        /*
        IF NOT RecUserSetup."Agent comptable" THEN
        IF UserMgt.GetUserActivity(USERID) <> 0 THEN
          BEGIN
            FILTERGROUP(2);
            SETRANGE("Order Type",UserMgt.GetUserActivity(USERID));
            FILTERGROUP(0);
            //SM MAZDA213
            {
            IF UserMgt.GetUserActivity(USERID) = 1 THEN BEGIN
              FILTERGROUP(2);
              SETFILTER("Order Type",'1|3');
              FILTERGROUP(0);
            END;
            }
            //END SM
          END;
          */
        //>> END TRIUM RAD Addin
        
        //<< RAD 01
        BoolMarketing := FALSE ;
        //SM MAZDA307
        //OLD IF "Order Type" = "Order Type"::Marketing THEN
        IF ("Order Type" = "Order Type"::Marketing) OR ("Order Type" = "Order Type"::Projet) THEN
          BoolMarketing := TRUE ;
        //>>CT16V001 ZM 15/05/2016
        
        RecWarehouseReceiptLine.RESET;
        RecWarehouseReceiptLine.SETRANGE("Source No.","No.");
        IF RecWarehouseReceiptLine.FINDFIRST THEN
          BolReasonCode := FALSE;

    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        IF NOT DocumentIsPosted THEN
          EXIT(ConfirmCloseUnposted);
    end;

    var
        CopyPurchDoc : Report "492";
        MoveNegPurchLines : Report "6698";
        ReportPrint : Codeunit "228";
        UserMgt : Codeunit "5700";
        ArchiveManagement : Codeunit "5063";
        PurchCalcDiscByType : Codeunit "66";
        ChangeExchangeRate : Page "511";
        ShipToOptions : Option "Default (Company Address)",Location,"Customer Address","Custom Address";
        PayToOptions : Option "Default (Vendor)","Another Vendor";
        [InDataSet]
        JobQueueVisible : Boolean;
        [InDataSet]
        JobQueueUsed : Boolean;
        HasIncomingDocument : Boolean;
        DocNoVisible : Boolean;
        VendorInvoiceNoMandatory : Boolean;
        OpenApprovalEntriesExistForCurrUser : Boolean;
        OpenApprovalEntriesExist : Boolean;
        ShowWorkflowStatus : Boolean;
        export : XMLport "50004";
        RecGPagePropArticle : Page "60010";
        RecGTypeDoc : Integer;
        RecGPurchOrder : Record "38";
        BoolMarketing : Boolean;
        TXT50000 : Label 'Voulez-vous mettre à jour les lignes traçabilité ?';
        TXT50001 : Label 'Mise à jour s''est terminée avec succès';
        MgtFinAures : Codeunit "70006";
        RecUserSetup : Record "91";
        RecWarehouseReceiptLine : Record "7317";
        BolReasonCode : Boolean;
        InventorySetup : Record "313";
        SalesReceivablesSetup : Record "311";
        PurchasesPayablesSetup : Record "312";
        CanCancelApprovalForRecord : Boolean;
        DocumentIsPosted : Boolean;
        OpenPostedPurchaseOrderQst : TextConst ENU='The order has been posted and moved to the Posted Purchase Invoices window.\\Do you want to open the posted invoice?',FRA='La commande a été validée et déplacée dans la fenêtre Factures achat enregistrées.\\Souhaitez-vous ouvrir la facture enregistrée ?';
        CreateIncomingDocumentEnabled : Boolean;
        CanRequestApprovalForFlow : Boolean;
        CanCancelApprovalForFlow : Boolean;
        ShowShippingOptionsWithLocation : Boolean;
        IsSaaS : Boolean;
        PurchaseRequestHeader : Record "50005";
        PurchaseRequestLine : Record "50008";
        PurchaseLine : Record "39";

    local procedure Post(PostingCodeunitID : Integer);
    var
        PurchaseHeader : Record "38";
        ApplicationAreaSetup : Record "9178";
        InstructionMgt : Codeunit "1330";
        LinesInstructionMgt : Codeunit "1320";
        IsScheduledPosting : Boolean;
    begin
        IF ApplicationAreaSetup.IsFoundationEnabled THEN
          LinesInstructionMgt.PurchaseCheckAllLinesHaveQuantityAssigned(Rec);

        SendToPosting(PostingCodeunitID);

        IsScheduledPosting := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        DocumentIsPosted := (NOT PurchaseHeader.GET("Document Type","No.")) OR IsScheduledPosting;

        IF IsScheduledPosting THEN
          CurrPage.CLOSE;
        CurrPage.UPDATE(FALSE);

        IF PostingCodeunitID <> CODEUNIT::"Purch.-Post (Yes/No)" THEN
          EXIT;

        IF InstructionMgt.IsEnabled(InstructionMgt.ShowPostedConfirmationMessageCode) THEN
          ShowPostedConfirmationMessage;
    end;

    local procedure ApproveCalcInvDisc();
    begin
        CurrPage.PurchLines.PAGE.ApproveCalcInvDisc;
    end;

    local procedure PurchaserCodeOnAfterValidate();
    begin
        CurrPage.PurchLines.PAGE.UpdateForm(TRUE);
    end;

    local procedure ShortcutDimension1CodeOnAfterV();
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShortcutDimension2CodeOnAfterV();
    begin
        CurrPage.UPDATE;
    end;

    local procedure PricesIncludingVATOnAfterValid();
    begin
        CurrPage.UPDATE;
    end;

    local procedure Prepayment37OnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    local procedure SetDocNoVisible();
    var
        DocumentNoVisibility : Codeunit "1400";
        DocType : Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.PurchaseDocumentNoIsVisible(DocType::Order,"No.");
    end;

    local procedure SetExtDocNoMandatoryCondition();
    var
        PurchasesPayablesSetup : Record "312";
    begin
        PurchasesPayablesSetup.GET;
        VendorInvoiceNoMandatory := PurchasesPayablesSetup."Ext. Doc. No. Mandatory"
    end;

    local procedure SetControlAppearance();
    var
        ApprovalsMgmt : Codeunit "1535";
        WorkflowWebhookMgt : Codeunit "1543";
    begin
        JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
        HasIncomingDocument := "Incoming Document Entry No." <> 0;
        CreateIncomingDocumentEnabled := (NOT HasIncomingDocument) AND ("No." <> '');
        SetExtDocNoMandatoryCondition;

        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);

        WorkflowWebhookMgt.GetCanRequestAndCanCancel(RECORDID,CanRequestApprovalForFlow,CanCancelApprovalForFlow);
    end;

    local procedure ShowPostedConfirmationMessage();
    var
        OrderPurchaseHeader : Record "38";
        PurchInvHeader : Record "122";
        InstructionMgt : Codeunit "1330";
    begin
        IF NOT OrderPurchaseHeader.GET("Document Type","No.") THEN BEGIN
          PurchInvHeader.SETRANGE("No.","Last Posting No.");
          IF PurchInvHeader.FINDFIRST THEN
            IF InstructionMgt.ShowConfirm(OpenPostedPurchaseOrderQst,InstructionMgt.ShowPostedConfirmationMessageCode) THEN
              PAGE.RUN(PAGE::"Posted Purchase Invoice",PurchInvHeader);
        END;
    end;

    local procedure ValidateShippingOption();
    begin
        CASE ShipToOptions OF
          ShipToOptions::"Default (Company Address)",
          ShipToOptions::"Custom Address":
            BEGIN
              VALIDATE("Location Code",'');
              VALIDATE("Sell-to Customer No.",'');
            END;
          ShipToOptions::Location:
            BEGIN
              VALIDATE("Location Code");
              VALIDATE("Sell-to Customer No.",'');
            END;
          ShipToOptions::"Customer Address":
            BEGIN
              VALIDATE("Sell-to Customer No.");
              VALIDATE("Location Code",'');
            END;
        END;
    end;

    local procedure CalculateCurrentShippingAndPayToOption();
    begin
        CASE TRUE OF
          "Sell-to Customer No." <> '':
            ShipToOptions := ShipToOptions::"Customer Address";
          "Location Code" <> '':
            ShipToOptions := ShipToOptions::Location;
          ELSE
            IF ShipToAddressEqualsCompanyShipToAddress THEN
              ShipToOptions := ShipToOptions::"Default (Company Address)"
            ELSE
              ShipToOptions := ShipToOptions::"Custom Address";
        END;

        IF "Pay-to Vendor No." = "Buy-from Vendor No." THEN
          PayToOptions := PayToOptions::"Default (Vendor)"
        ELSE
          PayToOptions := PayToOptions::"Another Vendor";
    end;
}

