page 50157 "Service Quotes Archive"
{
    // version NAVW111.00.00.19846

    // T180001 KT 19/10/2018 : upgrade

    CaptionML = ENU='Service Quotes',
                FRA='Devis service';
    CardPageID = "Service Quote Archive";
    DataCaptionFields = "Customer No.";
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60076;
    SourceTableView = WHERE(Document Type=CONST(Quote));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No. Version";"No. Version")
                {
                }
                field("Archiver par";"Archiver par")
                {
                }
                field("Date archive";"Date archive")
                {
                }
                field("No.";"No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the involved entry or record, according to the specified number series.',
                                FRA='Spécifie le numéro de l''écriture ou de l''enregistrement concerné, en fonction de la souche de numéros spécifiée.';
                }
                field("Reception No";"Reception No")
                {
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field(Matricule;Matricule)
                {
                }
                field(Kilométrage;Kilométrage)
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(Priority;Priority)
                {
                }
                field("Status SR";"Status SR")
                {
                    Caption = 'Status OR';
                    Style = AttentionAccent;
                    StyleExpr = TRUE;
                }
                field(Status;Status)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the service order status, which reflects the repair or maintenance status of all service items on the service order.',
                                FRA='Spécifie le statut de la commande service qui reflète l''état de réparation ou de maintenance de tous les articles service de la commande service.';
                }
                field("Posting Date";"Posting Date")
                {
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
                field("Document Date";"Document Date")
                {
                    Visible = false;
                }
                field("Customer No.";"Customer No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the customer who owns the items in the service document.',
                                FRA='Indique le numéro du client auquel appartiennent les articles du document service.';
                }
                field("Ship-to Code";"Ship-to Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.',
                                FRA='Spécifie un code pour une adresse secondaire de livraison si vous souhaitez expédier vers une autre adresse que celle qui a été saisie automatiquement. Ce champ est également utilisé en cas de livraison directe.';
                }
                field(Name;Name)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the name of the customer to whom the items on the document will be shipped.',
                                FRA='Spécifie le nom du client auquel les articles du document vont être expédiés.';
                }
                field("VAT Registration No.";"VAT Registration No.")
                {
                    CaptionML = ENU='VAT Registration No.',
                                FRA='Num Registre';
                }
                field("Notify Customer";"Notify Customer")
                {
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the code of the location (for example, warehouse or distribution center) of the items specified on the service item lines.',
                                FRA='Spécifie le code du lieu (par exemple, l''entrepôt ou le centre de distribution) où se situent les articles spécifiés sur les lignes article de service.';
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 1 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTipML = ENU='Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.',
                                FRA='Spécifie le code du raccourci Axe 2 qui est l''un des codes d''axe principal que vous configurez dans la fenêtre Paramètres comptabilité.';
                    Visible = false;
                }
                field("Assigned User ID";"Assigned User ID")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the ID of the user who is responsible for the document.',
                                FRA='Spécifie le code de l''utilisateur qui est responsable du document.';
                }
                field("Service Order Type";"Service Order Type")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the type of this service order.',
                                FRA='Spécifie le type de la commande service.';
                    Visible = false;
                }
                field("Contract No.";"Contract No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the contract associated with the order.',
                                FRA='Spécifie le numéro du contrat associé à la commande.';
                    Visible = false;
                }
                field("Response Date";"Response Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the estimated date when work on the order should start, that is, when the service order status changes from Pending, to In Process.',
                                FRA='Spécifie la date estimée de début de travail sur la commande, c''est-à-dire l''instant où le statut commande service passe de Suspendu à En cours.';
                    Visible = false;
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.',
                                FRA='Spécifie une formule qui calcule la date d''échéance du paiement, la date d''escompte et le montant de l''escompte.';
                    Visible = false;
                }
                field("Due Date";"Due Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies when the invoice is due.',
                                FRA='Spécifie la date d''échéance de la facture.';
                    Visible = false;
                }
                field("Payment Discount %";"Payment Discount %")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the percentage of payment discount given, if the customer pays by the date entered in the Pmt. Discount Date field.',
                                FRA='Spécifie le pourcentage d''escompte accordé si le client paie au plus tard à la date saisie dans le champ Date d''escompte.';
                    Visible = false;
                }
                field("Payment Method Code";"Payment Method Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies how to make payment, such as with bank transfer, cash,  or check.',
                                FRA='Spécifie le mode de paiement, par exemple, par virement bancaire, en espèces ou par chèque.';
                    Visible = false;
                }
                field("Warning Status";"Warning Status")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the response time warning status for the order.',
                                FRA='Spécifie le statut de l''avertissement du délai de réponse pour la commande.';
                    Visible = false;
                }
                field("Allocated Hours";"Allocated Hours")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of hours allocated to the items in this service order.',
                                FRA='Spécifie le nombre d''heures affectées aux articles de cette commande service.';
                    Visible = false;
                }
                field("Starting Date";"Starting Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the starting date of the service, that is, the date when the order status changes from Pending, to In Process for the first time.',
                                FRA='Spécifie la date de début du service, c''est-à-dire la date à laquelle le statut de la commande service passe pour la première fois de Suspendu à En cours.';
                    Visible = false;
                }
                field("Type Reception";"Type Reception")
                {
                    Editable = false;
                }
                field("Finishing Date";"Finishing Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the finishing date of the service, that is, the date when the Status field changes to Finished.',
                                FRA='Spécifie la date de fin du service, c''est-à-dire la date à laquelle le champ Statut passe sur Terminé.';
                    Visible = false;
                }
                field("Created By";"Created By")
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
            }
        }
        area(factboxes)
        {
            part(;9082)
            {
                ApplicationArea = Service;
                SubPageLink = No.=FIELD(Bill-to Customer No.),
                              Date Filter=FIELD(Date Filter);
                Visible = true;
            }
            part(;9084)
            {
                ApplicationArea = Service;
                SubPageLink = No.=FIELD(Customer No.),
                              Date Filter=FIELD(Date Filter);
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
    }

    trigger OnOpenPage();
    begin
        //SetSecurityFilterOnRespCenter;

        //CopyCustomerFilter;
    end;
}

