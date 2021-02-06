page 50186 "VN Arrivage Dir.VN"
{
    // version VN0002

    DeleteAllowed = false;
    PageType = List;
    SourceTable = Table70015;
    SourceTableView = SORTING(Date livraison)
                      WHERE(Statut VIN=FILTER(<>Supprimé),
                            Existe en Stock=CONST(No),
                            CAF=FILTER(<>CAF*));

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
                    CaptionML = ENU='Line',
                                FRA='Ligne';
                    Editable = false;
                    StyleExpr = LineColor;
                }
                field("Date livraison";"Date livraison")
                {
                }
                field("Date production";"Date production")
                {
                    Caption = 'Production';
                    Editable = false;
                }
                field(Famille;Famille)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Code version";"Code version")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Libelé version";"Libelé version")
                {
                    Editable = false;
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
                    Caption = 'Garnissage Int.';
                    Editable = false;
                }
                field("Description Garnissage";"Description Garnissage")
                {
                    Editable = false;
                }
                field("Code pers";"Code pers")
                {
                    Editable = false;
                    Visible = false;
                }
                field(Options;Options)
                {
                    Editable = false;
                    Visible = false;
                }
                field(Finition;Finition)
                {
                    Visible = false;
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

                    trigger OnValidate();
                    begin
                        IF "Commentaire Kais"  = 'ND' THEN
                           ERROR('Vous ne pouvez pas réserver ce VIN ! ');
                    end;
                }
                field("Sales Order Line No";"Sales Order Line No")
                {
                    CaptionML = ENU='Sales Order Line No',
                                FRA='N° ligne commande vente';
                }
                field("Code Titre";"Code Titre")
                {
                    Editable = false;
                }
                field("Répartiton HT\TTC";"Répartiton HT\TTC")
                {
                }
                field("Réservation DC";"Réservation DC")
                {
                    Visible = ShowReservation;
                }
                field("Commentaire DC";"Commentaire DC")
                {
                }
                field("Document type";"Document type")
                {
                }
                field("Centre de gestion";"Centre de gestion")
                {
                    Editable = false;
                }
                field("Document status";"Document status")
                {
                    Editable = false;
                }
                field(Observation;Observation)
                {
                }
                field("Préfixe VIN";"Préfixe VIN")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Radical VIN";"Radical VIN")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Suffixe VIN";"Suffixe VIN")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Dernière date MAJ";"Dernière date MAJ")
                {
                    Editable = false;
                    Visible = false;
                }
                field("No. moteur";"No. moteur")
                {
                    Editable = false;
                    Visible = false;
                }
                field("E Com prévisionelle";"E Com prévisionelle")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Reférence local";"Reférence local")
                {
                }
                field(Usine;Usine)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Port d'embarquament";"Port d'embarquament")
                {
                    Editable = false;
                }
                field("No. Expédition";"No. Expédition")
                {
                    Editable = false;
                    Visible = false;
                }
                field("No. proforma";"No. proforma")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Date bâteau visé";"Date bâteau visé")
                {
                    Editable = false;
                }
                field("Nom du navire";"Nom du navire")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Date Emb. prévu";"Date Emb. prévu")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Date Emb. confirmée";"Date Emb. confirmée")
                {
                    Editable = false;
                }
                field("Date Emb. Estimée";"Date Emb. Estimée")
                {
                    Editable = false;
                    Visible = false;
                }
                field("No. lettre de crédit";"No. lettre de crédit")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Commentaire..";"Commentaire..")
                {
                    Editable = false;
                }
                field("Statut VIN";"Statut VIN")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Réservé pour";"Réservé pour")
                {
                    Editable = false;
                }
                field("VIN Reserved";"VIN Reserved")
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
                field("Date Création Commande";"Date Création Commande")
                {
                }
                field(Justificatif;Justificatif)
                {
                }
                field("Commentaire Kais";"Commentaire Kais")
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

                    //ImportModèleVN.RUN;
                     CLEAR(MgtAures);
                     MgtAures.ImportVIN;
                     COMMIT;
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
        Vide := '';
        /*//SM 040119
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
        */

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
        
        //SM 060917
        
        
        
        
        
        /*
        //KK__25092017 A voir
        IF (NOT UserSetup."Responsable agence VN") AND (NOT UserSetup.Admin_Vente_VN) THEN
        SETRANGE("Sales person code",UserSetup."Salespers./Purch. Code");
        IF UserMgt.GetSalesFilter <> '' THEN BEGIN
          SETRANGE("Centre de gestion",UserMgt.GetSalesFilter);
        END;
        */
        
        
        //END SM
        //SM 171017
        FILTERGROUP(2);
        UserSetup.GET(USERID);
        IF NOT UserSetup.Admin_Vente_VN  THEN BEGIN
          IF UserMgt.GetSalesFilter <> '' THEN BEGIN
            SETFILTER("Centre de gestion",'%1|''''',UserMgt.GetSalesFilter);
          END;
        END;
        
        IF (NOT UserSetup.Admin_Vente_VN) AND (NOT UserSetup."Responsable agence VN") THEN BEGIN
          SETFILTER("Sales person code",'%1|''''',UserSetup."Salespers./Purch. Code");
        END;
        //SM 070119
        ShowReservation := UserSetup.Admin_Vente_VN;
        IF NOT UserSetup.Admin_Vente_VN  THEN
          SETRANGE("Réservation DC",FALSE);
        //END SM
        
        FILTERGROUP(0);
        //SM

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
        UserMgt : Codeunit "5700";
        NbreVehicule : Decimal;
        NbreVehiculeReserve : Decimal;
        NbreVehiculeAvecVIN : Decimal;
        "DétailVNArrivageCount" : Record "70015";
        Vide : Code[10];
        ShowReservation : Boolean;
}

