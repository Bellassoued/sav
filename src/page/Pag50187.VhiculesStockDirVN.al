page 50187 "Véhicules Stock Dir.VN"
{
    // version CT16V002

    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = Table60049;
    SourceTableTemporary = true;
    SourceTableView = SORTING(Réservé,Stock\Commande Achat,Date Embarquement)
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            group(Statistique)
            {
                field("Nbre Véhicules Dispo";NbreVehiculeStock-NbreVehiculeReserve)
                {
                    DecimalPlaces = 0:0;
                    Editable = false;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Véhicules Résevés";NbreVehiculeReserve)
                {
                    DecimalPlaces = 0:0;
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Nbre Véhicules en Stock";NbreVehiculeStock)
                {
                    DecimalPlaces = 0:0;
                    Style = Standard;
                    StyleExpr = TRUE;
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
            repeater(Group)
            {
                field("No. Article";"No. Article")
                {
                    Editable = false;
                }
                field(Modèle;Modèle)
                {
                }
                field("Couleur/Garnissage";"Couleur/Garnissage")
                {
                }
                field(VIN;VIN)
                {
                    Editable = false;
                }
                field("Hors taxe";"Hors taxe")
                {
                }
                field("Code Variante";"Code Variante")
                {
                    Editable = false;
                }
                field(Réservé;Réservé)
                {
                    Editable = false;
                    Visible = false;
                }
                field(Emplacement;Emplacement)
                {
                    Editable = false;
                }
                field("HT/TTC";"HT/TTC")
                {
                    DrillDown = false;
                    Lookup = false;
                }
                field(Quantité;Quantité)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Date Entree";"Date Entree")
                {
                }
                field("Date Embarquement";"Date Embarquement")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(Production;Production)
                {
                    Editable = false;
                }
                field("Nom Vendeur";"Nom Vendeur")
                {
                    Editable = false;
                }
                field("Nom Client";"Nom Client")
                {
                    Editable = false;
                }
                field("Délai Expiration";"Délai Expiration")
                {
                    Editable = false;
                }
                field("Expiration Dans";"Expiration Dans")
                {
                    Editable = false;
                }
                field("Date Création";"Date Création")
                {
                    Editable = false;
                }
                field("Date préparation";"Date préparation")
                {
                    Editable = false;
                }
                field("No. Série";"No. Série")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Réservé à partir de";"Réservé à partir de")
                {
                    Editable = false;
                }
                field("Réservé pour";"Réservé pour")
                {
                    Editable = false;
                }
                field("No. Séquence";"No. Séquence")
                {
                    Editable = false;
                }
                field("Document type";"Document type")
                {
                    Editable = false;
                }
                field("Document No.";"Document No.")
                {
                    Editable = false;
                }
                field("Quantité Réservée";"Quantité Réservée")
                {
                    Editable = false;
                }
                field("Quantité Non Réservée";"Quantité Non Réservée")
                {
                    Editable = false;
                }
                field("Date Arrivage";"Date Arrivage")
                {
                }
                field(AI;AI)
                {
                    CaptionML = ENU='CI',
                                FRA='CI';
                }
                field("Status Carte Grise";"Status Carte Grise")
                {
                }
                field("Date Livraison Prévue";"Date Livraison Prévue")
                {
                }
                field("Date Livraison Confirmé";"Date Livraison Confirmé")
                {
                }
                field("Date réception dossier";GRecServiceItem."Date Recep Dossier")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Dossier Complet";"Dossier Complet")
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
                field("Date Confirmation VIN + CAF";"Date Confirmation VIN + CAF")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Date Bateau Visé VIN + CAF";"Date Bateau Visé VIN + CAF")
                {
                    Editable = false;
                    Visible = false;
                }
                field(Commentaire;Commentaire)
                {
                    Editable = true;

                    trigger OnValidate();
                    var
                        RecReservationEntryComment : Record "337";
                    begin
                         TESTFIELD(Réservé,TRUE);
                         RecReservationEntryComment.RESET;
                         RecReservationEntryComment.SETRANGE("Entry No.","No. Séquence");
                         IF RecReservationEntryComment.FINDSET THEN
                           RecReservationEntryComment.MODIFYALL(Commentaire,Commentaire);
                    end;
                }
                field("Stock\Commande Achat";"Stock\Commande Achat")
                {
                    Editable = false;
                }
                field("Réservation DC";"Réservation DC")
                {
                }
                field("Commentaire DC";"Commentaire DC")
                {
                }
                field("Commentaire appro";"Commentaire appro")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    begin
        //SM 040119
        /*
        vide := '';
        NbreVehicule := 0;
        NbreVehiculeReserve := 0;
        NbreVehiculeAvecVIN  := 0;
        //ReservationVueCount.RESET;
        ReservationVueCount.COPY(Rec);
        //ReservationVueCount.COPYFILTERS(Rec);
        NbreVehicule := ReservationVueCount.COUNTAPPROX;
        //MESSAGE(FORMAT(ReservationVueCount.COUNT));
        IF ReservationVueCount.FINDSET THEN BEGIN
          ReservationVueCount.SETRANGE("Réservé",TRUE);
          NbreVehiculeReserve := ReservationVueCount.COUNTAPPROX;
          ReservationVueCount.SETRANGE("Document No.");
          ReservationVueCount.SETFILTER(VIN,'<>%1',Vide);
          NbreVehiculeAvecVIN := ReservationVueCount.COUNTAPPROX;
        END;
        */
        //END SM
        
        NbreVehiculeStock := COUNTAPPROX;
        ReservationVueCount.COPY(Rec,TRUE);
        ReservationVueCount.SETRANGE(Réservé,TRUE);
        //MESSAGE(FORMAT(ReservationVueCount.COUNTAPPROX));
        NbreVehiculeReserve := ReservationVueCount.COUNTAPPROX;

    end;

    trigger OnAfterGetRecord();
    begin
        GRecServiceItem.RESET;
        GRecServiceItem.SETRANGE("Serial No.",VIN);
        IF GRecServiceItem.FINDFIRST THEN;

        NbreVehiculeStock := COUNTAPPROX;
        ReservationVueCount := Rec;
        ReservationVueCount.SETRANGE(Réservé,TRUE);
        NbreVehiculeReserve := ReservationVueCount.COUNTAPPROX;
    end;

    trigger OnClosePage();
    begin
        DELETEALL();
    end;

    trigger OnOpenPage();
    begin
        Seq := 10000;
        ReservationEntriesVN();
        //SM OLD 270717LigneAchatRéservé();
        StockARéserver();
        UserSetup.GET(USERID);
        ShowReservation := UserSetup.Admin_Vente_VN;
        //IF NOT UserSetup.Admin_Vente_VN  THEN
        //KT 11022020

         // SETRANGE("Réservation DC",UserSetup.Admin_Vente_VN);
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        /*SM TMP CurrPage.SETSELECTIONFILTER(Rec);
        IF CloseAction IN [ACTION::OK,ACTION::LookupOK] THEN
          BEGIN
            ItemJournalLine.FctSetVariableForTracking(TemplJnline,JrlBathName,PostingDate,DocumentNo);
            ItemJournalLine.FctCreateItemjnlineAndTracking(Rec,TemplJnline,JrlBathName,PostingDate,DocumentNo);
          END;
        */

    end;

    var
        BoolExpired : Boolean;
        RecGSalesLine : Record "37";
        RecGSalesHeader : Record "36";
        RecGParamExpirReservVN : Record "60044";
        RecGReservEntries : Record "337";
        RecGPurchdr : Record "38";
        Seq : Integer;
        ItemJournalLine : Record "83";
        TemplJnline : Code[10];
        JrlBathName : Code[10];
        PostingDate : Date;
        DocumentNo : Code[20];
        CarteGriseLigne : Record "60016";
        GRecServiceItem : Record "5940";
        RecGUserSetup : Record "91";
        UserMgt : Codeunit "5700";
        NbreVehicule : Decimal;
        NbreVehiculeReserve : Decimal;
        NbreVehiculeAvecVIN : Decimal;
        ReservationVueCount : Record "60049" temporary;
        Vide : Code[10];
        NbreVehiculeStock : Decimal;
        "RecDétailVNArrivage" : Record "70015";
        ShowReservation : Boolean;
        UserSetup : Record "91";
        Bin : Record "7354";

    procedure ReservationEntriesVN();
    var
        ReservationEntry : Record "337";
        ReservedFrom : Record "337";
        PurchLine : Record "39";
        RecPurchaseHeader : Record "38";
        ItemLedgEntry : Record "32";
        RecWarehouseEntry : Record "7312";
        RecItem : Record "27";
        ReservEngineMgt : Codeunit "99000831";
        ReservedFromSerialNo : Record "337";
        ReservationVue : Record "60049";
        RecFicheTechnique : Record "50032";
        RecSalesLine : Record "37";
        RecSalesHeader : Record "36";
        LRecBin : Record "7354";
        LRecWarehouseEntry : Record "7312";
        "LRecDétailVNArrivage" : Record "70015";
    begin
        // *********************** Reservation Entries
        ReservationEntry.RESET;
        ReservationEntry.SETCURRENTKEY("Entry No.",Positive);
        //SM
        ReservationEntry.SETRANGE(Positive,FALSE);
        //END SM
        ReservationEntry.SETRANGE("Source Type",37);
        ReservationEntry.SETRANGE("Reservation Status",ReservationEntry."Reservation Status"::Reservation);
        IF ReservationEntry.FINDFIRST THEN
          ReservationVue.RESET;
          IF ReservationVue.FINDLAST THEN
            "Primary Key" := ReservationVue."Primary Key"
          ELSE "Primary Key" := 0;
        
          REPEAT
            Seq += 10000;
            INIT;
            "Primary Key"      := Seq ;
            "No. Séquence"     := ReservationEntry."Entry No." ;
            "No. Article"      := ReservationEntry."Item No.";
            "Code Magasin"     := ReservationEntry."Location Code" ;
            Quantité           := ABS(ReservationEntry."Quantity (Base)");
            "Date préparation" := ReservationEntry."Shipment Date" ;
            "Code Variante"    := ReservationEntry."Variant Code" ;
            Commentaire        := ReservationEntry.Commentaire;
        
            "No. Série"        := '';
            RecGReservEntries.RESET;
            RecGReservEntries.SETRANGE("Entry No.",ReservationEntry."Entry No.");
            IF RecGReservEntries.FINDSET THEN;
            IF  RecGReservEntries.NEXT > 0 THEN
              "No. Série" := RecGReservEntries."Serial No." ;
        
            CalcExpirationDate(ReservationEntry);
        
            IF ReservedFrom.GET(ReservationEntry."Entry No.",TRUE) THEN BEGIN
              WITH ReservedFrom DO
                CASE "Source Type" OF
                  DATABASE::"Purchase Line":
                    BEGIN
                      "Stock\Commande Achat" := "Stock\Commande Achat"::"Commande Achat";
                      PurchLine.RESET;
                      PurchLine.SETRANGE("Document Type","Source Subtype");
                      PurchLine.SETRANGE("Document No.","Source ID");
                      PurchLine.SETRANGE("Line No.","Source Ref. No.");
                      IF PurchLine.FINDFIRST THEN BEGIN
                        Emplacement := PurchLine."Bin Code";
                        "Date Arrivage"         := PurchLine."Expected Receipt Date";
        
                        IF RecPurchaseHeader.GET(PurchLine."Document Type",PurchLine."Document No.") THEN
                          Production :=  RecPurchaseHeader."Vendor Order No."
                        ELSE
                          Production := '';
                      END ELSE BEGIN
                        Emplacement := '';
                        Production := '';
                      END;
                    END;
        
                  DATABASE::"Item Ledger Entry":
                    BEGIN
                      //<<ZMN 25/01/2019
                      ItemLedgEntry.RESET;
                      ItemLedgEntry.SETRANGE("Serial No.","Serial No.");
                      ItemLedgEntry.SETRANGE("Entry Type",ItemLedgEntry."Entry Type"::Purchase);
                      IF ItemLedgEntry.FINDFIRST  THEN BEGIN
                         //>>ZMN 25/01/2019
                          "Stock\Commande Achat" := "Stock\Commande Achat"::Stock;
                          //KT 01022019
                          LRecWarehouseEntry.RESET;
                          LRecWarehouseEntry.SETRANGE("Serial No.",ReservationEntry."Serial No.");
                          IF LRecWarehouseEntry.FINDFIRST THEN
                          //"Date Entree"            := ItemLedgerEntry."Posting Date";
                          "Date Entree"            := LRecWarehouseEntry."Registering Date";
                          //END KT
                      END;
                        RecWarehouseEntry.RESET;
                        RecWarehouseEntry.SETRANGE("Serial No.","Serial No.");
                        RecWarehouseEntry.SETRANGE("Item No.","Item No.");
                        RecWarehouseEntry.SETRANGE("Variant Code","Variant Code");
                        RecWarehouseEntry.SETRANGE("Location Code","Location Code");
        
                      IF RecWarehouseEntry.FINDLAST THEN
                        Emplacement := RecWarehouseEntry."Bin Code"
                      ELSE
                        Emplacement := '';
                      IF  Bin.GET("Location Code",Emplacement) THEN
                        "Hors taxe":=Bin."Hors taxe";
                    END;
                 END;
            END;
        
            IF RecItem.GET(ReservationEntry."Item No.") THEN
              //<<CT16V001 ZM 15/05/2016
              BEGIN
                IF RecFicheTechnique.GET(RecItem."No.") THEN
                  "Type Commerciale" := RecFicheTechnique."Model Code"
              END
              //>>CT16V001 ZM 15/05/2016
                ELSE
                  "Type Commerciale" := '';
        
            "Réservé pour"          := ReservEngineMgt.CreateForText(ReservationEntry) ;
            "Réservé à partir de"   := ReservEngineMgt.CreateFromText(ReservationEntry);
            "Nom Vendeur"           := ReservEngineMgt.CreateTextVendor(ReservationEntry);
            "Nom Client"            := ReservEngineMgt.CreateTextCustomer(ReservationEntry);
            "Délai Expiration"      := 0;
            "Expiration Dans"       := 0;
        
            IF ReservedFromSerialNo.GET(ReservationEntry."Entry No.",TRUE) THEN
              VIN := ReservedFromSerialNo."Serial No." ;
        
            Réservé := TRUE ;
        
            //SM 270717
            CarteGriseLigne.RESET;
            CarteGriseLigne.SETRANGE(VIN,VIN);
            IF CarteGriseLigne.FINDFIRST THEN BEGIN
              "Status Carte Grise"      := CarteGriseLigne.Statut;
            END;
            //SM 091017
            CALCFIELDS("Date Embarquement Calc","Date Confirmation VIN + CAF","Date Bateau Visé VIN + CAF");
            IF  "Date Embarquement Calc" <> 0D THEN
             "Date Embarquement" := "Date Embarquement Calc";
            IF  "Date Bateau Visé VIN + CAF" <> 0D THEN
             "Date Embarquement" := "Date Bateau Visé VIN + CAF"  ;
            IF  "Date Confirmation VIN + CAF" <> 0D THEN
             "Date Embarquement" := "Date Confirmation VIN + CAF";
            //END SM
            IF RecSalesHeader.GET(RecSalesHeader."Document Type"::Order,ReservationEntry."Source ID") THEN BEGIN
        
        
              "Date Livraison Prévue"   := RecSalesHeader."Requested Delivery Date";
              "Date Livraison Confirmé" := RecSalesHeader."Promised Delivery Date";
              Vendeur                   := RecSalesHeader."Salesperson Code";
              "Responsibility Center"   := RecSalesHeader."Responsibility Center";
              //SM 060917
              "Date Création Commande" := RecSalesHeader."Date Time creation";
              //END SM
              //SourceType := SourceType::Sales;
        
            END;
            //END SM
            RecDétailVNArrivage.RESET;
            RecDétailVNArrivage.SETRANGE(RecDétailVNArrivage.VIN,VIN);
            IF RecDétailVNArrivage.FINDFIRST THEN  BEGIN
              "Commentaire DC" := RecDétailVNArrivage."Commentaire DC";
               "Réservation DC" := RecDétailVNArrivage."Réservation DC";
               //ZMN 17/12/2019
               "Commentaire appro" := RecDétailVNArrivage."Commentaire Kais";
            END;
        //SM 020817
        RecGUserSetup.GET(USERID);
        IF (NOT RecGUserSetup.Admin_Vente_VN) AND (UserMgt.GetSalesFilter <> '')  THEN BEGIN
        
            IF ("Responsibility Center" = UserMgt.GetSalesFilter) THEN BEGIN
              IF (NOT RecGUserSetup."Responsable agence VN") THEN BEGIN
                IF Vendeur = RecGUserSetup."Salespers./Purch. Code" THEN
                  INSERT(TRUE);
              END ELSE BEGIN
                INSERT(TRUE);
              END;
            END;
        
        END ELSE BEGIN
          /*
           LRecBin.RESET;
            LRecBin.SETFILTER("Location Code",'%1','PARC_VN');
            LRecBin.SETRANGE(Code,Emplacement);
            IF LRecBin.FINDFIRST THEN
             // BlncheckBin := LRecBin."Not available";
            IF not LRecBin."Not available" THEN
            */
             INSERT(TRUE);
        END;
        //SM
        
           // INSERT(TRUE);
            LRecBin.RESET;
            //LRecBin.SETFILTER("Location Code",'%1','PARC_VN');
        
        
            LRecBin.SETRANGE(Code,Emplacement);
            IF LRecBin.FINDFIRST THEN BEGIN
              //BlncheckBin := LRecBin."Not available";
              "Hors taxe" :=LRecBin."Hors taxe";
              IF LRecBin.Statut = LRecBin.Statut::Port THEN BEGIN
          LRecDétailVNArrivage.RESET;
          LRecDétailVNArrivage.SETRANGE(VIN,VIN);
          LRecDétailVNArrivage.SETFILTER("No. Expédition",'<>%1','');
          LRecDétailVNArrivage.FINDFIRST;
                IF  LRecDétailVNArrivage."Répartiton HT\TTC" = LRecDétailVNArrivage."Répartiton HT\TTC"::HT THEN
                    "Hors taxe" := TRUE
                  ELSE "Hors taxe" := FALSE;
              END;
            END;
            MODIFY;
          UNTIL ReservationEntry.NEXT = 0 ;
        //NbreVehiculeReserve:= COUNT;
        NbreVehiculeReserve := COUNTAPPROX;

    end;

    procedure "LigneAchatRéservé"();
    var
        PurchaseLine : Record "39";
        ReservationVue : Record "60049";
        RecPurchaseHeader : Record "38";
        RecItem : Record "27";
        RecFicheTechnique : Record "50032";
    begin
        PurchaseLine.RESET;
        PurchaseLine.SETCURRENTKEY("Document Type",Type,"No.","Variant Code","Drop Shipment","Location Code","Expected Receipt Date");
        PurchaseLine.SETRANGE("Gen. Prod. Posting Group",'VN');
        PurchaseLine.SETRANGE("Posting Group",'VEHICULES');
        PurchaseLine.SETFILTER("Variant Code",'<>%1','');
        PurchaseLine.SETFILTER(Type,'%1',PurchaseLine.Type::Item);
        PurchaseLine.SETFILTER("Qty. to Receive",'<>0');
        IF PurchaseLine.FINDFIRST THEN BEGIN
          ReservationVue.RESET;
          IF ReservationVue.FINDLAST THEN
            "Primary Key" := ReservationVue."Primary Key"
          ELSE "Primary Key" := 0;
          REPEAT
            Seq += 10000;
            INIT;
            "Primary Key"  := Seq;
            IF RecPurchaseHeader.GET(PurchaseLine."Document Type",PurchaseLine."Document No.") THEN
              Production :=  RecPurchaseHeader."Vendor Order No."
            ELSE
              Production := '';

            IF RecItem.GET(PurchaseLine."No.") THEN
               //<<CT16V001 ZM 15/05/2016
              BEGIN
                IF RecFicheTechnique.GET(RecItem."No.") THEN
                  "Type Commerciale" := RecFicheTechnique."Model Code"
              END
              //>>CT16V001 ZM 15/05/2016
                ELSE
                  "Type Commerciale" := '';

            "No. Article"           := PurchaseLine."No.";
            "Code Magasin"          := PurchaseLine."Location Code";
            Emplacement             := PurchaseLine."Bin Code";
            Quantité                := PurchaseLine.Quantity ;
            PurchaseLine.CALCFIELDS("Reserved Quantity");
            "Quantité Réservée"     := PurchaseLine."Reserved Quantity";
            "Quantité Non Réservée" := PurchaseLine."Qty. to Receive" - PurchaseLine."Reserved Quantity";
            "Code Variante"         := PurchaseLine."Variant Code";
            "Document type"         := FORMAT(PurchaseLine."Document Type");
            "Document No."          := PurchaseLine."Document No.";
            "Date Arrivage"         := PurchaseLine."Expected Receipt Date";
            Réservé := FALSE ;
            "Stock\Commande Achat" := "Stock\Commande Achat"::"Commande Achat";
            IF "Quantité Non Réservée" <> 0 THEN
              INSERT(TRUE);

          UNTIL PurchaseLine.NEXT=0;
        END;
    end;

    procedure "StockARéserverOLD"();
    var
        ItemLedgerEntry : Record "32";
        ReservationVue : Record "60049";
        RecItem : Record "27";
        RecWarehouseEntry : Record "7312";
        RecFicheTechnique : Record "50032";
        LRecBin : Record "7354";
        BlncheckBin : Boolean;
        LRecWarehouseEntry : Record "7312";
    begin
        ItemLedgerEntry.RESET;
        ItemLedgerEntry.SETCURRENTKEY("Item No.",Open,"Variant Code",Positive,"Location Code","Posting Date","Expiration Date","Lot No.","Serial No.");
        ItemLedgerEntry.SETRANGE(Open,TRUE);
        ItemLedgerEntry.SETRANGE(Positive,TRUE);
        ItemLedgerEntry.SETRANGE("Reserved Quantity",0);
        ItemLedgerEntry.SETFILTER("Variant Code",'<>%1','');
        ItemLedgerEntry.SETFILTER("Serial No.",'<>%1','');
        IF ItemLedgerEntry.FINDFIRST THEN BEGIN
          ReservationVue.RESET;
          IF ReservationVue.FINDLAST THEN
            "Primary Key" := ReservationVue."Primary Key"
          ELSE "Primary Key" := 0;
          REPEAT
            Seq += 10000;
            INIT;
            "Primary Key"            := Seq ;
            "No. Article"            := ItemLedgerEntry."Item No.";
            "Date Comptabilisation"  := ItemLedgerEntry."Posting Date" ;
            "Code Magasin"           := ItemLedgerEntry."Location Code" ;
            Quantité                 := ItemLedgerEntry.Quantity ;
            "Quantité Restante"      := ItemLedgerEntry."Remaining Quantity" ;
            ItemLedgerEntry.CALCFIELDS("Reserved Quantity");
            "Quantité Réservée"      := ItemLedgerEntry."Reserved Quantity";
            "Code Variante"          := ItemLedgerEntry."Variant Code";
            "No. Série"              := ItemLedgerEntry."Serial No.";
            //SM
            VIN                      := ItemLedgerEntry."Serial No.";
            //KT 01022019
            LRecWarehouseEntry.RESET;
            LRecWarehouseEntry.SETRANGE("Serial No.",ItemLedgerEntry."Serial No.");
            IF LRecWarehouseEntry.FINDFIRST THEN
            //"Date Entree"            := ItemLedgerEntry."Posting Date";
              "Date Entree"            := LRecWarehouseEntry."Registering Date";
            //END KT
            //END SM
            IF RecItem.GET(ItemLedgerEntry."Item No.") THEN
              //<<CT16V001 ZM 15/05/2016
              BEGIN
                IF RecFicheTechnique.GET(RecItem."No.") THEN
                  "Type Commerciale" := RecFicheTechnique."Model Code"
              END
              //>>CT16V001 ZM 15/05/2016
                 ELSE
                    "Type Commerciale" := '';

            Réservé := FALSE ;
            "Stock\Commande Achat" := "Stock\Commande Achat"::Stock;
            //SM

            RecWarehouseEntry.RESET;
            RecWarehouseEntry.SETRANGE("Serial No.",ItemLedgerEntry."Serial No.");
            RecWarehouseEntry.SETRANGE("Item No.",ItemLedgerEntry."Item No.");
            RecWarehouseEntry.SETRANGE("Variant Code",ItemLedgerEntry."Variant Code");
            RecWarehouseEntry.SETRANGE("Location Code",ItemLedgerEntry."Location Code");

            IF RecWarehouseEntry.FINDLAST THEN
              Emplacement := RecWarehouseEntry."Bin Code"
            ELSE
              Emplacement := '';
            //SM 091017
            CALCFIELDS("Date Embarquement Calc","Date Confirmation VIN + CAF","Date Bateau Visé VIN + CAF");
            IF  "Date Embarquement Calc" <> 0D THEN
             "Date Embarquement" := "Date Embarquement Calc";
            IF  "Date Bateau Visé VIN + CAF" <> 0D THEN
             "Date Embarquement" := "Date Bateau Visé VIN + CAF"  ;
            IF  "Date Confirmation VIN + CAF" <> 0D THEN
             "Date Embarquement" := "Date Confirmation VIN + CAF";
            //END SM
            //END SM
            RecDétailVNArrivage.RESET;
            RecDétailVNArrivage.SETRANGE(RecDétailVNArrivage.VIN,VIN);
            IF RecDétailVNArrivage.FINDFIRST THEN  BEGIN
              "Commentaire DC" := RecDétailVNArrivage."Commentaire DC";
               "Réservation DC" := RecDétailVNArrivage."Réservation DC";
            END;
            UserSetup.GET(USERID);
            IF UserSetup.Admin_Vente_VN THEN
              INSERT(TRUE)
            ELSE BEGIN

               LRecBin.RESET;
               UserSetup.GET(USERID);
            LRecBin.SETFILTER("Location Code",'%1','PARC_VN');
            LRecBin.SETRANGE(Code,Emplacement);
            IF LRecBin.FINDFIRST THEN
              BlncheckBin := (LRecBin."Not available") AND (NOT UserSetup.Admin_Vente_VN) ;
              //OLD BlncheckBin := LRecBin."Not available" OR (NOT ((NOT LRecBin."Not available") AND ((LRecBin.Statut=LRecBin.Statut::Port) OR (LRecBin.Statut=LRecBin.Statut::"En transit"))));

            IF NOT BlncheckBin THEN

              INSERT(TRUE);
            END;
            //INSERT(TRUE);
          UNTIL ItemLedgerEntry.NEXT =0;
        END;
        //SM
        FINDFIRST;
        //END SM
        //COPYFILTERS(Rec);
        NbreVehiculeStock := COUNTAPPROX;

        //NbreVehiculeStock := COUNT;
    end;

    procedure CalcExpirationDate(RecReservationEntry : Record "337");
    begin
        //IF RecGItem.GET("Item No.") THEN
        //  IntdelaiEpirReserv := RecGItem."Age Réservation VN (jours)";

        BoolExpired := FALSE ;
        RecGSalesLine.RESET;
        RecGSalesHeader.RESET;
        RecGParamExpirReservVN.RESET;

        WITH RecReservationEntry DO BEGIN
        IF ("Source Type" = 37) AND ("Source Subtype" = 1) THEN
          IF RecGSalesHeader.GET(RecGSalesHeader."Document Type"::Order,"Source ID") AND
             RecGSalesLine.GET(RecGSalesLine."Document Type"::Order,"Source ID","Source Ref. No.") THEN
            BEGIN
              IF RecGParamExpirReservVN.GET(RecGSalesLine."Bin Code",RecGSalesHeader."Type Paiement") THEN
                BEGIN

                IF RecGParamExpirReservVN."Base de calcule" = RecGParamExpirReservVN."Base de calcule"::"Date Reservation" THEN
                  BEGIN
                    "Délai Expiration" := RecGParamExpirReservVN."Délais d'expiration" ;
                    "Expiration Dans" := CALCDATE('<+'+ FORMAT("Délai Expiration") + 'D>',"Creation Date") - TODAY;
                    IF   "Expiration Dans" < 0 THEN
                      BoolExpired := TRUE ;

                  END;

                // si base de calcule date de
                IF RecGParamExpirReservVN."Base de calcule" = RecGParamExpirReservVN."Base de calcule"::"Date Réception prévue" THEN
                  BEGIN
                    // recupérér la date de reception de la commande achat.
                    IF (RecGReservEntries."Source Type" = 39 ) AND (RecGReservEntries."Source Subtype" = 1) THEN
                      BEGIN
                        RecGPurchdr.GET(RecGPurchdr."Document Type"::Order,RecGReservEntries."Source ID");

                        "Délai Expiration" := RecGParamExpirReservVN."Délais d'expiration" ;
                        "Expiration Dans" := CALCDATE('<+'+ FORMAT("Délai Expiration") + 'D>',RecGPurchdr."Requested Receipt Date") - TODAY;
                        IF   "Expiration Dans" < 0 THEN
                          BoolExpired := TRUE ;
                      END ;
                  END;
                 END ELSE "Délai Expiration" := 0 ;
            END
              ELSE "Délai Expiration" := 0 ;
        END;
    end;

    procedure FctSetVariableForTrackingForPage(PTemplJlnIne : Code[10];PItemJnline : Code[10];PPostingDate : Date;PDocumentno : Code[20]);
    begin
        TemplJnline:=PTemplJlnIne;
        JrlBathName:=PItemJnline;
        PostingDate:=PPostingDate;
        DocumentNo:=PDocumentno;
    end;

    procedure "StockARéserver"();
    var
        ItemLedgerEntry : Record "32";
        ReservationVue : Record "60049";
        RecItem : Record "27";
        RecWarehouseEntry : Record "7312";
        RecFicheTechnique : Record "50032";
        LRecBin : Record "7354";
        BlncheckBin : Boolean;
        "LRecDétailVNArrivage" : Record "70015";
    begin
        //MinDateEntree:=TODAY;
        ItemLedgerEntry.RESET;
        ItemLedgerEntry.SETCURRENTKEY("Item No.",Open,"Variant Code",Positive,"Location Code","Posting Date","Expiration Date","Lot No.","Serial No.");
        ItemLedgerEntry.SETRANGE(Open,TRUE);
        ItemLedgerEntry.SETRANGE(Positive,TRUE);
        ItemLedgerEntry.SETRANGE("Reserved Quantity",0);
        //SM
        IF GETFILTER("No. Article") <> '' THEN
        ItemLedgerEntry.SETRANGE("Item No.",GETFILTER("No. Article"));
        IF GETFILTER("Code Variante") <> '' THEN
        ItemLedgerEntry.SETRANGE("Variant Code",GETFILTER("Code Variante"))
        ELSE
        ItemLedgerEntry.SETFILTER("Variant Code",'<>%1','');

        ItemLedgerEntry.SETFILTER("Serial No.",'<>%1','');
        IF ItemLedgerEntry.FINDFIRST THEN BEGIN

          ReservationVue.RESET;
          IF ReservationVue.FINDLAST THEN
            "Primary Key" := ReservationVue."Primary Key"
          ELSE "Primary Key" := 0;
          REPEAT
            Seq += 10000;
            INIT;
            "Primary Key"            := Seq ;
            "No. Article"            := ItemLedgerEntry."Item No.";
            "Date Comptabilisation"  := ItemLedgerEntry."Posting Date" ;
            "Code Magasin"           := ItemLedgerEntry."Location Code" ;
            Quantité                 := ItemLedgerEntry.Quantity ;
            "Quantité Restante"      := ItemLedgerEntry."Remaining Quantity" ;
            ItemLedgerEntry.CALCFIELDS("Reserved Quantity");
            "Quantité Réservée"      := ItemLedgerEntry."Reserved Quantity";
            "Code Variante"          := ItemLedgerEntry."Variant Code";
            "No. Série"              := ItemLedgerEntry."Serial No.";
            //SM
            VIN                      := ItemLedgerEntry."Serial No.";
            //END SM
            //SM 291218
            "Date Entree"            := ItemLedgerEntry."Posting Date";
            //END SM
             //KT 300818
          LRecDétailVNArrivage.RESET;
          LRecDétailVNArrivage.SETRANGE(VIN,ItemLedgerEntry."Serial No.");
          LRecDétailVNArrivage.SETFILTER("No. Expédition",'<>%1','');
          IF LRecDétailVNArrivage.FINDFIRST THEN
            "No. Expédition":=LRecDétailVNArrivage."No. Expédition";
          //END KT
            IF RecItem.GET(ItemLedgerEntry."Item No.") THEN
              //<<CT16V001 ZM 15/05/2016
              BEGIN
                IF RecFicheTechnique.GET(RecItem."No.") THEN
                  "Type Commerciale" := RecFicheTechnique."Model Code"
              END
              //>>CT16V001 ZM 15/05/2016
                 ELSE
                    "Type Commerciale" := '';

            Réservé := FALSE ;
            "Stock\Commande Achat" := "Stock\Commande Achat"::Stock;
            //SM

            RecWarehouseEntry.RESET;
            RecWarehouseEntry.SETRANGE("Serial No.",ItemLedgerEntry."Serial No.");
            RecWarehouseEntry.SETRANGE("Item No.",ItemLedgerEntry."Item No.");
            RecWarehouseEntry.SETRANGE("Variant Code",ItemLedgerEntry."Variant Code");
            RecWarehouseEntry.SETRANGE("Location Code",ItemLedgerEntry."Location Code");

            IF RecWarehouseEntry.FINDLAST THEN
              Emplacement := RecWarehouseEntry."Bin Code"
            ELSE
              Emplacement := '';
                //SM 091017
            CALCFIELDS("Date Embarquement Calc","Date Confirmation VIN + CAF","Date Bateau Visé VIN + CAF");
            IF  "Date Embarquement Calc" <> 0D THEN
             "Date Embarquement" := "Date Embarquement Calc";
            IF  "Date Bateau Visé VIN + CAF" <> 0D THEN
             "Date Embarquement" := "Date Bateau Visé VIN + CAF"  ;
            IF  "Date Confirmation VIN + CAF" <> 0D THEN
             "Date Embarquement" := "Date Confirmation VIN + CAF";
            //IF "Date Embarquement"<>0D THEN
            //  IF "Date Embarquement"<MinDateEmb THEN
            //   MinDateEmb:="Date Embarquement";
            //END SM
            //END SM
            LRecBin.RESET;
            //LRecBin.SETFILTER("Location Code",'%1','PARC_VN');


            LRecBin.SETRANGE(Code,Emplacement);
            IF LRecBin.FINDFIRST THEN BEGIN
              BlncheckBin := LRecBin."Not available";
              "Hors taxe" :=LRecBin."Hors taxe";
              IF LRecBin.Statut = LRecBin.Statut::Port THEN BEGIN
                IF  LRecDétailVNArrivage."Répartiton HT\TTC" = LRecDétailVNArrivage."Répartiton HT\TTC"::HT THEN
                    "Hors taxe" := TRUE
                  ELSE "Hors taxe" := FALSE;
              END;
            END;
        //why KT TMP
        RecGUserSetup.GET(USERID);
            IF (NOT BlncheckBin) OR RecGUserSetup.Admin_Vente_VN THEN
              INSERT(TRUE);
          UNTIL ItemLedgerEntry.NEXT =0;
        END;

        //SM
        FINDFIRST;
        //END SM
    end;
}

