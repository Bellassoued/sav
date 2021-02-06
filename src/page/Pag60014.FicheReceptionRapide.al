page 60014 "Fiche Reception Rapide"
{
    // version SAV Automobile,MAZDA205,MAZDA444

    CaptionML = ENU='Rapid Reception Card',
                FRA='Fiche Réception Rapide';
    PageType = Card;
    SourceTable = Table60008;
    SourceTableView = WHERE(Service Type=CONST(Rapid Service));

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("Reception No";"Reception No")
                {
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                    Editable = false;
                }
                field("N° OR Archive";"N° OR Archive")
                {
                    Caption = 'N° OR Archive Incadea';
                    ShowMandatory = true;
                    Style = Attention;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field(Matricule;Matricule)
                {

                    trigger OnLookup(Text : Text) : Boolean;
                    var
                        ReceptionSAV1 : Record "60008";
                    begin
                        ReceptionSAV1.RESET;
                        ReceptionSAV1.SETRANGE(Matricule,Matricule);
                        ReceptionSAV1.SETFILTER("Status SR",'<>%1',ReceptionSAV1."Status SR"::Facturée);
                        IF ReceptionSAV1.FINDFIRST THEN
                          ERROR(TXT50014,VIN,ReceptionSAV1."Reception No");
                    end;

                    trigger OnValidate();
                    begin
                        CurrPage.LigneServRapide.PAGE.SetNumReception("Reception No");
                        RefreshFactBoxRejet ;
                        CALCFIELDS("OR Entretien 10 000","OR Entretien 20 000","OR Entretien 30 000");
                    end;
                }
                field(VIN;VIN)
                {

                    trigger OnValidate();
                    var
                        ReceptionSAV1 : Record "60008";
                    begin
                        CurrPage.LigneServRapide.PAGE.SetNumReception("Reception No");
                        RefreshFactBoxRejet ;
                        IF "Status SR"<>"Status SR"::"Fiche Crée" THEN
                        ERROR('Vous n avez pas le droit');
                        ReceptionSAV1.RESET;
                        ReceptionSAV1.SETRANGE(VIN,VIN);
                        ReceptionSAV1.SETFILTER("Status SR",'<>%1',ReceptionSAV1."Status SR"::Facturée);
                        IF ReceptionSAV1.FINDFIRST THEN
                          MESSAGE(TXT50014,VIN,ReceptionSAV1."Reception No");
                        //KT 170817
                        CALCFIELDS("OR Entretien 10 000","OR Entretien 20 000","OR Entretien 30 000");
                    end;
                }
                field("Vehicle No.";"Vehicle No.")
                {
                }
                field("Model Code";"Model Code")
                {
                }
                field("Variant Code";"Variant Code")
                {
                    Importance = Additional;
                }
                field("Status SR";"Status SR")
                {
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field(Priority;Priority)
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field(Contact;Contact)
                {
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Reception Date";"Reception Date")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Shipment date Request";"Shipment date Request")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Date Livraison";"Date Livraison")
                {
                    Editable = false;
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
                field(Invoiced;Invoiced)
                {
                    Editable = false;
                }
                field("Created By";"Created By")
                {
                    Editable = false;
                }
                field("Creation date";"Creation date")
                {
                    Editable = false;
                }
                field("Heur creation";"Heur creation")
                {
                    Editable = false;
                }
                field("Last Modification Date";"Last Modification Date")
                {
                }
                field("Modified By";"Modified By")
                {
                }
                field("Last Modification Time";"Last Modification Time")
                {
                }
                field(Kilométrage;Kilométrage)
                {
                    DrillDown = false;
                    Editable = false;
                    Lookup = false;
                }
                group(Interne)
                {
                    CaptionML = ENU='Interne',
                                FRA='Interne';
                    field(Intern;Intern)
                    {
                        Editable = true;
                        Style = StrongAccent;
                        StyleExpr = TRUE;

                        trigger OnValidate();
                        begin
                            //<<---NM060417-------
                            IF Intern=FALSE  THEN
                              VALIDATE("Intern Type",0);
                            //>>---NM060417-------
                            /*//ADD KT 20042017
                            WhoWillPayForIt;
                            //END KT
                            //KT 170817
                            IF "Status SR"="Status SR"::"Commande Crée" THEN
                            CuSAVManagement.ModifySalesDocAccordingToRcpGrandRep(2,Rec,0);
                            //END KT
                            */

                        end;
                    }
                    field("Intern Type";"Intern Type")
                    {
                        CaptionML = ENU='Type interne',
                                    FRA='Type Interne';
                        Editable = true;
                        OptionCaptionML = ENU=' ,Voiture de Service Auto,,Inerne  Atelier,Soutien commercial DG,Soutien atelier DG,Cadeau Fidélité',
                                          FRA=' ,Voiture de Service Auto,,Inerne  Atelier,Soutien commercial DG,Soutien atelier DG,Cadeau Fidélité';
                        Visible = true;

                        trigger OnValidate();
                        begin
                            //KT 170817
                            /*
                            IF NOT ((("Entretien 10 000") AND("OR Entretien 10 000"='')) OR(("Entretien 20 000") AND ("OR Entretien 20 000"='')) OR (("Entretien 30 000") AND ("OR Entretien 30 000"=''))) THEN
                              ERROR('Aucune action commerciale disponible pour ce véhicule');
                              */

                        end;
                    }
                }
                group(Assurance)
                {
                    CaptionML = ENU='Assurance',
                                FRA='Assurance';
                    field("Assurances groupe";"Assurances groupe")
                    {
                    }
                    field("Type assurances groupe";"Type assurances groupe")
                    {
                    }
                }
                group(Retour)
                {
                    CaptionML = ENU='Retour',
                                FRA='Retour';
                    field(Retour;Retour)
                    {
                    }
                }
                group("Informations Règlement")
                {
                    field("Payment Method Code";"Payment Method Code")
                    {
                    }
                    field(RIB;RIB)
                    {
                    }
                    field("Nom CH";"Nom CH")
                    {
                        Caption = 'Nom De:';
                    }
                }
                group("Avantages entretien")
                {
                    Editable = false;
                    field("Entretien 10 000";"Entretien 10 000")
                    {
                    }
                    field("Entretien 20 000";"Entretien 20 000")
                    {
                    }
                    field("Entretien 30 000";"Entretien 30 000")
                    {
                    }
                    field("OR Entretien 10 000";"OR Entretien 10 000")
                    {
                    }
                    field("OR Entretien 20 000";"OR Entretien 20 000")
                    {
                    }
                    field("OR Entretien 30 000";"OR Entretien 30 000")
                    {
                    }
                }
            }
            part(LigneServRapide;60020)
            {
                Caption = 'Ligne OR Chrono';
                SubPageLink = Reception No.=FIELD(Reception No),
                              Type opération=CONST(rapid service);
                SubPageView = WHERE(Type=CONST(Item));
            }
            part("Ligne travaux service rapide";60197)
            {
                Caption = 'Effets Client';
                SubPageLink = Reception No.=FIELD(Reception No),
                              Type opération=CONST(rapid service);
                SubPageView = WHERE(Type=CONST(Resource));
            }
            part(;60021)
            {
                SubPageLink = Reception No.=FIELD(Reception No),
                              Type opération=CONST(Additional Sales);
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
                field(Warranty;Warranty)
                {
                }
                field("Code Titre Client";"Code Titre Client")
                {
                }
            }
        }
        area(factboxes)
        {
            part(FactPRRejeter;60068)
            {
            }
            part(;9082)
            {
                SubPageLink = No.=FIELD(Customer No.);
                Visible = false;
            }
            part(;9084)
            {
                SubPageLink = No.=FIELD(Customer No.);
                Visible = true;
            }
            part("Détails Véhicule";9088)
            {
                Caption = 'Détails Véhicule';
                SubPageLink = Service Item No.=FIELD(Service Item No.);
                Visible = true;
            }
            part(;9085)
            {
                SubPageLink = No.=FIELD(Customer No.);
                Visible = true;
            }
            part(;9086)
            {
                SubPageLink = No.=FIELD(Customer No.);
                Visible = false;
            }
            part(;69086)
            {
                SubPageLink = Id=FIELD(Reception No);
            }
            part(Factbox;70240)
            {
                CaptionML = ENU='Détails  OR Précédent',
                            FRA='Détails OR Précédent';
                SubPageLink = Reception No=FIELD(Last repair No.);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Function")
            {
                action(Lancer)
                {
                    Caption = 'lancer';
                    Image = ReOpen;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        //SM 010 92016
                        /* OLD
                        IF xRec."Status SR" = "Status SR"::"Fiche Crée" THEN
                          BEGIN
                            "Status SR":="Status SR"::Lancée;
                            MODIFY ;
                          END ELSE ERROR('La fiche ne peut être modifié en statut Lancé');
                         */
                        
                        IF (xRec."Status SR" = "Status SR"::Annulé) THEN
                          BEGIN
                            "Status SR":="Status SR"::"Fiche Crée";
                            MODIFY ;
                          END ELSE ERROR('La fiche ne peut être modifié en statut Annulé');
                        //SM

                    end;
                }
                action(Annuler)
                {
                    Caption = 'Annuler';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        IF (xRec."Status SR" = "Status SR"::"Fiche Crée") THEN
                          BEGIN
                            "Status SR":="Status SR"::Annulé;
                            MODIFY ;
                          END ELSE ERROR('La fiche ne peut être modifié en statut Annulé');
                    end;
                }
                action("Annuler Suspension")
                {
                    Caption = 'Annuler Suspension';

                    trigger OnAction();
                    begin
                        //SM MAZDA205
                        RecUserSetup.GET(USERID);
                        IF RecUserSetup."Annuler Suspension SAV" THEN BEGIN
                          "Status SR":="Status SR"::"Pièces demandé";
                        END ELSE
                          ERROR(TXT50010);
                        //END SM MAZDA205
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

                        CLEAR(RecControl);
                        IF NOT RecControl.GET("Reception No") THEN
                          BEGIN
                            RecControl.INIT;
                            RecControl.Id:="Reception No";
                            RecControl.INSERT;
                          END;

                        PAGE.RUN(PAGE::"Contrôle Visuels",RecControl);
                    end;
                }
            }
            group("&Document")
            {
                action("Crée Commande")
                {
                    Caption = 'Créer Commande';
                    Image = CreateDocuments;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                        RecCustomer : Record "18";
                    begin
                        /* TMP
                        //ADD KK MAZDA1004
                        IF (RecCustomer.GET("Customer No.")) AND (RecCustomer."Client EA") THEN
                           TESTFIELD("No. demande de réparation");
                        //END KK MAZDA1004
                        */
                        // ADD KKK MAZDA1004
                        CALCFIELDS(Kilométrage);
                        IF NOT (Kilométrage>0) THEN
                          ERROR('Le kilométrage doit être saisi');
                        RecDemandeRéparation.RESET;
                        RecDemandeRéparation.SETRANGE("No Réception SAV","Reception No");
                        IF RecDemandeRéparation.FINDFIRST THEN
                          ERROR(TXT50012);
                        
                        //SM 061115
                        RecCustomer.GET("Customer No.");
                        //IF NOT RecCustomer."Client EA" THEN
                        //END SM
                        //SM MAZDA444
                        CuSAVManagement.CreateSalesDocFromRcpServ(2,Rec,0,0);

                    end;
                }
                action("Crée Commande Vehicule Interne Actif")
                {
                    Caption = 'Crée Commande Vehicule Interne Actif';
                    Image = CreateDocuments;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                    begin
                        /* TMP
                        //ADD KK MAZDA1004
                        IF (RecCustomer.GET("Customer No.")) AND (RecCustomer."Client EA") THEN
                           TESTFIELD("No. demande de réparation");
                        //END KK MAZDA1004
                        */
                        
                        //SM MAZDA444
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Autoris. defaclquer Fact. serv" THEN
                          ERROR(TXT50011);
                        CuSAVManagement.CreateSalesDocFromRcpServ(2,Rec,1,1);

                    end;
                }
                action("Crée Commande Véhicule Economic Auto")
                {
                    Caption = 'Créer commande avarie';
                    Image = CreateDocuments;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                    begin
                        // ADD KK MAZDA1004
                        RecDemandeRéparation.RESET;
                        RecDemandeRéparation.SETRANGE("No Réception SAV","Reception No");
                        IF RecDemandeRéparation.FINDFIRST THEN
                          ERROR(TXT50012);

                        //SM MAZDA444
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Autoris. defaclquer Fact. serv" THEN
                          ERROR(TXT50011);

                        CuSAVManagement.CreateSalesDocFromRcpServ(2,Rec,1,2);
                    end;
                }
                action("Crée Commande Véhicule Action Commerciale")
                {
                    Caption = 'Crée Commande Véhicule Action Commerciale';
                    Image = CreateDocuments;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                    begin
                        // ADD KK MAZDA1004
                        RecDemandeRéparation.RESET;
                        RecDemandeRéparation.SETRANGE("No Réception SAV","Reception No");
                        IF RecDemandeRéparation.FINDFIRST THEN
                          ERROR(TXT50012);

                        //SM MAZDA444
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Autoris. defaclquer Fact. serv" THEN
                          ERROR(TXT50011);

                        CuSAVManagement.CreateSalesDocFromRcpServ(2,Rec,1,3);
                    end;
                }
                action("Créer Devis")
                {
                    Caption = 'Créer Devis';
                    Image = CreateDocuments;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                        RecCustomer : Record "18";
                    begin
                        /* TMP
                        //ADD KK MAZDA1004
                        IF (RecCustomer.GET("Customer No.")) AND (RecCustomer."Client EA") THEN
                           TESTFIELD("No. demande de réparation");
                        //END KK MAZDA1004
                        */
                        // ADD KK MAZDA1004
                        RecDemandeRéparation.RESET;
                        RecDemandeRéparation.SETRANGE("No Réception SAV","Reception No");
                        IF RecDemandeRéparation.FINDFIRST THEN
                          ERROR(TXT50012);
                        //END KK MAZDA1004
                        
                        //SM 061115
                        RecCustomer.GET("Customer No.");
                        //IF NOT RecCustomer."Client EA" THEN
                        //END SM
                        
                        //SM MAZDA444
                        CuSAVManagement.CreateSalesDocFromRcpServ(1,Rec,0,0);

                    end;
                }
                action("Créer Devis Vehicule Interne Actif")
                {
                    Caption = 'Créer Devis Vehicule Interne Actif';
                    Image = CreateDocuments;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                    begin
                        //SM MAZDA444
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Autoris. defaclquer Fact. serv" THEN
                          ERROR(TXT50011);
                        CuSAVManagement.CreateSalesDocFromRcpServ(1,Rec,1,1);
                    end;
                }
                action("Créer Devis Véhicule Economic Auto")
                {
                    Caption = 'Créer Devis Véhicule Economic Auto';
                    Image = CreateDocuments;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                    begin
                        // ADD KK MAZDA1004
                        RecDemandeRéparation.RESET;
                        RecDemandeRéparation.SETRANGE("No Réception SAV","Reception No");
                        IF RecDemandeRéparation.FINDFIRST THEN
                          ERROR(TXT50012);

                        //SM MAZDA444
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Autoris. defaclquer Fact. serv" THEN
                          ERROR(TXT50011);
                        CuSAVManagement.CreateSalesDocFromRcpServ(1,Rec,1,2);
                    end;
                }
                action("Créer Devis Véhicule Action Commerciale")
                {
                    Caption = 'Créer Devis Véhicule Action Commerciale';
                    Image = CreateDocuments;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                    begin
                        // ADD KK MAZDA1004
                        RecDemandeRéparation.RESET;
                        RecDemandeRéparation.SETRANGE("No Réception SAV","Reception No");
                        IF RecDemandeRéparation.FINDFIRST THEN
                          ERROR(TXT50012);

                        //SM MAZDA444
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Autoris. defaclquer Fact. serv" THEN
                          ERROR(TXT50011);
                        CuSAVManagement.CreateSalesDocFromRcpServ(1,Rec,1,3);
                    end;
                }
                action("Crée Véhicule")
                {
                    Caption = 'Créer Véhicule';
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
                action("Crée Client")
                {
                    Caption = 'Créer Client';
                    Image = NewCustomer;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecCustomer : Record "18";
                    begin
                        //---> Fonction dans Rec pour crée Client
                          CreateCustomer();
                    end;
                }
                action("Imprimer Fiche")
                {
                    Caption = 'Imprimer Fiche';
                    Image = PrintForm;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecRecpetionSav : Record "60008";
                    begin
                        RecRecpetionSav.SETRANGE("Reception No","Reception No");
                        IF RecRecpetionSav.FINDFIRST THEN
                          REPORT.RUN(REPORT::"Cmd Service Rapide",TRUE,TRUE,RecRecpetionSav);
                    end;
                }
                action("Fiche Véhicule")
                {
                    Caption = 'Fiche Véhicule';
                    Image = ServiceItem;
                    Promoted = true;
                    PromotedCategory = Category5;
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

                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Document Type",RecLServiceHeader."Document Type"::Quote);
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Reception No","Reception No");
                        IF RecLServiceHeader.FINDFIRST THEN
                          PAGE.RUN(PAGE::"Service Quote",RecLServiceHeader);
                    end;
                }
                action("Consulter client")
                {
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 21;
                    RunPageLink = No.=FIELD(Customer No.);
                }
            }
            group("&Historique")
            {
                action(Historiques)
                {
                    Caption = 'Historiques';
                    Image = History;

                    trigger OnAction();
                    begin

                        RecGRecpetion.COPY(Rec);
                        RecGRecpetion.FILTERGROUP(2);
                        RecGRecpetion.SETRANGE(RecGRecpetion.VIN,VIN);
                        //RecGRecpetion.SETRANGE("Service Type",RecGRecpetion."Service Type"::"Big Service");
                        RecGRecpetion.FILTERGROUP(0);

                        PAGE.RUN(PAGE::"Liste des Receptions Rapide",RecGRecpetion);
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
        area(reporting)
        {
            action("Commande de travaux")
            {
                Image = "Order";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    Controle.RESET;
                    Controle.SETRANGE(Id,"Reception No");
                    IF Controle.FINDFIRST THEN BEGIN
                      IF Controle."Cree par"='' THEN
                        Controle."Cree par":="Created By";
                        Controle.MODIFY;
                        COMMIT;
                        CLEAR(CommandedetravauxChrono);
                        CommandedetravauxChrono.SETTABLEVIEW(Controle);
                        CommandedetravauxChrono.RUNMODAL;
                        "Nbre Impressions"+=1;
                        MODIFY;
                        CurrPage.UPDATE;
                    END;
                end;
            }
            action("Confirmation retour")
            {
                Caption = 'Confirmation Retour';
                Image = ReturnReceipt;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    RecUserSetup.GET(USERID);
                    IF (RecUserSetup."Chef atelier" OR RecUserSetup."Chef équipe atelier" OR RecUserSetup."Responsable SAV") THEN BEGIN
                      IF Retour=TRUE THEN BEGIN
                        TESTFIELD("No Réception Origine");
                        CLEAR(GPageFicheretour);
                        GPageFicheretour.SETRECORD(Rec);
                        GPageFicheretour.SETTABLEVIEW(Rec);
                        GPageFicheretour.RUN;
                      END;
                    END;
                end;
            }
            action("Confirmation RC garage")
            {
                Caption = 'Confirmation RC Garage';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category6;

                trigger OnAction();
                begin
                    RecUserSetup.GET(USERID);
                    IF (RecUserSetup."Chef atelier" OR RecUserSetup."Chef équipe atelier" OR RecUserSetup."Responsable SAV") THEN BEGIN
                      IF "Assurances groupe" AND ("Type assurances groupe"="Type assurances groupe"::"RC Garage") THEN BEGIN
                        TESTFIELD("No Réception Origine RC");
                        CLEAR(GPageFicheRCGarage);
                        GPageFicheRCGarage.SETRECORD(Rec);
                        GPageFicheRCGarage.SETTABLEVIEW(Rec);
                        GPageFicheRCGarage.RUN;
                      END;
                    END;
                end;
            }
            action("Approbation garantie constructeur")
            {
                Image = Approval;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page 70286;
                RunPageLink = Reception No=FIELD(Reception No);
            }
            action("Approbation interne")
            {
                CaptionML = ENU='Approbation OR interne',
                            FRA='Approbation OR interne';
                Image = Replan;

                trigger OnAction();
                var
                    LPageApprobationORinterne : Page "70291";
                    LRecReceptionSAV : Record "60008";
                begin
                    //KT 170817
                    IF "Assurances groupe" OR Intern THEN BEGIN
                      RecUserSetup.GET(USERID);
                      //MESSAGE(FORMAT(RecUserSetup."Approuver OR interne"));
                      IF RecUserSetup."Approuver OR interne" THEN BEGIN
                        LRecReceptionSAV.RESET;
                        LRecReceptionSAV.SETRANGE("Reception No","Reception No");
                        LRecReceptionSAV.FINDFIRST;
                        CLEAR(LPageApprobationORinterne);
                        LPageApprobationORinterne.SETRECORD(LRecReceptionSAV);
                        LPageApprobationORinterne.SETTABLEVIEW(LRecReceptionSAV);
                        LPageApprobationORinterne.RUNMODAL;
                      END;
                    END;
                    //END KT
                end;
            }
            action("Approbation OR interne atelier")
            {
                Image = WorkCenter;

                trigger OnAction();
                begin
                    //KT 180817
                    RecUserSetup.GET(USERID);
                    IF RecUserSetup."Approuver OR interne atelier" THEN
                      IF Intern AND ("Intern Type"="Intern Type"::"Interne  Atelier") THEN
                        "Approval Intern Service Post":="Approval Intern Service Post"::Approuver
                      ELSE
                        MESSAGE('L OR %1 doit être interne de type Interne atelier',"Reception No");
                end;
            }
            action("Approbation interne commercial")
            {
                Image = Approve;

                trigger OnAction();
                begin
                    //KT 180817
                    RecUserSetup.GET(USERID);
                    IF RecUserSetup."Approuver OR interne comm." THEN
                      IF Intern AND ("Intern Type"="Intern Type"::"Interne Commercial") THEN
                        "Approval Intern Service Post":="Approval Intern Service Post"::Approuver
                      ELSE
                        MESSAGE('L OR %1 doit être interne de type Interne commercial',"Reception No");
                end;
            }
            action("Approbation soutien commercial DG")
            {
                Image = Approve;

                trigger OnAction();
                begin
                    //KT 180817
                    RecUserSetup.GET(USERID);
                    IF RecUserSetup."Approuver OR S.Commercial DG" THEN
                      IF Intern AND ("Intern Type"="Intern Type"::"Soutien commercial DG") THEN
                        "Approval Intern Service Post":="Approval Intern Service Post"::Approuver
                      ELSE
                        MESSAGE('L OR %1 doit être interne de type Soutien commercial DG',"Reception No");
                end;
            }
            action("Approbation soutien atelier DG")
            {
                Image = Approve;

                trigger OnAction();
                begin
                    //KT 180817
                    RecUserSetup.GET(USERID);
                    IF RecUserSetup."Approuver OR S.Atelier DG" THEN
                      IF Intern AND ("Intern Type"="Intern Type"::"Soutien atelier DG") THEN
                        "Approval Intern Service Post":="Approval Intern Service Post"::Approuver
                      ELSE
                        MESSAGE('L OR %1 doit être interne de type Soutien atelier DG',"Reception No");
                end;
            }
            action("Approbation cadeau fidélité")
            {
                Image = Approve;

                trigger OnAction();
                begin
                    //KT 180817
                    RecUserSetup.GET(USERID);
                    IF RecUserSetup."Approuver cadeau fidélité" THEN
                      IF Intern AND ("Intern Type"="Intern Type"::"Cadeau Fidélité") THEN
                        "Approval Intern Service Post":="Approval Intern Service Post"::Approuver
                      ELSE
                        MESSAGE('L OR %1 doit être interne de type Cadeau Fidélité',"Reception No");
                end;
            }
            action("Approuver assurance transport")
            {
                CaptionML = ENU='Approuver RC sinistre transport',
                            FRA='Approuver RC sinistre transport';
                Image = Approve;

                trigger OnAction();
                begin
                    //KT 180817
                    RecUserSetup.GET(USERID);
                    IF RecUserSetup."Approuver assurance transport" THEN
                      IF "Assurances groupe" AND ("Type assurances groupe"="Type assurances groupe"::"Sinistre RC Transport") THEN
                        "App. Insuranc  Service Post":="App. Insuranc  Service Post"::Approuver
                      ELSE
                        MESSAGE('L OR %1 doit être assurance de type Sinistre RC Transport',"Reception No");
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        GetLastRepairForVin;
        CALCFIELDS("OR Entretien 10 000","OR Entretien 20 000","OR Entretien 30 000");
    end;

    trigger OnAfterGetRecord();
    begin
        InitTechnicalInfo;
        GetLastRepairForVin;
        RefreshFactBoxRejet ;
        CurrPage.LigneServRapide.PAGE.SetNumReception("Reception No");
        CALCFIELDS("OR Entretien 10 000","OR Entretien 20 000","OR Entretien 30 000");
        //IF "Model Code" = '' THEN
         // "Model Code" := RecGVehicule."Model Code" ;
    end;

    trigger OnClosePage();
    begin
        //<<--ADD NM 211116
        IF "Payment Method Code"="Payment Method Code"::Chéque THEN
          BEGIN
            TESTFIELD(RIB);
            TESTFIELD("Nom CH");
        END;
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        CurrPage.LigneServRapide.PAGE.SetNumReception("Reception No");
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
         "Service Type":="Service Type"::"Rapid Service";
    end;

    trigger OnOpenPage();
    begin

        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;


        InitTechnicalInfo;
        RefreshFactBoxRejet ;
    end;

    var
        RecGVehicule : Record "27";
        PageLigneRcp : Page "60020";
        RecGRecpetion : Record "60008";
        UserMgt : Codeunit "5700";
        RecUserSetup : Record "91";
        TXT50010 : Label 'Vous n''avez pas le droit d''annuler la suspension de la réception.';
        TXT50011 : Label 'Vous n''avez pas l''autorisation, merci de contacter l''administrateur système.';
        "RecDemandeRéparation" : Record "60067";
        TXT50012 : Label 'Cette fiche apartient à une demande de réparation, veuillez choisir "Commande Vehicule Interne Actif"';
        RecCustomer : Record "18";
        Controle : Record "60009";
        CommandedetravauxChrono : Report "70055";
        ControleExec : Record "60009";
        LastReceptionSAV : Record "60008";
        TXT50014 : Label 'Un ordre de réparation a été déjà créé pour le véhicule %1  OR: %2';
        GPageFicheretour : Page "60196";
        GPageFicheRCGarage : Page "60199";

    procedure InitTechnicalInfo();
    begin
        IF RecGVehicule.GET("Vehicle No.") THEN ;
    end;

    procedure RefreshFactBoxRejet();
    begin
        CurrPage.FactPRRejeter.PAGE.InitFilter("Reception No","Customer No.","Service Item No.");
        CurrPage.FactPRRejeter.PAGE.FillTable;
    end;

    local procedure GetLastRepairForVin();
    begin
        IF "Last repair No."='' THEN BEGIN
        LastReceptionSAV.RESET;
        LastReceptionSAV.SETRANGE(VIN,VIN);
        LastReceptionSAV.SETFILTER("Reception Date",'<=%1',"Reception Date");
        LastReceptionSAV.SETFILTER("Reception No",'<%1',"Reception No");
        LastReceptionSAV.SETCURRENTKEY("Reception No");
        LastReceptionSAV.ASCENDING(TRUE);
        IF LastReceptionSAV.FINDLAST THEN BEGIN
          "Last repair No.":=LastReceptionSAV."Reception No";
        END ELSE
          "Last repair No.":='';
        END;
    end;
}

