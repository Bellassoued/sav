page 60195 "Liste VN Arrivage V2"
{
    // version VN0002

    DeleteAllowed = false;
    PageType = Worksheet;
    SourceTable = Table70015;
    SourceTableView = WHERE(Statut VIN=FILTER(<>Supprimé));

    layout
    {
        area(content)
        {
            field(FilterExpedNo;FilterExpedNo)
            {
                Caption = 'Filter No. Expdition à Crée';

                trigger OnValidate();
                begin
                    SETFILTER("No. Expédition",'%1',FilterExpedNo);
                    CurrPage.SAVERECORD;
                    CurrPage.UPDATE(FALSE);
                end;
            }
            repeater(Group)
            {
                field(CAF;CAF)
                {
                    StyleExpr = LineColor;
                }
                field(VIN;VIN)
                {
                    StyleExpr = LineColor;
                }
                field("VIN Reserved";"VIN Reserved")
                {
                }
                field(Famille;Famille)
                {
                }
                field("Code couleur";"Code couleur")
                {
                }
                field("Garnissage Int.";"Garnissage Int.")
                {
                }
                field("Date production";"Date production")
                {
                }
                field("Date Emb. prévu";"Date Emb. prévu")
                {
                }
                field("Date Emb. confirmée";"Date Emb. confirmée")
                {
                }
                field("Date Emb. Estimée";"Date Emb. Estimée")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Customer Name";"Customer Name")
                {
                }
                field("Sales person code";"Sales person code")
                {
                }
                field("Sales person name";"Sales person name")
                {
                }
                field("Order date";"Order date")
                {
                }
                field("Sales Order No.";"Sales Order No.")
                {
                }
                field("Document type";"Document type")
                {
                }
                field("Document status";"Document status")
                {
                }
                field(Observation;Observation)
                {
                }
                field("Reférence local";"Reférence local")
                {
                }
                field("Code version";"Code version")
                {
                }
                field("Libelé version";"Libelé version")
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
                field("Préfixe VIN";"Préfixe VIN")
                {
                }
                field("Radical VIN";"Radical VIN")
                {
                }
                field("Suffixe VIN";"Suffixe VIN")
                {
                }
                field("Dernière date MAJ";"Dernière date MAJ")
                {
                }
                field("Statut VIN";"Statut VIN")
                {
                }
                field("Item No.";"Item No.")
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
                field("Prix Options calculé";"Prix Options calculé")
                {
                }
                field("Prix couleur calculé";"Prix couleur calculé")
                {
                }
                field("Prix Garnissage calculé";"Prix Garnissage calculé")
                {
                }
                field("Mnt Mino Unitaire";"Mnt Mino Unitaire")
                {
                }
                field("Mnt Mino Unitaire Animation";"Mnt Mino Unitaire Animation")
                {
                }
                field("Prix achat Net avec Mino";"Prix achat Net avec Mino")
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
            action("Confirmer Expédition ( supprimer)")
            {
                Visible = false;

                trigger OnAction();
                begin
                    CLEAR(DétailVNArrivage);
                    DétailVNArrivage.SETFILTER(DétailVNArrivage."A expédier",'%1',TRUE);
                    DétailVNArrivage.FIND('-');
                    EntêtExpéditionVN.GET(DétailVNArrivage."No. Expédition");
                    EntêtExpéditionVN.Désignation := EntêtExpéditionVN."No. Expédition" + '/' + FORMAT(DMY2DATE(3));
                    EntêtExpéditionVN.MODIFY;

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
                          LigneExpéditionVN."Désignation version" := EntêtExpéditionVN."No. Expédition" + '/' + FORMAT(DMY2DATE(3));
                          LigneExpéditionVN.Modele := DétailVNArrivage.Famille;
                          LigneExpéditionVN.Quantité := 1;
                          LigneExpéditionVN."Tot. En Devise (sans Mino)" := DétailVNArrivage."Prix d'achat unitaire";
                          LigneExpéditionVN.INSERT;
                         END
                         ELSE
                          BEGIN
                           LigneExpéditionVN.Quantité += 1;
                           LigneExpéditionVN."Tot. En Devise (sans Mino)" += DétailVNArrivage."Prix d'achat unitaire";
                           LigneExpéditionVN.MODIFY;
                          END;
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
                    MgtAures.FctCreateautoTransferOrderPRAMB;     //Vers 2 expédition et proforma rempli lors de l'importation de VIN+CAF : Nouvelle demande de KAIS
                end;
            }
            action("Sélectionner A expédier ")
            {

                trigger OnAction();
                begin
                    IF FilterExpedNo = '' THEN ERROR(TXT50001);
                    MODIFYALL("A expédier",FALSE);
                    SETRANGE("No. Expédition",FilterExpedNo);
                    MODIFYALL("A expédier",TRUE);
                    SETRANGE("No. Expédition");
                end;
            }
            action("Créer Expédition")
            {
                Image = Receipt;

                trigger OnAction();
                begin
                    //SM VNJ001 310117
                    //MgtAures.CréerExpedition(FALSE,''); //Vers 1 expédition crée auto suite à la sélection des VIN dans VIN + CAF
                    IF FilterExpedNo = '' THEN ERROR(TXT50001);
                    MgtAures.CréerExpedition(TRUE,FilterExpedNo); //Vers 2 expédition et proforma rempli lors de l'importation de VIN+CAF : Nouvelle demande de KAIS
                    
                    
                    
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
            action("Créer Expédition Ancienne")
            {
                Image = Receipt;

                trigger OnAction();
                begin
                    //SM VNJ001 310117
                    MgtAures.CréerExpedition(TRUE,FilterExpedNo);
                    
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
        }
    }

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

    end;

    var
        LineColor : Text[15];
        TXT50000 : Label 'Etes vous sur de créer une commande achat pour les VIN sélectionnés ?';
        Proforma : Code[10];
        "EntêtExpéditionVN" : Record "70033";
        "DétailVNArrivage" : Record "70015";
        "LigneExpéditionVN" : Record "70034";
        MgtAures : Codeunit "70003";
        FilterExpedNo : Code[20];
        txtfil : Code[150];
        Count1 : Integer;
        TXT50001 : Label 'Veuillez mentionner le No. d''expédition à créer';
}

