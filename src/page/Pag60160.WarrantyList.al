page 60160 "Warranty List"
{
    // version MAZDA19

    CaptionML = ENU='Warranty Card',
                FRA='Fiche Garantie';
    CardPageID = "Warranty Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60008;
    SourceTableView = WHERE(Service Type=CONST(Big Service),
                            Warranty=CONST(Yes));

    layout
    {
        area(content)
        {
            repeater("Warranty Grp")
            {
                Caption = 'Garantie';
                field("<ReceptionNo>";"Reception No")
                {
                }
                field("Warranty Request By";"Warranty Request By")
                {
                }
                field("Type de garantie";"Type de garantie")
                {
                }
                field("Sous Type de garantie";"Sous Type de garantie")
                {
                    Editable = ShowSousTypeGarantie;
                }
                field("Etat de la réclamation";"Etat de la réclamation")
                {
                }
                field(Warranty;Warranty)
                {
                }
                field("Warranty End Date";"Warranty End Date")
                {
                }
                field("Warranty Starting Date (Labor)";"Warranty Starting Date (Labor)")
                {
                }
                field("Warranty Ending Date (Labor)";"Warranty Ending Date (Labor)")
                {
                }
                field("Warranty Starting Date (Parts)";"Warranty Starting Date (Parts)")
                {
                }
                field("Warranty Ending Date (Parts)";"Warranty Ending Date (Parts)")
                {
                }
                field("Warranty % (Parts)";"Warranty % (Parts)")
                {
                }
                field("Warranty % (Labor)";"Warranty % (Labor)")
                {
                }
                field("Sales Date";"Sales Date")
                {
                    CaptionML = ENU='Sales Date',
                                FRA='Date de 1èr mise en circulation';
                    Editable = false;
                }
                field(Kilometrage;RecControl."Boite pharmacieD")
                {
                    Editable = false;
                }
                field("Approval Warranty Pick Request";"Approval Warranty Pick Request")
                {
                }
                field("Approval Warranty Service Post";"Approval Warranty Service Post")
                {
                }
                field("Warranty Status";"Warranty Status")
                {
                }
                field("Reception No";"Reception No")
                {
                }
                field(Matricule;Matricule)
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
                field("Date Validation Devis";"Date Validation Devis")
                {
                }
                field("Devis Validé";"Devis Validé")
                {
                }
                field(Invoiced;Invoiced)
                {
                }
                field("Motif Hors garantie";"Motif Hors garantie")
                {
                }
                field("Type d'intervention";"Type d'intervention")
                {
                }
                field("Nom Personne Livré";"Nom Personne Livré")
                {
                }
                field("CIN Personne Livré";"CIN Personne Livré")
                {
                }
                field("Date devis";"Date devis")
                {
                }
                field("Date Réparation";"Date Réparation")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Function")
            {
                action("Annuler Dossier Garantie")
                {
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecLUserSetup : Record "91";
                    begin
                        //SM MAZDA19
                        RecLUserSetup.GET(USERID);
                        IF RecLUserSetup."Approbation Garantie" THEN BEGIN
                          "Warranty Status" := 2;
                          Warranty := FALSE;
                          CurrPage.UPDATE(TRUE);
                          CurrPage.CLOSE;
                        END ELSE IF RecLUserSetup."Approbation Technique Garantie" THEN BEGIN
                          "Warranty Status" := 1;
                          Warranty := FALSE;
                          CurrPage.UPDATE(TRUE);
                          CurrPage.CLOSE;
                        END ELSE ERROR(TXT50008);

                        //END SM
                    end;
                }
                action("Approuver Demande Pièce")
                {
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        VALIDATE("Approval Warranty Pick Request","Approval Warranty Pick Request"::Approuver);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                action("Refuser Demande Pièce")
                {
                    Image = CancelLine;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        VALIDATE("Approval Warranty Pick Request","Approval Warranty Pick Request"::Refuser);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                action("Approuver BL/Facturation")
                {
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        VALIDATE("Approval Warranty Service Post","Approval Warranty Service Post"::Approuver);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                action("Refuser BL/Facturation")
                {
                    Image = CancelLine;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        VALIDATE("Approval Warranty Service Post","Approval Warranty Service Post"::Refuser);
                        CurrPage.UPDATE(TRUE);
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
                action("Fiche Réception")
                {

                    trigger OnAction();
                    begin
                         PAGE.RUN(PAGE::"Fiche Reception Grande Réparat",Rec);
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
                        RecLServiceHeader.RESET;
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Document Type",RecLServiceHeader."Document Type"::Order);
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Reception No","Reception No");
                        IF RecLServiceHeader.FINDFIRST THEN
                          PAGE.RUN(PAGE::"Service Order",RecLServiceHeader);
                    end;
                }
                action("Consulter Devis")
                {
                    Caption = 'Consulter Devis';
                    Image = ServiceLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecLServiceHeader : Record "5900";
                    begin
                        RecLServiceHeader.RESET;
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Document Type",RecLServiceHeader."Document Type"::Quote);
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Reception No","Reception No");
                        IF RecLServiceHeader.FINDFIRST THEN
                          PAGE.RUN(PAGE::"Service Quote",RecLServiceHeader);
                    end;
                }
            }
            group("&Historique")
            {
                action("Historiques Expéditions SAV Enregistrées")
                {
                    Caption = 'Historiques Expéditions SAV Enregistrées';
                    Image = PostedShipment;

                    trigger OnAction();
                    begin

                        RecServiceShipmentHeader.RESET;
                        RecServiceShipmentHeader.SETRANGE("Reception No","Reception No");
                        IF RecServiceShipmentHeader.FINDSET THEN
                          PAGE.RUN(PAGE::"Posted Service Shipments",RecServiceShipmentHeader);
                    end;
                }
                action("Historiques Factures SAV Enregistrées")
                {
                    Caption = 'Historiques Factures SAV Enregistrées';
                    Image = PostedServiceOrder;

                    trigger OnAction();
                    begin

                        RecServiceInvoiceHeader.RESET;
                        RecServiceInvoiceHeader.SETRANGE("Reception No","Reception No");
                        IF RecServiceInvoiceHeader.FINDSET THEN
                          PAGE.RUN(PAGE::"Posted Service Invoices",RecServiceInvoiceHeader);
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

    trigger OnOpenPage();
    begin

        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;
        //SM MAZDA19
        ShowSousTypeGarantie := ("Type de garantie" = "Type de garantie"::"Garantie  Constructeur");
        //END SM

        InitTechnicalInfo;
        UpdateSubForm;
    end;

    var
        RecGVehicule : Record "27";
        CuSAVManagement : Codeunit "50010";
        UserMgt : Codeunit "5700";
        RecControl : Record "60009";
        RecServiceHeader : Record "5900";
        RecServiceInvoiceHeader : Record "5992";
        RecServiceShipmentHeader : Record "5990";
        ShowSousTypeGarantie : Boolean;
        TXT50008 : TextConst ENU='You cannot rename a %1.',FRA='Vous n''avez pas l''autorisation approbation Garantie.';

    procedure InitTechnicalInfo();
    begin
    end;

    procedure UpdateSubForm();
    begin
    end;
}

