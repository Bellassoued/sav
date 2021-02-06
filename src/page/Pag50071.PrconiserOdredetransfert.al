page 50071 "Préconiser Odre de transfert"
{
    // version CT16V002

    DelayedInsert = true;
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Document;
    ShowFilter = true;
    SourceTable = Table60050;

    layout
    {
        area(content)
        {
            group(Filtre)
            {
                field("Date Début";StartDate)
                {
                    Caption = 'Date Début';
                }
                field("Date Fin";EndDate)
                {
                    Caption = 'Date Fin';
                }
                field(Magasin;MagPreco)
                {
                    Editable = false;
                }
                field("Code catégorie article";"Item Category Code")
                {
                }
                field("Product Group Code";"Product Group Code")
                {
                }
                field(famille;famille)
                {

                    trigger OnValidate();
                    begin
                        TESTFIELD("Product Group Code");
                    end;
                }
                field("Model Code";"Model Code")
                {

                    trigger OnValidate();
                    begin
                        TESTFIELD(famille);
                    end;
                }
            }
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field(Famille;"Code Modèl PR")
                {
                }
                field("Qty préconisé";"Qty préconisé")
                {
                    Caption = '<Qty préconisée>';
                }
                field("Stock Mag Prov";"Stock Mag Source")
                {
                }
                field("Stock Mag Destination";"Stock Mag Destination")
                {
                }
                field("Qty Vendu Période";"Quantié réceptionée")
                {
                }
                field("Qty Sur Achat";"Quantité Mag EMB")
                {
                    Caption = 'Qty Sur Achat';
                }
                field("<Vente SAV M>";"Quantité Vendu SAV M")
                {
                    Caption = '<Vente SAV M>';
                }
                field("<Vente SAV M-1>";"Quantité Vendu SAV M-1")
                {
                    Caption = '<Vente SAV M-1>';
                }
                field("<Vente PVR M>";"Quantité Vendu COM M")
                {
                    Caption = '<Vente PVR M>';
                }
                field("<Vente PVR M-1>";"Quantité Vendu COM M-1")
                {
                    Caption = '<Vente PVR M-1>';
                }
                field("<Vente SAV Année>";"Quantité Vendu SAV Année")
                {
                    Caption = '<Vente SAV Année>';
                }
                field("<Vente VPR Année>";"Quantité Vendu COM Année")
                {
                    Caption = '<Vente PVR Année>';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group()
            {
                action("Proposer Articles")
                {
                    Image = AddAction;

                    trigger OnAction();
                    begin
                        CalcQuantitéRecp(MagPreco,MagDestinatio);
                    end;
                }
                action("Inserer Lignes")
                {
                    Image = Insert;

                    trigger OnAction();
                    begin
                        InsertTransferLine(NumOrdreTransfert);
                        CurrPage.CLOSE;
                    end;
                }
            }
        }
    }

    trigger OnClosePage();
    begin
        DELETEALL();
    end;

    trigger OnOpenPage();
    begin
        EndDate := TODAY;
        StartDate := CALCDATE('<-'+FORMAT(NbMoisHisVente)+'M>',EndDate);
        TxtPeriodeCalcule := 'Du ' + FORMAT(StartDate) + '   au ' + FORMAT(EndDate);
        CurrPage.UPDATE;
    end;

    var
        StartDate : Date;
        EndDate : Date;
        RecGPurchaseSetup : Record "312";
        IntNbreMoisCouvert : Integer;
        IntNbreMoisDelaiFour : Integer;
        TxtPeriodeCalcule : Text[100];
        NbMoisHisVente : Integer;
        MagPreco : Code[10];
        CodeModelePR : Code[30];
        RecGArticle : Record "27";
        "Location Filter" : Text[50];
        TXT50000 : Label '"Nombre mois d''historique vente doit être différent de 0  "';
        MagDestinatio : Code[10];
        NumOrdreTransfert : Code[20];
        GroupeProduit : Code[20];
        CodeModel : Code[20];

    procedure "CalcQuantitéRecp"(Magasin : Code[10];MagDes : Code[10]);
    var
        ItemLedgerEntry : Record "32";
        QtyRecep : Decimal;
        Periode : Integer;
        PurchaseLine : Record "39";
        TransferShipLine : Record "5745";
        CH : Text;
        CurrMonth : Integer;
        DateDebutMois : Date;
        DateFinMois : Date;
        RecItem : Record "27";
        RecFicheTechnique : Record "50032";
    begin
        DELETEALL();

         // IF NbMoisHisVente=0 THEN
         //    ERROR(TXT50000);

         // ********************* CALCULE QUANTITE (SORTIE) MAGASIN dest

         // ********************* CALCULE QUANTITE (SORTIE) MAGASIN PROV
         ItemLedgerEntry.RESET;
         ItemLedgerEntry.SETCURRENTKEY("Item No.",Open,"Variant Code",Positive,"Location Code","Posting Date");
         ItemLedgerEntry.SETRANGE("Location Code",Magasin);
         ItemLedgerEntry.SETRANGE(Positive,FALSE);
         ItemLedgerEntry.SETFILTER("Posting Date",'%1..%2',StartDate,EndDate);
         IF ItemLedgerEntry.FINDSET THEN
           REPEAT
            RecGArticle.GET(ItemLedgerEntry."Item No.");
            RecGArticle.SETFILTER("Date Filter",'%1..%2',StartDate,EndDate);
            RecGArticle.SETFILTER("Location Filter",Magasin);
            RecGArticle.CALCFIELDS(Inventory);

            RecItem.GET(ItemLedgerEntry."Item No.");
            RecItem.SETFILTER("Date Filter",'%1..%2',StartDate,EndDate);
            RecItem.SETFILTER("Location Filter",MagDes);
            RecItem.CALCFIELDS(Inventory);
            IF RecFicheTechnique.GET(RecGArticle."No.") THEN;

            IF "Model Code" <> '' THEN
            BEGIN
              IF (RecGArticle."Item Category Code"="Item Category Code")AND(RecGArticle."Product Group Code" = "Product Group Code")AND
                          (RecGArticle."Code Modèle PR" = famille)AND(RecFicheTechnique."Model Code" = "Model Code")THEN
              BEGIN
                  IF GET(ItemLedgerEntry."Item No.",ItemLedgerEntry."Location Code",MagDes) THEN BEGIN
                    "Quantié réceptionée" += ItemLedgerEntry.Quantity;
                    MODIFY();
                  END ELSE BEGIN
                    INIT;
                    "No."                   := ItemLedgerEntry."Item No.";
                    Description             := RecGArticle.Description;
                    "Code Magasin"          := ItemLedgerEntry."Location Code" ;
                    "Quantié réceptionée"   := ItemLedgerEntry.Quantity;
                    "Code Modèl PR"         := RecGArticle."Code Modèle PR";
                    "Stock Mag Source"      := RecGArticle.Inventory;
                    "Stock Mag Destination" := RecItem.Inventory;
                    "Magasin Destination"   := MagDes;
                    "Product Group Code"    := RecGArticle."Product Group Code";
                    famille                 := RecGArticle."Code Modèle PR";
                    "Model Code"            := RecFicheTechnique."Model Code";
                    "Item Category Code"    := RecGArticle."Item Category Code";
                    INSERT;
                  END;
              END;
            END ELSE IF famille <> '' THEN BEGIN
              IF (RecGArticle."Item Category Code"="Item Category Code")AND(RecGArticle."Product Group Code" = "Product Group Code")AND
                    (RecGArticle."Code Modèle PR" = famille)THEN
              BEGIN
                  IF GET(ItemLedgerEntry."Item No.",ItemLedgerEntry."Location Code",MagDes) THEN BEGIN
                    "Quantié réceptionée" += ItemLedgerEntry.Quantity;
                    MODIFY();
                  END ELSE BEGIN
                    INIT;
                    "No."                   := ItemLedgerEntry."Item No.";
                    Description             := RecGArticle.Description;
                    "Code Magasin"          := ItemLedgerEntry."Location Code" ;
                    "Quantié réceptionée"   := ItemLedgerEntry.Quantity;
                    "Code Modèl PR"         := RecGArticle."Code Modèle PR";
                    "Product Group Code"    := RecGArticle."Product Group Code";
                    famille                 := RecGArticle."Code Modèle PR";
                    "Stock Mag Source"      := RecGArticle.Inventory;
                    "Stock Mag Destination" := RecItem.Inventory;
                    "Magasin Destination"   := MagDes;
                    "Item Category Code"    := RecGArticle."Item Category Code";
                    INSERT;
                  END;
              END;
            END ELSE IF "Product Group Code" <> '' THEN
            BEGIN
              IF (RecGArticle."Item Category Code"="Item Category Code")AND(RecGArticle."Product Group Code" = "Product Group Code") THEN
              BEGIN
                  IF GET(ItemLedgerEntry."Item No.",ItemLedgerEntry."Location Code",MagDes) THEN BEGIN
                    "Quantié réceptionée" += ItemLedgerEntry.Quantity;
                    MODIFY();
                  END ELSE BEGIN
                    INIT;
                    "No."                   := ItemLedgerEntry."Item No.";
                    Description             := RecGArticle.Description;
                    "Code Magasin"          := ItemLedgerEntry."Location Code" ;
                    "Quantié réceptionée"   := ItemLedgerEntry.Quantity;
                    "Code Modèl PR"         := RecGArticle."Code Modèle PR";
                    "Stock Mag Source"      := RecGArticle.Inventory;
                    "Stock Mag Destination" := RecItem.Inventory;
                    "Magasin Destination"   := MagDes;
                    "Product Group Code"    := RecGArticle."Product Group Code";
                    "Item Category Code"    := RecGArticle."Item Category Code";
                    INSERT;
                  END;
              END;
            END
            ELSE BEGIN
                      IF GET(ItemLedgerEntry."Item No.",ItemLedgerEntry."Location Code",MagDes) THEN BEGIN
                        "Quantié réceptionée" += ItemLedgerEntry.Quantity;
                        MODIFY();
                      END ELSE BEGIN
                         INIT;
                         "No."                   := ItemLedgerEntry."Item No.";
                         Description             := RecGArticle.Description;
                         "Code Magasin"          := ItemLedgerEntry."Location Code" ;
                         "Quantié réceptionée"   := ItemLedgerEntry.Quantity;
                         "Code Modèl PR"         := RecGArticle."Code Modèle PR";
                         "Stock Mag Source"      := RecGArticle.Inventory;
                         "Stock Mag Destination" := RecItem.Inventory;
                         "Magasin Destination"   := MagDes;

                         INSERT;
                      END;
            END;
          UNTIL ItemLedgerEntry.NEXT =0;

         // ********************* CALCULE QUANTITE (RETOUR SAV & PVR) MAGASIN PROV

         CH := COPYSTR(FORMAT(Magasin),7,2);
         "Location Filter" := 'SAV - '+CH+'|VPR - '+CH;

         ItemLedgerEntry.RESET;
         ItemLedgerEntry.SETCURRENTKEY("Item No.",Open,"Variant Code",Positive,"Location Code","Posting Date");
         ItemLedgerEntry.SETRANGE(Positive,FALSE);
         ItemLedgerEntry.SETRANGE("Entry Type",ItemLedgerEntry."Entry Type"::Transfer);
         ItemLedgerEntry.SETFILTER("Location Code","Location Filter");
         ItemLedgerEntry.SETFILTER("Posting Date",'%1..%2',StartDate,EndDate);
         IF ItemLedgerEntry.FINDSET THEN
           REPEAT
              IF GET(ItemLedgerEntry."Item No.",Magasin,MagDes) THEN BEGIN
                "Quantié réceptionée" += ItemLedgerEntry.Quantity;
                MODIFY();
              END;
           UNTIL ItemLedgerEntry.NEXT =0;


         // ********************* CALCULE QUANTITE (ENTREE) MAGASIN EMBARQUEMENT
         ItemLedgerEntry.RESET;
         ItemLedgerEntry.SETCURRENTKEY("Item No.",Open,"Variant Code",Positive,"Location Code","Posting Date");
         ItemLedgerEntry.SETRANGE(Positive,TRUE);
         ItemLedgerEntry.SETFILTER("Location Code",'MAG - EMB*');
         ItemLedgerEntry.SETFILTER("Posting Date",'%1..%2',StartDate,EndDate);
         IF ItemLedgerEntry.FINDSET THEN
           REPEAT
            RecGArticle.GET(ItemLedgerEntry."Item No.");
            RecGArticle.SETFILTER("Date Filter",'%1..%2',StartDate,EndDate);
            RecGArticle.SETFILTER("Location Filter",Magasin);
            RecGArticle.CALCFIELDS(Inventory);

            RecItem.GET(ItemLedgerEntry."Item No.");
            RecItem.SETFILTER("Date Filter",'%1..%2',StartDate,EndDate);
            RecItem.SETFILTER("Location Filter",MagDes);
            RecItem.CALCFIELDS(Inventory);
            IF RecFicheTechnique.GET(RecGArticle."No.") THEN;

            IF "Model Code" <> '' THEN
            BEGIN
              IF (RecGArticle."Product Group Code" = "Product Group Code")AND(RecGArticle."Code Modèle PR" = famille)AND
                          (RecFicheTechnique."Model Code" = "Model Code")THEN
              BEGIN
                  IF GET(ItemLedgerEntry."Item No.",ItemLedgerEntry."Location Code",MagDes) THEN BEGIN
                    "Quantié réceptionée" += ItemLedgerEntry.Quantity;
                    MODIFY();
                  END ELSE BEGIN
                    INIT;
                    "No."                   := ItemLedgerEntry."Item No.";
                    Description             := RecGArticle.Description;
                    "Code Magasin"          := ItemLedgerEntry."Location Code" ;
                    "Quantié réceptionée"   := ItemLedgerEntry.Quantity;
                    "Code Modèl PR"         := RecGArticle."Code Modèle PR";
                    "Stock Mag Source"      := RecGArticle.Inventory;
                    "Stock Mag Destination" := RecItem.Inventory;
                    "Magasin Destination"   := MagDes;
                    "Product Group Code"    := RecGArticle."Product Group Code";
                    famille                 := RecGArticle."Code Modèle PR";
                    "Model Code"            := RecFicheTechnique."Model Code";
                    "Item Category Code"    := RecGArticle."Item Category Code";
                    INSERT;
                  END;
              END;
            END ELSE IF famille<>'' THEN
            BEGIN
              IF (RecGArticle."Product Group Code" = "Product Group Code")AND(RecGArticle."Code Modèle PR" = famille)THEN
              BEGIN
                  IF GET(ItemLedgerEntry."Item No.",ItemLedgerEntry."Location Code",MagDes) THEN BEGIN
                    "Quantié réceptionée" += ItemLedgerEntry.Quantity;
                    MODIFY();
                  END ELSE BEGIN
                    INIT;
                    "No."                   := ItemLedgerEntry."Item No.";
                    Description             := RecGArticle.Description;
                    "Code Magasin"          := ItemLedgerEntry."Location Code" ;
                    "Quantié réceptionée"   := ItemLedgerEntry.Quantity;
                    "Code Modèl PR"         := RecGArticle."Code Modèle PR";
                    "Stock Mag Source"      := RecGArticle.Inventory;
                    "Stock Mag Destination" := RecItem.Inventory;
                    "Magasin Destination"   := MagDes;
                    "Product Group Code"    := RecGArticle."Product Group Code";
                    famille                 := RecGArticle."Code Modèle PR";
                    "Item Category Code"    := RecGArticle."Item Category Code";
                    INSERT;
                  END;
              END;
            END ELSE IF "Product Group Code"<>'' THEN
            BEGIN
              IF (RecGArticle."Product Group Code" = "Product Group Code") THEN
              BEGIN
                  IF GET(ItemLedgerEntry."Item No.",ItemLedgerEntry."Location Code",MagDes) THEN BEGIN
                    "Quantié réceptionée" += ItemLedgerEntry.Quantity;
                    MODIFY();
                  END ELSE BEGIN
                    INIT;
                    "No."                   := ItemLedgerEntry."Item No.";
                    Description             := RecGArticle.Description;
                    "Code Magasin"          := ItemLedgerEntry."Location Code" ;
                    "Quantié réceptionée"   := ItemLedgerEntry.Quantity;
                    "Code Modèl PR"         := RecGArticle."Code Modèle PR";
                    "Stock Mag Source"      := RecGArticle.Inventory;
                    "Stock Mag Destination" := RecItem.Inventory;
                    "Magasin Destination"   := MagDes;
                    "Product Group Code"    := RecGArticle."Product Group Code";
                    "Item Category Code"    := RecGArticle."Item Category Code";
                    INSERT;
                  END;
              END;
            END
            ELSE BEGIN
                  IF GET(ItemLedgerEntry."Item No.",ItemLedgerEntry."Location Code",MagDes) THEN BEGIN
                    "Quantité Mag EMB" += ItemLedgerEntry.Quantity;
                    MODIFY();
                  END ELSE BEGIN
                    INIT;
                    "No."                   := ItemLedgerEntry."Item No.";
                    Description             := ItemLedgerEntry.Description;
                    "Quantité Mag EMB"      := ItemLedgerEntry.Quantity;
                    "Code Modèl PR"         := RecGArticle."Code Modèle PR";
                    "Stock Mag Source"      := RecGArticle.Inventory;
                    "Stock Mag Destination" := RecItem.Inventory;
                    "Code Magasin"          := ItemLedgerEntry."Location Code";
                    "Magasin Destination"   := MagDes;
                    INSERT;
                  END;
            END;
           UNTIL ItemLedgerEntry.NEXT =0;

         // ********************* CALCULE QUANTITE VENDU (SAV ET PVR) MAGASIN Prov Mois encours
         TransferShipLine.RESET;
         TransferShipLine.SETCURRENTKEY("Transfer Order No.","Item No.","Shipment Date");
         TransferShipLine.SETRANGE("Transfer-from Code",Magasin);
         TransferShipLine.SETFILTER("Shipment Date",'01..t');
         IF TransferShipLine.FINDSET THEN
           REPEAT
             CH := COPYSTR(FORMAT(TransferShipLine."Transfer-to Code"),1,3);
             IF GET(TransferShipLine."Item No.",TransferShipLine."Transfer-from Code",MagDes) THEN BEGIN
                IF CH = 'SAV' THEN BEGIN
                   IF GET(TransferShipLine."Item No.") THEN BEGIN
                    "Quantité Vendu SAV M" += ItemLedgerEntry.Quantity;
                    MODIFY();
                   END; END
                ELSE IF CH = 'VPR' THEN BEGIN
                   IF GET(TransferShipLine."Item No.",TransferShipLine."Transfer-from Code",MagDes) THEN BEGIN
                    "Quantité Vendu COM M" += ItemLedgerEntry.Quantity;
                    MODIFY();
                   END;
                END;
              END;
           UNTIL TransferShipLine.NEXT=0;

         //***  RETOUR SAV & VPR Mois encours
         TransferShipLine.RESET;
         TransferShipLine.SETCURRENTKEY("Transfer Order No.","Item No.","Shipment Date");
         TransferShipLine.SETRANGE("Transfer-to Code",Magasin);
         TransferShipLine.SETFILTER("Shipment Date",'01..t');
         IF TransferShipLine.FINDSET THEN
           REPEAT
             CH := COPYSTR(FORMAT(TransferShipLine."Transfer-from Code"),1,3);
             IF GET(TransferShipLine."Item No.",Magasin,MagDes) THEN BEGIN
                IF CH = 'SAV' THEN BEGIN
                   IF GET(TransferShipLine."Item No.") THEN BEGIN
                    "Quantité Vendu SAV M" -= ItemLedgerEntry.Quantity;
                    MODIFY();
                   END; END
                ELSE IF CH = 'VPR' THEN BEGIN
                   IF GET(TransferShipLine."Item No.",Magasin,MagDes) THEN BEGIN
                    "Quantité Vendu COM M" -= ItemLedgerEntry.Quantity;
                    MODIFY();
                   END;
                END;
              END;
           UNTIL TransferShipLine.NEXT=0;

         // ********************* CALCULE QUANTITE VENDU (SAV ET PVR) MAGASIN Prov Mois -1
         CurrMonth := DATE2DMY(TODAY,2) - 1 ;
         DateDebutMois := DMY2DATE(1,DATE2DMY(CALCDATE('<-1M>',TODAY),2),DATE2DMY(CALCDATE('<-'+ FORMAT(CurrMonth) +'M>',TODAY),3));
         DateFinMois   := CALCDATE('<-1D>',CALCDATE('<+1M>',DateDebutMois));

         // MESSAGE('%1..%2',DateDebutMois,DateFinMois);

         TransferShipLine.RESET;
         TransferShipLine.SETCURRENTKEY("Transfer Order No.","Item No.","Shipment Date");
         TransferShipLine.SETRANGE("Transfer-from Code",Magasin);
         TransferShipLine.SETFILTER("Shipment Date",'%1..%2',DateDebutMois,DateFinMois);
         IF TransferShipLine.FINDSET THEN
           REPEAT
             CH := COPYSTR(FORMAT(TransferShipLine."Transfer-to Code"),1,3);
             IF CH = 'SAV' THEN BEGIN
                IF GET(TransferShipLine."Item No.",Magasin,MagDes) THEN BEGIN
                  "Quantité Vendu SAV M-1" += ItemLedgerEntry.Quantity;
                  MODIFY();
                END; END
             ELSE IF CH = 'VPR' THEN BEGIN
                IF GET(TransferShipLine."Item No.",Magasin,MagDes) THEN BEGIN
                  "Quantité Vendu COM M-1" += ItemLedgerEntry.Quantity;
                  MODIFY();
                END;
             END;
           UNTIL TransferShipLine.NEXT=0;

        // ****** RETOUR SAV & VPR Mois précédent encours
         TransferShipLine.RESET;
         TransferShipLine.SETCURRENTKEY("Transfer Order No.","Item No.","Shipment Date");
         TransferShipLine.SETRANGE("Transfer-to Code",Magasin);
         TransferShipLine.SETFILTER("Shipment Date",'%1..%2',DateDebutMois,DateFinMois);
         IF TransferShipLine.FINDSET THEN
           REPEAT
             CH := COPYSTR(FORMAT(TransferShipLine."Transfer-from Code"),1,3);
             IF CH = 'SAV' THEN BEGIN
                IF GET(TransferShipLine."Item No.",Magasin,MagDes) THEN BEGIN
                  "Quantité Vendu SAV M-1" -= ItemLedgerEntry.Quantity;
                  MODIFY();
                END; END
             ELSE IF CH = 'VPR' THEN BEGIN
                IF GET(TransferShipLine."Item No.",Magasin,MagDes) THEN BEGIN
                  "Quantité Vendu COM M-1" -= ItemLedgerEntry.Quantity;
                  MODIFY();
                END;
             END;
           UNTIL TransferShipLine.NEXT=0;

        // ********************* CALCULE QUANTITE VENDU (SAV ET PVR) MAGASIN Prov Année Encours
        CurrMonth := DATE2DMY(TODAY,2);
        DateDebutMois := CALCDATE('<-'+FORMAT(CurrMonth)+'M>',TODAY);
        DateFinMois   := CALCDATE('<CY>',CALCDATE('<+1Y>',DateDebutMois));

        TransferShipLine.RESET;
        TransferShipLine.SETCURRENTKEY("Transfer Order No.","Item No.","Shipment Date");
        TransferShipLine.SETRANGE("Transfer-from Code",Magasin);
        TransferShipLine.SETFILTER("Shipment Date",'0101..3112'); //,DateDebutMois,DateFinMois);
        IF TransferShipLine.FINDSET THEN
          REPEAT
            CH := COPYSTR(FORMAT(TransferShipLine."Transfer-to Code"),1,3);
            IF CH = 'SAV' THEN BEGIN
               IF GET(TransferShipLine."Item No.",Magasin,MagDes) THEN BEGIN
                "Quantité Vendu SAV Année" += ItemLedgerEntry.Quantity;
                MODIFY();
               END; END
            ELSE IF CH = 'VPR' THEN BEGIN
               IF GET(TransferShipLine."Item No.",Magasin,MagDes) THEN BEGIN
                "Quantité Vendu COM Année" += ItemLedgerEntry.Quantity;
                MODIFY();
               END;
            END;
          UNTIL TransferShipLine.NEXT=0;

        // ***** RETOUR SAV & VPR annuel
        TransferShipLine.RESET;
        TransferShipLine.SETCURRENTKEY("Transfer Order No.","Item No.","Shipment Date");
        TransferShipLine.SETRANGE("Transfer-to Code",Magasin);//to
        TransferShipLine.SETFILTER("Shipment Date",'0101..3112'); //,DateDebutMois,DateFinMois);
        IF TransferShipLine.FINDSET THEN
          REPEAT
            CH := COPYSTR(FORMAT(TransferShipLine."Transfer-from Code"),1,3);// from
            IF CH = 'SAV' THEN BEGIN
               IF GET(TransferShipLine."Item No.",Magasin,MagDes) THEN BEGIN
                "Quantité Vendu SAV Année" -= ItemLedgerEntry.Quantity; //-
                MODIFY();
               END; END
            ELSE IF CH = 'VPR' THEN BEGIN
               IF GET(TransferShipLine."Item No.",Magasin,MagDes) THEN BEGIN
                "Quantité Vendu COM Année" -= ItemLedgerEntry.Quantity; //-
                MODIFY();
               END;
            END;
          UNTIL TransferShipLine.NEXT=0;
    end;

    procedure "SetMagasinPréconisation"("Magasin Source" : Code[10];"Magasin Destination" : Code[10]);
    begin
        MagPreco      := "Magasin Source";
        MagDestinatio := "Magasin Destination";
    end;

    procedure SetNumTransfert("No. Ordre Transfert" : Code[20]);
    begin
        NumOrdreTransfert := "No. Ordre Transfert";
    end;
}

