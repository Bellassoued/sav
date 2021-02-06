page 50159 "Service List Archive"
{
    // version NAVW111.00.00.19846

    CaptionML = ENU='Service List',
                FRA='Liste service Archive';
    CardPageID = "Service Order Archive";
    DataCaptionFields = "Document Type","No.";
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60076;
    SourceTableView = WHERE(Document Type=FILTER(Order));

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
                field(Status;Status)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the service order status, which reflects the repair or maintenance status of all service items on the service order.',
                                FRA='Spécifie le statut de la commande service qui reflète l''état de réparation ou de maintenance de tous les articles service de la commande service.';
                }
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the type of the service document on the line.',
                                FRA='Spécifie le type de document service sur la ligne.';
                }
                field("No.";"No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the involved entry or record, according to the specified number series.',
                                FRA='Spécifie le numéro de l''écriture ou de l''enregistrement concerné, en fonction de la souche de numéros spécifiée.';
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
                field("Quote No.";"Quote No.")
                {
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
                field("Location Code";"Location Code")
                {
                    ApplicationArea = Location;
                    ToolTipML = ENU='Specifies the code of the location (for example, warehouse or distribution center) of the items specified on the service item lines.',
                                FRA='Spécifie le code du lieu (par exemple, l''entrepôt ou le centre de distribution) où se situent les articles spécifiés sur les lignes article de service.';
                }
                field("Response Date";"Response Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the estimated date when work on the order should start, that is, when the service order status changes from Pending, to In Process.',
                                FRA='Spécifie la date estimée de début de travail sur la commande, c''est-à-dire l''instant où le statut commande service passe de Suspendu à En cours.';
                    Visible = ResponseDateVisible;
                }
                field("Response Time";"Response Time")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the estimated time when work on the order starts, that is, when the service order status changes from Pending, to In Process.',
                                FRA='Spécifie l''heure estimée de début de travail sur la commande, c''est-à-dire l''instant où le statut de la commande service passe de Suspendu à En cours.';
                    Visible = ResponseTimeVisible;
                }
                field(Priority;Priority)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the priority of the service order.',
                                FRA='Spécifie la priorité de la commande service.';
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
                field("Avance sur commande";"Avance sur commande")
                {
                }
                field("Type avance";"Type avance")
                {
                }
                field(Matricule;Matricule)
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
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                Image = Line;
            }
        }
    }

    trigger OnOpenPage();
    begin
        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
         // SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;
    end;

    var
        [InDataSet]
        ResponseDateVisible : Boolean;
        [InDataSet]
        ResponseTimeVisible : Boolean;
        UserMgt : Codeunit "5700";
}

