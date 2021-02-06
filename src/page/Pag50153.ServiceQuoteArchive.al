page 50153 "Service Quote Archive"
{
    // version NAVW111.00.00.19846,T180001

    //  T180001 ZM 05/10/2018 : upgrade

    CaptionML = ENU='Service Quote',
                FRA='Devis service archive';
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = Table60076;
    SourceTableView = WHERE(Document Type=FILTER(Quote));

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
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the number of the involved entry or record, according to the specified number series.',
                                FRA='Spécifie le numéro de l''écriture ou de l''enregistrement concerné, en fonction de la souche de numéros spécifiée.';
                }
                field(Description;Description)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies a short description of the service document, such as Order 2001.',
                                FRA='Indique une brève description du document service, par exemple Commande 2001.';
                }
                field("Customer No.";"Customer No.")
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the number of the customer who owns the items in the service document.',
                                FRA='Indique le numéro du client auquel appartiennent les articles du document service.';
                }
                field("Contact No.";"Contact No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the contact to whom you will deliver the service.',
                                FRA='Spécifie le numéro du contact auquel vous allez fournir le service.';
                }
                field(Name;Name)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the name of the customer to whom the items on the document will be shipped.',
                                FRA='Spécifie le nom du client auquel les articles du document vont être expédiés.';
                }
                field(Address;Address)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the address of the customer to whom the service will be shipped.',
                                FRA='Spécifie l''adresse du client auquel le service va être livré.';
                }
                field("Address 2";"Address 2")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies additional address information.',
                                FRA='Spécifie des informations d''adresse supplémentaires.';
                }
                field("Post Code";"Post Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the postal code.',
                                FRA='Spécifie le code postal.';
                }
                field("Contact Name";"Contact Name")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the name of the contact who will receive the service.',
                                FRA='Spécifie le nom du contact qui va bénéficier du service.';
                }
                field("Phone No.";"Phone No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the phone number of the customer in this service order.',
                                FRA='Spécifie le numéro de téléphone du client de cette commande service.';
                }
                field("E-Mail";"E-Mail")
                {
                    ApplicationArea = Service;
                    ExtendedDatatype = EMail;
                    ToolTipML = ENU='Specifies the email address of the customer in this service order.',
                                FRA='Spécifie l''adresse électronique du client de cette commande service.';
                }
                field(City;City)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the city of the address.',
                                FRA='Spécifie la ville de l''adresse.';
                }
                field("Phone No. 2";"Phone No. 2")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies your customer''s alternate phone number.',
                                FRA='Spécifie l''autre numéro de téléphone de votre client.';
                }
                field("Notify Customer";"Notify Customer")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies how the customer wants to receive notifications about service completion.',
                                FRA='Spécifie la manière dont le client souhaite être informé de la fin du service.';
                }
                field("Service Order Type";"Service Order Type")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the type of this service order.',
                                FRA='Spécifie le type de la commande service.';
                }
                field("Contract No.";"Contract No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the contract associated with the order.',
                                FRA='Spécifie le numéro du contrat associé à la commande.';
                }
                field("Response Date";"Response Date")
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the estimated date when work on the order should start, that is, when the service order status changes from Pending, to In Process.',
                                FRA='Spécifie la date estimée de début de travail sur la commande, c''est-à-dire l''instant où le statut commande service passe de Suspendu à En cours.';
                }
                field("Response Time";"Response Time")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the estimated time when work on the order starts, that is, when the service order status changes from Pending, to In Process.',
                                FRA='Spécifie l''heure estimée de début de travail sur la commande, c''est-à-dire l''instant où le statut de la commande service passe de Suspendu à En cours.';
                }
                field(Priority;Priority)
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the priority of the service order.',
                                FRA='Spécifie la priorité de la commande service.';
                }
                field(Status;Status)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the service order status, which reflects the repair or maintenance status of all service items on the service order.',
                                FRA='Spécifie le statut de la commande service qui reflète l''état de réparation ou de maintenance de tous les articles service de la commande service.';
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the code of the responsibility center, such as a distribution hub, that is associated with the involved user, company, customer, or vendor.',
                                FRA='Spécifie le code du centre de gestion, tel qu''un centre de distribution, associé à l''utilisateur, la société, le client ou le fournisseur concerné.';
                }
                field("Location Code";"Location Code")
                {
                }
                field("Created By";"Created By")
                {
                    CaptionML = ENU='Créer Par',
                                FRA='Crée par';
                    Editable = false;
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("Assigned User ID";"Assigned User ID")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the ID of the user who is responsible for the document.',
                                FRA='Spécifie le code de l''utilisateur qui est responsable du document.';
                }
                field(Timbre;Timbre)
                {
                    Caption = 'Appliquer Timbre';
                }
                field(Matricule;Matricule)
                {
                }
                field("Appliquer Frais Dossier";"Appliquer Frais Dossier")
                {
                    Editable = false;
                }
                field("Montant Frais Dossier";"Montant Frais Dossier")
                {
                    Editable = false;
                }
                field("Type de garantie";"Type de garantie")
                {
                    Editable = false;
                }
                field("No. Bon de commande V. susp";"No. Bon de commande V. susp")
                {
                }
                field("Date Bon Commande V. susp";"Date Bon Commande V. susp")
                {
                }
                field("Type avance";"Type avance")
                {
                }
                field("Avance sur commande";"Avance sur commande")
                {
                }
                field("Estimated Time For Delivery";"Estimated Time For Delivery")
                {
                }
            }
            part(ServItemLine;50156)
            {
                ApplicationArea = Advanced;
                SubPageLink = Document No.=FIELD(No.),
                              No. Version=FIELD(No. Version);
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                    ApplicationArea = Service;
                    Editable = false;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the number of the customer that you send or sent the invoice or credit memo to.',
                                FRA='Spécifie le numéro du client à qui vous envoyez ou avez envoyé la facture ou l''avoir.';
                }
                field("Bill-to Contact No.";"Bill-to Contact No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the contact person at the customer''s billing address.',
                                FRA='Spécifie le numéro du contact à l''adresse de facturation du client.';
                }
                field("Bill-to Name";"Bill-to Name")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the name of the customer that you send or sent the invoice or credit memo to.',
                                FRA='Spécifie le nom du client à qui vous envoyez ou avez envoyé la facture ou l''avoir.';
                }
                field("Bill-to Address";"Bill-to Address")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the address of the customer to whom you will send the invoice.',
                                FRA='Spécifie l''adresse du client à qui vous allez envoyer la facture.';
                }
                field("Bill-to Address 2";"Bill-to Address 2")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies an additional line of the address.',
                                FRA='Spécifie une ligne supplémentaire pour l''adresse.';
                }
                field("Bill-to Post Code";"Bill-to Post Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the postal code of the customer''s billing address.',
                                FRA='Spécifie le code postal de l''adresse de facturation du client.';
                }
                field("Bill-to City";"Bill-to City")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the city of the address.',
                                FRA='Spécifie la ville de l''adresse.';
                }
                field("Bill-to Contact";"Bill-to Contact")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the name of the contact person at the customer''s billing address.',
                                FRA='Spécifie le nom de la personne à l''adresse de facturation du client.';
                }
                field("Your Reference";"Your Reference")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies a customer reference, which will be used when printing service documents.',
                                FRA='Spécifie une référence client utilisée lors de l''impression des documents service.';
                }
                field("Max. Labor Unit Price";"Max. Labor Unit Price")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the maximum unit price that can be set for a resource (for example, a technician) on all service lines linked to this order.',
                                FRA='Spécifie le prix unitaire maximal pouvant être paramétré pour une ressource (par exemple, un technicien) sur toutes les lignes service liées à cette commande.';
                }
                field("Document Date";"Document Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the date when the related document was created.',
                                FRA='Spécifie la date de création du document associé.';
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 1 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 2 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.',
                                FRA='Spécifie une formule qui calcule la date d''échéance du paiement, la date d''escompte et le montant de l''escompte.';
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies when the related invoice must be paid.',
                                FRA='Spécifie la date à laquelle la facture associée doit être payée.';
                }
                field("Payment Discount %";"Payment Discount %")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the percentage of payment discount given, if the customer pays by the date entered in the Pmt. Discount Date field.',
                                FRA='Spécifie le pourcentage d''escompte accordé si le client paie au plus tard à la date saisie dans le champ Date d''escompte.';
                }
                field("Pmt. Discount Date";"Pmt. Discount Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the date on which the amount in the entry must be paid for a payment discount to be granted.',
                                FRA='Spécifie la date à laquelle le montant de l''écriture doit être payé pour obtenir un escompte sur la commande.';
                }
                field("Payment Method Code";"Payment Method Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies how to make payment, such as with bank transfer, cash,  or check.',
                                FRA='Spécifie le mode de paiement, par exemple, par virement bancaire, en espèces ou par chèque.';
                }
                field("Prices Including VAT";"Prices Including VAT")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.',
                                FRA='Spécifie si les champs Prix unitaire et Montant ligne sur les lignes document vente doivent être affichés avec ou sans la TVA.';
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.',
                                FRA='Spécifie le détail TVA du client ou du fournisseur concerné pour lier les transactions effectuées pour cet enregistrement au compte général approprié en fonction des paramètres de comptabilisation TVA.';
                }
            }
            group(Shipping)
            {
                CaptionML = ENU='Shipping',
                            FRA='Livraison';
                field("Ship-to Code";"Ship-to Code")
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.',
                                FRA='Spécifie un code pour une adresse secondaire de livraison si vous souhaitez expédier vers une autre adresse que celle qui a été saisie automatiquement. Ce champ est également utilisé en cas de livraison directe.';
                }
                field("Ship-to Name";"Ship-to Name")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the name of the customer at the address that the items are shipped to.',
                                FRA='Spécifie le nom du client à l''adresse à laquelle les articles sont expédiés.';
                }
                field("Ship-to Address";"Ship-to Address")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the address that the items are shipped to.',
                                FRA='Spécifie l''adresse à laquelle les articles sont expédiés.';
                }
                field("Ship-to Address 2";"Ship-to Address 2")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies an additional part of the ship-to address, in case it is a long address.',
                                FRA='Spécifie une partie supplémentaire de l''adresse destinataire, s''il s''agit d''une adresse longue.';
                }
                field("Ship-to Post Code";"Ship-to Post Code")
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the postal code of the address that the items are shipped to.',
                                FRA='Spécifie le code postal de l''adresse à laquelle les articles sont expédiés.';
                }
                field("Ship-to City";"Ship-to City")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the city of the address that the items are shipped to.',
                                FRA='Spécifie la ville de l''adresse à laquelle les articles sont expédiés.';
                }
                field("Ship-to Contact";"Ship-to Contact")
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the name of the contact person at the address that the items are shipped to.',
                                FRA='Spécifie le nom du contact à l''adresse à laquelle les articles sont expédiés.';
                }
                field("Ship-to Phone";"Ship-to Phone")
                {
                    ApplicationArea = Service;
                    CaptionML = ENU='Ship-to Phone/Phone 2',
                                FRA='Tél./Tél. 2 destinataire';
                    ToolTipML = ENU='Specifies the phone number of the address where the service items in the order are located.',
                                FRA='Spécifie le numéro de téléphone de l''adresse où se trouvent les articles de service de la commande.';
                }
                field("Ship-to Phone 2";"Ship-to Phone 2")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies an additional phone number at address that the items are shipped to.',
                                FRA='Spécifie un numéro de téléphone supplémentaire à l''adresse à laquelle les articles sont expédiés.';
                }
                field("Ship-to E-Mail";"Ship-to E-Mail")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the email address at the address that the items are shipped to.',
                                FRA='Spécifie l''adresse e-mail à l''adresse à laquelle les articles sont expédiés.';
                }
            }
            group(Details)
            {
                CaptionML = ENU='Details',
                            FRA='Détails';
                field("Warning Status";"Warning Status")
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the response time warning status for the order.',
                                FRA='Spécifie le statut de l''avertissement du délai de réponse pour la commande.';
                }
                field("Link Service to Service Item";"Link Service to Service Item")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies that service lines for items and resources must be linked to a service item line.',
                                FRA='Indique que les lignes service des ressources et des articles doivent être liées à une ligne article de service.';
                }
                field("Allocated Hours";"Allocated Hours")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of hours allocated to the items in this service order.',
                                FRA='Spécifie le nombre d''heures affectées aux articles de cette commande service.';
                }
                field("No. of Allocations";"No. of Allocations")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of resource allocations to service items in this order.',
                                FRA='Spécifie le nombre d''affectations ressources aux articles service de cette commande.';
                }
                field("No. of Unallocated Items";"No. of Unallocated Items")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of service items in this order that are not allocated to resources.',
                                FRA='Spécifie le nombre d''affectations ressources aux articles de cette commande qui ne sont pas affectés aux ressources.';
                }
                field("Service Zone Code";"Service Zone Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the service zone code of the customer''s ship-to address in the service order.',
                                FRA='Spécifie le code service zone de l''adresse destinataire du client dans la commande service.';
                }
                field("Order Date";"Order Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the date when the order was created.',
                                FRA='Spécifie la date à laquelle la commande a été créée.';
                }
                field("Order Time";"Order Time")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the time when the service order was created.',
                                FRA='Spécifie l''heure à laquelle vous avez créé la commande service.';
                }
                field("Starting Date";"Starting Date")
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the starting date of the service, that is, the date when the order status changes from Pending, to In Process for the first time.',
                                FRA='Spécifie la date de début du service, c''est-à-dire la date à laquelle le statut de la commande service passe pour la première fois de Suspendu à En cours.';
                }
                field("Starting Time";"Starting Time")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the starting time of the service, that is, the time when the order status changes from Pending, to In Process for the first time.',
                                FRA='Spécifie l''heure de début du service, c''est-à-dire l''heure à laquelle le statut de la commande service passe pour la première fois de Suspendu à En cours.';
                }
                field("Actual Response Time (Hours)";"Actual Response Time (Hours)")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of hours from order creation, to when the service order status changes from Pending, to In Process.',
                                FRA='Spécifie le nombre d''heures depuis la création de la commande au moment où le statut de la commande service passe de Suspendu à En cours.';
                }
                field("Finishing Date";"Finishing Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the finishing date of the service, that is, the date when the Status field changes to Finished.',
                                FRA='Spécifie la date de fin du service, c''est-à-dire la date à laquelle le champ Statut passe sur Terminé.';
                }
                field("Finishing Time";"Finishing Time")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the finishing time of the service, that is, the time when the Status field changes to Finished.',
                                FRA='Spécifie l''heure de fin du service, c''est-à-dire l''heure à laquelle le champ Statut passe sur Terminé.';
                }
            }
            group(" Foreign Trade")
            {
                CaptionML = ENU=' Foreign Trade',
                            FRA=' International';
                field("Currency Code";"Currency Code")
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTipML = ENU='Specifies the currency code for various amounts on the service lines.',
                                FRA='Spécifie le code devise des différents montants des lignes service.';
                }
                field("EU 3-Party Trade";"EU 3-Party Trade")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies if the transaction is related to trade with a third party within the EU.',
                                FRA='Spécifie si la transaction est associée à des échanges avec un tiers dans l''Union européenne.';
                }
                field("Transaction Type";"Transaction Type")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the type of transaction that the document represents, for the purpose of reporting to INTRASTAT.',
                                FRA='Spécifie le type de transaction que représente le document, à des fins de compte-rendu intracommunautaire.';
                }
                field("Transaction Specification";"Transaction Specification")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies a specification of the document''s transaction, for the purpose of reporting to INTRASTAT.',
                                FRA='Spécifie une spécification de la transaction du document, à des fins de compte-rendu intracommunautaire.';
                }
                field("Transport Method";"Transport Method")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the transport method, for the purpose of reporting to INTRASTAT.',
                                FRA='Spécifie le mode de transport, à des fins de compte-rendu intracommunautaire.';
                }
                field("Exit Point";"Exit Point")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the point of exit through which you ship the items out of your country/region, for reporting to Intrastat.',
                                FRA='Spécifie le point de sortie par lequel les articles sortent de votre pays/région, à des fins de compte-rendu à Intrastat.';
                }
                field(Area;Area)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the area of the customer or vendor, for the purpose of reporting to INTRASTAT.',
                                FRA='Spécifie la zone du client ou du fournisseur, à des fins de compte-rendu intracommunautaire.';
                }
            }
        }
        area(factboxes)
        {
            part(;9082)
            {
                ApplicationArea = Service;
                SubPageLink = No.=FIELD(Bill-to Customer No.);
                Visible = false;
            }
            part(;9084)
            {
                ApplicationArea = Service;
                SubPageLink = No.=FIELD(Customer No.);
                Visible = false;
            }
            part(;9085)
            {
                ApplicationArea = Advanced;
                SubPageLink = No.=FIELD(Customer No.);
                Visible = true;
            }
            part(;9086)
            {
                ApplicationArea = Advanced;
                SubPageLink = No.=FIELD(Bill-to Customer No.);
                Visible = false;
            }
            part(;9088)
            {
                ApplicationArea = Advanced;
                Provider = ServItemLine;
                SubPageLink = Document Type=FIELD(Document Type),
                              Document No.=FIELD(Document No.),
                              Line No.=FIELD(Line No.);
                Visible = true;
            }
            systempart(;Links)
            {
                Visible = false;
            }
            systempart(;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action(Imprimer)
            {
                Image = Print;

                trigger OnAction();
                var
                    ServiceHeaderArchive : Record "60076";
                begin
                    ServiceHeaderArchive.GET("Document Type","No.","No. Version");
                    ServiceHeaderArchive.SETRECFILTER;
                    REPORT.RUN(60264,TRUE,FALSE,ServiceHeaderArchive);
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          //dSETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;
    end;

    var
        ServOrderMgt : Codeunit "5900";
        UserMgt : Codeunit "5700";
        ChangeExchangeRate : Page "511";
        UserSetup1 : Record "91";
        RecPriceServiceLine : Record "5902";
        RecItem : Record "27";
        RecPaymentHeader : Record "10865";
        DecMontantavance : Decimal;
        RecCustLedgerEntry : Record "21";
}

