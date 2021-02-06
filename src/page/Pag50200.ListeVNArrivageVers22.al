page 50200 "Liste VN Arrivage Vers22"
{
    // version VN0002

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Table70015;
    SourceTableView = SORTING(Date livraison)
                      WHERE(Statut VIN=FILTER(<>Supprimé),
                            Existe en Stock=CONST(No));

    layout
    {
        area(content)
        {
            group("Filtre No. Expédition")
            {
                Caption = 'Filtre No. Expédition';
                field(FilterExpedNo;FilterExpedNo)
                {
                    Caption = 'Filter No. Expdition à Crée';

                    trigger OnValidate();
                    begin
                        SETFILTER("No. Expédition",'%1',FilterExpedNo);
                        //SETFILTER(CAF,'%1',FilterExpedNo);
                        NbreVehicule:= COUNT;
                        CurrPage.SAVERECORD;
                        CurrPage.UPDATE(FALSE);
                    end;
                }
                field("Nbre de Véhicules";NbreVehicule)
                {
                    DecimalPlaces = 0:0;
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("Véhicules Résevés";NbreVehiculeReserve)
                {
                    DecimalPlaces = 0:0;
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("Véhicules Libres";NbreVehicule-NbreVehiculeReserve)
                {
                    DecimalPlaces = 0:0;
                    Style = Favorable;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("Vehicules Produits Avec VIN";NbreVehiculeAvecVIN)
                {
                    DecimalPlaces = 0:0;
                    Editable = false;
                    Visible = false;
                }
            }
            group("Liste VIN CAF")
            {
                Caption = 'Liste VIN CAF';
                repeater(Group)
                {
                    field("No. commande achat";"No. commande achat")
                    {
                    }
                    field("DS No.";"DS No.")
                    {
                    }
                    field("Date livraison";"Date livraison")
                    {

                        trigger OnValidate();
                        begin
                            "Date modifiée manuellement":=TRUE;
                        end;
                    }
                    field("Item No.";"Item No.")
                    {
                        Editable = false;
                    }
                    field("Code couleur";"Code couleur")
                    {
                        Caption = 'Couleur Ext.';
                        Editable = false;
                    }
                    field("Garnissage Int.";"Garnissage Int.")
                    {
                        Caption = 'Couleur Int.';
                        Editable = false;
                    }
                    field("Code version";"Code version")
                    {
                        Editable = false;
                    }
                    field("Libelé version";"Libelé version")
                    {
                        Editable = false;
                    }
                    field(VIN;VIN)
                    {
                        StyleExpr = LineColor;

                        trigger OnValidate();
                        begin
                            IF VIN<>'' THEN
                            GCduMgtAures.FctVerfierVINModele("Code version",VIN);
                        end;
                    }
                    field("VIN Reserved";"VIN Reserved")
                    {
                        Editable = false;
                    }
                    field(Famille;Famille)
                    {
                        Editable = false;
                    }
                    field("Date production";"Date production")
                    {
                        Editable = false;
                    }
                    field("Date Emb. prévu";"Date Emb. prévu")
                    {
                    }
                    field("Date Emb. confirmée";"Date Emb. confirmée")
                    {
                    }
                    field("Customer No.";"Customer No.")
                    {
                        Editable = false;
                    }
                    field("Customer Name";"Customer Name")
                    {
                        Editable = false;
                    }
                    field("Sales person code";"Sales person code")
                    {
                        Editable = false;
                    }
                    field("Sales person name";"Sales person name")
                    {
                        Editable = false;
                    }
                    field("Order date";"Order date")
                    {
                    }
                    field("Sales Order No.";"Sales Order No.")
                    {
                    }
                    field("Sales Order Line No";"Sales Order Line No")
                    {
                    }
                    field("Document type";"Document type")
                    {
                    }
                    field("Document status";"Document status")
                    {
                    }
                    field("Code Titre";"Code Titre")
                    {
                    }
                    field("Répartiton HT\TTC";"Répartiton HT\TTC")
                    {
                    }
                    field(Observation;Observation)
                    {
                    }
                    field("No. moteur";"No. moteur")
                    {
                    }
                    field("Code pers";"Code pers")
                    {
                    }
                    field(Options;Options)
                    {
                    }
                    field("Dernière date MAJ";"Dernière date MAJ")
                    {
                    }
                    field("Statut VIN";"Statut VIN")
                    {
                    }
                    field(Description;Description)
                    {
                    }
                    field("Code variante";"Code variante")
                    {
                        StyleExpr = TRUE;
                    }
                    field("A expédier";"A expédier")
                    {
                    }
                    field("No. Expédition";"No. Expédition")
                    {
                    }
                    field("No. proforma";"No. proforma")
                    {
                    }
                    field("No. lettre de crédit";"No. lettre de crédit")
                    {
                    }
                    field("No. Line Expédition";"No. Line Expédition")
                    {
                    }
                    field("Commentaire..";"Commentaire..")
                    {
                    }
                    field("Prix d'achat unitaire";"Prix d'achat unitaire")
                    {
                    }
                    field("Port d'embarquament";"Port d'embarquament")
                    {
                    }
                    field("Sales Type";"Sales Type")
                    {
                    }
                    field("Sales Code";"Sales Code")
                    {
                    }
                    field("Prix de vente";"Prix de vente")
                    {
                    }
                    field("Commentaire Kais";"Commentaire Kais")
                    {
                    }
                    field(CAF;CAF)
                    {
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Import Modèle VN")
            {
                Image = ImportExcel;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction();
                var
                    "ImportModèleVN" : XMLport "70003";
                begin

                    ImportModèleVN.RUN;
                end;
            }
            action("Réservation Véhicule en Stock")
            {
                Caption = 'Réservation Véhicules en Stock';
                Image = Reserve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction();
                begin
                    ReservationVéhiculeStock(Rec);
                end;
            }
            action("Créer commande achat VN ( a supp)")
            {
                Image = Purchasing;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction();
                var
                    CreateVNPurchaseOrder : Report "70015";
                begin
                    MESSAGE('ok1');
                    CreateVNPurchaseOrder.RUN;
                end;
            }
            action("Create véhicules")
            {
                Visible = false;

                trigger OnAction();
                var
                    LPagConfigurateurFicheArticle : Page "60186";
                begin
                    MESSAGE('ok');
                    LPagConfigurateurFicheArticle.FctCallTryCreateItem("Code version","Code pers","Code couleur","Garnissage Int.");
                end;
            }
            action("Affecter No. Expédition")
            {
                Visible = false;

                trigger OnAction();
                begin
                    MESSAGE('ok');
                    CLEAR(EntêtExpéditionVN);
                    CLEAR(DétailVNArrivage);
                    DétailVNArrivage.SETFILTER(DétailVNArrivage."A expédier",'%1',TRUE);
                    DétailVNArrivage.FIND('-');
                    EntêtExpéditionVN."Date Création" := WORKDATE;
                    EntêtExpéditionVN."crée par" := USERID;
                    EntêtExpéditionVN.INSERT(TRUE);
                    CLEAR(DétailVNArrivage);
                    DétailVNArrivage.SETFILTER(DétailVNArrivage."A expédier",'%1',TRUE);
                    DétailVNArrivage.FIND('-');
                     REPEAT
                      DétailVNArrivage."No. Expédition" := EntêtExpéditionVN."No. Expédition";
                      DétailVNArrivage.MODIFY;
                     UNTIL DétailVNArrivage.NEXT = 0;
                end;
            }
            action("Confirmer Expédition")
            {
                Image = Confirm;

                trigger OnAction();
                begin
                    //code pour calcul des montants et Net d'achat
                    //= prix fob + prix option + prix couleur + prix ganissage  - Mino - MinoAnimation
                    //prix fob : table catalogue prix achat
                    //option, couleur et garnissage : table option avec filter par option
                    //Mino : table catalogue prix achat
                    //MinoAnimation = saisie manuellement
                    //MgtAures.ConfirmerExpedition(FALSE,'');  //Vers 1 expédition crée auto suite à la sélection des VIN dans VIN + CAF
                    MgtAures.ConfirmerExpedition(TRUE,FilterExpedNo);     //Vers 2 expédition et proforma rempli lors de l'importation de VIN+CAF : Nouvelle demande de KAIS
                end;
            }
            action("Sélectionner A expédier ")
            {

                trigger OnAction();
                begin
                    IF FilterExpedNo = '' THEN ERROR(TXT50001);
                    //MODIFYALL("A expédier",FALSE);
                    SETRANGE("No. Expédition",FilterExpedNo);
                    MODIFYALL("A expédier",TRUE);
                    SETRANGE("No. Expédition");
                end;
            }
            action("Créer Expéd. (Groupé/Prov./Réf)")
            {
                Caption = 'Créer Expéd. (Groupé/Prov./Réf)';
                Image = Receipt;

                trigger OnAction();
                begin
                    IF FilterExpedNo = '' THEN ERROR(TXT50001);
                    MgtAures.CréerExpedition(TRUE,FilterExpedNo,TRUE); //Groupé par Item et Proforma  : spécifique
                end;
            }
            action("Créer Expédition Ancienne")
            {
                Image = Receipt;
                Visible = false;

                trigger OnAction();
                begin
                    //SM VNJ001 310117
                    //MgtAures.CréerExpedition(TRUE,FilterExpedNo); //commentaire HR : utiliser la F° Créer Expédition
                    
                    /*
                    CLEAR(EntêtExpéditionVN);
                    CLEAR(DétailVNArrivage);
                    DétailVNArrivage.SETFILTER(DétailVNArrivage."A expédier",'%1',TRUE);
                    DétailVNArrivage.FIND('-');
                    EntêtExpéditionVN."Date Création" := WORKDATE;
                    EntêtExpéditionVN."crée par" := USERID;
                    EntêtExpéditionVN.INSERT(TRUE);
                    CLEAR(DétailVNArrivage);
                    DétailVNArrivage.SETFILTER(DétailVNArrivage."A expédier",'%1',TRUE);
                    DétailVNArrivage.FIND('-');
                     REPEAT
                       CLEAR(LigneExpéditionVN);
                      LigneExpéditionVN.SETRANGE("No. Expédition",EntêtExpéditionVN."No. Expédition");
                      LigneExpéditionVN.SETRANGE(Modele,DétailVNArrivage.Famille);
                      IF NOT LigneExpéditionVN.FIND('-') THEN
                        BEGIN
                          LigneExpéditionVN."No. Expédition" := EntêtExpéditionVN."No. Expédition";
                          LigneExpéditionVN."No. proforma" := '';
                          LigneExpéditionVN.Désignation := EntêtExpéditionVN."No. Expédition" + '/' + FORMAT(DMY2DATE(3));
                          LigneExpéditionVN.Modele := DétailVNArrivage.Famille;
                          LigneExpéditionVN.Quantité := 1;
                          LigneExpéditionVN.Valeur := DétailVNArrivage."Prix d'achat unitaire validé";
                          LigneExpéditionVN.INSERT;
                         END
                         ELSE
                          BEGIN
                           LigneExpéditionVN.Quantité += 1;
                           LigneExpéditionVN.Valeur += DétailVNArrivage."Prix d'achat unitaire validé";
                           LigneExpéditionVN.MODIFY;
                          END;
                      DétailVNArrivage."No. Expédition" := EntêtExpéditionVN."No. Expédition";
                      DétailVNArrivage.MODIFY;
                    
                     UNTIL DétailVNArrivage.NEXT = 0;
                    */
                    /*
                    CLEAR(DétailVNArrivage);
                    DétailVNArrivage.SETFILTER(DétailVNArrivage."A expédier",'%1',TRUE);
                    DétailVNArrivage.FIND('-');
                    EntêtExpéditionVN.GET(DétailVNArrivage."No. Expédition");
                    EntêtExpéditionVN.Désignation := EntêtExpéditionVN."No. Expédition" + '/' + FORMAT(DMY2DATE(3));
                    EntêtExpéditionVN.MODIFY;
                    
                    */

                end;
            }
            action("70058")
            {
                Image = Import;
                Visible = false;

                trigger OnAction();
                var
                    ImportModelVINCAF : XMLport "70058";
                begin
                    //CLEAR(ImportModelVINCAF);
                    //ImportModelVINCAF.RUN;
                    XMLPORT.RUN(70058);
                end;
            }
            action("Import Modèle VN2")
            {
                Image = ImportExcel;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction();
                var
                    ImportModelVINCAF : XMLport "70057";
                    "ImportModèleVN" : XMLport "70003";
                begin

                    ImportModelVINCAF.RUN;
                end;
            }
            action("Maj VIN Commande Achat VN")
            {
                Image = TransferToLines;

                trigger OnAction();
                var
                    MgtAures : Codeunit "70003";
                begin
                    //SM 160119
                    MgtAures.UpdateVINLigneAchatVN;
                end;
            }
            action("Modifer date de livraison")
            {
                RunObject = Report 60253;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin

        Vide := '';
        //SM 040119
        NbreVehicule := 0;
        NbreVehiculeReserve := 0;
        NbreVehiculeAvecVIN  := 0;
        // DétailVNArrivageCount.RESET;
        // DétailVNArrivageCount.COPYFILTERS(Rec);
        // NbreVehicule := DétailVNArrivageCount.COUNTAPPROX;
        // IF DétailVNArrivageCount.FINDSET THEN BEGIN
        //  DétailVNArrivageCount.SETFILTER("Sales Order No.",'<>%1',Vide);
        //  NbreVehiculeReserve := DétailVNArrivageCount.COUNTAPPROX;
        //  DétailVNArrivageCount.SETRANGE("Sales Order No.");
        //  DétailVNArrivageCount.SETFILTER(VIN,'<>%1',Vide);
        //  NbreVehiculeAvecVIN := DétailVNArrivageCount.COUNTAPPROX;
        // END;
        //END SM
    end;

    trigger OnAfterGetRecord();
    begin
        /*
        IF "Motif ligne"="Motif ligne"::"A réserver" THEN
          LineColor := 'Favorable'
        ELSE IF "Motif ligne"="Motif ligne"::"A supprimer" THEN
          LineColor := 'Attention'
        ELSE IF "Motif ligne"="Motif ligne"::"Mise à jour" THEN
          LineColor := 'StandardAccent'
        ELSE
          LineColor := 'Standard'
        */
        NbreVehicule:= COUNT

    end;

    var
        LineColor : Text[15];
        TXT50000 : Label 'Etes vous sur de créer une commande achat pour les VIN sélectionnés ?';
        Proforma : Code[10];
        "EntêtExpéditionVN" : Record "70033";
        "DétailVNArrivage" : Record "70015";
        "LigneExpéditionVN" : Record "70034";
        MgtAures : Codeunit "70006";
        FilterExpedNo : Code[20];
        txtfil : Code[150];
        Count1 : Integer;
        TXT50001 : Label 'Veuillez mentionner le No. d''expédition à créer';
        NbreVehicule : Decimal;
        NbreVehiculeReserve : Decimal;
        NbreVehiculeAvecVIN : Decimal;
        "DétailVNArrivageCount" : Record "70015";
        Vide : Code[10];
        GCduMgtAures : Codeunit "70003";
        UserSetup : Record "91";
        RecordLink : Record "2000000068";
        ClientTypeManagement : Codeunit "4";
}

