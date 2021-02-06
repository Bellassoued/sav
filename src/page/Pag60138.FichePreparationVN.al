page 60138 "Fiche Preparation VN"
{
    // version Preparation VN,MAZDA301,MAZDA988

    CaptionML = ENU='Fiche Preparation VN',
                FRA='Fiche Preparation VN';
    PageType = Card;
    SourceTable = Table60025;
    SourceTableView = SORTING(Preparation No);

    layout
    {
        area(content)
        {
            group("Général")
            {
                group("Information Véhiule")
                {
                    Caption = 'Information Véhiule';
                    field("Preparation No";"Preparation No")
                    {
                        Editable = false;
                    }
                    field(Matricule;Matricule)
                    {
                        Editable = Editable;
                    }
                    field(VIN;VIN)
                    {
                        Editable = Editable;
                    }
                    field("Vehicle No.";"Vehicle No.")
                    {
                        Editable = Editable;
                    }
                    field("Model Code";"Model Code")
                    {
                        Editable = Editable;
                    }
                    field("Service Item Description";"Service Item Description")
                    {
                        Editable = Editable;
                    }
                    field("Status Préparation";"Status Préparation")
                    {
                        Caption = 'Status Préparation';
                        Editable = false;
                        Style = StrongAccent;
                        StyleExpr = TRUE;
                    }
                    field("CheckListe Validée";"CheckListe Validée")
                    {
                        Editable = false;
                        Style = StrongAccent;
                        StyleExpr = TRUE;
                    }
                    field("Nombre d'impression";"Nombre d'impression")
                    {
                        Editable = false;
                    }
                    field(Livreur;Livreur)
                    {
                        Editable = false;
                    }
                }
                group(Dates)
                {
                    field("Creation date";"Creation date")
                    {
                        CaptionML = ENU='Creation date',
                                    FRA='Date création';
                    }
                    field("Date de préparation souhaité";"Date de préparation souhaité")
                    {
                    }
                    field("Date de préparation prévu";"Date de préparation prévu")
                    {
                    }
                    field("Date Envoie Bor. Carte Grise";"Date Envoie Bor. Carte Grise")
                    {
                    }
                    field("Date Réparation";"Date Réparation")
                    {
                        CaptionML = ENU='Repair Date',
                                    FRA='Date Livraison Client Souhaité';
                        Style = Favorable;
                        StyleExpr = TRUE;
                    }
                }
                group(Avancement)
                {
                    field("Accessoires Montés";"Accessoires Montés")
                    {
                        Editable = false;
                    }
                    field(Carburant;Carburant)
                    {
                        Editable = false;
                    }
                    field(Accepté;Accepté)
                    {

                        trigger OnValidate();
                        begin
                            //ADD KK
                            //IF Accepté THEN
                            //  TESTFIELD("No Demande VIN");
                            
                            //IF "Nombre d'impression" > 0 THEN
                            //  ERROR(TXT50009);
                            //END KK
                            //SM 100917
                            //KT 221117
                            /*IF "Accepté" THEN BEGIN
                            ServiceItem.GET("Service Item No.");
                            IF ServiceItem."Préparation/Livraison" <> ServiceItem."Préparation/Livraison"::Préparer THEN BEGIN
                              ServiceItem.VALIDATE("Préparation/Livraison" , ServiceItem."Préparation/Livraison"::Préparer);
                              ServiceItem.MODIFY;
                              //ERROR('L''OR PVN n''est pas facturé ');
                             END;
                            END ELSE IF "Accepté"<>xRec."Accepté" THEN
                              ERROR('Annuler acceptation interdite');*/
                            //END KT
                            ServiceItem.GET("Service Item No.");
                            IF ServiceItem."Préparation/Livraison" <> ServiceItem."Préparation/Livraison"::Préparer THEN
                              ERROR('L''OR PVN n''est pas facturé ');
                            
                            //END SM
                            //KT, 061017
                            IF Accepté THEN BEGIN
                              ServiceItem."Date preparation":=CURRENTDATETIME;
                              ServiceItem.MODIFY;
                            END;
                            //END KT

                        end;
                    }
                    field(Refusé;Refusé)
                    {
                    }
                    field("Réserve";Réserve)
                    {
                    }
                }
                group("Information Vente")
                {
                    Caption = 'Information Vente';
                    field("Customer No.";"Customer No.")
                    {
                        Editable = Editable;
                    }
                    field(Name;Name)
                    {
                        Editable = Editable;
                    }
                    field("Name 2";"Name 2")
                    {
                        Editable = Editable;
                    }
                    field(Address;Address)
                    {
                        Editable = Editable;
                    }
                    field("Address 2";"Address 2")
                    {
                        Editable = Editable;
                    }
                    field("Post Code";"Post Code")
                    {
                        Editable = Editable;
                    }
                    field(City;City)
                    {
                        Enabled = Editable;
                    }
                    field(County;County)
                    {
                        Editable = Editable;
                    }
                    field("Country/Region Code";"Country/Region Code")
                    {
                        Editable = Editable;
                    }
                }
            }
            part(;60139)
            {
                Editable = true;
                SubPageLink = Document No=FIELD(Preparation No);
                SubPageView = SORTING(Document No,Line No)
                              WHERE(Titre Principale=CONST(No));
            }
            part(;50074)
            {
                SubPageLink = Service Item Serial No.=FIELD(VIN);
                SubPageView = WHERE(Type=FILTER(Item),
                                    No.=FILTER(<>CARBURANT));
                Visible = EditableLivraisonAcc;
            }
            part(;60064)
            {
                SubPageLink = Reception No=FIELD(Preparation No);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Function")
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
                    begin
                        CuSAVManagement.CreateServOrderFromPrpVN(Rec);
                    end;
                }
                action("Généer Inspection Inter Parc")
                {
                    Caption = 'Généer Inspection Inter Parc';
                    Image = CheckList;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        ControlVenteVN : Record "60026";
                    begin
                        IF "Status Préparation" = "Status Préparation"::"Véhicule Préparée" THEN
                        BEGIN
                          CLEAR(ControlVenteVN);
                          ControlVenteVN.SETRANGE(ControlVenteVN."No Chassis",VIN);
                          ControlVenteVN.SETRANGE("Document No","Preparation No");
                          ControlVenteVN.SETRANGE( "Type Control",ControlVenteVN."Type Control"::"Réception VN inter Parc");
                          IF NOT ControlVenteVN.FINDFIRST THEN
                             CreateControl(2);
                         END
                         ELSE ERROR('Véhicule doit être préparer avant de faire la checkliste');
                    end;
                }
                action("Valider inspection")
                {
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction();
                    begin
                        IF "Status Préparation" = "Status Préparation"::"Véhicule Préparée" THEN
                          ValiderControlLine()
                        ELSE ERROR('Véhicule doit être préparer');
                    end;
                }
                action("Imprimer Check Liste")
                {
                    Image = PrintCheck;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecPreparationVN : Record "60025";
                    begin
                        IF "CheckListe Validée" THEN
                        BEGIN
                            CLEAR(RecPreparationVN);
                            RecPreparationVN.SETRANGE("Preparation No","Preparation No");
                            IF RecPreparationVN.FINDFIRST THEN
                            BEGIN
                                REPORT.RUN(REPORT::"Check liste Inter Parc",TRUE,TRUE,RecPreparationVN);
                            END;
                        END
                        ELSE ERROR('Checkliste doit être valider avant l''impression');
                    end;
                }
                action("Valider check List")
                {
                    Image = ValueLedger;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        RecPreparationVN : Record "60025";
                        ServiceInvLine : Record "5993";
                        i : Integer;
                    begin
                        //ADD KK
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Approbation Livraison VN" THEN
                          ERROR(TXT50007);

                        CLEAR(RecPreparationVN);
                        RecPreparationVN.SETRANGE("Preparation No","Preparation No");
                        IF RecPreparationVN.FINDFIRST THEN
                          REPORT.RUN(50090,TRUE,TRUE,RecPreparationVN);

                        Accepté := TRUE;
                        "Nombre d'impression" += 1;
                        MODIFY;

                        //END KK
                    end;
                }
                action("Créer Ordre de Livraison")
                {
                    Image = SalesShipment;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecPreparationLivraison : Record "60025";
                        RecPreparationLivraisonToCreate : Record "60025";
                        TXT50000 : Label 'Il existe ordre de livraison N° %1 pour la préparation N° %2 .';
                        TXT50001 : Label 'Voulez-vous crée un ordre de Livraison ?';
                        TXT50002 : Label 'Vous n''avez pas le droit veuillez contactez votre administrateur';
                        LRecAccessoiresManquantVN : Record "50075";
                        RecLItemLedgerEntry : Record "32";
                    begin
                        ServiceItem.RESET;
                        ServiceItem.SETRANGE("Serial No.",VIN);
                        ServiceItem.FINDFIRST;
                        
                        //SM MAZDA301
                        //SM MAZDA301
                        RecUserSetup.GET(USERID);
                        IF NOT RecUserSetup."Approbation Livraison VN" THEN
                          ERROR(TXT50002);
                        //SM MAZDA301
                        //SM 070917
                        IF NOT ServiceItem."Dérogation DC Livraison" THEN BEGIN
                        //END SM
                          //19/08/2015 suggestion Ramzi Arous TESTFIELD(Carburant,TRUE);
                          //SM 200717 TESTFIELD("Accessoires Montés" ,TRUE);
                          TESTFIELD(Accepté,TRUE);
                          //SM 200717 TESTFIELD("CheckListe Validée",TRUE);
                        
                        END;
                        
                        
                        //KK__0510___Control VIN Fcturé
                        RecLItemLedgerEntry.RESET;
                        RecLItemLedgerEntry.SETRANGE("Entry Type",RecLItemLedgerEntry."Entry Type"::Sale);
                        RecLItemLedgerEntry.SETRANGE("Document Type",RecLItemLedgerEntry."Document Type"::"Sales Shipment");
                        RecLItemLedgerEntry.SETRANGE("Serial No.",VIN);
                        IF RecLItemLedgerEntry.ISEMPTY THEN
                          ERROR(TXT50010);
                        //END KK
                        
                        ServiceItem.CALCFIELDS("Statut Carte Grise");
                        //SM 070917
                        IF NOT ServiceItem."Dérogation DC Livraison" THEN BEGIN
                        //END SM
                          ServiceItem.TESTFIELD("Statut Carte Grise",ServiceItem."Statut Carte Grise"::Reçue);
                          //SM 151017
                          //<<--------NM230120---SUITE LA DEMANDE DE MR HAYTHEM
                          /*
                          ServiceItem.TESTFIELD("Réglement réçu Immatriculation",TRUE);
                        */
                          //END SM
                        END;
                        //SM 200717IF "Nombre d'impression"=0 THEN
                        //SM 200717  ERROR(TXT50006);
                        
                        RecPreparationLivraison.RESET;
                        RecPreparationLivraison.SETRANGE("Service Type",RecPreparationLivraison."Service Type"::Livraison);
                        RecPreparationLivraison.SETRANGE("From Preparation No","Preparation No");
                        
                        IF NOT RecPreparationLivraison.FINDFIRST THEN BEGIN
                          IF CONFIRM(TXT50001)THEN
                          BEGIN
                            CLEAR(RecPreparationLivraisonToCreate);
                        
                            RecPreparationLivraisonToCreate."Service Type":=RecPreparationLivraisonToCreate."Service Type"::Livraison;
                            RecPreparationLivraisonToCreate.VALIDATE(VIN,VIN);
                            RecPreparationLivraisonToCreate."From Preparation No" := "Preparation No";
                            //KK
                            //KT 240717
                            //KT 041217
                            RecPreparationLivraisonToCreate."Salesperson No":="Salesperson No";
                            //END KT
                            RecPreparationLivraisonToCreate."Num BL":="Num BL";
                            RecPreparationLivraisonToCreate.Lavage := TRUE;
                            RecPreparationLivraisonToCreate."Plaque Monté":=TRUE;
                            RecPreparationLivraisonToCreate.VALIDATE("Salesperson No","Salesperson No");
                            RecPreparationLivraisonToCreate."Campaign No.":="Campaign No.";
                            RecPreparationLivraisonToCreate."Entretien 10 000":="Entretien 10 000";
                            RecPreparationLivraisonToCreate."Entretien 20 000":="Entretien 20 000";
                            RecPreparationLivraisonToCreate."Entretien 30 000":="Entretien 30 000";
                            RecPreparationLivraisonToCreate."Carte Carburant" :="Carte Carburant";
                            ServiceInvLine.RESET;
                            ServiceInvLine.SETCURRENTKEY("Service Item Serial No.",Type,"No.");
                            ServiceInvLine.SETRANGE("Service Item Serial No.",VIN);
                            ServiceInvLine.SETFILTER(Type,'Item');
                            ServiceInvLine.SETFILTER("No.",'<> %1&<> %2',GRecServiceMgtSetup."Code article carburant Diesel",GRecServiceMgtSetup."Code article carburant Essence");
                            IF ServiceInvLine.FINDFIRST THEN
                              REPEAT
                                ServiceInvLine."Accessoire Livré Client" := ServiceInvLine."Accessoire Livré PVN";
                                ServiceInvLine.MODIFY;
                              UNTIL ServiceInvLine.NEXT=0;
                            //END KK
                            //ADD KT 220717
                            //IF USERID='GRPLOUKIL\ZIED.MNASRI' THEN BEGIN
                              // MESSAGE('1');
                            GRecSalesLine.RESET;
                            GrecAccessoiresManquantVN.RESET;
                            IF GrecAccessoiresManquantVN.FINDLAST THEN
                              GIntNoSeq:=GrecAccessoiresManquantVN."N°Seq"+10000
                            ELSE
                              GIntNoSeq:=10000;
                            //GRecSalesLine.SETCURRENTKEY("Affecter sur",Type,"No.");
                            GRecSalesLine.SETRANGE("Affecter sur",VIN);
                            GRecSalesLine.SETRANGE(Type,GRecSalesLine.Type::Item);
                            GRecSalesLine.SETRANGE("Type VN",GRecSalesLine."Type VN"::Accessoire);
                            //GRecSalesLine.SETFILTER("Unit of Measure",'<>VEH');
                            //ServiceInvLine.SETFILTER("No.",'<>CARBURANT');
                            IF GRecSalesLine.FINDFIRST THEN  // wassim hakim
                              //MESSAGE(FORMAT(GRecSalesLine.COUNT));
                              REPEAT
                               // MESSAGE('1');
                               LRecAccessoiresManquantVN.RESET;
                               LRecAccessoiresManquantVN.SETRANGE("N°BLIV","Num BL");
                               LRecAccessoiresManquantVN.SETRANGE(Ref,GRecSalesLine."No.");
                               IF NOT LRecAccessoiresManquantVN.FINDFIRST THEN BEGIN
                                 GrecAccessoiresManquantVN.INIT;
                                 GrecAccessoiresManquantVN.Ref            :=GRecSalesLine."No.";
                                 GrecAccessoiresManquantVN.Designation    :=GRecSalesLine.Description;
                                 GrecAccessoiresManquantVN."N°Seq"        :=GIntNoSeq;
                                 GrecAccessoiresManquantVN.VIN            :=VIN;
                                 GrecAccessoiresManquantVN.Quantité       :=GRecSalesLine.Quantity;
                                 GrecAccessoiresManquantVN."N°BLIV"       :="Num BL";
                                 GrecAccessoiresManquantVN."Date B_Livraison":=GRecSalesLine."Date Livraison BL";
                                 GrecAccessoiresManquantVN.Livrée       :=TRUE;
                                 GrecAccessoiresManquantVN.INSERT;
                                 GIntNoSeq+=20000;
                               END;
                              UNTIL GRecSalesLine.NEXT=0;
                              //END;
                            //END KT
                            IF RecPreparationLivraisonToCreate.INSERT(TRUE) THEN
                            BEGIN
                                ServiceItem.RESET;
                                ServiceItem.SETRANGE("Serial No.",VIN);
                                ServiceItem.FINDFIRST;
                                ServiceItem.TESTFIELD("Statut Livraison",0);
                                ServiceItem."Statut Livraison" := ServiceItem."Statut Livraison"::"Rendez-Vous crée";
                                ServiceItem."Non Inclus dans préparation" := TRUE;
                                ServiceItem.MODIFY;
                                PAGE.RUN(PAGE::"Fiche Livraison VN",RecPreparationLivraisonToCreate);
                            END;
                        
                        
                          END;
                        END ELSE ERROR(TXT50000,RecPreparationLivraison."Preparation No","Preparation No");
                        
                        //SM MAZDA301

                    end;
                }
                action("Consulter Order de Livraison")
                {
                    CaptionML = ENU='Consulter Ordre de Livraison',
                                FRA='Consulter Ordre de Livraison';
                    Image = ViewPage;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecPreparationLivraison : Record "60025";
                        TXT50000 : Label 'Pas d''''ordre de Livraison !';
                    begin
                        //SM MAZDA301
                        CLEAR(RecPreparationLivraison);
                        RecPreparationLivraison.SETRANGE("Service Type",RecPreparationLivraison."Service Type"::Livraison);
                        RecPreparationLivraison.SETRANGE("From Preparation No","Preparation No");

                        IF RecPreparationLivraison.FINDFIRST THEN
                        BEGIN
                          //KT 041217
                             //IF USERID='GRPLOUKIL\SBSKAIS.TIMOUMI' THEN BEGIN
                               IF (RecPreparationLivraison."Salesperson No"='') OR NOT(RecPreparationLivraison."Entretien 10 000"
                                OR RecPreparationLivraison."Entretien 20 000" OR RecPreparationLivraison."Entretien 30 000") OR (
                                RecPreparationLivraison."Carte Carburant"<>"Carte Carburant" )
                                 THEN BEGIN
                                RecPreparationLivraison."Entretien 10 000":="Entretien 10 000";
                                RecPreparationLivraison."Entretien 20 000":="Entretien 20 000";
                                RecPreparationLivraison."Entretien 30 000":="Entretien 30 000";
                                RecPreparationLivraison."Carte Carburant" :="Carte Carburant";
                                IF RecPreparationLivraison."Salesperson No"=''  THEN
                                RecPreparationLivraison."Salesperson No":="Salesperson No";
                                RecPreparationLivraison.MODIFY;
                                END;

                            // END;
                             //END KT
                             PAGE.RUN(PAGE::"Fiche Livraison VN",RecPreparationLivraison);
                        END ELSE ERROR(TXT50000);
                        //SM MAZDA301
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
                        GIntPAgeID : Integer;
                    begin
                        //--> Appel au contrôle Visuel
                        //GIntPAgeID
                        //<<---NM121119------Ajout CQ sur la partie PVN
                        IF CURRENTCLIENTTYPE=CLIENTTYPE::Windows THEN
                          GIntPAgeID:=60012
                          ELSE
                          GIntPAgeID:=60192;

                        RecControl.RESET;
                        RecControl.SETRANGE(Id, "Preparation No");
                        IF RecControl.FINDFIRST THEN BEGIN
                              //60192
                                PAGE.RUNMODAL(GIntPAgeID,RecControl);
                            END
                        ELSE BEGIN

                              //60192
                                RecControl.INIT;
                                RecControl.Id:="Preparation No";
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
                        //MESSAGE('1');
                        IF GRecUserSetup.GET(USERID) THEN BEGIN
                        IF CURRENTCLIENTTYPE=CLIENTTYPE::Windows THEN
                          GIntPAgeID:=50128
                          ELSE
                          GIntPAgeID:=60193;
                        RecControlQ.RESET;
                        IF RecControlQ.GET("Preparation No") THEN
                            BEGIN
                                PageControlVisuleQ.SETRECORD(RecControlQ);
                                PageControlVisuleQ.SETTABLEVIEW(RecControlQ);
                                PageControlVisuleQ.RUNMODAL;
                            END
                        ELSE
                            BEGIN
                                RecControlQ.INIT;
                                RecControlQ.No:="Preparation No";
                                //<< KT 09112016 SAV00020
                                //TESTFIELD("Order No");
                                GRecServiceHeader.RESET;
                                GRecServiceHeader.SETRANGE("Document Type",GRecServiceHeader."Document Type"::Order);
                                GRecServiceHeader.SETRANGE("Reception No",GRecServiceHeader."Reception No");
                                GRecServiceHeader.FINDFIRST;
                               // RecControlQ."N° Commande de travaux":=GRecServiceHeader."No.";
                                //--> Donnée Date         RecControl."Date de Creation":=
                                RecControlQ.INSERT;
                                //70105
                                PageControlVisuleQ.SETRECORD(RecControlQ);
                                PageControlVisuleQ.SETTABLEVIEW(RecControlQ);
                                PageControlVisuleQ.RUN;
                                //PAGE.RUN(GIntPAgeID,RecControlQ);
                            END;
                        END;
                    end;
                }
                action("Imprimer Commande de Travaux")
                {
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecRecpetionSav : Record "60008";
                    begin
                        Controle.RESET;
                        Controle.SETRANGE(Id,"Preparation No");
                        IF Controle.FINDFIRST THEN BEGIN
                          IF Controle."Cree par"='' THEN
                            Controle."Cree par":="Created By";
                            Controle.MODIFY;
                        //  CLEAR(CommandedetravauxCitroën);
                        //CommandedetravauxCitroën.SetLineType(TRUE);
                        //  CommandedetravauxCitroën.SETTABLEVIEW(Controle);
                        //  CommandedetravauxCitroën.RUN;
                          COMMIT;
                          REPORT.RUN(50059,TRUE,TRUE,Controle);
                          //REPORT.RUN(REPORT::"Cmd Service Grand Rep",FALSE,FALSE,RecRecpetionSav);
                          //"Nbre Impressions"+=1;
                          MODIFY;
                          CurrPage.UPDATE;
                        END;
                    end;
                }
            }
            group("&Document")
            {
                action("Imprimer Fiche")
                {
                    Caption = 'Imprimer Fiche';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecRecpetionSav : Record "60008";
                    begin
                    end;
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
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Reception No","Preparation No");
                        IF RecLServiceHeader.FINDFIRST THEN
                          PAGE.RUN(PAGE::"Service Order",RecLServiceHeader);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        //SM MAZDA988
        IF ("Service Type" = "Service Type"::Préparation) AND ("Status Préparation" = "Status Préparation"::"Véhicule Préparée") THEN BEGIN
          EditableLivraisonAcc := TRUE;
        END;
        //END SM
        //KT 260717
        CALCFIELDS("Num BL");
        //END KT
    end;

    trigger OnAfterGetRecord();
    var
        RecReservationEntry : Record "337";
        RecServiceHeader : Record "5900";
        RecServiceInvoiceHeader : Record "5992";
        RecServiceInvoiceLine : Record "5993";
    begin
         IF "Status Préparation"= "Status Préparation"::"Véhicule Préparée" THEN
            Editable := FALSE;

        //SM MAZDA301
        "Accessoires Montés" := FALSE;
        Carburant := FALSE;
        RecServiceHeader.RESET;
        RecServiceHeader.SETRANGE("Reception No","Preparation No");
        RecServiceHeader.SETRANGE("Type Reception",RecServiceHeader."Type Reception"::VN);
        IF RecServiceHeader.FINDSET THEN BEGIN
          RecReservationEntry.RESET;
          RecReservationEntry.SETRANGE("Item No.",'CARBURANT');
          RecReservationEntry.SETRANGE("Source ID",RecServiceHeader."No.");
          RecReservationEntry.SETRANGE("Source Type",5902);
          IF RecReservationEntry.FINDSET THEN
            Carburant := TRUE;
        END;

        //facturé
        RecServiceInvoiceHeader.RESET;
        RecServiceInvoiceHeader.SETRANGE("Reception No","Preparation No");
        RecServiceInvoiceHeader.SETRANGE("Type Reception",RecServiceInvoiceHeader."Type Reception"::VN);
        IF RecServiceInvoiceHeader.FINDSET THEN BEGIN
          RecServiceInvoiceLine.RESET;
          RecServiceInvoiceLine.SETRANGE("Document No.",RecServiceInvoiceHeader."No.");
          RecServiceInvoiceLine.SETRANGE(Type,RecServiceInvoiceLine.Type::Item);
          RecServiceInvoiceLine.SETRANGE("No.",'CARBURANT');
          IF RecServiceInvoiceLine.FINDSET THEN BEGIN
            Carburant := TRUE;
          END;
          "Accessoires Montés" := TRUE;
        END;
        //SM MAZDA301

        //SM MAZDA988
        IF ("Service Type" = "Service Type"::Préparation) AND ("Status Préparation" = "Status Préparation"::"Véhicule Préparée") THEN BEGIN
          EditableLivraisonAcc := TRUE;
        END;
        //END SM
        //KT 260717
        CALCFIELDS("Num BL");
        //END KT
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
         "Service Type" := "Service Type"::Préparation;
    end;

    trigger OnOpenPage();
    begin
        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          UserSetupG.GET(USERID);
          IF NOT UserSetupG."PVN Multi Sites" THEN
            SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;
        Editable := TRUE;
        //SM MAZDA988
        EditableLivraisonAcc := FALSE;
        //END SM
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        //KK
        IF Réserve=Réserve::Accessoires THEN BEGIN
          ServiceInvLine.RESET;
          ServiceInvLine.SETRANGE("Service Item Serial No.",VIN);
          ServiceInvLine.SETRANGE("Accessoire Livré PVN",FALSE);
          ServiceInvLine.SETFILTER(Type,'%1',ServiceInvLine.Type::Item);
          ServiceInvLine.SETFILTER("No.",'<>%1','CARBURANT');
          IF NOT ServiceInvLine.FINDSET THEN BEGIN
            Réserve:=Réserve::" ";
            MODIFY;
            COMMIT;
            ERROR(TXT50008);
          END;
        END;
        //END KK
    end;

    var
        RecGVehicule : Record "27";
        PageLigneRcp : Page "60020";
        RecGRecpetion : Record "60008";
        UserMgt : Codeunit "5700";
        Editable : Boolean;
        RecUserSetup : Record "91";
        EditableLivraisonAcc : Boolean;
        TXT50000 : Label 'check liste déja validé';
        TXT50006 : Label 'Vous devez valider le check liste pour créer ordre de livraison';
        TXT50007 : Label 'Vous n''avez pas le droit';
        ServiceInvLine : Record "5993";
        TXT50008 : Label 'Vous devez décoher les accessoire non livrés';
        TXT50009 : Label 'Vous ne pouvez pas décocher accepté car vous avez imprimé le check liste';
        ServiceItem : Record "5940";
        Controle : Record "60009";
        GRecSalesLine : Record "111";
        GrecAccessoiresManquantVN : Record "50075";
        GIntNoSeq : Integer;
        GRecServiceMgtSetup : Record "5911";
        TXT50010 : Label 'Vous ne pouvez pas créer fiche de livraison pour un VIN n''est pas encore facturé !';
        UserSetupG : Record "91";
        GRecUserSetup : Record "91";
        GIntPAgeID : Integer;
        GRecServiceHeader : Record "5900";

    procedure CreateControl();
    var
        RecControlGroup : Record "60027";
        RecLineControl : Record "60028";
        ControlVenteVN : Record "60026";
        IntLineNo : Integer;
    begin
        IntLineNo := 10000;
        CLEAR(RecControlGroup);
        RecControlGroup.SETRANGE(RecControlGroup."Type Control",RecControlGroup."Type Control"::"Réception VN inter Parc");
        IF RecControlGroup.FINDFIRST THEN
        REPEAT

              // INSERT LIGNE GROUPE;
              CLEAR(RecLineControl);
              ControlVenteVN."Document No"      := "Preparation No";
              ControlVenteVN."No Chassis"       := VIN;
              ControlVenteVN."Line No"          := IntLineNo;
              ControlVenteVN."Date de Creation" := TODAY;
              ControlVenteVN."Cree par"         := USERID;
              ControlVenteVN.Group              := RecControlGroup."Group No" ;
              ControlVenteVN."Type Control"     := RecControlGroup."Type Control"::"Réception VN inter Parc";
              ControlVenteVN.Description        := RecControlGroup."Group No";
              ControlVenteVN.Titre              := TRUE;
              ControlVenteVN.ShowDetail         := FALSE;
              IF ControlVenteVN.INSERT THEN IntLineNo+= 10000;

              // INSERT LIGNE CONTROL;
              CLEAR(RecLineControl);
              RecLineControl.SETRANGE(RecLineControl.Group,RecControlGroup."Group No");
              IF RecLineControl.FINDFIRST THEN
              REPEAT
                  CLEAR(ControlVenteVN);
                  IF RecLineControl."Titre Principale" THEN
                     ControlVenteVN."Titre Principale" := TRUE
                  ELSE ControlVenteVN.ShowDetail := TRUE;

                  ControlVenteVN."Document No"      := "Preparation No";
                  ControlVenteVN."No Chassis"       := VIN;
                  ControlVenteVN."Line No"          := IntLineNo;
                  ControlVenteVN."Date de Creation" := TODAY;
                  ControlVenteVN."Cree par"         := USERID;
                  ControlVenteVN.Group              := RecLineControl.Group ;
                  ControlVenteVN."Type Control"     := RecControlGroup."Type Control"::"Réception VN inter Parc";
                  ControlVenteVN.Description        := '   ' +RecLineControl.Description;
                  IF ControlVenteVN.INSERT THEN IntLineNo+= 10000;
              UNTIL RecLineControl.NEXT = 0;
        UNTIL RecControlGroup.NEXT = 0;
    end;
}

