page 70041 "VN Arrivage ADV"
{
    // version VN0002

    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table70015;
    SourceTableView = SORTING(Date livraison)
                      WHERE(Statut VIN=FILTER(<>Supprimé),
                            Existe en Stock=CONST(No),
                            CAF=FILTER(<>CAF-OUV*));

    layout
    {
        area(content)
        {
            group(Statistique)
            {
                field("Nbre de Véhicules";NbreVehicule)
                {
                    DecimalPlaces = 0:0;
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Véhicules Résevés";NbreVehiculeReserve)
                {
                    DecimalPlaces = 0:0;
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Véhicules Libres";NbreVehicule-NbreVehiculeReserve)
                {
                    DecimalPlaces = 0:0;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Vehicules Produits Avec VIN";NbreVehiculeAvecVIN)
                {
                    DecimalPlaces = 0:0;
                    Editable = false;
                }
            }
            repeater(Group)
            {
                field(CAF;CAF)
                {
                    Editable = false;
                    StyleExpr = LineColor;
                }
                field("Date livraison";"Date livraison")
                {
                    ToolTip = 'Date livraison';
                }
                field(Famille;Famille)
                {
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
                field("Code variante";"Code variante")
                {
                    Editable = false;
                    StyleExpr = TRUE;
                }
                field("Code couleur";"Code couleur")
                {
                    Editable = false;
                }
                field("Description Couleur";"Description Couleur")
                {
                    Editable = false;
                }
                field("Garnissage Int.";"Garnissage Int.")
                {
                    Editable = false;
                }
                field("Description Garnissage";"Description Garnissage")
                {
                    Editable = false;
                }
                field("Code pers";"Code pers")
                {
                    Editable = false;
                }
                field(Options;Options)
                {
                    Visible = false;
                }
                field("Item No.";"Item No.")
                {
                    DrillDownPageID = "Vehicule List";
                    LookupPageID = "Vehicule List";
                }
                field(Description;Description)
                {
                }
                field(VIN;VIN)
                {
                    Editable = false;
                    StyleExpr = LineColor;
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
                field("Sales Order Line No";"Sales Order Line No")
                {
                    CaptionML = ENU='Sales Order Line No',
                                FRA='N° ligne commande vente';
                }
                field("Document status";"Document status")
                {
                    Editable = false;
                }
                field("Code Titre";"Code Titre")
                {
                }
                field("Répartiton HT\TTC";"Répartiton HT\TTC")
                {
                }
                field("Réservation DC";"Réservation DC")
                {
                    Editable = false;
                }
                field("Commentaire DC";"Commentaire DC")
                {
                }
                field(Observation;Observation)
                {
                }
                field("Préfixe VIN";"Préfixe VIN")
                {
                    Editable = false;
                }
                field("Radical VIN";"Radical VIN")
                {
                    Editable = false;
                }
                field("Suffixe VIN";"Suffixe VIN")
                {
                    Editable = false;
                }
                field("Dernière date MAJ";"Dernière date MAJ")
                {
                    Editable = false;
                }
                field("Reférence local";"Reférence local")
                {
                    Editable = false;
                }
                field("No. moteur";"No. moteur")
                {
                    Editable = false;
                }
                field("Date production";"Date production")
                {
                    Editable = false;
                }
                field(Usine;Usine)
                {
                    Editable = false;
                }
                field("Port d'embarquament";"Port d'embarquament")
                {
                    Editable = false;
                }
                field("Code devise";"Code devise")
                {
                }
                field("No. Expédition";"No. Expédition")
                {
                    Editable = false;
                }
                field("No. proforma";"No. proforma")
                {
                    Editable = false;
                }
                field("Date bâteau visé";"Date bâteau visé")
                {
                    Editable = false;
                }
                field("Nom du navire";"Nom du navire")
                {
                    Editable = false;
                }
                field("Date Emb. prévu";"Date Emb. prévu")
                {
                    Editable = false;
                }
                field("Date Emb. confirmée";"Date Emb. confirmée")
                {
                    Editable = false;
                }
                field("Date Emb. Estimée";"Date Emb. Estimée")
                {
                    Editable = false;
                }
                field("No. lettre de crédit";"No. lettre de crédit")
                {
                    Editable = false;
                }
                field("Commentaire..";"Commentaire..")
                {
                    Editable = false;
                }
                field("Statut VIN";"Statut VIN")
                {
                    Editable = false;
                }
                field("VIN Reserved";"VIN Reserved")
                {
                    Editable = false;
                }
                field("Réservé pour";"Réservé pour")
                {
                    Editable = false;
                }
                field("Date réception dossier";"Date réception dossier")
                {
                }
                field("Dossier complet";"Dossier complet")
                {
                }
                field("Dossier Validé";"Dossier Validé")
                {
                }
                field(Justificatif;Justificatif)
                {
                }
                field("Date Création Commande";"Date Création Commande")
                {
                }
                field(Commentaire;Commentaire)
                {
                }
                field("Commentaire Kais";"Commentaire Kais")
                {
                }
                field("No. commande achat";"No. commande achat")
                {
                }
                field("Arrival Date(ETA)";"Arrival Date(ETA)")
                {
                }
                field("DS No.";"DS No.")
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
                Visible = false;

                trigger OnAction();
                var
                    "ImportModèleVN" : XMLport "70003";
                begin
                    XMLPORT.RUN(70003,TRUE,FALSE)
                    //ImportModèleVN.RUN
                     /*CLEAR(MgtAures);
                     MgtAures.ImportVIN;
                     COMMIT;*/

                end;
            }
            action("Import Perse")
            {
                Image = ImportExcel;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction();
                var
                    ImportPerse : XMLport "70011";
                begin

                    ImportPerse.RUN;
                end;
            }
            action("Réservation Véhicule sur stock ou commande achat")
            {
                Caption = 'Réservation Véhicule sur stock ou commande achat';
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
            action("Create modèle")
            {
                Image = CreateInteraction;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction();
                var
                    LPagConfigurateurFicheArticle : Page "60186";
                begin
                    LPagConfigurateurFicheArticle.FctCreateItem("Code version","Code pers","Code couleur","Garnissage Int.","Libelé version");
                end;
            }
            action("Supprimer VIN")
            {
                Image = CancelAllLines;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Category4;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                Visible = false;

                trigger OnAction();
                begin
                    IF CONFIRM(TXT50002) THEN BEGIN
                      VNArrivageToDelete.RESET;
                      VNArrivageToDelete.SETRANGE("Statut VIN","Statut VIN"::"A réserver");
                      IF NOT VNArrivageToDelete.ISEMPTY THEN
                        ERROR(TXT50001);

                      VNArrivageToDelete.RESET;
                      VNArrivageToDelete.SETRANGE("Statut VIN","Statut VIN"::"A supprimer");
                      IF VNArrivageToDelete.FINDSET THEN
                        VNArrivageToDelete.MODIFYALL("Statut VIN",VNArrivageToDelete."Statut VIN"::Supprimé);
                    END;
                end;
            }
            action("70059")
            {
                Caption = 'Importer Commande Confirmée du Mois';
                Image = Import;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    DetailVNArrivage : Record "70015";
                    MgtAures : Codeunit "70006";
                    EntetExpeditionVN : Record "70033";
                begin
                    CLEAR(ImportModelVINCAFfromOrder);
                    ImportModelVINCAFfromOrder.RUN;
                    /*//KT TODOCréation automatique projet expédition
                    DetailVNArrivage.RESET;
                    DetailVNArrivage.SETRANGE("Créer projet expédition",TRUE);
                    DetailVNArrivage.SETRANGE("No. Line Expédition",0);
                    IF DetailVNArrivage.FINDSET THEN BEGIN
                      REPEAT
                    //    EntetExpeditionVN.RESET;
                    //    EntetExpeditionVN.SETRANGE("No. Expédition",DetailVNArrivage."Date production");
                    //    IF EntetExpeditionVN.ISEMPTY THEN
                          MgtAures.CréerExpedition(TRUE,DetailVNArrivage."Date production",TRUE); //Groupé par Item et Proforma  : spécifique
                      UNTIL DetailVNArrivage.NEXT=0;
                    END;
                    */

                end;
            }
            action("70060")
            {
                Caption = 'Importer Fichier de Livraison';
                Image = Calendar;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction();
                var
                    ImportModelVINCAF : XMLport "70060";
                begin
                    CLEAR(ImportModelVINCAF);
                    ImportModelVINCAF.RUN;
                end;
            }
            action("70061")
            {
                Caption = 'Importer Commande Sage';
                Image = "Order";
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction();
                begin
                    CLEAR(ImportVINCAFfromOpenOrder);
                    ImportVINCAFfromOpenOrder.RUN;
                end;
            }
            action("70062")
            {
                Visible = false;

                trigger OnAction();
                begin
                    CLEAR(ImportModelfromOrder2);
                    ImportModelfromOrder2.RUN;
                end;
            }
            action("70063")
            {
                Caption = 'Importer Fichier de Livraison';
                Image = Calendar;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction();
                var
                    ImportModelVINCAF : XMLport "70060";
                begin
                    CLEAR(ImportDeliverySchedule);
                    ImportDeliverySchedule.RUN;
                end;
            }
            action("70064")
            {
                Caption = 'Importer Fichier de Livraison';
                Image = Calendar;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction();
                var
                    ImportModelVINCAF : XMLport "70060";
                begin
                    CLEAR(ImportDeliverySchedule_COSMOS);
                    ImportDeliverySchedule_COSMOS.RUN;
                end;
            }
            action("7006470065")
            {
                Caption = 'Importer Fichier de Livraison';
                Image = Calendar;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    TextFilter:='TMC,TSAM,TMAP,GEX';
                    Selection:=STRMENU(TextFilter);
                    CASE Selection OF
                      0: BEGIN
                        EXIT;
                        END;
                      1:BEGIN
                        CLEAR(ImportDeliverySchedule_COSMOS);
                        ImportDeliverySchedule_COSMOS.RUN;
                        END;
                      2: BEGIN
                        CLEAR(ImportDeliverySchedule_EU);
                        ImportDeliverySchedule_EU.RUN;
                        END;
                      3:BEGIN
                        CLEAR(ImportDeliverySchedule_EU);
                        ImportDeliverySchedule_EU.RUN;
                        END;
                      4: BEGIN
                        CLEAR(ImportDeliverySchedule_EU);
                        ImportDeliverySchedule_EU.RUN;
                        END;
                      END;
                end;
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
        DétailVNArrivageCount.RESET;
        DétailVNArrivageCount.COPYFILTERS(Rec);
        NbreVehicule := DétailVNArrivageCount.COUNTAPPROX;
        IF DétailVNArrivageCount.FINDSET THEN BEGIN
          DétailVNArrivageCount.SETFILTER("Sales Order No.",'<>%1',Vide);
          NbreVehiculeReserve := DétailVNArrivageCount.COUNTAPPROX;
          DétailVNArrivageCount.SETRANGE("Sales Order No.");
          DétailVNArrivageCount.SETFILTER(VIN,'<>%1',Vide);
          NbreVehiculeAvecVIN := DétailVNArrivageCount.COUNTAPPROX;
        END;
        //END SM
    end;

    trigger OnAfterGetRecord();
    begin
        CALCFIELDS("VIN Reserved");
        IF ("Sales Order No." <> '') OR ("VIN Reserved") THEN
          LineColor := 'Favorable'
        ELSE
          LineColor := 'Standard';
    end;

    trigger OnInit();
    begin
        VarHideValue := FALSE;
        VarVisible := FALSE;
    end;

    trigger OnOpenPage();
    begin
        //EM VNF001 20/02/2017
        UserSetup.RESET;
        UserSetup.GET(USERID);
        IF UserSetup."Cost Responsable" THEN BEGIN
          VarHideValue := TRUE;
          VarVisible:= TRUE;
        END
        ELSE BEGIN
          VarHideValue := FALSE;
          VarVisible := FALSE;
        END;
        //END EM VNF001 20/02/2017
    end;

    var
        LineColor : Text[15];
        TXT50000 : Label 'Etes vous sur de créer une commande achat pour les VIN sélectionnés ?';
        Proforma : Code[10];
        "EntêtExpéditionVN" : Record "70033";
        "DétailVNArrivage" : Record "70015";
        "LigneExpéditionVN" : Record "70034";
        MgtAures : Codeunit "70003";
        TXT50001 : Label 'Vous ne pouvez pas supprimer des VIN non encore réservés !';
        VNArrivageToDelete : Record "70015";
        TXT50002 : Label 'Etes-vous sûre de supprimer les lignes VIN+CAF ?';
        UserSetup : Record "91";
        VarHideValue : Boolean;
        VarVisible : Boolean;
        ImportModelVINCAFfromOrder : XMLport "70059";
        ImportVINCAFfromOpenOrder : XMLport "70061";
        ImportModelfromOrder2 : XMLport "70062";
        NbreVehicule : Decimal;
        NbreVehiculeReserve : Decimal;
        NbreVehiculeAvecVIN : Decimal;
        "DétailVNArrivageCount" : Record "70015";
        Vide : Code[10];
        ImportDeliverySchedule : XMLport "70063";
        ImportDeliverySchedule_COSMOS : XMLport "70064";
        ImportDeliverySchedule_EU : XMLport "70065";
        TextFilter : Text;
        Selection : Integer;
}

