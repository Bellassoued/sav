page 60018 "Fiche Reception Grande Réparat"
{
    // version CT16V002

    // //TO DO Mettre le client facturé à jour lors de la validation de type

    CaptionML = ENU='Reception Big Repartion Card',
                FRA='Fiche Reception Grande Réparation';
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'Nouveau,Process,Etats,Consultation,Interne,Document,Category7,Category8,Category9';
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
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("N° OR Archive";"N° OR Archive")
                {
                    Caption = 'N° OR Archive';
                    ShowMandatory = true;
                    Style = Attention;
                    StyleExpr = TRUE;
                    Visible = ORArchiveVisible;
                }
                field(VIN;VIN)
                {
                    Editable = GBoolDocIsStillEditable;

                    trigger OnValidate();
                    begin
                        IF ("Status SR"<>"Status SR"::"Fiche Crée") AND ("Status SR"<>"Status SR"::Lancée) THEN
                          IF VIN<>xRec.VIN THEN
                            ERROR('Modification interdite, statut OR %1',"Status SR");
                        RecGServiceHeader.RESET;
                        RecGServiceHeader.SETRANGE("Reception No","Reception No");
                        IF "Reception No"<>'' THEN
                        IF RecGServiceHeader.FINDFIRST THEN
                          ERROR('Modification intedite après création %1', RecGServiceHeader."Document Type");
                        ReceptionSAV1.RESET;
                        ReceptionSAV1.SETRANGE(VIN,VIN);
                        ReceptionSAV1.SETFILTER("Reception No",'<>%1',"Reception No");
                        ReceptionSAV1.SETFILTER("Status SR",'<>%1',ReceptionSAV1."Status SR"::Facturée);
                        IF ReceptionSAV1.FINDFIRST THEN
                          MESSAGE(TXT50014,VIN,ReceptionSAV1."Reception No");
                        //KT 070817
                        FctVerifCampagne(0);
                        //END KT
                        //KT 230917
                        FctVerifGarantiePiece(0);
                        //ENDKT
                    end;
                }
                field(Matricule;Matricule)
                {
                    Editable = GBoolDocIsStillEditable;

                    trigger OnValidate();
                    begin
                        IF ("Status SR"<>"Status SR"::"Fiche Crée") AND ("Status SR"<>"Status SR"::Lancée) THEN
                          IF Matricule<>xRec.Matricule THEN
                            ERROR('Modification interdite, statut OR %1',"Status SR");
                        RecGServiceHeader.RESET;
                        RecGServiceHeader.SETRANGE("Reception No","Reception No");
                        IF RecGServiceHeader.FINDFIRST THEN
                          ERROR('Modification intedite après création %1', RecGServiceHeader."Document Type");
                        ReceptionSAV1.RESET;
                        ReceptionSAV1.SETRANGE(Matricule,Matricule);
                        ReceptionSAV1.SETFILTER("Status SR",'<>%1',ReceptionSAV1."Status SR"::Facturée);
                        IF ReceptionSAV1.FINDFIRST THEN
                         //TMPERROR
                          //Modification le nlocage par un message d'infomation suite la dmande de Citreon--NM040817
                          MESSAGE(TXT50014,Matricule,ReceptionSAV1."Reception No");
                        FctVerifCampagne(1);
                        //KT 211117
                        FctVerifGarantiePiece(1);
                        //END KT
                    end;
                }
                field("Service Item No.";"Service Item No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Model Code";"Model Code")
                {
                    Editable = false;
                }
                field("Service Item Description";"Service Item Description")
                {
                    Editable = false;
                }
                field("Variant Code";"Variant Code")
                {
                    Editable = false;
                    Importance = Additional;
                }
                field("Vehicle No.";"Vehicle No.")
                {
                    CaptionML = ENU='Vehicle No.',
                                FRA='Modéle';
                    Editable = false;
                    Visible = false;
                }
                field(Status;Status)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Status SR";"Status SR")
                {
                    Caption = 'Status OR';
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field(Priority;Priority)
                {
                    Editable = GBoolDocIsStillEditable;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(Kilométrage;Kilométrage)
                {
                    Editable = false;
                }
                field("Reception Date";"Reception Date")
                {
                    Editable = AgGarantie OR GBoolDocIsStillEditable;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Shipment date Request";"Shipment date Request")
                {
                    Editable = GBoolDocIsStillEditable;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field(Contact;Contact)
                {
                    Editable = GBoolDocIsStillEditable;
                }
                field("Phone No.";"Phone No.")
                {
                    CaptionML = ENU='Phone No.',
                                FRA='Téléphone';
                }
                field("Date Livraison";"Date Livraison")
                {
                    Editable = false;
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
                {
                    Editable = false;
                }
                field("Type d'intervention";"Type d'intervention")
                {
                    Visible = false;
                }
                field("Date Réparation";"Date Réparation")
                {
                    Visible = false;
                }
                field("Autoriser Travaux Sans Avance";"Autoriser Travaux Sans Avance")
                {
                    Editable = false;
                }
                field("Nbre Impressions";"Nbre Impressions")
                {
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Tél. Réceptionnaire";RecUserSetup."Phone No.")
                {
                    Editable = false;
                }
                field("Avance sur commande";"Avance sur commande")
                {
                }
                field("Type avance";"Type avance")
                {
                }
                group(Informations)
                {
                    Caption = 'Informations';
                    Editable = GBoolDocIsStillEditable;
                    field("Responsibility Center";"Responsibility Center")
                    {
                        Editable = false;
                    }
                    field("Created By";"Created By")
                    {
                        Editable = false;
                    }
                    field("Creation date";"Creation date")
                    {
                        CaptionML = ENU='Creation date',
                                    FRA=' Date création';
                        Editable = false;
                    }
                    field("Block/cancel reason";"Block/cancel reason")
                    {
                    }
                    field("Block/cancel Date";"Block/cancel Date")
                    {
                    }
                }
                group(WarrantyGrp)
                {
                    CaptionML = ENU='Atelier',
                                FRA='Atelier';
                    Editable = GBoolGarantieEditable;
                    field("Type de garantie";"Type de garantie")
                    {
                        Caption = 'Type OR';
                        Editable = GBoolTypeGarantiEditable;
                        Style = Strong;
                        StyleExpr = TRUE;

                        trigger OnValidate();
                        begin
                            //<<------NM070417--------
                            IF ("Type de garantie"="Type de garantie"::Compagne) THEN
                                VALIDATE("Sous Type de garantie",2);
                            IF ("Type de garantie"="Type de garantie"::"Payant par Client") THEN
                                VALIDATE("Sous Type de garantie",0);
                            IF ("Type de garantie"="Type de garantie"::" ") THEN
                                VALIDATE("Sous Type de garantie",0);
                            IF ("Type de garantie"="Type de garantie"::"Garantie  Prolongé") THEN
                                VALIDATE("Sous Type de garantie",1);
                            //>>------NM070417--------
                            //ADD KT 180417
                            GBoolWarranty:="Type de garantie"<>"Type de garantie"::"Payant par Client";
                            //END KT
                            //KT 170817
                            IF "Status SR"="Status SR"::"Commande Crée" THEN
                            CuSAVManagement.ModifySalesDocAccordingToRcpGrandRep(2,Rec,0);
                            //END KT
                        end;
                    }
                    field("Demande Garantie";"Demande Garantie")
                    {
                    }
                    part(ListVinCamp;70297)
                    {
                        CaptionML = ENU='Campagnes',
                                    FRA='Campagnes';
                        SubPageLink = VIN=FIELD(VIN);
                        SubPageView = WHERE(Traiter=CONST(No));
                        Visible = false;
                    }
                    field("N° campagne";"N° campagne")
                    {
                        Visible = false;

                        trigger OnValidate();
                        begin
                            CurrPage.UPDATE;
                        end;
                    }
                    field("Renoncer campagne";"Renoncer campagne")
                    {

                        trigger OnValidate();
                        var
                            LRecUserSetup : Record "91";
                            LRecControle : Record "60009";
                            LRecListVINCompagne : Record "50076";
                        begin
                            //
                            IF xRec."Renoncer campagne" THEN
                              ERROR('Opération interdite');
                            LRecUserSetup.GET(USERID);
                            IF NOT LRecUserSetup."Renoncer campagne" THEN
                              ERROR('Opération interdite pour l''utilisateur %1',USERID);
                            "Type de garantie":="Type de garantie"::"Payant par Client";
                            "Sous Type de garantie":="Sous Type de garantie"::" ";
                            LRecControle.RESET;
                            LRecControle.SETRANGE(Id,"Reception No");
                            IF LRecControle.FINDFIRST THEN BEGIN
                              LRecControle.VALIDATE(Kilometrage,LRecControle.Kilometrage);
                              LRecControle.MODIFY;
                            END ELSE BEGIN
                              "Type de garantie":="Type de garantie"::"Payant par Client";
                              "Sous Type de garantie":="Sous Type de garantie"::" ";
                            END;
                            CurrPage.UPDATE;
                            //KT 060917
                            LRecListVINCompagne.RESET;
                            LRecListVINCompagne.SETRANGE("Reception No.","Reception No");
                            IF LRecListVINCompagne.FINDSET THEN
                              LRecListVINCompagne.MODIFYALL("Reception No.",'');
                            "N° campagne":='';
                        end;
                    }
                    field(Warranty;Warranty)
                    {

                        trigger OnValidate();
                        begin
                            WhoWillPayForIt;
                        end;
                    }
                    field("Sous Type de garantie";"Sous Type de garantie")
                    {
                        Editable = true;
                        Visible = false;

                        trigger OnValidate();
                        begin
                            //<<------NM100417--------------------------------------
                            IF  ("Type de garantie"="Type de garantie"::"Payant par Client") THEN
                              IF ("Sous Type de garantie"<>"Sous Type de garantie"::" ") THEN
                                ERROR('Vous ne pouvez affecter aucun sous type garantie pour le type de garantie « Payant par Client');

                            IF  ("Type de garantie"="Type de garantie"::Compagne) THEN
                              IF ("Sous Type de garantie"<>"Sous Type de garantie"::Compagne) THEN
                                ERROR('Vous ne pouvez pas affecter un autre sous type garantie différnt de «Compagne»');

                            IF  ("Type de garantie"="Type de garantie"::"Garantie  Prolongé") THEN
                              IF ("Sous Type de garantie"="Sous Type de garantie"::Compagne) THEN
                                ERROR('Il ne peut pas affecter sous type de garantie «Compagne» pour le type de garantie suivant «Garantie Prolongé»');
                            //>>------NM100417--------------------------------------
                            //KT 170817
                            IF "Status SR"="Status SR"::"Commande Crée" THEN
                            CuSAVManagement.ModifySalesDocAccordingToRcpGrandRep(2,Rec,0);
                            //END KT
                        end;
                    }
                    field("Warranty End Date";"Warranty End Date")
                    {
                        Editable = false;
                    }
                    field("Approval Warranty Pick Request";"Approval Warranty Pick Request")
                    {
                        Editable = false;
                        Visible = false;
                    }
                    field("Approval Warranty Service Post";"Approval Warranty Service Post")
                    {
                        Editable = false;
                        Visible = false;
                    }
                    field("Warranty Status";"Warranty Status")
                    {
                        Editable = false;
                    }
                }
                group("Garantie pièces")
                {
                    Visible = GBoolFactureSourceVisible;
                    field("Facture vente source";"Facture vente source")
                    {
                        Lookup = true;
                    }
                    field("Pièces garantie";GTextFiltrePieces)
                    {
                        CaptionML = ENU='Pièces garantie',
                                    FRA='Pièces garantie';
                        Lookup = true;
                        Visible = false;

                        trigger OnLookup(Text : Text) : Boolean;
                        var
                            LRecSalesLine : Record "37";
                            LPageSalesLines : Page "516";
                        begin
                            LRecSalesLine.RESET;
                            LRecSalesLine.SETRANGE("Document No.","Facture vente source");
                            LRecSalesLine.SETRANGE(Type,LRecSalesLine.Type::Item);
                            IF LRecSalesLine.FINDSET THEN BEGIN
                              LPageSalesLines.LOOKUPMODE(TRUE);
                              LPageSalesLines.SETRECORD(LRecSalesLine);
                              LPageSalesLines.SETTABLEVIEW(LRecSalesLine);
                              IF LPageSalesLines.RUNMODAL=ACTION::LookupOK THEN BEGIN
                                LPageSalesLines.GETRECORD(LRecSalesLine);
                                IF GTextFiltrePieces='' THEN
                                  GTextFiltrePieces+=FORMAT(LRecSalesLine."No.")
                                ELSE
                                  GTextFiltrePieces+='|'+FORMAT(LRecSalesLine."No.");
                              END;
                            END;
                        end;
                    }
                    field("Client ";"Name 2")
                    {
                        CaptionML = ENU='Client',
                                    FRA='Client';
                    }
                }
                group(Retour)
                {
                    Caption = 'Retour';
                    Editable = GBoolRetourEditable;
                    field(Retour1;Retour)
                    {
                        Caption = 'Retour';

                        trigger OnValidate();
                        begin
                            //<<----NM120417----------
                            IF Retour=FALSE THEN
                              VALIDATE("No Réception Origine",'');
                            //>>----NM120417----------
                            //ADD KT 20042017
                            WhoWillPayForIt;
                            //KT 170817
                            IF "Status SR"="Status SR"::"Commande Crée" THEN
                            CuSAVManagement.ModifySalesDocAccordingToRcpGrandRep(2,Rec,0);
                            //END KT
                        end;
                    }
                    field("No Réception Origine";"No Réception Origine")
                    {
                        Caption = 'Num OR Origine';
                        LookupPageID = "Liste Reception Grande Réparat";
                        Style = StrongAccent;
                        StyleExpr = TRUE;
                        Visible = true;
                    }
                }
                group()
                {
                    Editable = GBoolRetourEditable;
                    Visible = GBoolAppRetVisible;
                    field("Approval Return Pick Request";"Approval Return Pick Request")
                    {
                        Caption = 'Approbation Demande Pièce';
                    }
                }
                group(Interne)
                {
                    Caption = 'Interne';
                    Editable = GBoolInterneEditable;
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
                            //ADD KT 20042017
                            WhoWillPayForIt;
                            //END KT
                            //KT 170817
                            IF "Status SR"="Status SR"::"Commande Crée" THEN
                            CuSAVManagement.ModifySalesDocAccordingToRcpGrandRep(2,Rec,0);
                            //END KT
                        end;
                    }
                    field("Intern Type";"Intern Type")
                    {
                        Editable = true;
                        Visible = true;

                        trigger OnValidate();
                        begin
                            //KT 170817
                            IF "Status SR"="Status SR"::"Commande Crée" THEN
                            CuSAVManagement.ModifySalesDocAccordingToRcpGrandRep(2,Rec,0);
                            //END KT
                        end;
                    }
                }
                group("Assurance ")
                {
                    Caption = 'Assurance';
                    Editable = GBoolRCGarageEditable;
                    field("Assurances groupe";"Assurances groupe")
                    {

                        trigger OnValidate();
                        begin
                            //ADD KT 140617
                            WhoWillPayForIt;
                            //END KT
                            //KT 170817
                            IF "Status SR"="Status SR"::"Commande Crée" THEN
                            CuSAVManagement.ModifySalesDocAccordingToRcpGrandRep(2,Rec,0);
                            //END KT
                        end;
                    }
                    field("RC Garage";"RC Garage")
                    {
                        Style = StrongAccent;
                        StyleExpr = TRUE;
                        Visible = false;

                        trigger OnValidate();
                        begin
                            //ADD KT 20042017
                            WhoWillPayForIt;
                            //END KT
                        end;
                    }
                    field("Type assurances groupe";"Type assurances groupe")
                    {
                        Editable = "Assurances groupe";

                        trigger OnValidate();
                        begin
                            IF "Type assurances groupe"="Type assurances groupe"::"RC Garage" THEN
                              GBoolOrOrigineVisible:=TRUE
                            ELSE
                              GBoolOrOrigineVisible:=FALSE;
                            //KT 170817
                            IF "Status SR"="Status SR"::"Commande Crée" THEN
                            CuSAVManagement.ModifySalesDocAccordingToRcpGrandRep(2,Rec,0);
                            //END KT
                        end;
                    }
                    group()
                    {
                        field("Type avarie";"Type avarie")
                        {
                            Editable = true;
                        }
                        field("Clinet facturé transport avari";"Clinet facturé transport avari")
                        {
                            CaptionML = ENU='Clinet facturé transport avarie',
                                        FRA='Clinet facturé transport avarie';
                            Editable = false;
                        }
                    }
                }
                group()
                {
                    Visible = GBoolOrOrigineVisible;
                    field(RecOrigine;"No Réception Origine RC")
                    {
                        Caption = 'Num OR Origine';
                        LookupPageID = "Liste Reception Grande Réparat";
                        Style = StrongAccent;
                        StyleExpr = TRUE;
                    }
                }
                group()
                {
                    Visible = GBoolOrOrigineVisible;
                    field("Approval RC";"Approval Return Pick Request")
                    {
                        Caption = 'Approbation Demande Pièce';
                    }
                }
                group("Assurance conventionnée")
                {
                    CaptionML = ENU='Assurances conventionnées',
                                FRA='Assurance conventionnée';
                    Editable = GBoolAssConvEditable;
                    field("Assurances conventionnées";"Assurances conventionnées")
                    {

                        trigger OnValidate();
                        begin
                            WhoWillPayForIt;
                        end;
                    }
                    field("Code assureur conventionné";"Code assureur conventionné")
                    {

                        trigger OnValidate();
                        begin
                            //KT 170817
                            IF "Status SR"="Status SR"::"Commande Crée" THEN
                            CuSAVManagement.ModifySalesDocAccordingToRcpGrandRep(2,Rec,0);
                            //END KT
                        end;
                    }
                    field("Nom assureur conventionné";"Nom assureur conventionné")
                    {
                    }
                }
                field("Commentaire SAV";"Commentaire SAV")
                {
                }
                group("Informations Règlement")
                {
                    Enabled = GBoolDocIsStillEditable;
                    field("Payment Method Code";"Payment Method Code")
                    {
                    }
                    field(RIB;RIB)
                    {
                    }
                    field("Nom CH";"Nom CH")
                    {
                        CaptionML = ENU='<No CH:>',
                                    FRA='No CH:';
                    }
                    field("Num BC";"Num BC")
                    {
                    }
                    field("Report blocage (jours)";"Report blocage (jours)")
                    {
                    }
                }
            }
            part(Pannes;60064)
            {
                Caption = 'Effet Client';
                Editable = GBoolDocIsStillEditable OR AgGarantie;
                SubPageLink = Reception No=FIELD(Reception No);
            }
            part(LDT;70101)
            {
                Caption = 'Tavaux Atelier';
                Editable = GBoolDocIsStillEditable OR AgGarantie;
                SubPageLink = Reception No=FIELD(Reception No);
                SubPageView = WHERE(Garantie=FILTER(No),
                                    Type Effet CLT=FILTER(LDT));
            }
            group("Information Vente")
            {
                Editable = GBoolDocIsStillEditable AND GBoolClientModifiable;
                field("Customer No.";"Customer No.")
                {
                    Editable = false;
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
                    CaptionML = ENU='Country/Region Code',
                                FRA='Pays/code Région';
                }
                field("Code Titre Client";"Code Titre Client")
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
                field("Response Time (Hours)";"Response Time (Hours)")
                {
                }
                field("Installation Date";"Installation Date")
                {
                }
                field("Sales Date";"Sales Date")
                {
                }
                field("Original Invoice No";"Original Invoice No")
                {
                }
                field("Invoice Date";"Invoice Date")
                {
                }
                field("Sell-to Contact No.";"Sell-to Contact No.")
                {
                }
                field("Order No";"Order No")
                {
                }
                field("Shipment No";"Shipment No")
                {
                }
                field("Salesperson No";"Salesperson No")
                {
                }
                field("Salesperson Name";"Salesperson Name")
                {
                }
            }
            group("Information Techniques")
            {
                Editable = false;
                field(RecFicheTechnique."Model Code";RecFicheTechnique."Model Code")
                {
                    CaptionML = ENU='Model Code',
                                FRA='Code Modèle';
                }
                field(RecFicheTechnique."Emissions Test Category Code";RecFicheTechnique."Emissions Test Category Code")
                {
                    CaptionML = ENU='Emissions Test Category Code',
                                FRA='Code catégorie test échappement';
                }
                field(RecFicheTechnique."MVEG Consumption";RecFicheTechnique."MVEG Consumption")
                {
                    CaptionML = ENU='MVEG Consumption',
                                FRA='Consommation MVEG';
                }
                field(RecFicheTechnique."Engine Type Code";RecFicheTechnique."Engine Type Code")
                {
                    CaptionML = ENU='Engine Type Code',
                                FRA='Code Type Moteur';
                }
                field(RecFicheTechnique."Transmission Type Code";RecFicheTechnique."Transmission Type Code")
                {
                    CaptionML = ENU='Transmission Type Code',
                                FRA='Code Type transmission';
                }
                field(RecFicheTechnique."Cylinder Capacity (ccm)";RecFicheTechnique."Cylinder Capacity (ccm)")
                {
                    CaptionML = ENU='Cylinder Capacity (ccm)',
                                FRA='Cylindrée (cc)';
                }
                field(RecFicheTechnique."No. of Cylinders";RecFicheTechnique."No. of Cylinders")
                {
                    CaptionML = ENU='No. of Cylinders',
                                FRA='Nbre cylindres';
                }
                field(RecFicheTechnique."Power (kW)";RecFicheTechnique."Power (kW)")
                {
                    CaptionML = ENU='Power (kW)',
                                FRA='Puissance (KW)';
                }
                field(RecFicheTechnique."Power (hp)";RecFicheTechnique."Power (hp)")
                {
                    CaptionML = ENU='Power (hp)',
                                FRA='Puissance (CH)';
                }
                field(RecFicheTechnique.Tires;RecFicheTechnique.Tires)
                {
                    CaptionML = ENU='Tires',
                                FRA='Pneus';
                }
                field(RecFicheTechnique."Empty Weight (kg)";RecFicheTechnique."Empty Weight (kg)")
                {
                    CaptionML = ENU='Empty Weight (kg)',
                                FRA='Poids vide (KG)';
                }
                field(RecFicheTechnique."Total Weight (kg)";RecFicheTechnique."Total Weight (kg)")
                {
                    CaptionML = ENU='Total Weight (kg)',
                                FRA='Poids total (KG)';
                }
                field(RecFicheTechnique."Roof Load (kg)";RecFicheTechnique."Roof Load (kg)")
                {
                    CaptionML = ENU='Roof Load (kg)',
                                FRA='Charge toit (KG)';
                }
                field(RecFicheTechnique."Trailer Load (kg)";RecFicheTechnique."Trailer Load (kg)")
                {
                    CaptionML = ENU='Trailer Load (kg)',
                                FRA='Charge remorque (KG)';
                }
                field(RecFicheTechnique."Trailer Tongue Load (kg)";RecFicheTechnique."Trailer Tongue Load (kg)")
                {
                    CaptionML = ENU='Trailer Tongue Load (kg)',
                                FRA='Capacité de charge (KG)';
                }
                field(RecFicheTechnique."4WD";RecFicheTechnique."4WD")
                {
                    CaptionML = ENU='4WD',
                                FRA='Tous terrains';
                }
                field(RecFicheTechnique."No. of Axles";RecFicheTechnique."No. of Axles")
                {
                    CaptionML = ENU='No. of Axles',
                                FRA='Nbre essieux';
                }
                field(RecFicheTechnique."Wheelbase (mm)";RecFicheTechnique."Wheelbase (mm)")
                {
                    CaptionML = ENU='Wheelbase (mm)',
                                FRA='Distance de roues (mm)';
                }
                field(RecFicheTechnique."Front Axle Load (kg)";RecFicheTechnique."Front Axle Load (kg)")
                {
                    CaptionML = ENU='Front Axle Load (kg)',
                                FRA='Charge axe avant (KG)';
                }
                field(RecFicheTechnique."Rear Axle Load (kg)";RecFicheTechnique."Rear Axle Load (kg)")
                {
                    CaptionML = ENU='Rear Axle Load (kg)',
                                FRA='Charge essieu arrière (KG)';
                }
                field(RecFicheTechnique."No. of Doors";RecFicheTechnique."No. of Doors")
                {
                    CaptionML = ENU='No. of Doors',
                                FRA='Nbre portes';
                }
                field(RecFicheTechnique."Fiscal Power";RecFicheTechnique."Fiscal Power")
                {
                    CaptionML = ENU='Fiscal Power',
                                FRA='Puissance fiscal';
                }
            }
            group("Information Achat")
            {
                Editable = false;
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
        }
        area(factboxes)
        {
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
                UpdatePropagation = Both;
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
                SubPageLink = Reception No=FIELD(Last repair No.),
                              VIN=FIELD(VIN);
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
                action("Autoriser Travaux Sans Avance")
                {
                    Image = AvailableToPromise;

                    trigger OnAction();
                    begin
                        //SM MAZDA855
                        VALIDATE("Autoriser Travaux Sans Avance",TRUE);
                        //END MAZDA855
                    end;
                }
                action("Contrôle Visuel")
                {
                    CaptionML = ENU='Visual Control',
                                FRA='Contrôle Visuel';
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        PageControlVisule : Page "60012";
                        RecControl : Record "60009";
                    begin
                        //--> Appel au contrôle Visuel
                        //GIntPAgeID
                        IF CURRENTCLIENTTYPE=CLIENTTYPE::Windows THEN
                          GIntPAgeID:=60012
                          ELSE
                          GIntPAgeID:=60192;
                        RecControl.RESET;
                        IF RecControl.GET("Reception No") THEN BEGIN
                              //60192
                                PAGE.RUNMODAL(GIntPAgeID,RecControl);
                            END
                        ELSE BEGIN
                              //60192
                                RecControl.INIT;
                                RecControl.Id:="Reception No";
                                RecControl."Cree par":=USERID;
                                RecControl."Date de Creation":=WORKDATE;
                                RecControl.INSERT(TRUE);
                                PAGE.RUN(GIntPAgeID,RecControl);
                            END;
                    end;
                }
                action("Contrôle Qualité")
                {
                    CaptionML = ENU='Visual Control',
                                FRA='Contrôle Qualité';
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        PageControlVisuleQ : Page "50128";
                        RecControlQ : Record "50094";
                    begin
                        //--> Appel au contrôle Qualité
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Contôle qualité" THEN BEGIN
                        IF CURRENTCLIENTTYPE=CLIENTTYPE::Windows THEN
                          GIntPAgeID:=50128
                          ELSE
                          GIntPAgeID:=60193;
                        RecControlQ.RESET;
                        IF RecControlQ.GET("Reception No") THEN
                            BEGIN
                                PAGE.RUNMODAL(GIntPAgeID,RecControlQ);
                            END
                        ELSE
                            BEGIN
                                RecControlQ.INIT;
                                RecControlQ.No:="Reception No";
                                //<< KT 09112016 SAV00020
                                //TESTFIELD("Order No");
                                GRecServiceHeader.RESET;
                                GRecServiceHeader.SETRANGE("Document Type",GRecServiceHeader."Document Type"::Order);
                                GRecServiceHeader.SETRANGE("Reception No","Reception No");
                                GRecServiceHeader.FINDFIRST;
                                // RecControlQ."N° Commande de travaux":=GRecServiceHeader."No.";
                                //--> Donnée Date         RecControl."Date de Creation":=
                                RecControlQ.INSERT;
                                //70105
                                PAGE.RUN(GIntPAgeID,RecControlQ);
                            END;
                        END ELSE ERROR ('Vous n''avez pas le droit');
                    end;
                }
                action("CITROËN SERVICE")
                {
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    Visible = false;

                    trigger OnAction();
                    begin
                        HYPERLINK('https://networkservice.citroen.com/');
                    end;
                }
                action("Suivi Essai Sur Route ")
                {
                    Caption = 'Suivi Essai Sur Route';
                    Image = GanttChart;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        
                        //KT 14032017
                            RecUserSetup.GET(USERID);
                              IF RecUserSetup."Suivi essai sur route" THEN BEGIN
                              RECESSAI.RESET;
                              RECESSAI.SETRANGE("No.","Reception No");
                              IF RECESSAI.FINDSET THEN;
                              CLEAR(ListeSuiviEssaisurRoute);
                              ListeSuiviEssaisurRoute.SETRECORD(RECESSAI);
                              ListeSuiviEssaisurRoute.SETTABLEVIEW(RECESSAI);
                              ListeSuiviEssaisurRoute.RUNMODAL;
                            END ELSE MESSAGE(TXT50013,USERID);
                        //END KT
                        /*//--> Appel au suivi Essai ROUTE
                            IF RECESSAI.GET("Reception No") THEN
                               BEGIN
                                    PAGE.RUNMODAL(70100,RECESSAI);
                               END
                            ELSE
                               BEGIN
                                    RECESSAI.INIT;
                                    RECESSAI.Id:="Reception No";
                                    //--> Donnée Date         RECESSAI."Date de Creation":=
                                    RECESSAI.INSERT;
                                    PAGE.RUN(70100,RECESSAI);
                               END;
                        //<-- Appel au suivi Essai ROUTE
                        */

                    end;
                }
                action(Annuler)
                {
                    Image = Cancel;
                    Promoted = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    Visible = true;

                    trigger OnAction();
                    begin
                        //ERROR('Annulation interdite');
                        IF "Nbre Impressions" > 1 THEN
                          ERROR('Vous avez déja imprimer l''ordre de réparation');

                        IF "Status SR"<2 THEN
                        "Status SR":="Status SR"::Annulé;
                    end;
                }
                action("Annuler Suspension")
                {
                    Caption = 'Annuler Suspension';
                    Image = Cancel;

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
            group("&Document")
            {
                action("Crée Commande")
                {
                    Image = CreateDocuments;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = GBoolDocIsStillEditable;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                        RecCustomer : Record "18";
                    begin
                        //KT 20042017 Tests avant création commande
                        PreDocumentCreationTest('commande');
                        // END KT
                        //SM 061115
                        RecCustomer.GET("Customer No.");
                        IF NOT RecCustomer."Bloqué SAV" THEN
                        //END SM

                        //SM MAZDA444
                        CuSAVManagement.CreateSalesDocFromRcpGrandRep(2,Rec,0,0);
                    end;
                }
                action("Crée Devis")
                {
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = GBoolDocIsStillEditable;

                    trigger OnAction();
                    var
                        RecCustomer : Record "18";
                    begin
                        //SM 061115
                        PreDocumentCreationTest('devis');
                        RecCustomer.GET("Customer No.");
                        IF NOT RecCustomer."Bloqué SAV" THEN
                        //END SM
                        //<<---NM120417----controle si OR est de type RETOUR-------
                        IF Retour=TRUE THEN
                        BEGIN
                          RecUserSetup.GET(USERID);
                          IF NOT RecUserSetup."Autoriser Retour Sans N.OR." THEN
                            TESTFIELD("No Réception Origine");
                        END;
                        IF (Retour=TRUE) THEN
                            ERROR('Vous ne pouvez pas créer un Devis sans approbation retour ,veuillez contacter le Service Qualité !!!');
                        //>>---NM120417----controle si OR est de type RETOUR-------

                        //SM MAZDA444
                        CuSAVManagement.CreateSalesDocFromRcpGrandRep(1,Rec,0,0);
                    end;
                }
                action("Crée Commande AVARIE")
                {
                    Caption = 'Crée Commande Véhicule AVARIE';
                    Image = CreateDocuments;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    Visible = false;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                    begin
                        //SM 290419
                        TESTFIELD("Vehicle No.");
                        //END SM
                        //SM MAZDA444
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Autoris. defaclquer Fact. serv" THEN
                          ERROR(TXT50011);
                        //<<---NM060417---
                        IF ("Assurances groupe"=TRUE) THEN
                        TESTFIELD("Type assurances groupe");
                        IF "Type assurances groupe"<>"Type assurances groupe"::Avarie THEN
                        ERROR('Le type assurance groupe doit être « AVARIE »');
                        //>>---NM060417---
                        CuSAVManagement.CreateSalesDocFromRcpGrandRep(2,Rec,1,2);
                    end;
                }
                action("Crée Devis  AVARIE")
                {
                    Caption = 'Crée Devis  AVARIE';
                    Image = Quote;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category5;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //SM 290419
                        TESTFIELD("Vehicle No.");
                        //END SM

                        //SM MAZDA444
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Autoris. defaclquer Fact. serv" THEN
                          ERROR(TXT50011);

                        //<<---NM060417---
                        IF ("Assurances groupe"=TRUE) THEN
                        TESTFIELD("Type assurances groupe");
                        IF "Type assurances groupe"<>"Type assurances groupe"::Avarie THEN
                        ERROR('Le type assurance groupe doit être « AVARIE »');
                        //>>---NM060417---
                        CuSAVManagement.CreateSalesDocFromRcpGrandRep(1,Rec,1,3);
                    end;
                }
                action("Crée Véhicule")
                {
                    Image = Delivery;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;

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
                    Caption = 'Consulter Client';
                    Image = NewCustomer;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecCustomer : Record "18";
                    begin
                        //---> Fonction dans Rec pour crée Client
                          CreateCustomer();
                    end;
                }
                action("Crée Fiche de Garantie")
                {
                    Image = WarrantyLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        //SM MAZDA19
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Créer fiche garantie" THEN
                          IF ("Type de garantie"="Type de garantie"::"Garantie  Constructeur")
                            OR ("Type de garantie"="Type de garantie"::"Garantie  Constructeur+Campagne")
                            OR ("Type de garantie"="Type de garantie"::"Garantie  Prolongé") THEN
                          CreateWarrantyCard;
                        //SM
                    end;
                }
                action("Sélectionner campagnes de rappel")
                {
                    Image = SelectLineToApply;

                    trigger OnAction();
                    var
                        LRecListVINCompagne : Record "50076";
                        LPageListVINCompagne : Page "70285";
                    begin

                        CLEAR(LPageListVINCompagne);
                        LRecListVINCompagne.RESET;
                        FILTERGROUP(0);

                        LRecListVINCompagne.SETRANGE(VIN,VIN);
                        FILTERGROUP(2);
                        LPageListVINCompagne.FctSetReceptionNo("Reception No");
                        LPageListVINCompagne.FctSetSelectability(TRUE);
                        //LPageListVINCompagne
                        //LRecListVINCompagne.SETRANGE(Traiter,FALSE);
                        LRecListVINCompagne.SETFILTER("Reception No.",'%1|%2','',"Reception No");
                        IF ("Type de garantie"="Type de garantie"::Compagne) OR ("Type de garantie"="Type de garantie"::"Garantie  Constructeur+Campagne") THEN
                        IF LRecListVINCompagne.FINDSET THEN BEGIN
                          LPageListVINCompagne.SETRECORD(LRecListVINCompagne);
                          LPageListVINCompagne.SETTABLEVIEW(LRecListVINCompagne);
                          LPageListVINCompagne.RUNMODAL;
                        END;
                    end;
                }
            }
            group("&Interne")
            {
                action("Crée Commande Voiture de Service")
                {
                    Caption = 'Crée Commande Vehicule Voiture de Service';
                    Image = CreateDocuments;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                    begin
                        //SM MAZDA444
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Autoris. defaclquer Fact. serv" THEN
                          ERROR(
                          TXT50011);
                        //<<---NM060417---
                        IF (Intern=TRUE) THEN
                        TESTFIELD("Intern Type");
                        IF ("Intern Type"<>"Intern Type"::"Interne Commercial") AND ("Intern Type"<>"Intern Type"::"Voiture de Service Auto") THEN
                        ERROR('Le type interne doit être « Voiture de Service »');
                        //>>---NM060417---
                        CuSAVManagement.CreateSalesDocFromRcpGrandRep(2,Rec,1,1);
                    end;
                }
                action("Crée Commande Interne Commerciale")
                {
                    Image = CreateDocuments;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                    begin

                        //SM MAZDA444
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Autoris. defaclquer Fact. serv" THEN
                          ERROR(TXT50011);

                        //<<---NM060417---
                        IF ("Assurances groupe"=TRUE) THEN
                        TESTFIELD("Intern Type");
                        IF "Intern Type"<>"Intern Type"::"Interne  Atelier" THEN
                        ERROR('Le type interne doit être « Interne Commercial »');
                        //>>---NM060417---
                        CuSAVManagement.CreateSalesDocFromRcpGrandRep(2,Rec,1,3);
                    end;
                }
                action("Crée Devis Voiture de Service")
                {
                    Caption = 'Crée Devis Vehicule Voiture de Service';
                    Image = Quote;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category5;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //SM MAZDA444
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Autoris. defaclquer Fact. serv" THEN
                          ERROR(TXT50011);
                        //<<---NM060417---
                        IF (Intern=TRUE) THEN
                        TESTFIELD("Type assurances groupe");
                        IF ("Intern Type"<>"Intern Type"::"Interne Commercial") AND ("Intern Type"<>"Intern Type"::"Voiture de Service Auto") THEN
                        ERROR('Le type interne doit être « Voiture de Service »');
                        //>>---NM060417---
                        CuSAVManagement.CreateSalesDocFromRcpGrandRep(1,Rec,1,1);
                    end;
                }
                action("Crée Devis Interne Commerciale")
                {
                    Caption = 'Crée Devis Interne Commerciale';
                    Image = Quote;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //SM MAZDA444
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Autoris. defaclquer Fact. serv" THEN
                          ERROR(TXT50011);
                        //<<---NM060417---
                        IF (Intern=TRUE) THEN
                        TESTFIELD("Intern Type");
                        IF "Intern Type"<>"Intern Type"::"Interne  Atelier" THEN
                        ERROR('Le type interne doit être « Interne Commercial »');
                        //>>---NM060417---
                        CuSAVManagement.CreateSalesDocFromRcpGrandRep(1,Rec,1,2);
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


                        RecGRecpetion.COPY(Rec);
                        RecGRecpetion.FILTERGROUP(2);
                        RecGRecpetion.SETRANGE(RecGRecpetion.VIN,VIN);
                        RecGRecpetion.SETFILTER("Reception No",'<>%1',"Reception No");
                        //RecGRecpetion.SETRANGE("Service Type",RecGRecpetion."Service Type"::"Big Service");
                        RecGRecpetion.FILTERGROUP(0);

                        PAGE.RUN(PAGE::"Historique SAV",RecGRecpetion);
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
        area(navigation)
        {
            group("&Consultation")
            {
                action("Consulter Devis")
                {
                    Caption = 'Consulter Devis';
                    Image = ServiceLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = GBoolDocIsStillEditable;

                    trigger OnAction();
                    var
                        RecLServiceHeader : Record "5900";
                        PageLServiceQuote : Page "5964";
                    begin
                        PreDocumentCreationTest('devis');

                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Document Type",RecLServiceHeader."Document Type"::Quote);
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Reception No","Reception No");
                        IF RecLServiceHeader.FINDFIRST THEN BEGIN
                           IF NOT RecLServiceHeader."Forcer client facturé" THEN
                              CuSAVManagement.ModifySalesDocAccordingToRcpGrandRep(1,Rec,0);
                          CLEAR(PageLServiceQuote);
                          PageLServiceQuote.SETRECORD(RecLServiceHeader);
                          PageLServiceQuote.SETTABLEVIEW(RecLServiceHeader);
                          PageLServiceQuote.RUN;
                          //PAGE.RUN(PAGE::"Service Quote",RecLServiceHeader);
                          END;
                    end;
                }
                action("Consulter Commande")
                {
                    Caption = 'Consulter Commande';
                    Image = ServiceLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = GBoolDocIsStillEditable;

                    trigger OnAction();
                    var
                        RecLServiceHeader : Record "5900";
                        LPageServiceOrder : Page "5900";
                    begin
                        PreDocumentCreationTest('commande');
                        //MESSAGE('%1 "Reception No"',"Reception No");
                        IF ("Type de garantie"="Type de garantie"::"Garantie  Constructeur") OR ("Type de garantie"="Type de garantie"::"Garantie  Prolongé") THEN
                          TESTFIELD(Warranty,TRUE);
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Document Type",RecLServiceHeader."Document Type"::Order);
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Reception No","Reception No");
                        IF RecLServiceHeader.FINDFIRST THEN BEGIN
                          // ZMN 19/10/20017 TMP apres validation Arous
                          IF NOT RecLServiceHeader."Forcer client facturé" THEN
                          CuSAVManagement.ModifySalesDocAccordingToRcpGrandRep(2,Rec,0);

                          CLEAR(LPageServiceOrder);
                          RecLServiceHeader.FINDFIRST;
                          LPageServiceOrder.SETRECORD(RecLServiceHeader);
                          LPageServiceOrder.SETTABLEVIEW(RecLServiceHeader);
                          LPageServiceOrder.FctFacturationEssai;
                          LPageServiceOrder.FctInsertLigneFrais(RecLServiceHeader);
                          //SM
                         // PAGE.RUN(PAGE::"Service Order",RecLServiceHeader);
                          LPageServiceOrder.RUN;
                        END ELSE
                          MESSAGE('Aucune commande commande créée pour l''ordre de réparation %1',"Reception No");
                    end;
                }
                action("Consulter Fiche Véhicule")
                {
                    Image = ServiceItem;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;
                    RunObject = Page 5980;
                    RunPageLink = Serial No.=FIELD(VIN);
                    RunPageView = SORTING(Item No.,Serial No.)
                                  ORDER(Ascending);
                }
                action("Consulter Fiche de Garantie")
                {
                    Image = WarrantyLedger;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        //SM MAZDA19
                        IF Warranty THEN
                          PAGE.RUNMODAL(PAGE::"Warranty Card",Rec)
                        ELSE ERROR(TXT50009);
                        //END SM
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
                        GRecUserSetup.GET(USERID);
                        IF (GRecUserSetup."Chef atelier" OR GRecUserSetup."Chef équipe atelier" OR GRecUserSetup."Responsable SAV")OR(GRecUserSetup."Approbation Garantie") THEN BEGIN
                          IF Retour=TRUE THEN BEGIN
                            RecUserSetup.GET(USERID);
                            IF NOT RecUserSetup."Autoriser Retour Sans N.OR." THEN
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
                        GRecUserSetup.GET(USERID);
                        IF (GRecUserSetup."Chef atelier" OR GRecUserSetup."Chef équipe atelier" OR GRecUserSetup."Responsable SAV") OR(GRecUserSetup."Approbation Garantie") THEN BEGIN
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
                action("Approbation OR interne atelier")
                {
                    Image = WorkCenter;

                    trigger OnAction();
                    begin
                        //KT 180817
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Approuver OR interne atelier" THEN
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
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Approuver OR interne comm." THEN
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
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Approuver OR S.Commercial DG" THEN
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
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Approuver OR S.Atelier DG" THEN
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
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Approuver cadeau fidélité" THEN
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
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Approuver assurance transport" THEN
                          IF "Assurances groupe" AND ("Type assurances groupe"="Type assurances groupe"::"Sinistre RC Transport") THEN
                            "App. Insuranc  Service Post":="App. Insuranc  Service Post"::Approuver
                          ELSE
                            MESSAGE('L OR %1 doit être assurance de type Sinistre RC Transport',"Reception No");
                    end;
                }
                action("Approuver interne VS Auto")
                {
                    CaptionML = ENU='Approuver interne VS Auto',
                                FRA='Approuver interne VS Auto';
                    Image = Approve;

                    trigger OnAction();
                    begin
                        //KT 180817
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Approuver OR interne" THEN
                          IF Intern AND ("Intern Type"="Intern Type"::"Voiture de Service Auto") THEN
                            "Approval Intern Service Post":="Approval Intern Service Post"::Approuver
                          ELSE
                            MESSAGE('L OR %1 doit être assurance de type voiture de service Auto',"Reception No");
                    end;
                }
                action("Approuver Garantie Prolongée")
                {
                    Image = WarrantyLedger;
                    Visible = false;

                    trigger OnAction();
                    begin
                        GRecUserSetup.GET(USERID);
                        IF GRecUserSetup."Créer OR garantie prolongée" THEN BEGIN
                          VALIDATE("Type de garantie","Type de garantie"::"Garantie  Prolongé");
                          "Garantie prolongée exception":=TRUE;
                          END
                        ELSE
                          ERROR('Vous ne pouvez pas chnager le type de garantie! Merci de contacter votre administrateur.');
                    end;
                }
            }
        }
        area(reporting)
        {
            group("&Documents")
            {
                action("Imprimer Ordre de réparation")
                {
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecRecpetionSav : Record "60008";
                    begin
                        ReceptionSAVREC.RESET;
                        ReceptionSAVREC.SETRANGE("Reception No","Reception No");
                        IF ReceptionSAVREC.FINDFIRST THEN BEGIN

                          REPORT.RUN(50112,TRUE,TRUE,ReceptionSAVREC);
                          //REPORT.RUN(REPORT::"Cmd Service Grand Rep",FALSE,FALSE,RecRecpetionSav);
                          "Nbre Impressions"+=1;
                          MODIFY;
                          CurrPage.UPDATE;
                        END ELSE
                          MESSAGE('Pas de contrôle visuel pour OR %1',"Reception No");
                    end;
                }
                action("Imprimer Cpl Ordre de réparation")
                {
                    CaptionML = ENU='Imprimer Cpl Ordre de réparation',
                                FRA='Imprimer Complément Ordre de réparation';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecRecpetionSav : Record "60008";
                    begin
                        //AK 010519
                        ReceptionSAVREC.RESET;
                        //Control.SETRANGE(Id,Id);
                        ReceptionSAVREC.SETRANGE("Reception No","Reception No");
                        ReceptionSAVREC.FINDFIRST;
                        REPORT.RUN(50109,TRUE,TRUE,ReceptionSAVREC);
                    end;
                }
                action("Imprimer Bon de Sortie")
                {
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";
                    Visible = true;

                    trigger OnAction();
                    begin
                        //AK230419
                        //IF "Status SR" = "Status SR"::"Facturée" THEN
                        /*
                        RecSav.RESET;
                        RecSav.SETRANGE("Reception No","Reception No");
                        RecSav.SETFILTER("Status SR",'%1|%2',"Status SR"::Facturée,"Status SR"::Livré);
                        RecSav.FINDFIRST;
                        */
                        RecSav.RESET;
                        
                        //RecSav.SETFILTER("Status SR",'%1|%2',"Status SR"::Facturée,"Status SR"::Livré);
                        RecSav.SETRANGE(VIN,VIN);
                        RecSav.SETRANGE("Reception No","Reception No");
                        IF RecSav.FINDSET THEN
                          REPEAT
                            IF (RecSav."Status SR" <> RecSav."Status SR"::Facturée) AND (RecSav."Status SR" <> RecSav."Status SR"::Livré) AND (RecSav."Status SR" <> RecSav."Status SR"::Annulé) AND (RecSav."Status SR" <> RecSav."Status SR"::Suspendu) THEN
                              ERROR('Vous ne pouvez pas imprimer le bon de sortie car il existe un ou plusieurs OR non encore validé(s) !');
                          UNTIL RecSav.NEXT=0;
                        
                        REPORT.RUN(50107,TRUE,TRUE,RecSav);
                        //END

                    end;
                }
            }
        }
        area(creation)
        {
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        GetLastRepairForVin;
        //ADD KT 20042017
        SetEditability;
        WhoWillPayForIt;
        //END KT
        //KT 060917
        CurrPage.ListVinCamp.PAGE.FctSetReceptionNo("Reception No");
        FctVerifGarantiePiece(0);
    end;

    trigger OnAfterGetRecord();
    begin
        GetLastRepairForVin;
        //ReceptionSAVFactBox.
        //ADD KT 20042017
        SetEditability;
        WhoWillPayForIt;
        //END KT
        IF "Model Code" = '' THEN
          BEGIN
            "Model Code" := RecFicheTechnique."Model Code" ;

          END;
        RecUserSetup.GET("Created By");
        //KT 060917
        CurrPage.ListVinCamp.PAGE.FctSetReceptionNo("Reception No");
        FctVerifGarantiePiece(0);
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
        //KT 060917
        CurrPage.ListVinCamp.PAGE.FctSetReceptionNo("Reception No");
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Service Type":="Service Type"::"Big Service";
        //KT 060917
        CurrPage.ListVinCamp.PAGE.FctSetReceptionNo("Reception No");
    end;

    trigger OnOpenPage();
    begin
        GBoolDocIsStillEditable:=TRUE;
        SetEditability;
        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;

        //<<---NM060417-------
        IF  (RecGRecpetion."Status SR"=RecGRecpetion."Status SR"::"Commande Crée")  THEN
        BEGIN
        verouillageOR:=FALSE;
        END;
        IF (RecGRecpetion.Warranty=TRUE) THEN
          BEGIN
            verouillagegarantie:=FALSE;
        END;
        //>>---NM060417-------
        InitTechnicalInfo;
        IF ("Status SR"="Status SR"::Facturée) //OR ("Status SR"="Status SR"::Livré)
          THEN
          GBoolDocIsStillEditable:=FALSE;
        //KT 060917
        CurrPage.ListVinCamp.PAGE.FctSetReceptionNo("Reception No");
        GRecUserSetup.GET(USERID);
        IF GRecUserSetup."Approbation Garantie" THEN BEGIN
          GBoolGarantieEditable:=TRUE;
          GBoolGarantieEditable:=FALSE;
        END;
        IF GRecUserSetup."Modifier client/Client Facturé" THEN
          GBoolClientModifiable:=TRUE
        ELSE
          GBoolClientModifiable:=FALSE;
        GRecUserSetup.GET(USERID);
        IF GRecUserSetup."Approbation Garantie" THEN
          AgGarantie:=TRUE;
        IF (USERID='GRPLOUKIL\AYMEN.DHAOUADI') OR (USERID='GRPLOUKIL\MOHAMED.BARKAOUI') THEN
          ORArchiveVisible:=TRUE;
    end;

    var
        RecGVehicule : Record "27";
        CuSAVManagement : Codeunit "50010";
        UserMgt : Codeunit "5700";
        RecUserSetup : Record "91";
        TXT50008 : Label 'Vous n''avez pas l''autorisation Approbation Garantie .';
        TXT50009 : Label 'Il faut créer la fiche de garantie.';
        RecGRecpetion : Record "60008";
        TXT50010 : Label 'Vous n''avez pas le droit d''annuler la suspension de la réception.';
        TXT50011 : Label 'Vous n''avez pas l''autorisation, merci de contacter l''administrateur système.';
        RecFicheTechnique : Record "50032";
        RECESSAI : Record "70066";
        RecSav : Record "60008";
        Controle : Record "60009";
        LigneReceptionGrandService : Record "60012";
        TXT50012 : Label 'Les travaux atelier doivent être affectés aux équipes avant la création de commande';
        ListeSuiviEssaisurRoute : Page "70100";
        TXT50013 : TextConst ENU='L''utilisateur %1 n''est pas autorisé à voir le suivi essai sur route',FRA='L''utilisateur %1 n''est pas autorisé à voir le suivi essai';
        "CommandedetravauxCitroën" : Report "70028";
        ControleVisuel : Record "60009";
        ReceptionSAV1 : Record "60008";
        TXT50014 : Label 'Un ordre de réparation a été déjà créé pour le véhicule %1  OR: %2';
        GIntPAgeID : Integer;
        GBoolDocIsStillEditable : Boolean;
        verouillageOR : Boolean;
        verouillagegarantie : Boolean;
        GRecServiceHeader : Record "5900";
        GBoolWarranty : Boolean;
        GPageFicheretour : Page "60196";
        GBoolGarantieEditable : Boolean;
        GBoolRetourEditable : Boolean;
        GBoolInterneEditable : Boolean;
        GBoolRCGarageEditable : Boolean;
        TXT50015 : TextConst ENU='<L''OR %1 est de type interne, merci de créer un document de type %2  interne>',FRA='L''OR %1 est de type interne, merci de créer un document de type %2  interne';
        TXT50016 : Label 'On ne peut pas créer de %1 pour un OR annulé';
        TXT50018 : Label 'Approbation retour requise pour création %1';
        TXT50019 : Label 'Création fiche de garantie requise pour création %1';
        GRecUserSetup : Record "91";
        GBoolAssConvEditable : Boolean;
        LastReceptionSAV : Record "60008";
        ReceptionSAVFactBox : Page "70240";
        GPageFicheRCGarage : Page "60199";
        GBoolAppRetVisible : Boolean;
        GBoolAppRCVisible : Boolean;
        GBoolOrOrigineVisible : Boolean;
        GBoolPersoCitroEditable : Boolean;
        GBoolTypeGarantiEditable : Boolean;
        GRecServiceMgtSetup : Record "5911";
        GBoolFactureSourceVisible : Boolean;
        GTextFiltrePieces : Text[250];
        GBoolClientModifiable : Boolean;
        RecGServiceHeader : Record "5900";
        AgGarantie : Boolean;
        ORArchiveVisible : Boolean;
        ReceptionSAVREC : Record "60008";
        Color : Text;

    procedure InitTechnicalInfo();
    begin
        IF RecGVehicule.GET("Vehicle No.") THEN
           IF RecFicheTechnique.GET(RecGVehicule."No.") THEN;
    end;

    local procedure WhoWillPayForIt();
    begin
        GBoolOrOrigineVisible := ("Type assurances groupe"="Type assurances groupe"::"RC Garage");
        IF GBoolDocIsStillEditable THEN BEGIN
          IF (Intern OR Warranty OR Retour OR "Assurances groupe" OR "Assurances conventionnées" OR Personnel ) THEN BEGIN
            GBoolGarantieEditable :=Warranty;
            GBoolInterneEditable  :=Intern;
            GBoolRetourEditable   :=Retour;
            GBoolRCGarageEditable :="Assurances groupe";
            GBoolAssConvEditable  :="Assurances conventionnées";
            GBoolAppRCVisible     :="Assurances groupe";
            GBoolOrOrigineVisible := ("Type assurances groupe"="Type assurances groupe"::"RC Garage");
            GBoolAppRetVisible    :=Retour;
            GBoolPersoCitroEditable:=Personnel;
            IF NOT Warranty THEN BEGIN
              "Type de garantie":="Type de garantie"::" ";
              //"Sous Type de garantie":="Sous Type de garantie"::" ";
              IF ("Team chief approval" AND "Workshop chief approval" AND "Service manager approval") THEN
                IF "Approval Return Pick Request"<>"Approval Return Pick Request"::Refuser THEN
                  "Approval Return Pick Request":="Approval Return Pick Request"::Approuver
            END;
          END ELSE BEGIN
            GBoolGarantieEditable :=TRUE;
            GBoolInterneEditable  :=TRUE;
            GBoolRetourEditable   :=TRUE;
            GBoolRCGarageEditable :=TRUE;
            GBoolAssConvEditable  :=TRUE;
            GBoolPersoCitroEditable:=TRUE;
          END;
        END ELSE BEGIN
            GBoolGarantieEditable :=FALSE;
            GBoolInterneEditable  :=FALSE;
            GBoolRetourEditable   :=FALSE;
            GBoolRCGarageEditable :=FALSE;
            GBoolAssConvEditable  :=FALSE;
            GBoolPersoCitroEditable:=FALSE;
        END;
        //IF "Approval Return Pick Request"="Approval Return Pick Request"::Refuser THEN
           //GBoolRetourEditable:=FALSE;
        IF "Approval Return Pick Request"="Approval Return Pick Request"::Approuver THEN
           GBoolRetourEditable:=FALSE;
        IF "Approval Return Pick Request"="Approval Return Pick Request"::Approuver THEN
           GBoolRCGarageEditable:=FALSE;
        IF NOT  "Team chief approval" AND NOT "Workshop chief approval" AND NOT "Service manager approval" THEN BEGIN
          IF "Approval Return Pick Request"<>"Approval Return Pick Request"::Refuser THEN
            "Approval Return Pick Request":="Approval Return Pick Request"::Ouvert
        END;

        IF "Status SR"="Status SR"::Facturée THEN BEGIN
            GBoolGarantieEditable :=FALSE;
            GBoolInterneEditable  :=FALSE;
            GBoolRetourEditable   :=FALSE;
            GBoolRCGarageEditable :=FALSE;
            GBoolAssConvEditable  :=FALSE;
            GBoolPersoCitroEditable:=FALSE;
        END;
        IF "N° constat avarie"<>'' THEN BEGIN
            GBoolGarantieEditable :=FALSE;
            GBoolInterneEditable  :=FALSE;
            GBoolRetourEditable   :=FALSE;
            GBoolRCGarageEditable :=FALSE;
            GBoolAssConvEditable  :=FALSE;
            GBoolPersoCitroEditable:=FALSE;
        END;

        IF NOT (Retour OR Warranty OR Intern OR "Assurances groupe"  OR "Assurances conventionnées" OR Personnel )
          AND (xRec.Retour OR xRec.Warranty OR xRec.Intern OR xRec."Assurances groupe"
          OR xRec.Personnel OR xRec."Assurances conventionnées")  THEN
          VALIDATE("Type de garantie","Type de garantie"::"Payant par Client");
    end;

    local procedure SetEditability();
    begin
        CASE "Status SR" OF
          "Status SR"::Annulé:
            GBoolDocIsStillEditable:=FALSE;
          //"Status SR"::"Commande Crée":
         //   GBoolDocIsStillEditable:=FALSE;
          "Status SR"::Facturée:
            GBoolDocIsStillEditable:=FALSE;
         // "Status SR"::"Pièces demandé":
          //  GBoolDocIsStillEditable:=FALSE;
          END;
    end;

    local procedure PreDocumentCreationTest(DocType : Text[15]);
    var
        ERRORType : Label 'Choix du type assurance groupe obligatoire';
        LRecListVINCompagne : Record "50076";
    begin
        //SM 290419
        TESTFIELD("Vehicle No.");
        //END SM
        CALCFIELDS(Kilométrage);
        IF "Type assurances groupe"<>"Type assurances groupe"::Avarie THEN
        IF NOT (Kilométrage>0) THEN
          ERROR('Le kilométrage doit être saisi');
        //ADD KT 20042017
        //Interdiction pour OR annulé
        IF Status=Status::Annulé THEN
          ERROR(TXT50016,DocType);
        //<<----------NM050717----
        /*
        IF Intern THEN BEGIN
          TESTFIELD("Intern Type");
          ERROR(TXT50015,"Reception No",DocType);
        END;
        */
        //KT 230817
        IF Warranty THEN;
         //TESTFIELD("Approval Warranty Pick Request","Approval Warranty Pick Request"::Approuver);
         //END KT
        //KT 080817
        //KT 230817 Demande équipe pilotageIF Warranty AND( ("Warranty Status"="Warranty Status"::"Fiche créée") OR ("Warranty Status"="Warranty Status"::"Garantie approuvée")) THEN
          //ERROR('Le statut du dossier garantie est refusé, il faut annuler la garantie pour continuer' );
        //END KT
        IF Retour THEN BEGIN
          RecUserSetup.GET(USERID);
          IF NOT RecUserSetup."Autoriser Retour Sans N.OR." THEN
          IF NOT ("Reception No" IN ['CH-17-CVA27985','CH-17-CVA14377','CH-17-CVA13484','SO-17-CVA26813'] )THEN //KT TMP TMP TMP
          TESTFIELD("No Réception Origine");
          IF "Approval Return Pick Request"<> "Approval Return Pick Request"::Approuver THEN
            ERROR(TXT50018,DocType);
        END;
        /*IF "Assurances groupe" THEN BEGIN
          TESTFIELD("No Réception Origine RC");
        END;*/
        //KT 140617
        IF "Assurances groupe" AND ("Type assurances groupe"="Type assurances groupe"::"RC Garage")THEN BEGIN
          TESTFIELD("No Réception Origine RC");
          IF "Type assurances groupe" =0 THEN
            ERROR(ERRORType);
        END;
        //KT
        //KT 160617
        IF "Assurances groupe" THEN BEGIN
          IF "Type assurances groupe"="Type assurances groupe"::"RC Garage" THEN
            IF "Approval Return Pick Request"<>"Approval Return Pick Request"::Approuver THEN
            ERROR('Approbation RC garage nécessaire pour création commande');
        END;
        //END KT
        IF "Assurances conventionnées" THEN BEGIN
          TESTFIELD("Code assureur conventionné");
        END;
        LigneReceptionGrandService.RESET;
        LigneReceptionGrandService.SETRANGE("Reception No","Reception No");
        LigneReceptionGrandService.SETRANGE("Type Effet CLT",LigneReceptionGrandService."Type Effet CLT"::LDT);
        LigneReceptionGrandService.SETRANGE(Statut,LigneReceptionGrandService.Statut::Approuvée);
        LigneReceptionGrandService.SETFILTER("Chef d'équipe",'=%1','');
        IF LigneReceptionGrandService.FINDFIRST THEN
          ERROR(TXT50012,DocType);
        /*KT 230817 Demande par éqipe pilotage IF ("Type de garantie"="Type de garantie"::"Garantie  Constructeur") OR ("Type de garantie"="Type de garantie"::"Garantie  Prolongé") THEN BEGIN
          IF Warranty THEN
          TESTFIELD ("Sous Type de garantie")
          ELSE
          ERROR(TXT50019,DocType);
        END;*/
        //KT 090817
        IF ("Type de garantie"="Type de garantie"::Compagne)OR ("Type de garantie"="Type de garantie"::"Garantie  Constructeur+Campagne")  THEN BEGIN
        LRecListVINCompagne.RESET;
        LRecListVINCompagne.SETRANGE(VIN,VIN);
        LRecListVINCompagne.SETRANGE("Reception No.","Reception No");
        //LRecListVINCompagne.SETRANGE(Traiter,FALSE);
        IF NOT LRecListVINCompagne.FINDFIRST THEN
          ERROR('Merci de choisir les campagnes à traiter');
        END;
        //END KT
        IF ("Type de garantie"="Type de garantie"::"Garantie  Constructeur") OR
         ("Type de garantie"="Type de garantie"::"Garantie  Prolongé") OR ("Type de garantie"="Type de garantie"::"Garantie  Constructeur+Campagne") THEN
          TESTFIELD(Warranty,TRUE);

    end;

    local procedure GetLastRepairForVin();
    begin
        //IF "Last repair No."='' THEN BEGIN
        LastReceptionSAV.RESET;
        LastReceptionSAV.SETRANGE(VIN,VIN);
        LastReceptionSAV.SETFILTER("Reception Date",'<=%1',"Reception Date");
        LastReceptionSAV.SETFILTER("Reception No",'<%1',"Reception No");
        IF LastReceptionSAV.FINDLAST THEN BEGIN
          "Last repair No.":=LastReceptionSAV."Reception No";
        END ELSE
          "Last repair No.":='';
        //END;
    end;

    local procedure FctVerifCampagne(LOptIdField : Option VIN,Matricule);
    var
        LRecServiceItem : Record "5940";
    begin

        LRecServiceItem.RESET;
        IF LOptIdField=LOptIdField::VIN THEN
          LRecServiceItem.SETRANGE("Serial No.",VIN)
        ELSE
          LRecServiceItem.SETRANGE(Matricule,Matricule);
        LRecServiceItem.FINDFIRST;
        LRecServiceItem.CALCFIELDS(Compagne);
        IF LRecServiceItem.Compagne THEN BEGIN
          VALIDATE("Type de garantie","Type de garantie"::Compagne);
          //VALIDATE("Sous Type de garantie","Sous Type de garantie"::Compagne);
          END ELSE
          VALIDATE("Type de garantie","Type de garantie"::"Payant par Client");


        //MESSAGE(VIN+FORMAT(LRecServiceItem.Compagne));
    end;

    local procedure FctVerifGarantiePiece(Entree : Option Vin,Mat);
    var
        ServiceItem : Record "5940";
    begin
        GRecServiceMgtSetup.GET;

        GBoolFactureSourceVisible:=FALSE;
        ServiceItem.RESET;
        IF Entree=Entree::Vin THEN
          ServiceItem.SETRANGE("Serial No.",VIN)
        ELSE
          ServiceItem.SETRANGE(Matricule,Matricule);
        IF ServiceItem.FINDFIRST THEN
          IF ServiceItem."Serial No."=GRecServiceMgtSetup."VIN Garantie pièces" THEN BEGIN
            "Type de garantie":="Type de garantie"::"Garantie  Constructeur";
            GBoolFactureSourceVisible:=TRUE;
          END;
    end;
}

