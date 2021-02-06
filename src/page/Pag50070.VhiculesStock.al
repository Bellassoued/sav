page 50070 "Véhicules Stock"
{
    // version CT16V002

    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = Table60049;
    SourceTableTemporary = true;
    SourceTableView = SORTING(Réservé,Stock\Commande Achat,Date Entree)
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Date Entree";"Date Entree")
                {
                }
                field(Réservé;Réservé)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Stock\Commande Achat";"Stock\Commande Achat")
                {
                    Editable = false;
                    Visible = false;
                }
                field("No. Article";"No. Article")
                {
                    Editable = false;
                }
                field(Modèle;Modèle)
                {
                }
                field("Description perse";"Description perse")
                {
                }
                field("Couleur/Garnissage";"Couleur/Garnissage")
                {
                }
                field("Type Commerciale";"Type Commerciale")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Code Magasin";"Code Magasin")
                {
                    Editable = false;
                    Visible = false;
                }
                field(Emplacement;Emplacement)
                {
                    Editable = false;
                }
                field(VIN;VIN)
                {
                    Editable = false;
                }
                field(Quantité;Quantité)
                {
                    Editable = false;
                    Visible = false;
                }
                field(Production;Production)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Nom Vendeur";"Nom Vendeur")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Nom Client";"Nom Client")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Délai Expiration";"Délai Expiration")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Expiration Dans";"Expiration Dans")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Code Variante";"Code Variante")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Date Création";"Date Création")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Date préparation";"Date préparation")
                {
                    Editable = false;
                    Visible = false;
                }
                field("No. Série";"No. Série")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Réservé à partir de";"Réservé à partir de")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Réservé pour";"Réservé pour")
                {
                    Editable = false;
                    Visible = false;
                }
                field("No. Séquence";"No. Séquence")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Document type";"Document type")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Document No.";"Document No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Quantité Réservée";"Quantité Réservée")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Quantité Non Réservée";"Quantité Non Réservée")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Date Arrivage";"Date Arrivage")
                {
                }
                field(AI;AI)
                {
                }
                field("Status Carte Grise";"Status Carte Grise")
                {
                    Visible = false;
                }
                field("Date Livraison Prévue";"Date Livraison Prévue")
                {
                    Visible = false;
                }
                field("Date Livraison Confirmé";"Date Livraison Confirmé")
                {
                }
                field("Date réception dossier";GRecServiceItem."Date Recep Dossier")
                {
                    Visible = false;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    Visible = false;
                }
                field("Date Confirmation VIN + CAF";"Date Confirmation VIN + CAF")
                {
                    Editable = false;
                }
                field("Date Bateau Visé VIN + CAF";"Date Bateau Visé VIN + CAF")
                {
                    Editable = false;
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
                field("Date Embarquement";"Date Embarquement")
                {
                }
                field("No. Expédition";"No. Expédition")
                {
                }
                field("Hors taxe";"Hors taxe")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        GRecServiceItem.RESET;
        GRecServiceItem.SETRANGE("Serial No.",VIN);
        IF GRecServiceItem.FINDFIRST THEN;
    end;

    trigger OnClosePage();
    var
        RecReservationVueDel : Record "60049";
    begin
        DELETEALL;
    end;

    trigger OnOpenPage();
    begin
        Seq := 10000;
        //SM OLD 020817ReservationEntriesVN();
        //SM OLD 270717LigneAchatRéservé();
        StockARéserver();
        RecUserSetup.GET(USERID);
        FILTERGROUP(2);
        //IF NOT RecUserSetup.Admin_Vente_VN THEN
        SETFILTER("Commentaire appro",'<>PROTOTYPE&<>MOI&<>SAMPLE UNIT&<>HOMOLOGATION');
        //MESSAGE('%1',RecUserSetup.Admin_Vente_VN);
        FILTERGROUP(0);
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    var
        TMPReservationVueMin : Record "60049" temporary;
    begin
        //<<
        IF CloseAction IN [ACTION::OK,ACTION::LookupOK] THEN
          BEGIN
            RecUserSetup.GET(USERID);
        
              TMPReservationVueMin.COPY(Rec,TRUE);
              TMPReservationVueMin.SETCURRENTKEY(Réservé,"Stock\Commande Achat","Date Entree");
              TMPReservationVueMin.SETRANGE("No. Article","No. Article");
              TMPReservationVueMin.SETRANGE("Code Variante","Code Variante");
              TMPReservationVueMin.SETRANGE("Hors taxe","Hors taxe");
              IF TMPReservationVueMin.FINDFIRST THEN BEGIN
               IF TMPReservationVueMin."Date Entree" < "Date Entree" THEN
                 IF NOT  RecUserSetup.Admin_Vente_VN THEN BEGIN
                   ERROR('Il y a d''autres VIN à reserver avec une date d''entrée antérieure')
                 END ELSE BEGIN
                     IF CONFIRM('Il y a d''autres VIN à reserver avec une date d''entrée antérieure Voulez vous continuer ?',FALSE) THEN
                      EXIT
                     ELSE
                      ERROR('Il y a d''autres VIN à reserver avec une date d''entrée antérieure')
                   END;
              END;
              //IF MinDateEntree < "Date Entree" THEN
              //  ERROR('il ya d''autre VIN à reserver');
        
            END ELSE
             EXIT;
        
        //message(FORMAT(MinDateEmb));
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
        "LRecDétailVNArrivage" : Record "70015";
        RecReservationVue : Record "60049";
        RecUserSetup : Record "91";
        MinDateEntree : Date;

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
            RecGReservEntries.FINDSET ;
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
                      //ItemLedgEntry.RESET;
                      //ItemLedgEntry.SETRANGE("Entry No.","Source Ref. No.");
                      IF ItemLedgEntry.FINDSET THEN
                        "Stock\Commande Achat" := "Stock\Commande Achat"::Stock;
                        RecWarehouseEntry.RESET;
                        RecWarehouseEntry.SETRANGE("Serial No.","Serial No.");
                        RecWarehouseEntry.SETRANGE("Item No.","Item No.");
                        RecWarehouseEntry.SETRANGE("Variant Code","Variant Code");
                        RecWarehouseEntry.SETRANGE("Location Code","Location Code");

                      IF RecWarehouseEntry.FINDLAST THEN
                        Emplacement := RecWarehouseEntry."Bin Code"
                      ELSE
                        Emplacement := '';
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

            IF RecSalesHeader.GET(RecSalesHeader."Document Type"::Order,ReservationEntry."Source ID") THEN BEGIN


              "Date Livraison Prévue"   := RecSalesHeader."Requested Delivery Date";
              "Date Livraison Confirmé" := RecSalesHeader."Promised Delivery Date";
              Vendeur                   := RecSalesHeader."Salesperson Code";
              //SourceType := SourceType::Sales;

            END;
            //END SM



            INSERT(TRUE);
          UNTIL ReservationEntry.NEXT = 0 ;
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

    procedure "StockARéserver"();
    var
        ItemLedgerEntry : Record "32";
        ReservationVue : Record "60049";
        RecItem : Record "27";
        RecWarehouseEntry : Record "7312";
        RecFicheTechnique : Record "50032";
        LRecBin : Record "7354";
        BlncheckBin : Boolean;
    begin
        MinDateEntree:=TODAY;
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
            LRecBin.SETFILTER("Location Code",'%1','PARC_VN');
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
            IF NOT BlncheckBin THEN
              INSERT(TRUE);
          UNTIL ItemLedgerEntry.NEXT =0;
        END;

        //SM
        FINDFIRST;
        //END SM
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
}

