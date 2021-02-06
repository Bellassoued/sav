page 60157 "Fiche Réparation interne"
{
    // version CT16V002

    CaptionML = ENU='Reception Internal repair Card',
                FRA='Fiche Réparation interne';
    PageType = Card;
    SourceTable = Table60008;
    SourceTableView = WHERE(Service Type=CONST(Big Service));

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("Reception No";"Reception No")
                {
                }
                field(VIN;VIN)
                {
                }
                field("Variant Code";"Variant Code")
                {
                    Importance = Additional;
                }
                field("Vehicle No.";"Vehicle No.")
                {
                }
                field("Model Code";"Model Code")
                {
                }
                field(Priority;Priority)
                {
                }
                field("Service Item No.";"Service Item No.")
                {
                }
                field("Service Item Description";"Service Item Description")
                {
                }
                field("Created By";"Created By")
                {
                }
                field("Creation date";"Creation date")
                {
                }
                field("Reception Date";"Reception Date")
                {
                }
                field("Shipment date Request";"Shipment date Request")
                {
                }
                field(Contact;Contact)
                {
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                }
                field("Owner Code";"Owner Code")
                {
                }
                field("Owner Name";"Owner Name")
                {
                }
                field("Owner Address";"Owner Address")
                {
                }
                field("Owner Address 2";"Owner Address 2")
                {
                }
                field("Owner Post Code";"Owner Post Code")
                {
                }
                field("Owner City";"Owner City")
                {
                }
                field("Owner County";"Owner County")
                {
                }
                field("Owner Country/Region Code";"Owner Country/Region Code")
                {
                }
                field("Owner Contact";"Owner Contact")
                {
                }
                field("Owner Phone No.";"Owner Phone No.")
                {
                }
                field("Livré au client";"Livré au client")
                {
                }
                field("Date Livraison";"Date Livraison")
                {
                }
                field("Total Work Hour";"Total Work Hour")
                {
                }
                field("Block/cancel reason";"Block/cancel reason")
                {
                }
                field("Block/cancel Date";"Block/cancel Date")
                {
                }
                field("unblock/reactivate Date";"unblock/reactivate Date")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field(Invoiced;Invoiced)
                {
                }
                field("Type d'intervention";"Type d'intervention")
                {
                }
                field("Date Réparation";"Date Réparation")
                {
                }
            }
            group("Information Vente")
            {
                field("Customer No.";"Customer No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Name 2";"Name 2")
                {
                }
                field(Address;Address)
                {
                }
                field("Address 2";"Address 2")
                {
                }
                field("Post Code";"Post Code")
                {
                }
                field(City;City)
                {
                }
                field(County;County)
                {
                }
                field("Country/Region Code";"Country/Region Code")
                {
                }
                field("Sell-to Contact No.";"Sell-to Contact No.")
                {
                }
            }
            group("Information Achat")
            {
                field("Vendor No.";"Vendor No.")
                {
                }
                field("Vendor Item No.";"Vendor Item No.")
                {
                }
                field("Vendor Item Name";"Vendor Item Name")
                {
                }
                field("Vendor Name";"Vendor Name")
                {
                }
                field("Vendor Warranty Date";"Vendor Warranty Date")
                {
                }
                field("Purchase invoice No.";"Purchase invoice No.")
                {
                }
                field("Purchase invoice Date";"Purchase invoice Date")
                {
                }
            }
            part(Pannes;60064)
            {
                SubPageLink = Reception No=FIELD(Reception No),
                              Garantie=CONST(No);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Function")
            {
                action(lancer)
                {
                    Image = ReOpen;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        "Status SR":="Status SR"::Lancée;
                    end;
                }
                action(Annuler)
                {
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        "Status SR":="Status SR"::Annulé;
                    end;
                }
            }
            group("&Inspection")
            {
                CaptionML = ENU='Control',
                            FRA='Contrôle';
                action("Contrôle Visuel")
                {
                    CaptionML = ENU='Visual Control',
                                FRA='Contrôle Visuel';
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        PageControlVisule : Page "60012";
                        RecControl : Record "60009";
                    begin
                        //--> Appel au contrôle Visuel

                            RecControl.RESET;
                            IF RecControl.GET("Reception No") THEN
                               BEGIN
                                    PAGE.RUNMODAL(60012,RecControl);
                               END
                            ELSE
                               BEGIN
                                    RecControl.INIT;
                                    RecControl.Id:="Reception No";
                                    //--> Donnée Date         RecControl."Date de Creation":=
                                    RecControl.INSERT;
                                    PAGE.RUN(60012,RecControl);
                               END;
                    end;
                }
            }
            group("&Document")
            {
                action("Crée Commande")
                {
                    Image = CreateDocuments;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                    begin
                        CuSAVManagement.CreateSalesDocFromRcpGrandRep(2,Rec,2,1);
                    end;
                }
                action("Crée Véhicule")
                {
                    Image = Delivery;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecServiceItem : Record "5940";
                    begin
                        //---> Fonction dans Rec pour crée Services Item

                        CreateServiceItem();
                    end;
                }
                action("Imprimer Fiche")
                {
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecRecpetionSav : Record "60008";
                    begin
                        RecRecpetionSav.SETRANGE("Reception No","Reception No");
                        IF RecRecpetionSav.FINDFIRST THEN
                          REPORT.RUN(REPORT::"Cmd Service Grand Rep",TRUE,TRUE,RecRecpetionSav);
                    end;
                }
                action("Fiche Véhicule")
                {
                    Image = ServiceItem;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page 5980;
                    RunPageLink = Serial No.=FIELD(VIN);
                    RunPageView = SORTING(Item No.,Serial No.)
                                  ORDER(Ascending);
                }
                action("Consulter commande")
                {
                    Caption = 'Consulter Commande';
                    Image = ServiceLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecLServiceHeader : Record "5900";
                    begin
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Document Type",RecLServiceHeader."Document Type"::Order);
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Reception No","Reception No");
                        IF RecLServiceHeader.FINDFIRST THEN
                          PAGE.RUN(PAGE::"Service Order",RecLServiceHeader);
                    end;
                }
            }
            group("&Historique")
            {
                action(Historiques)
                {
                    Image = History;

                    trigger OnAction();
                    begin
                        
                        /*
                        RecGRecpetion.COPY(Rec);
                        RecGRecpetion.FILTERGROUP(2);
                        RecGRecpetion.SETRANGE(RecGRecpetion.VIN,VIN);
                        RecGRecpetion.SETRANGE("Service Type",RecGRecpetion."Service Type"::"Big Service");
                        RecGRecpetion.FILTERGROUP(0);
                        
                        PAGE.RUN(PAGE::"Liste des Receptions Rapide",RecGRecpetion);
                        */

                    end;
                }
                action("Historique Dossier SAV")
                {
                    Image = Line;
                    RunObject = Page 60118;
                    RunPageLink = No_Chassis=FIELD(VIN);
                    RunPageMode = View;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        InitTechnicalInfo;

        IF "Model Code" = '' THEN
          BEGIN
            "Model Code" := RecFicheTechnique."Model Code" ;

          END;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Service Type":="Service Type"::"Internal Repair";
    end;

    trigger OnOpenPage();
    begin

        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;

        InitTechnicalInfo;
    end;

    var
        RecGVehicule : Record "27";
        CuSAVManagement : Codeunit "50010";
        UserMgt : Codeunit "5700";
        RecUserSetup : Record "91";
        TXT50008 : Label 'Vous n''avez pas l''autorisation Approbation Garantie .';
        TXT50009 : Label 'Il faut créer la fiche de garantie.';
        RecFicheTechnique : Record "50032";

    procedure InitTechnicalInfo();
    begin
        IF RecGVehicule.GET("Vehicle No.") THEN
           IF RecFicheTechnique.GET(RecGVehicule."No.") THEN ;
    end;
}

