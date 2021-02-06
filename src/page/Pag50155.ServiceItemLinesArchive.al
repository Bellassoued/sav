page 50155 "Service Item Lines Archive"
{
    // version NAVW111.00

    CaptionML = ENU='Service Item Lines',
                FRA='Lignes article de service Archive';
    DataCaptionFields = "Document Type","Document No.","Fault Reason Code";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60077;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Document Type";"Document Type")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies whether the service document is a service order or service quote.',
                                FRA='Indique si le document service est une commande service ou un devis service.';
                }
                field("Document No.";"Document No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the service order linked to this service item line.',
                                FRA='Spécifie le numéro de la commande service liée à cette ligne article service.';
                }
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the line.',
                                FRA='Spécifie le numéro de la ligne.';
                }
                field("Service Item Group Code";"Service Item Group Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the code of the service item group for this item.',
                                FRA='Spécifie le code du groupe d''articles service pour cet article.';
                }
                field("Service Item No.";"Service Item No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the service item number registered in the Service Item table.',
                                FRA='Spécifie le numéro article de service enregistré dans la table Article de service.';
                }
                field(Description;Description)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies a description of this service item.',
                                FRA='Spécifie une description de cet article service.';
                }
                field("Item No.";"Item No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the item number linked to this service item.',
                                FRA='Spécifie le numéro article associé à cet article service.';
                }
                field("Serial No.";"Serial No.")
                {
                    ApplicationArea = ItemTracking;
                    ToolTipML = ENU='Specifies the serial number of this item.',
                                FRA='Spécifie le numéro de série de cet article.';
                }
                field(Warranty;Warranty)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies that warranty on either parts or labor exists for this item.',
                                FRA='Indique qu''il existe une garantie sur les pièces ou la main-d''ouvre pour cet article.';
                }
                field("Contract No.";"Contract No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the service contract associated with the item or service on the line.',
                                FRA='Spécifie le numéro du contrat de service associé à l''article ou au service sur la ligne.';
                }
                field("Fault Reason Code";"Fault Reason Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the fault reason code for the item.',
                                FRA='Indique le code motif panne de cet article.';
                }
                field("Fault Area Code";"Fault Area Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the fault area code for this item.',
                                FRA='Spécifie le code zone panne de cet article.';
                }
                field("Symptom Code";"Symptom Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the symptom code for this item.',
                                FRA='Spécifie le code symptôme pour cet article.';
                }
                field("Resolution Code";"Resolution Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the resolution code for this item.',
                                FRA='Spécifie le code résolution pour cet article.';
                }
                field("Fault Code";"Fault Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the fault code for this item.',
                                FRA='Spécifie le code panne pour cet article.';
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
            group("&Worksheet")
            {
                CaptionML = ENU='&Worksheet',
                            FRA='Feuille &activité';
                Image = Worksheet;
                group("Com&ments")
                {
                    CaptionML = ENU='Com&ments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;
                    action(Faults)
                    {
                        ApplicationArea = Service;
                        CaptionML = ENU='Faults',
                                    FRA='Pannes';
                        Image = Error;
                        RunObject = Page 5911;
                        RunPageLink = Table Name=CONST(Service Header),
                                      Table Subtype=FIELD(Document Type),
                                      No.=FIELD(Document No.),
                                      Table Line No.=FIELD(Line No.),
                                      Type=CONST(Fault);
                        ToolTipML = ENU='View or edit the different fault codes that you can assign to service items. You can use fault codes to identify the different service item faults or the actions taken on service items for each combination of fault area and symptom codes.',
                                    FRA='Afficher ou modifier les différents codes panne que vous pouvez affecter aux articles de service. Vous pouvez utiliser les codes panne pour identifier les différentes pannes d''article de service ou les actions à entreprendre sur les articles de service pour chaque croisement de zone panne et de codes symptôme.';
                    }
                    action(Resolutions)
                    {
                        ApplicationArea = Service;
                        CaptionML = ENU='Resolutions',
                                    FRA='Solutions';
                        Image = Completed;
                        RunObject = Page 5911;
                        RunPageLink = Table Name=CONST(Service Header),
                                      Table Subtype=FIELD(Document Type),
                                      No.=FIELD(Document No.),
                                      Table Line No.=FIELD(Line No.),
                                      Type=CONST(Resolution);
                        ToolTipML = ENU='View or edit the different resolution codes that you can assign to service items. You can use resolution codes to identify methods used to solve typical service problems.',
                                    FRA='Afficher ou modifier les différents codes solution que vous pouvez affecter aux articles de service. Vous pouvez utiliser les codes solution pour identifier les modes utilisés pour résoudre des problèmes de service habituels.';
                    }
                    action(Internal)
                    {
                        ApplicationArea = Service;
                        CaptionML = ENU='Internal',
                                    FRA='Interne';
                        Image = Comment;
                        RunObject = Page 5911;
                        RunPageLink = Table Name=CONST(Service Header),
                                      Table Subtype=FIELD(Document Type),
                                      No.=FIELD(Document No.),
                                      Table Line No.=FIELD(Line No.),
                                      Type=CONST(Internal);
                        ToolTipML = ENU='View or reregister internal comments for the service item. Internal comments are for internal use only and are not printed on reports.',
                                    FRA='Afficher ou enregistrer les commentaires internes pour l''article de service. Les commentaires internes sont à usage interne uniquement et ne sont pas imprimés sur les états.';
                    }
                    action(Accessories)
                    {
                        ApplicationArea = Service;
                        CaptionML = ENU='Accessories',
                                    FRA='Accessoires';
                        Image = ServiceAccessories;
                        RunObject = Page 5911;
                        RunPageLink = Table Name=CONST(Service Header),
                                      Table Subtype=FIELD(Document Type),
                                      No.=FIELD(Document No.),
                                      Table Line No.=FIELD(Line No.),
                                      Type=CONST(Accessory);
                        ToolTipML = ENU='View or register comments for the accessories to the service item.',
                                    FRA='Afficher ou enregistrer des commentaires sur les accessoires pour l''article de service.';
                    }
                    action(Loaners)
                    {
                        ApplicationArea = Service;
                        CaptionML = ENU='Loaners',
                                    FRA='Articles de prêt';
                        Image = Loaners;
                        RunObject = Page 5911;
                        RunPageLink = Table Name=CONST(Service Header),
                                      Table Subtype=FIELD(Document Type),
                                      No.=FIELD(Document No.),
                                      Table Line No.=FIELD(Line No.),
                                      Type=CONST(Service Item Loaner);
                        ToolTipML = ENU='View or select from items that you lend out temporarily to customers to replace items that they have in service.',
                                    FRA='Afficher ou sélectionner les articles que vous prêtez temporairement aux clients pour remplacer ceux qui sont en service.';
                    }
                }
                group("Service &Item")
                {
                    CaptionML = ENU='Service &Item',
                                FRA='&Article de service';
                    Image = ServiceItem;
                    action(Card)
                    {
                        ApplicationArea = Service;
                        CaptionML = ENU='Card',
                                    FRA='Fiche';
                        Image = EditLines;
                        RunObject = Page 5980;
                        RunPageLink = No.=FIELD(Service Item No.);
                        ShortCutKey = 'Shift+F5';
                        ToolTipML = ENU='View or change detailed information about the record on the document or journal line.',
                                    FRA='Afficher ou modifier les informations détaillées sur l''enregistrement sur le document ou la ligne feuille.';
                    }
                    action("&Log")
                    {
                        ApplicationArea = Service;
                        CaptionML = ENU='&Log',
                                    FRA='&Journal';
                        Image = Approve;
                        RunObject = Page 5989;
                        RunPageLink = Service Item No.=FIELD(Service Item No.);
                        ToolTipML = ENU='View a list of the service item changes that have been logged, for example, when the warranty has changed or a component has been added. This window displays the field that was changed, the old value and the new value, and the date and time that the field was changed.',
                                    FRA='Afficher la liste des modifications des articles de service qui ont été journalisées, par exemple, lorsque la garantie a été modifiée ou lorsqu''un composant a été ajouté. Cette fenêtre affiche le champ modifié, l''ancienne valeur et la nouvelle valeur, ainsi que la date et l''heure des modifications apportées au champ.';
                    }
                }
            }
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                Image = Line;
                action("Service Item Worksheet")
                {
                    ApplicationArea = Service;
                    CaptionML = ENU='Service Item Worksheet',
                                FRA='Feuille activité article serv.';
                    Image = ServiceItemWorksheet;
                    RunObject = Page 5906;
                    RunPageLink = Document Type=FIELD(Document Type),
                                  Document No.=FIELD(Document No.),
                                  Line No.=FIELD(Line No.);
                    ShortCutKey = 'Shift+F7';
                    ToolTipML = ENU='View or edit a worksheet where you record information about service items, such as repair status, fault comments and codes, and cost. In this window, you can update information on the items such as repair status and fault and resolution codes. You can also enter new service lines for resource hours, for the use of spare parts and for specific service costs.',
                                FRA='Afficher ou modifier une feuille sur laquelle vous enregistrez des informations sur les articles de service (par exemple, l''état de réparation, les commentaires et les codes panne, ainsi que le coût). Dans cette fenêtre, vous pouvez également mettre à jour des informations sur les articles, comme leur état de réparation et les codes panne et solution. Vous pouvez également y entrer de nouvelles lignes service pour les heures ressource, pour l''utilisation de pièces de rechange et pour certains coûts service.';
                }
            }
        }
    }
}

