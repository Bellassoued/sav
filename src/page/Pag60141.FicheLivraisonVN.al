page 60141 "Fiche Livraison VN"
{
    // version Preparation VN,MAZDA301,MAZDA988

    CaptionML = ENU='Fiche Livraison VN',
                FRA='Fiche Livraison VN';
    Editable = true;
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
                        CaptionML = ENU='Preparation No',
                                    FRA='Livraison N°';
                    }
                    field(Matricule;Matricule)
                    {
                        Editable = Editable;
                    }
                    field(VIN;VIN)
                    {
                        Editable = Editable;

                        trigger OnValidate();
                        begin
                             CurrPage.UPDATE;
                        end;
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
                    field("Status Livraison";"Status Livraison")
                    {
                        Caption = 'Status Livraison';
                        Editable = false;
                        Style = StrongAccent;
                        StyleExpr = TRUE;
                    }
                    field("Plaque Monté";"Plaque Monté")
                    {
                        Enabled = true;
                    }
                    field(Lavage;Lavage)
                    {
                        Editable = true;
                    }
                    field("Acceptation Financière";"Acceptation Financière")
                    {
                    }
                    field("N contrat 3GAA";"N contrat 3GAA")
                    {
                    }
                }
                group("Information Vente")
                {
                    Caption = 'Information Vente';
                    field("Customer No.";"Customer No.")
                    {
                        Editable = false;
                    }
                    field(Name;Name)
                    {
                        Editable = false;
                    }
                    field(Contact;Contact)
                    {
                    }
                    field("Phone No.";"Phone No.")
                    {
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
                        Editable = Editable;
                    }
                    field(County;County)
                    {
                        Editable = Editable;
                    }
                    field("Country/Region Code";"Country/Region Code")
                    {
                        Editable = Editable;
                    }
                    field("Date rendez vous";"Date rendez vous")
                    {
                    }
                    field("Date Livraison";"Date Livraison")
                    {
                    }
                }
                group("Bon manquant")
                {
                    CaptionML = ENU='Bon manquant',
                                FRA='Bon manquant';
                    field(Date;Date)
                    {
                    }
                    field("Date livraison prévue";"Date livraison prévue")
                    {
                    }
                    field(Livreur;Livreur)
                    {
                    }
                    field("Num BL";"Num BL")
                    {
                    }
                    field("Salesperson No";"Salesperson No")
                    {
                    }
                    field("Autre manquant";"Autre manquant")
                    {
                    }
                }
                group(Avantages)
                {
                    field("Campaign No.";"Campaign No.")
                    {
                        Editable = false;
                    }
                    field("Entretien 10 000";"Entretien 10 000")
                    {
                        Editable = false;
                    }
                    field("Entretien 20 000";"Entretien 20 000")
                    {
                        Editable = false;
                    }
                    field("Entretien 30 000";"Entretien 30 000")
                    {
                        Editable = false;
                    }
                    field("Carte Carburant";"Carte Carburant")
                    {
                        Editable = false;
                    }
                    field("Carte Carburant livrée";"Carte Carburant livrée")
                    {
                    }
                }
            }
            part(;60139)
            {
                SubPageLink = Document No=FIELD(Preparation No);
                SubPageView = SORTING(Document No,Line No)
                              WHERE(Titre Principale=CONST(No));
                Visible = false;
            }
            part("Accessoires montés";50075)
            {
                CaptionML = ENU='Accessoires montés',
                            FRA='Accessoires montés';
                SubPageLink = Service Item Serial No.=FIELD(VIN);
                SubPageView = WHERE(Type=FILTER(Item),
                                    No.=FILTER(<>CARBURANT));
            }
            part("Accessoires manquants";70276)
            {
                CaptionML = ENU='Accessoires manquants',
                            FRA='Accessoires manquants';
                SubPageLink = N°BLIV=FIELD(Num BL);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Function")
            {
                action(Livrer)
                {
                    Image = SalesShipment;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                         IF CONFIRM('Voulez vous  livrée la véhicule ?')  THEN
                         BEGIN
                            //SM MAZDA301
                            //OLD IF "CheckListe Valider" THEN BEGIN

                               TESTFIELD("Plaque Monté",TRUE);
                               TESTFIELD(Lavage,TRUE);
                               IF NOT CUSAVManagement.CheckVINIsPaied(VIN) THEN
                                 TESTFIELD("Acceptation Financière",TRUE);

                               VALIDATE("Status Livraison","Status Livraison"::Livrée)
                            //OLD END ELSE ERROR('Check liste doit être valider avant livraison');
                            //SM MAZDA301
                         END;
                    end;
                }
                action("Créer rendez Vous")
                {
                    Image = PersonInCharge;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        PreparationVN : Record "60025";
                    begin
                        //SM 2306


                        //SM 2306 IF "Status Livraison" = "Status Livraison"::"Rendez-Vous crée" THEN
                        //SM 2306  ERROR('Rendez-vous déja crée');

                        //SM 2306TESTFIELD("Status Livraison",0);

                        CLEAR(Rendezvous);
                        PreparationVN.GET("Preparation No");
                        Rendezvous.SETTABLEVIEW(PreparationVN);
                        Rendezvous.SETRECORD(PreparationVN);
                        Rendezvous.RUN;
                    end;
                }
                action("Crée Commande")
                {
                    Caption = 'Créer Commande';
                    Image = CreateDocuments;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        CuSAVManagement : Codeunit "50010";
                    begin

                        CuSAVManagement.CreateServOrderFromLivraisonVN(Rec);
                    end;
                }
            }
            group("&Inspection")
            {
                Visible = false;
                action("Inspection avant livraison Vehicule Neuf")
                {
                    Caption = 'Générer Inspection Avant Livraison';
                    Image = Check;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        ControlVenteVN : Record "60026";
                    begin
                        //SM MAZDA301
                        ERROR('Interdit');
                        //SM MAZDA301
                        // 0: ,
                        // 1: Réception VN,
                        // 2: Réception VN inter Parc,
                        // 3: Avant Livraison

                        CLEAR(ControlVenteVN);
                        ControlVenteVN.SETRANGE(ControlVenteVN."No Chassis",VIN);
                        ControlVenteVN.SETRANGE("Document No","Preparation No");
                        ControlVenteVN.SETRANGE( "Type Control",ControlVenteVN."Type Control"::"Avant Livraison");
                        IF NOT ControlVenteVN.FINDFIRST THEN
                           CreateControl(3);
                    end;
                }
                action("Valider inspection")
                {
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    begin
                        //SM MAZDA301
                        ERROR('Interdit');
                        //SM MAZDA301

                            IF "Status Livraison" = "Status Livraison"::"Rendez-Vous crée" THEN
                              ValiderControlLine()
                          ELSE ERROR('Rendez-vous doit être crée');
                    end;
                }
                action("Imprimer Check Liste")
                {
                    Image = PrintCheck;
                    Promoted = true;
                    PromotedCategory = Category7;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        RecPreparationVN : Record "60025";
                    begin
                        //SM MAZDA301
                        ERROR('Interdit');
                        //SM MAZDA301

                        IF "CheckListe Validée" THEN
                        BEGIN
                            CLEAR(RecPreparationVN);
                            RecPreparationVN.SETRANGE("Preparation No","Preparation No");

                              IF RecPreparationVN.FINDFIRST THEN
                            BEGIN
                                REPORT.RUN(REPORT::"Check liste Avant Livraison",TRUE,TRUE,RecPreparationVN);
                            END;
                        END
                        ELSE ERROR('Checkliste doit être valider avant l''impression');
                    end;
                }
            }
            group("&Document")
            {
                action("Imprimer BL")
                {
                    Caption = 'Imprimer BL';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecPreparationVN : Record "60025";
                        TXT50000 : Label 'Livraison doit être valider avant l''''impression de bon de sortie';
                        ServiceItem : Record "5940";
                    begin
                        //SM MAZDA301
                        //SM 2306 IF "Status Livraison" = "Status Livraison"::"Rendez-Vous crée" THEN BEGIN
                        IF "Date rendez vous"=0DT THEN
                          ERROR('Veuillez créer un rendez-vous!');
                        //KT 27022020
                        TESTFIELD("Date Livraison");
                        //END KT
                        IF CONFIRM(text001) THEN BEGIN
                          ServiceItem.RESET;
                          ServiceItem.SETRANGE("Serial No.",VIN);
                          ServiceItem.FINDFIRST;
                          ServiceItem.CALCFIELDS("Statut Carte Grise");
                          //SM 100917
                          IF NOT ServiceItem."Dérogation DC Livraison" THEN
                          //END SM
                            ServiceItem.TESTFIELD("Statut Carte Grise",ServiceItem."Statut Carte Grise"::Reçue);
                          //END SM
                          SalesShipmentHeader.SETRANGE("No.",ServiceItem."Sales/Serv. Shpt. Document No.");
                          IF SalesShipmentHeader.FINDFIRST THEN BEGIN
                          R_BonsortieVN.SetServiceItemNo(ServiceItem."No.");
                            //KT 27022020
                          R_BonsortieVN.SetShipmentDate(DT2DATE("Date Livraison"));
                          R_BonsortieVN.SETTABLEVIEW(SalesShipmentHeader);
                          // R_BonsortieVN.SetServiceItemNo(ServiceItem."No.");
                          //
                          R_BonsortieVN.RUN;
                         // REPORT.RUN(REPORT::"Bon sortie VN",TRUE,TRUE,SalesShipmentHeader);
                        
                           END;
                          //SM 270717 TMP A VOIR ServiceItem.TESTFIELD(Emplacement,ServiceItem.Emplacement::"Chez Aures Auto");
                        /*
                          CLEAR(RecPreparationVN);
                          RecPreparationVN.SETRANGE("Preparation No","Preparation No");
                          REPORT.RUN(REPORT::"Bon sortie VN",TRUE,TRUE,RecPreparationVN);
                        */
                          IF "Date Livraison"=0DT THEN
                            "Date Livraison"   := CURRENTDATETIME;
                        
                          "Status Livraison" := "Status Livraison"::Livrée;
                          IF ServiceItem."Date Livraison"=0DT THEN
                            ServiceItem."Date Livraison" := CURRENTDATETIME;
                          ServiceItem.Emplacement := ServiceItem.Emplacement::"Chez client";
                          //SM 01/10/17
                          //KT 251017
                          ServiceItem.Livreur:=Livreur;
                          //END KT
                          ServiceItem."Préparation/Livraison" := ServiceItem."Préparation/Livraison"::Livrer;
                          //END SM
                          ServiceItem.MODIFY;
                          MODIFY;
                        END;
                        //SM 2306 END ELSE
                        //SM 2306   ERROR('Vous devez créer un rendez-vous ! ');

                    end;
                }
                action("Liste Bon Manquant")
                {
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;
                    Visible = true;

                    trigger OnAction();
                    var
                        BonManquant : Report "50075";
                        SalesShipmentHeader : Record "110";
                        PreparationVN : Record "60025";
                    begin
                        CLEAR(BonManquant);
                        PreparationVN.RESET;
                        PreparationVN.SETRANGE("Num BL","Num BL");
                        IF PreparationVN.FINDFIRST THEN BEGIN
                          BonManquant.SETTABLEVIEW(PreparationVN);
                          BonManquant.RUN;
                        END;
                    end;
                }
                action("Consulter commande")
                {
                    Caption = 'Consulter Commande';
                    Image = ServiceLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction();
                    var
                        RecLServiceHeader : Record "5900";
                    begin
                        //SM MAZDA301
                        ERROR('Interdit');
                        //SM MAZDA301

                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Document Type",RecLServiceHeader."Document Type"::Order);
                        RecLServiceHeader.SETRANGE(RecLServiceHeader."Reception No","Preparation No");
                        IF RecLServiceHeader.FINDFIRST THEN
                          PAGE.RUN(PAGE::"Service Order",RecLServiceHeader);
                    end;
                }
                action(Contrat3GAA)
                {
                    Caption = 'Imprimer contrat 3GAA';
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = "Report";

                    trigger OnAction();
                    begin
                        PreparationVN.SETRANGE("Preparation No","Preparation No");
                        PreparationVN.FINDFIRST;
                        REPORT.RUN(70034,TRUE,TRUE,PreparationVN);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        CALCFIELDS("N contrat 3GAA");
    end;

    trigger OnAfterGetRecord();
    begin

         IF ("Status Livraison"= "Status Livraison"::Livrée) OR ("Status Livraison"= "Status Livraison"::"4")  THEN
            Editable := FALSE;
        CALCFIELDS("N contrat 3GAA");
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
         "Service Type":= "Service Type"::Livraison;
    end;

    trigger OnOpenPage();
    begin
        /*
        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;
        */
        Editable := TRUE;

    end;

    var
        RecGVehicule : Record "27";
        PageLigneRcp : Page "60020";
        RecGRecpetion : Record "60008";
        UserMgt : Codeunit "5700";
        Editable : Boolean;
        CUSAVManagement : Codeunit "50010";
        Rendezvous : Page "70088";
        SalesShipmentHeader : Record "110";
        R_BonsortieVN : Report "60033";
        PreparationVN : Record "60025";
        UserSetup : Record "91";
        text001 : Label 'Voulez-vous imprimer le bon de livraison ?';
}

