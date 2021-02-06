page 50160 "Service Order Subform Archive"
{
    // version NAVW111.00,T180001

    //  T180001 ZM 05/10/2018 : upgrade

    AutoSplitKey = true;
    CaptionML = ENU='Lines',
                FRA='Lignes Archive';
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = Table60077;
    SourceTableView = WHERE(Document Type=CONST(Order));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Line No.";"Line No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the line.',
                                FRA='Spécifie le numéro de la ligne.';
                    Visible = false;
                }
                field(ServiceItemNo;"Service Item No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the service item number registered in the Service Item table.',
                                FRA='Spécifie le numéro article de service enregistré dans la table Article de service.';

                    trigger OnLookup(Text : Text) : Boolean;
                    var
                        ServOrderMgt : Codeunit "5900";
                    begin
                    end;
                }
                field("Item No.";"Item No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the item number linked to this service item.',
                                FRA='Spécifie le numéro article associé à cet article service.';
                    Visible = true;
                }
                field("Service Item Group Code";"Service Item Group Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the code of the service item group for this item.',
                                FRA='Spécifie le code du groupe d''articles service pour cet article.';
                }
                field("Ship-to Code";"Ship-to Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.',
                                FRA='Spécifie un code pour une adresse secondaire de livraison si vous souhaitez expédier vers une autre adresse que celle qui a été saisie automatiquement. Ce champ est également utilisé en cas de livraison directe.';
                    Visible = false;
                }
                field("Variant Code";"Variant Code")
                {
                    ApplicationArea = Advanced;
                    ToolTipML = ENU='Specifies the variant of the item on the line.',
                                FRA='Indique la variante de l''article sur la ligne.';
                    Visible = false;
                }
                field("Serial No.";"Serial No.")
                {
                    ApplicationArea = ItemTracking;
                    ToolTipML = ENU='Specifies the serial number of this item.',
                                FRA='Spécifie le numéro de série de cet article.';
                }
                field(Description;Description)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies a description of this service item.',
                                FRA='Spécifie une description de cet article service.';
                }
                field("Description 2";"Description 2")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies an additional description of this item.',
                                FRA='Spécifie une description supplémentaire de cet article.';
                    Visible = true;
                }
                field("Repair Status Code";"Repair Status Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the repair status of this service item.',
                                FRA='Spécifie le statut de réparation de cet article service.';
                }
                field("Service Shelf No.";"Service Shelf No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the service shelf this item is stored on.',
                                FRA='Spécifie le numéro du rayon service sur lequel cet article est stocké.';
                    Visible = false;
                }
                field(Warranty;Warranty)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies that warranty on either parts or labor exists for this item.',
                                FRA='Indique qu''il existe une garantie sur les pièces ou la main-d''ouvre pour cet article.';
                }
                field("Warranty Starting Date (Parts)";"Warranty Starting Date (Parts)")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the starting date of the spare parts warranty for this item.',
                                FRA='Spécifie la date de début de la garantie des pièces de rechange de cet article.';
                    Visible = false;
                }
                field("Warranty Ending Date (Parts)";"Warranty Ending Date (Parts)")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the ending date of the spare parts warranty for this item.',
                                FRA='Spécifie la date de fin de la garantie des pièces de rechange de cet article.';
                    Visible = false;
                }
                field("Warranty % (Parts)";"Warranty % (Parts)")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the percentage of spare parts costs covered by the warranty for this item.',
                                FRA='Spécifie le pourcentage des coûts pièce de rechange couverts par la garantie de cet article.';
                    Visible = false;
                }
                field("Warranty % (Labor)";"Warranty % (Labor)")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the percentage of labor costs covered by the warranty for this item.',
                                FRA='Spécifie le pourcentage des coûts travail couverts par la garantie de cet article.';
                    Visible = false;
                }
                field("Warranty Starting Date (Labor)";"Warranty Starting Date (Labor)")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the starting date of the labor warranty for this item.',
                                FRA='Spécifie la date de début de la garantie main-d''ouvre de cet article de service.';
                    Visible = false;
                }
                field("Warranty Ending Date (Labor)";"Warranty Ending Date (Labor)")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the ending date of the labor warranty for this item.',
                                FRA='Spécifie la date de fin de la garantie main-d''ouvre de cet article de service.';
                    Visible = false;
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
                    Visible = false;
                }
                field("Service Price Group Code";"Service Price Group Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the code of the service price group associated with the item.',
                                FRA='Spécifie le code du groupe tarifs service associé à l''article.';
                }
                field("Adjustment Type";"Adjustment Type")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the adjustment type for the line.',
                                FRA='Spécifie le type d''ajustement pour la ligne.';
                    Visible = false;
                }
                field("Base Amount to Adjust";"Base Amount to Adjust")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the amount that the service line, linked to this service item line, will be adjusted to.',
                                FRA='Spécifie le montant d''ajustement de la ligne service liée à la ligne article de service actuelle.';
                    Visible = false;
                }
                field("Fault Area Code";"Fault Area Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the fault area code for this item.',
                                FRA='Spécifie le code zone panne de cet article.';
                    Visible = FaultAreaCodeVisible;
                }
                field("Symptom Code";"Symptom Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the symptom code for this item.',
                                FRA='Spécifie le code symptôme pour cet article.';
                    Visible = SymptomCodeVisible;
                }
                field("Fault Code";"Fault Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the fault code for this item.',
                                FRA='Spécifie le code panne pour cet article.';
                    Visible = FaultCodeVisible;
                }
                field("Resolution Code";"Resolution Code")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the resolution code for this item.',
                                FRA='Spécifie le code résolution pour cet article.';
                    Visible = ResolutionCodeVisible;
                }
                field(Priority;Priority)
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the service priority for this item.',
                                FRA='Spécifie la priorité service pour cet article.';
                }
                field("Response Time (Hours)";"Response Time (Hours)")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the estimated hours from order creation, to the time when the repair status of the item line changes from Initial, to In Process.',
                                FRA='Spécifie les heures estimées entre la création de la commande service et le moment où le statut réparation de la ligne article de service passe de Initial à En cours.';
                }
                field("Response Date";"Response Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the estimated date when service should start on this service item line.',
                                FRA='Spécifie la date estimée de début du service pour cette ligne article de service.';
                }
                field("Response Time";"Response Time")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the estimated time when service should start on this service item.',
                                FRA='Spécifie l''heure estimée de début du service pour cette ligne article de service.';
                }
                field("Loaner No.";"Loaner No.")
                {
                    ApplicationArea = Service;
                    LookupPageID = "Available Loaners";
                    ToolTipML = ENU='Specifies the number of the loaner that has been lent to the customer in the service order to replace this item.',
                                FRA='Spécifie le numéro de l''article de prêt qui a été prêté au client de la commande service pour remplacer cet article de service.';
                }
                field("Vendor No.";"Vendor No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of the vendor of this item.',
                                FRA='Spécifie le numéro du fournisseur de cet article.';
                    Visible = false;
                }
                field("Vendor Item No.";"Vendor Item No.")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number that the vendor uses for this item.',
                                FRA='Spécifie le numéro que le fournisseur utilise pour cet article.';
                    Visible = false;
                }
                field("Starting Date";"Starting Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the date when service on this item began and when the repair status changed to In process.',
                                FRA='Spécifie la date à laquelle le service sur cet article a commencé et le moment où le statut de réparation est passé sur En cours.';
                    Visible = false;
                }
                field("Starting Time";"Starting Time")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the time when service on this item began and when the repair status changed to In process.',
                                FRA='Spécifie l''heure à laquelle le service de cet article a commencé et le moment où le statut de réparation est passé sur En cours.';
                    Visible = false;
                }
                field("Finishing Date";"Finishing Date")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the finishing date of the service and when the repair status of this item changes to Finished.',
                                FRA='Spécifie la date de fin du service, c''est-à-dire la date à laquelle le champ Statut est passé sur Terminé.';
                    Visible = false;
                }
                field("Finishing Time";"Finishing Time")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the finishing time of the service and when the repair status of this item changes to Finished.',
                                FRA='Spécifie l''heure de fin du service, c''est-à-dire le moment où le champ Statut est passé sur Terminé.';
                    Visible = false;
                }
                field("No. of Previous Services";"No. of Previous Services")
                {
                    ApplicationArea = Service;
                    ToolTipML = ENU='Specifies the number of services performed on service items with the same item and serial number as this service item.',
                                FRA='Spécifie le nombre de services effectués sur des articles de service avec le même numéro article et le même numéro de série que cet article de service.';
                }
                field(;'')
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Service Lines")
            {
                ApplicationArea = Service;
                CaptionML = ENU='Service Lin&es',
                            FRA='Lign&es service';
                Image = ServiceLines;
                ShortCutKey = 'Shift+Ctrl+I';
                ToolTipML = ENU='View or edit the related service lines.',
                            FRA='Afficher ou modifier les lignes service associées.';

                trigger OnAction();
                var
                    ServOrderAlloc : Record "5950";
                begin
                    /*LigneRec.RESET;
                    LigneRec.SETRANGE("Reception No","Reception No");
                    LigneRec.SETRANGE(Statut,LigneRec.Statut::Approuvée);
                    LigneRec.SETRANGE("Type Effet CLT",LigneRec."Type Effet CLT"::LDT);
                    {
                      ServOrderAlloc.RESET;
                      ServOrderAlloc.SETRANGE("Document Type","Document Type");
                      ServOrderAlloc.SETRANGE("Document No.","Document No.");
                      ServOrderAlloc.SETRANGE("Réception No.","Reception No");}
                      //ServOrderAlloc.SETRANGE("Line No.",LigneReceptionGrandService."Num ligne");
                    IF (LigneRec.FINDSET) THEN*/
                      //IF NOT (ServOrderAlloc.FINDSET) OR ((ServOrderAlloc.FINDSET) AND (ServOrderAlloc.COUNT<>LigneRec.COUNT))  THEN
                        //ERROR('Affectation ressources obligatoire')
                    RegisterServInvLines;
                    //IF NOT (LigneRec.FINDSET) THEN RegisterServInvLines;

                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        IF "Serial No." = '' THEN
          "No. of Previous Services" := 0;
    end;

    trigger OnOpenPage();
    begin
        ServMgtSetup.GET;
        CASE ServMgtSetup."Fault Reporting Level" OF
          ServMgtSetup."Fault Reporting Level"::None:
            BEGIN
              FaultAreaCodeVisible := FALSE;
              SymptomCodeVisible := FALSE;
              FaultCodeVisible := FALSE;
              ResolutionCodeVisible := FALSE;
            END;
          ServMgtSetup."Fault Reporting Level"::Fault:
            BEGIN
              FaultAreaCodeVisible := FALSE;
              SymptomCodeVisible := FALSE;
              FaultCodeVisible := TRUE;
              ResolutionCodeVisible := TRUE;
            END;
          ServMgtSetup."Fault Reporting Level"::"Fault+Symptom":
            BEGIN
              FaultAreaCodeVisible := FALSE;
              SymptomCodeVisible := TRUE;
              FaultCodeVisible := TRUE;
              ResolutionCodeVisible := TRUE;
            END;
          ServMgtSetup."Fault Reporting Level"::"Fault+Symptom+Area (IRIS)":
            BEGIN
              FaultAreaCodeVisible := TRUE;
              SymptomCodeVisible := TRUE;
              FaultCodeVisible := TRUE;
              ResolutionCodeVisible := TRUE;
            END;
        END;
    end;

    var
        Text000 : TextConst ENU='You cannot open the window because %1 is %2 in the %3 table.',FRA='Vous ne pouvez pas ouvrir la fenêtre car %1 est à %2 dans la table %3.';
        ServMgtSetup : Record "5911";
        ServLoanerMgt : Codeunit "5901";
        [InDataSet]
        FaultAreaCodeVisible : Boolean;
        [InDataSet]
        SymptomCodeVisible : Boolean;
        [InDataSet]
        FaultCodeVisible : Boolean;
        [InDataSet]
        ResolutionCodeVisible : Boolean;
        LigneReceptionGrandService : Record "60012";
        ServiceItemLine : Record "5901";
        GRecReceptionSAV : Record "60008";
        LignereceptionserviceRapide : Record "60010";
        UserSetup : Record "91";
        LigneRec : Record "60012";
        "RecGVentesratées" : Record "70096";
        GRecServiceLine : Record "5902";
        TXT50000 : Label 'Vous ne pouvez pas mettre à jour ligne article de  service';

    local procedure RegisterServInvLines();
    var
        ServInvLine : Record "60088";
        ServInvLines : Page "50161";
    begin
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        CLEAR(ServInvLine);
        ServInvLine.SETRANGE("Document Type","Document Type");
        ServInvLine.SETRANGE("Document No.","Document No.");
        ServInvLine.SETRANGE("Service Item No.","Service Item No.");
        ServInvLine.SETRANGE("Service Item Line No.","Line No.");
        ServInvLine.SETRANGE("No. Version","No. Version");
        ServInvLine.FILTERGROUP(2);
        CLEAR(ServInvLines);
        ServInvLines.Initialize("Line No.");
        ServInvLines.SETTABLEVIEW(ServInvLine);
        ServInvLines.RUNMODAL;
        ServInvLine.FILTERGROUP(0);
    end;
}

