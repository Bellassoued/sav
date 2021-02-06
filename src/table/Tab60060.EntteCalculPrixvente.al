table 60060 "Entête Calcul Prix vente"
{
    // version MAZDA77.2


    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"Document type";Option)
        {
            OptionCaption = 'Commande Achat,Réception Achat Enregistrée,Facture Achat Enregistrée';
            OptionMembers = "Commande Achat","Réception Achat Enregistrée","Facture Achat Enregistrée";

            trigger OnValidate();
            begin
                //SM MAZDA77.1
                IF ("Mode de calcul" = "Mode de calcul"::"Prix de Vente = Coût Prévu * MARGE") AND ("Document type" <> "Document type"::"Réception Achat Enregistrée") THEN
                  ERROR(TXT0004);
                IF ("Mode de calcul" = "Mode de calcul"::"Prix de Vente = CM Prévu * MARGE") AND ("Document type" <> "Document type"::"Réception Achat Enregistrée") THEN
                  ERROR(TXT0004);
            end;
        }
        field(3;"No. document achat";Code[30])
        {
            TableRelation = IF (Document type=FILTER(Commande Achat)) "Purchase Header".No. WHERE (Document Type=FILTER(Order))
                            ELSE IF (Document type=FILTER(Réception Achat Enregistrée)) "Purch. Rcpt. Header".No.
                            ELSE IF (Document type=FILTER(Facture Achat Enregistrée)) "Purch. Inv. Header".No.;

            trigger OnValidate();
            begin
                CheckFactAchat("Document type","No. document achat");
                RecSalesReceivablesSetup.GET;
                //SM MAZDA77.1
                // MODIF KK MAZDA77.2
                // OLD RecMargeParGroupePièce.DELETEALL;
                //KK MAZDA77.2
                RecMargeParGroupePièce.RESET;
                RecMargeParGroupePièce.SETRANGE("Document No.","No.");
                IF RecMargeParGroupePièce.FINDSET THEN
                  RecMargeParGroupePièce.DELETEALL;
                //END KK MAZDA77.2

                CASE "Document type" OF
                  0  :BEGIN
                        IF RecPurchaseHeader.GET(RecPurchaseHeader."Document Type"::Order,"No. document achat") THEN BEGIN
                           IF RecPurchaseHeader."Currency Factor" <> 0 THEN BEGIN
                             "Taux de change actuelle" := 1/RecPurchaseHeader."Currency Factor";
                             //IF RecTransportMethod.GET(RecPurchaseHeader."Transport Method") THEN
                             //  ModeTransport := RecTransportMethod.Description;
                             //IF RecPurchaseHeader."Order Type" =  RecPurchaseHeader."Order Type"::PR THEN BEGIN
                             // IF RecPurchaseHeader."Transport Method" = '1' THEN
                             // ELSE IF RecPurchaseHeader."Transport Method" = '4' THEN
                             //   Coef := RecSalesReceivablesSetup."Coefficient Voie Aérienne PR";
                           END;
                           coefficient := RecSalesReceivablesSetup."Coefficient Import";

                           //SM MAZDA77.1
                           //GET RecPurchaseLine
                           RecPurchaseLine.RESET;
                           RecPurchaseLine.SETRANGE("Document No.","No. document achat");
                           RecPurchaseLine.SETRANGE(Type,RecPurchaseLine.Type::Item);
                           IF RecPurchaseLine.FINDFIRST THEN
                           REPEAT
                             RecItem.GET(RecPurchaseLine."No.");
                             // MODIF KK MAZDA77.2
                             // OLD IF NOT RecMargeParGroupePièce.GET(RecItem."Product Group Code") THEN BEGIN
                             IF NOT RecMargeParGroupePièce.GET(RecItem."Product Group Code","No.") THEN BEGIN
                               RecMargeParGroupePièce.INIT;
                               //ADD KK MAZDA77.2
                               RecMargeParGroupePièce."Document No."  := "No.";
                               //END KK MAZDA77.2
                               RecMargeParGroupePièce."Posting Group" := RecItem."Product Group Code";
                               RecMargeParGroupePièce.INSERT;
                             END;
                           UNTIL RecPurchaseLine.NEXT = 0;
                           //END SM MAZDA77.1

                        END;
                      END;
                  1  :BEGIN
                        IF RecPurchRcptHeader.GET("No. document achat") THEN BEGIN
                           IF RecPurchRcptHeader."Currency Factor" <> 0 THEN BEGIN
                             "Taux de change actuelle" := 1/RecPurchRcptHeader."Currency Factor";
                             //IF RecTransportMethod.GET(RecPurchaseHeader."Transport Method") THEN
                             //  ModeTransport := RecTransportMethod.Description;
                             //IF RecPurchRcptHeader."Order Type" = RecPurchRcptHeader."Order Type"::PR THEN BEGIN
                             // IF RecPurchRcptHeader."Transport Method" = '1' THEN
                             // ELSE IF RecPurchRcptHeader."Transport Method" = '4' THEN
                             //  Coef := RecSalesReceivablesSetup."Coefficient Voie Aérienne PR";
                             END;
                             coefficient := RecSalesReceivablesSetup."Coefficient Import";
                             //SM MAZDA77.1
                             //GET RecPurchRcptLine
                             CLEAR(RecPurchRcptLine);
                             RecPurchRcptLine.SETRANGE("Document No.","No. document achat");
                             RecPurchRcptLine.SETRANGE(Type,RecPurchRcptLine.Type::Item);
                             IF RecPurchRcptLine.FINDFIRST THEN
                             REPEAT
                              RecItem.GET(RecPurchRcptLine."No.");
                              // MODIF KK MAZDA77.2
                              // OLD IF NOT RecMargeParGroupePièce.GET(RecItem."Product Group Code") THEN BEGIN
                              IF NOT RecMargeParGroupePièce.GET(RecItem."Product Group Code","No.") THEN BEGIN
                                RecMargeParGroupePièce.INIT;
                                //ADD KK MAZDA77.2
                                RecMargeParGroupePièce."Document No."  := "No.";
                                //END KK MAZDA77.2
                                RecMargeParGroupePièce."Posting Group" := RecItem."Product Group Code";
                                RecMargeParGroupePièce.INSERT;
                              END;
                             UNTIL RecPurchRcptLine.NEXT = 0;
                             //END SM MAZDA77.1
                        END;
                      END;
                  2  :BEGIN
                        IF PuchaseInvHeader.GET("No. document achat") THEN BEGIN
                           IF PuchaseInvHeader."Currency Factor" <> 0 THEN BEGIN
                             "Taux de change actuelle" := 1/PuchaseInvHeader."Currency Factor";
                             //IF RecTransportMethod.GET(RecPurchaseHeader."Transport Method") THEN
                             //  ModeTransport := RecTransportMethod.Description;
                             //IF PuchaseInvHeader."Order Type" = PuchaseInvHeader."Order Type"::PR THEN BEGIN
                             //  IF PuchaseInvHeader."Transport Method" = '1' THEN

                             //  ELSE IF PuchaseInvHeader."Transport Method" = '4' THEN
                             //    Coef := RecSalesReceivablesSetup."Coefficient Voie Aérienne PR";
                             //END;

                           END;
                           coefficient := RecSalesReceivablesSetup."Coefficient Import";
                           //SM MAZDA77.1
                          //GET PuchaseInvLine
                          CLEAR(RecPuchaseInvLine);
                          //ADD KK MAZDA77.3
                          IF "No. document achat"<>'' THEN
                            RecPuchaseInvLine.SETRANGE("Document No.","No. document achat");
                          IF "Filter No. Document"<>'' THEN
                            RecPuchaseInvLine.SETRANGE("Document No.",'%1',"Filter No. Document");
                          IF "Filter No. Fournisseur" <>'' THEN
                            RecPuchaseInvLine.SETRANGE("Buy-from Vendor No.",'%1',"Filter No. Fournisseur");
                          RecPuchaseInvLine.SETRANGE(Type,RecPuchaseInvLine.Type::Item);
                          IF RecPuchaseInvLine.FINDFIRST THEN
                          REPEAT
                            RecItem.GET(RecPuchaseInvLine."No.");
                            // MODIF KK MAZDA77.2
                            // OLD IF NOT RecMargeParGroupePièce.GET(RecItem."Product Group Code") THEN BEGIN
                            IF NOT RecMargeParGroupePièce.GET(RecItem."Product Group Code","No.") THEN BEGIN
                              RecMargeParGroupePièce.INIT;
                              //ADD KK MAZDA77.2
                              RecMargeParGroupePièce."Document No."  := "No.";
                              //END KK MAZDA77.2
                              RecMargeParGroupePièce."Posting Group" := RecItem."Product Group Code";
                              RecMargeParGroupePièce.INSERT;
                            END;
                          UNTIL RecPuchaseInvLine.NEXT = 0;
                           //END SM  MAZDA77.1
                        END;
                      END;
                END;
            end;
        }
        field(4;"Taux de change actuelle";Decimal)
        {
            Editable = false;
        }
        field(5;"Taux de change simulation";Decimal)
        {
        }
        field(6;"Mode de transport";Text[50])
        {
        }
        field(7;coefficient;Decimal)
        {
        }
        field(8;"Mode de calcul";Option)
        {
            OptionCaptionML = FRA='Prix de Vente = Coût Simulé * MARGE,Prix de Vente = CM Simulé * MARGE,Prix de Vente = Coût Prévu * MARGE,Prix de Vente = CM Prévu * MARGE,Prix de Vente = CM  Réel * MARGE';
            OptionMembers = "Prix de Vente = Coût Simulé * MARGE","Prix de Vente = CM Simulé * MARGE","Prix de Vente = Coût Prévu * MARGE","Prix de Vente = CM Prévu * MARGE","Prix de Vente = CM  Réel * MARGE";

            trigger OnValidate();
            begin
                //SM MAZDA77.1
                IF ("Mode de calcul" = "Mode de calcul"::"Prix de Vente = Coût Prévu * MARGE") AND ("Document type" <> "Document type"::"Réception Achat Enregistrée") THEN
                  ERROR(TXT0004);
                IF ("Mode de calcul" = "Mode de calcul"::"Prix de Vente = CM Prévu * MARGE") AND ("Document type" <> "Document type"::"Réception Achat Enregistrée") THEN
                  ERROR(TXT0004);
            end;
        }
        field(9;"Date début";Date)
        {
        }
        field(10;Type;Option)
        {
            OptionMembers = Simulation,Definitif;
        }
        field(11;Statut;Option)
        {
            OptionCaption = 'Ouvert,En cours d''approbation,Approuvé,Validé';
            OptionMembers = Ouvert,"En cours d'approbation","Approuvé","Validé";
        }
        field(12;"No. Series";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(13;"Filter No. Document";Text[50])
        {

            trigger OnValidate();
            begin
                //ADD KK MAZDA77.3
                TESTFIELD("No. document achat",'');
                //ADD KK MAZDA77.3
                //OLD IF PuchaseInvHeader.GET("No. document achat") THEN BEGIN
                PuchaseInvHeader.RESET;
                PuchaseInvHeader.SETFILTER("No.",'%1',"Filter No. Document");
                MESSAGE('%1',PuchaseInvHeader.COUNT);
                IF "Filter No. Fournisseur" <>'' THEN
                  PuchaseInvHeader.SETFILTER("Buy-from Vendor No.",'%1',"Filter No. Fournisseur");
                MESSAGE('%1',PuchaseInvHeader.COUNT);

                IF PuchaseInvHeader.FINDFIRST THEN BEGIN
                  IF PuchaseInvHeader."Currency Factor" <> 0 THEN BEGIN
                    "Taux de change actuelle" := 1/PuchaseInvHeader."Currency Factor";
                    coefficient := RecSalesReceivablesSetup."Coefficient Import";
                  END;
                REPEAT
                   //SM MAZDA77.1
                  CLEAR(RecPuchaseInvLine);
                  //ADD KK MAZDA77.3
                  RecPuchaseInvLine.SETRANGE("Document No.",PuchaseInvHeader."No.");
                  RecPuchaseInvLine.SETRANGE(Type,RecPuchaseInvLine.Type::Item);
                  IF RecPuchaseInvLine.FINDFIRST THEN
                  REPEAT
                    IF RecItem.GET(RecPuchaseInvLine."No.") THEN BEGIN
                      // MODIF KK MAZDA77.2
                      // OLD IF NOT RecMargeParGroupePièce.GET(RecItem."Product Group Code") THEN BEGIN
                      IF NOT RecMargeParGroupePièce.GET(RecItem."Product Group Code","No.") THEN BEGIN
                        RecMargeParGroupePièce.INIT;
                        //ADD KK MAZDA77.2
                        RecMargeParGroupePièce."Document No."  := "No.";
                        //END KK MAZDA77.2
                        RecMargeParGroupePièce."Posting Group" := RecItem."Product Group Code";
                        RecMargeParGroupePièce.INSERT;
                      END;
                    END;
                  UNTIL RecPuchaseInvLine.NEXT = 0;
                   //END SM  MAZDA77.1
                UNTIL PuchaseInvHeader.NEXT=0;
                END;
            end;
        }
        field(14;"Prix de vente actuel zéro";Boolean)
        {
        }
        field(15;"Filter No. Fournisseur";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //ADD KK MAZDA77.2
        RecMargeParGroupePièce.RESET;
        RecMargeParGroupePièce.SETRANGE("Document No.","No.");
        IF RecMargeParGroupePièce.FINDSET THEN
          RecMargeParGroupePièce.DELETEALL;

        RecSalesPriBuffer.RESET;
        RecSalesPriBuffer.SETRANGE("No. Document","No.");
        IF RecSalesPriBuffer.FINDSET THEN
          RecSalesPriBuffer.DELETEALL;
        //END KK MAZDA77.2
    end;

    trigger OnInsert();
    begin
        //ADD KK MAZDA77.2
        RecSalesReceivablesSetup.GET;
        RecSalesReceivablesSetup.TESTFIELD(RecSalesReceivablesSetup."No. Doc Calc. Prix Vente");
        IF "No." = '' THEN BEGIN
          NoSeriesMgt.InitSeries(RecSalesReceivablesSetup."No. Doc Calc. Prix Vente",xRec."No.",TODAY,"No.","No. Series");
        END;
        //END KK MAZDA77.2
    end;

    trigger OnModify();
    begin
        //ADD KK MAZDA77.2
        IF (xRec.Statut=Statut) THEN
          TESTFIELD(Statut,Statut::Ouvert);
        //END KK MAZDA77.2
    end;

    var
        RecSalesReceivablesSetup : Record "311";
        RecPurchaseHeader : Record "38";
        RecPurchaseLine : Record "39";
        RecItem : Record "27";
        "RecMargeParGroupePièce" : Record "60052";
        RecPurchRcptHeader : Record "120";
        RecPurchRcptLine : Record "121";
        PuchaseInvHeader : Record "122";
        RecPuchaseInvLine : Record "123";
        TXT0001 : Label 'Attention ! tous les prix des articles ci-dessous seront modifié.\Voulez vous confirmez ?';
        TXT0002 : Label 'Vous devez initialiser les données avant de traiter un nouveau docuement !';
        TXT0003 : Label 'Vous n''etes pas autoriser';
        TXT0004 : Label 'Type Document et Mode Calcule incompatible';
        TXT0005 : Label 'Merci de remplir tous les champs de l''entête';
        TXT50000 : Label 'Vous devez insérer date fin dans les lignes précédantes avant de créer une nouvelle ligne. Seulement la dernière ligne doit êtres avec date fin vide.Article %1.';
        TXT50001 : Label 'Il y''a plus qu''une ligne prix de vente valable pour cette date.';
        TXT50002 : Label 'Mode Calcule et Type Document Incompatible';
        NoSeriesMgt : Codeunit "396";
        RecSalesPriBuffer : Record "60037";

    procedure CheckFactAchat(TypeDocOption : Option "Commande Achat","Réception Achat Enregistrée","Facture Achat Enregistrée";NFact : Code[30]) : Boolean;
    var
        PuchaseInvHeader : Record "122";
        TXT0001 : Label 'Facture achat %1 n''existe pas! vérifier le N° de facture';
        RecPurchaseHeader : Record "38";
        RecPurchRcptHeader : Record "120";
    begin
        CASE TypeDocOption OF
          0  :BEGIN
                IF RecPurchaseHeader.GET(RecPurchaseHeader."Document Type"::Order,NFact) THEN
                   EXIT(TRUE)
                 ELSE ERROR(STRSUBSTNO(TXT0001,NFact));
              END;
          1  :BEGIN
                IF RecPurchRcptHeader.GET(NFact) THEN
                   EXIT(TRUE)
                 ELSE ERROR(STRSUBSTNO(TXT0001,NFact));
              END;
          //MODIF KK MAZDA77.3
          // 2  :BEGIN
          //       IF PuchaseInvHeader.GET(NFact) THEN
          //          EXIT(TRUE)
          //        ELSE ERROR(STRSUBSTNO(TXT0001,NFact));
          //     END;
        END;
        //END KK MAZDA77.2
    end;

    procedure CalcPrix(TypeDocOption : Option "Commande Achat","Réception Achat Enregistrée","Facture Achat Enregistrée";NFact : Code[30];ParamTauxChangeSim : Decimal;ParamCoef : Decimal;DateDebut : Date;ModeCalcul : Option "Prix de Vente = Coût Simulé * MARGE","Prix de Vente = CM Simulé * MARGE","Prix de Vente = Coût Prévu * MARGE","Prix de Vente = CM Prévu * MARGE","Prix de Vente = CM  Réel * MARGE";ParamTauxChange : Decimal;FilterNoDocument : Text[50]);
    var
        PuchaseInvHeader : Record "122";
        PuchaseInvLine : Record "123";
        SalesPricebuffer : Record "60037";
        RecPurchRcptLine : Record "121";
        RecPurchaseLine : Record "39";
        RecItem : Record "27";
        RecItemLedgerEntry : Record "32";
        ParamMarge : Decimal;
        SalesPricebuffer2 : Record "60037";
        CurrNo : Code[50];
        RecFicheTechniqueItem : Record "50032";
    begin
        //MODIF KK MAZDA772
        //OLD DELETEALL;
        //ADD KK MAZDA77.2
        RecSalesPriBuffer.RESET;
        RecSalesPriBuffer.SETRANGE("No. Document","No.");
        IF RecSalesPriBuffer.FINDSET THEN
          RecSalesPriBuffer.DELETEALL;
        //END KK MAZDA77.2
        CASE TypeDocOption OF
          0  :BEGIN
                IF CheckFactAchat(TypeDocOption,NFact) AND (ParamCoef<>0) AND (DateDebut<>0D) AND (ParamTauxChangeSim<>0)THEN
                BEGIN
                     //GET RecPurchaseLine
                     CLEAR(RecPurchaseLine);
                     RecPurchaseLine.SETRANGE("Document No.",NFact);
                     RecPurchaseLine.SETRANGE(Type,RecPurchaseLine.Type::Item);
                     IF RecPurchaseLine.FINDFIRST THEN
                     REPEAT
                          //NEW LINE OF Sales price buffer
                          CLEAR(SalesPricebuffer);
                          SalesPricebuffer."Doc no"            := NFact;
                          SalesPricebuffer."Type Document"     := TypeDocOption;
                          //ADD KK MAZDA77.2
                          SalesPricebuffer."No. Document"      := "No.";
                          //END KK MAZDA77.2
                          SalesPricebuffer."Line No"           := RecPurchaseLine."Line No.";
                          SalesPricebuffer."Item no"           := RecPurchaseLine."No.";
                          SalesPricebuffer.Description         := RecPurchaseLine.Description;
                          SalesPricebuffer."Posting Group"     := RecPurchaseLine."Posting Group";

                          //SM MAZDA77.1
                          RecItem.GET(SalesPricebuffer."Item no");
                          IF RecFicheTechniqueItem.GET(RecItem."No.") THEN;
                          //MODIF KK MAZDA77.2
                          //OLD RecMargeParGroupePièce.GET(RecItem."Product Group Code");
                          RecMargeParGroupePièce.GET(RecItem."Product Group Code","No.");
                          //END MODIF KK
                          RecMargeParGroupePièce.TESTFIELD("Marge en %");
                          ParamMarge := RecMargeParGroupePièce."Marge en %";
                          //END SM MAZDA77.1


                          SalesPricebuffer."Unit cost Curr Inv"             := RecPurchaseLine."Direct Unit Cost";
                          SalesPricebuffer."Unit cost Curr Inv LCY"         := RecPurchaseLine."Unit Cost (LCY)";
                          SalesPricebuffer."Unit cost Curr Inv Sim LCY"     := ROUND(RecPurchaseLine."Direct Unit Cost" * ParamTauxChangeSim,0.001,'=');
                          SalesPricebuffer."Unit Cost Calc"                 := ROUND(SalesPricebuffer."Unit cost Curr Inv Sim LCY" * ParamCoef,0.001,'=');
                          //OLD SalesPricebuffer."New Sales Price"                := ROUND((SalesPricebuffer."Unit Cost Calc" * (100+ParamMarge)) / 100,0.001,'=');

                          //-->GET FROM SALES PRICE
                          SalesPricebuffer."Actual Unit Price"       :=  GetSalesPrice(RecPurchaseLine."No.",RecPurchaseLine."Variant Code");
                          //-->GET PMP
                          SalesPricebuffer."Last Direct Cost"        := GetLastUnitCost(RecPurchaseLine."No.");
                          SalesPricebuffer."Unit Cost"               := GetAvrgCost(RecPurchaseLine."No.");
                          //SM 050116
                          SalesPricebuffer."CM Sécurité de Change"   :=  ROUND((SalesPricebuffer."Unit Cost"/ParamTauxChange) * ParamTauxChangeSim,0.001,'=');
                          //END SM
                          //SM MAZDA77.1
                          IF (RecPurchaseLine.Quantity <> 0) THEN BEGIN
                            SalesPricebuffer."CM Simulé" := ROUND(((SalesPricebuffer."Unit Cost Calc" * RecPurchaseLine.Quantity) + (GetAvrgCost(RecPurchaseLine."No.") * GetInventory(RecPurchaseLine."No.")))
                            /(RecPurchaseLine.Quantity+GetInventory(RecPurchaseLine."No.")),0.001);
                          END ELSE BEGIN
                            SalesPricebuffer."CM Simulé" := 0;
                          END;
                          //END SM MAZDA77.1

                          SalesPricebuffer."Coefficient vente" := ParamCoef;
                          SalesPricebuffer."Variant code"      := RecPurchaseLine."Variant Code";
                          SalesPricebuffer.Marge               := ParamMarge;
                          SalesPricebuffer."Start Date" := DateDebut;
                          SalesPricebuffer."User Id"   := USERID;

                          SalesPricebuffer."Product Group Code" := RecItem."Product Group Code";
                          SalesPricebuffer."Model Code"         := RecFicheTechniqueItem."Model Code";
                          //SM
                          //OLD MAZDA77.1 SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                          //END SM

                          //SM MAZDA77.1
                          CASE ModeCalcul OF
                            ModeCalcul::"Prix de Vente = Coût Simulé * MARGE" :BEGIN
                                                                                 SalesPricebuffer."New Sales Price" := ROUND((SalesPricebuffer."Unit Cost Calc" * (100+ParamMarge)) / 100,0.001,'=');
                                                                                 SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                                                                               END;
                            ModeCalcul::"Prix de Vente = CM Simulé * MARGE" :BEGIN
                                                                               SalesPricebuffer."New Sales Price" := ROUND((SalesPricebuffer."CM Simulé" * (100+ParamMarge)) / 100,0.001,'=');
                                                                               SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                                                                             END;
                            ModeCalcul::"Prix de Vente = CM  Réel * MARGE" :BEGIN
                                                                              SalesPricebuffer."New Sales Price" :=
                                                                              ROUND((SalesPricebuffer."CM Sécurité de Change" * (100+ParamMarge)) / 100,0.001,'=');
                                                                              //ROUND((SalesPricebuffer."Unit Cost" * (100+ParamMarge)) / 100,0.001,'=');

                                                                              //ROUND((SalesPricebuffer."Unit Cost" * (100+ParamMarge)) / 100,0.001,'=');
                                                                              SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                                                                            END;
                            ELSE ERROR(TXT50002);
                            END;
                          //END MAZDA77.1




                          SalesPricebuffer.INSERT;
                     UNTIL RecPurchaseLine.NEXT = 0;
                END;



              END;
          1  :BEGIN
                IF CheckFactAchat(TypeDocOption,NFact) AND (ParamCoef<>0) AND (DateDebut<>0D) AND (ParamTauxChangeSim<>0)THEN
                BEGIN
                     //GET RecPurchRcptLine
                     CLEAR(RecPurchRcptLine);
                     RecPurchRcptLine.SETRANGE("Document No.",NFact);
                     RecPurchRcptLine.SETRANGE(Type,RecPurchRcptLine.Type::Item);
                     IF RecPurchRcptLine.FINDFIRST THEN
                     REPEAT
                          //NEW LINE OF Sales price buffer
                          CLEAR(SalesPricebuffer);
                          SalesPricebuffer."Doc no"            := NFact;
                          SalesPricebuffer."Type Document"     := TypeDocOption;
                          //ADD KK MAZDA77.2
                          SalesPricebuffer."No. Document"      := "No.";
                          //END KK MAZDA77.2

                          SalesPricebuffer."Line No"           := RecPurchRcptLine."Line No.";
                          SalesPricebuffer."Item no"           := RecPurchRcptLine."No.";
                          SalesPricebuffer.Description         := RecPurchRcptLine.Description;
                          SalesPricebuffer."Posting Group"     := RecPurchRcptLine."Posting Group";
                          //SM MAZDA77.1
                          RecItem.GET(SalesPricebuffer."Item no");
                          IF RecFicheTechniqueItem.GET(RecItem."No.") THEN;
                          //MODIF KK MAZDA77.2
                          //OLD RecMargeParGroupePièce.GET(RecItem."Product Group Code");
                          RecMargeParGroupePièce.GET(RecItem."Product Group Code","No.");
                          //END MODIF KK
                          RecMargeParGroupePièce.TESTFIELD("Marge en %");
                          ParamMarge := RecMargeParGroupePièce."Marge en %";
                          //END SM MAZDA77.1


                          //SM MAZDA77.1
                          RecItemLedgerEntry.RESET;
                          RecItemLedgerEntry.SETCURRENTKEY("Document No.","Document Type","Document Line No.");
                          RecItemLedgerEntry.SETRANGE("Document No.",RecPurchRcptLine."Document No.");
                          RecItemLedgerEntry.SETRANGE("Document Type",RecItemLedgerEntry."Document Type"::"Purchase Receipt");
                          RecItemLedgerEntry.SETRANGE("Document Line No.",RecPurchRcptLine."Line No.");
                          IF RecItemLedgerEntry.FINDFIRST THEN BEGIN
                           RecItemLedgerEntry.CALCFIELDS("Cost Amount (Expected)");
                           IF RecItemLedgerEntry.Quantity <> 0 THEN BEGIN
                             SalesPricebuffer."Coût Prévu" := ROUND(RecItemLedgerEntry."Cost Amount (Expected)"/RecItemLedgerEntry.Quantity,0.001);
                             SalesPricebuffer."CM Prévu" := ROUND((RecItemLedgerEntry."Cost Amount (Expected)" + (GetAvrgCost(RecPurchRcptLine."No.") * GetInventory(RecPurchRcptLine."No.")))
                             /(GetInventory(RecPurchRcptLine."No.")+RecItemLedgerEntry.Quantity),0.001);
                           END ELSE BEGIN
                             SalesPricebuffer."Coût Prévu" := 0;
                             SalesPricebuffer."CM Prévu" := 0;
                           END;

                          END;
                          //END SM MAZDA77.1

                          SalesPricebuffer."Unit cost Curr Inv"             := RecPurchRcptLine."Direct Unit Cost";
                          SalesPricebuffer."Unit cost Curr Inv LCY"         := RecPurchRcptLine."Unit Cost (LCY)";
                          SalesPricebuffer."Unit cost Curr Inv Sim LCY"     := ROUND(RecPurchRcptLine."Direct Unit Cost" * ParamTauxChangeSim,0.001,'=');
                          SalesPricebuffer."Unit Cost Calc"                 := ROUND(SalesPricebuffer."Unit cost Curr Inv Sim LCY" * ParamCoef,0.001,'=');
                          //OLD SM MAZDA77.1 SalesPricebuffer."New Sales Price"                := ROUND((SalesPricebuffer."Unit Cost Calc" * (100+ParamMarge)) / 100,0.001,'=');
                          //SM MAZDA77.1
                          IF (RecPurchRcptLine.Quantity <> 0) THEN BEGIN
                            SalesPricebuffer."CM Simulé" := ROUND(((SalesPricebuffer."Unit Cost Calc" * RecPurchRcptLine.Quantity) + (GetAvrgCost(RecPurchRcptLine."No.") * GetInventory(RecPurchRcptLine."No.")))
                            /(RecPurchRcptLine.Quantity+GetInventory(RecPurchRcptLine."No.")),0.001);
                          END ELSE BEGIN
                            SalesPricebuffer."CM Simulé" := 0;
                          END;
                          //END SM MAZDA77.1

                          //-->GET FROM SALES PRICE
                          SalesPricebuffer."Actual Unit Price" :=  GetSalesPrice(RecPurchRcptLine."No.",RecPurchRcptLine."Variant Code");
                          //-->GET PMP
                          SalesPricebuffer."Last Direct Cost"        := GetLastUnitCost(RecPurchRcptLine."No.");
                          SalesPricebuffer."Unit Cost"               := GetAvrgCost(RecPurchRcptLine."No.");
                          //SM 050116
                          SalesPricebuffer."CM Sécurité de Change" :=  ROUND((SalesPricebuffer."Unit Cost"/ParamTauxChange) * ParamTauxChangeSim,0.001,'=');
                          //END SM

                          SalesPricebuffer."Coefficient vente" := ParamCoef;
                          SalesPricebuffer."Variant code"      := RecPurchRcptLine."Variant Code";
                          SalesPricebuffer.Marge               := ParamMarge;
                          SalesPricebuffer."Start Date" := DateDebut;
                          SalesPricebuffer."User Id"   := USERID;

                          SalesPricebuffer."Product Group Code" := RecItem."Product Group Code";
                          SalesPricebuffer."Model Code"         := RecFicheTechniqueItem."Model Code";

                          //SM
                          //OLD SM MAZDA77.1 SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                          //END SM
                          //SM MAZDA77.1
                          CASE ModeCalcul OF
                            ModeCalcul::"Prix de Vente = Coût Simulé * MARGE" :BEGIN
                                                                                 SalesPricebuffer."New Sales Price" := ROUND((SalesPricebuffer."Unit Cost Calc" * (100+ParamMarge)) / 100,0.001,'=');
                                                                                 SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                                                                               END;
                            ModeCalcul::"Prix de Vente = CM Simulé * MARGE" :BEGIN
                                                                               SalesPricebuffer."New Sales Price" := ROUND((SalesPricebuffer."CM Simulé" * (100+ParamMarge)) / 100,0.001,'=');
                                                                               SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                                                                             END;
                            ModeCalcul::"Prix de Vente = Coût Prévu * MARGE" :BEGIN
                                                                               SalesPricebuffer."New Sales Price" := ROUND((SalesPricebuffer."Coût Prévu" * (100+ParamMarge)) / 100,0.001,'=');
                                                                               SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                                                                             END;
                            ModeCalcul::"Prix de Vente = CM Prévu * MARGE" :BEGIN
                                                                              SalesPricebuffer."New Sales Price" := ROUND((SalesPricebuffer."CM Prévu" * (100+ParamMarge)) / 100,0.001,'=');
                                                                              SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                                                                            END;
                            ModeCalcul::"Prix de Vente = CM  Réel * MARGE" :BEGIN
                                                                              SalesPricebuffer."New Sales Price" :=
                                                                              ROUND((SalesPricebuffer."CM Sécurité de Change" * (100+ParamMarge)) / 100,0.001,'=');
                                                                              //ROUND((SalesPricebuffer."Unit Cost" * (100+ParamMarge)) / 100,0.001,'=');
                                                                              SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                                                                            END;
                            ELSE ERROR(TXT50002);
                            END;
                          //END MAZDA77.1

                          SalesPricebuffer.INSERT;
                     UNTIL RecPurchRcptLine.NEXT = 0;
                END;



              END;
          2  :BEGIN
                // MODIF KK MAZDA77.3
                //OLD IF CheckFactAchat(TypeDocOption,NFact) AND (ParamCoef<>0) AND (DateDebut<>0D) AND (ParamTauxChangeSim<>0)THEN
                IF (ParamCoef<>0) AND (DateDebut<>0D) AND (ParamTauxChangeSim<>0)THEN
                BEGIN
                     //GET PuchaseInvLine
                     CLEAR(PuchaseInvLine);
                     //SM ADD
                     PuchaseInvLine.SETCURRENTKEY(Type,"No.","Variant Code","N° budget d'investissement");
                     // ADD KK MAZDA77.3
                     IF NFact<>'' THEN
                      PuchaseInvLine.SETRANGE("Document No.",NFact);
                     // ADD KK MAZDA77.3
                     IF FilterNoDocument<>'' THEN
                      PuchaseInvLine.SETFILTER("Document No.",'%1',FilterNoDocument);
                     IF "Filter No. Fournisseur"<>'' THEN
                      PuchaseInvLine.SETFILTER("Buy-from Vendor No.",'%1',"Filter No. Fournisseur");

                     PuchaseInvLine.SETRANGE(Type,PuchaseInvLine.Type::Item);
                     IF PuchaseInvLine.FINDFIRST THEN
                     REPEAT
                       IF CurrNo <> PuchaseInvLine."No." THEN BEGIN

                       //NEW LINE OF Sales price buffer
                       IF PuchaseInvLine."No."<>'' THEN BEGIN
                          CLEAR(SalesPricebuffer);

                          //END SM
                          SalesPricebuffer."Doc no"            := PuchaseInvLine."Document No.";
                          SalesPricebuffer."Type Document"     := TypeDocOption;
                          //ADD KK MAZDA77.2
                          SalesPricebuffer."No. Document"      := "No.";
                          //END KK MAZDA77.2

                          SalesPricebuffer."Line No"           := PuchaseInvLine."Line No.";
                          SalesPricebuffer."Item no"           := PuchaseInvLine."No.";
                          SalesPricebuffer.Description         := PuchaseInvLine.Description;
                          SalesPricebuffer."Posting Group"     := PuchaseInvLine."Posting Group";
                          //SM MAZDA77.1
                          RecItem.GET(PuchaseInvLine."No.");
                          IF RecFicheTechniqueItem.GET(RecItem."No.") THEN;
                          //MODIF KK MAZDA77.2
                          //OLD RecMargeParGroupePièce.GET(RecItem."Product Group Code");
                          RecMargeParGroupePièce.GET(RecItem."Product Group Code","No.");
                          //END MODIF KK
                          RecMargeParGroupePièce.TESTFIELD("Marge en %");
                          ParamMarge := RecMargeParGroupePièce."Marge en %";
                          //END SM MAZDA77.1



                          SalesPricebuffer."Unit cost Curr Inv"             := PuchaseInvLine."Direct Unit Cost";
                          SalesPricebuffer."Unit cost Curr Inv LCY"         := PuchaseInvLine."Unit Cost (LCY)";
                          SalesPricebuffer."Unit cost Curr Inv Sim LCY"     := ROUND(PuchaseInvLine."Direct Unit Cost" * ParamTauxChangeSim,0.001,'=');
                          SalesPricebuffer."Unit Cost Calc"                 := ROUND(SalesPricebuffer."Unit cost Curr Inv Sim LCY" * ParamCoef,0.001,'=');
                          //OLD SM MAZDA77.1 SalesPricebuffer."New Sales Price"                := ROUND((SalesPricebuffer."Unit Cost Calc" * (100+ParamMarge)) / 100,0.001,'=');
                          //SM MAZDA77.1
                          IF (PuchaseInvLine.Quantity <> 0) THEN BEGIN
                            SalesPricebuffer."CM Simulé" := ROUND(((SalesPricebuffer."Unit Cost Calc" * PuchaseInvLine.Quantity) + (GetAvrgCost(PuchaseInvLine."No.") * GetInventory(PuchaseInvLine."No.")))
                            /(PuchaseInvLine.Quantity+GetInventory(PuchaseInvLine."No.")),0.001);
                          END ELSE BEGIN
                            SalesPricebuffer."CM Simulé" := 0;
                          END;
                          //END SM MAZDA77.1

                          //-->GET FROM SALES PRICE
                          SalesPricebuffer."Actual Unit Price" :=  GetSalesPrice(PuchaseInvLine."No.",PuchaseInvLine."Variant Code");
                          //-->GET PMP
                          SalesPricebuffer."Last Direct Cost"        := GetLastUnitCost(PuchaseInvLine."No.");
                          SalesPricebuffer."Unit Cost"               := GetAvrgCost(PuchaseInvLine."No.");
                          //SM 050116
                          SalesPricebuffer."CM Sécurité de Change" :=  ROUND((SalesPricebuffer."Unit Cost"/ParamTauxChange) * ParamTauxChangeSim,0.001,'=');
                          //END SM

                          SalesPricebuffer."Coefficient vente" := ParamCoef;
                          SalesPricebuffer."Variant code"      := PuchaseInvLine."Variant Code";
                          SalesPricebuffer.Marge               := ParamMarge;
                          SalesPricebuffer."Start Date" := DateDebut;
                          SalesPricebuffer."User Id"   := USERID;

                          SalesPricebuffer."Product Group Code" := RecItem."Product Group Code";
                          SalesPricebuffer."Model Code"         := RecFicheTechniqueItem."Model Code";
                          //SM
                          //OLD SM MAZDA77.1SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                          //END SM
                          //SM MAZDA77.1
                          CASE ModeCalcul OF
                            ModeCalcul::"Prix de Vente = Coût Simulé * MARGE" :BEGIN
                                                                                 SalesPricebuffer."New Sales Price" := ROUND((SalesPricebuffer."Unit Cost Calc" * (100+ParamMarge)) / 100,0.001,'=');
                                                                                 SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                                                                               END;
                            ModeCalcul::"Prix de Vente = CM Simulé * MARGE" :BEGIN
                                                                               SalesPricebuffer."New Sales Price" := ROUND((SalesPricebuffer."CM Simulé" * (100+ParamMarge)) / 100,0.001,'=');
                                                                               SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                                                                             END;
                            ModeCalcul::"Prix de Vente = CM  Réel * MARGE" :BEGIN
                                                                              SalesPricebuffer."New Sales Price" :=
                                                                              ROUND((SalesPricebuffer."CM Sécurité de Change" * (100+ParamMarge)) / 100,0.001,'=');
                                                                              //ROUND((SalesPricebuffer."Unit Cost" * (100+ParamMarge)) / 100,0.001,'=');
                                                                              SalesPricebuffer."Différence Prix" := SalesPricebuffer."New Sales Price" - SalesPricebuffer."Actual Unit Price";
                                                                            END;
                            ELSE ERROR(TXT50002);
                            END;
                          //END MAZDA77.1

                          //ADD KK MAZDA77.3
                          IF "Prix de vente actuel zéro" THEN BEGIN
                            IF SalesPricebuffer."Actual Unit Price"=0 THEN
                              SalesPricebuffer.INSERT;
                          END ELSE
                              SalesPricebuffer.INSERT;
                     END;
                       CurrNo:= PuchaseInvLine."No."
                     END;
                     UNTIL PuchaseInvLine.NEXT = 0;
                END;
              END;
        END;
    end;

    local procedure GetSalesPrice(ItemNo : Code[30];VariantCode : Code[20]) : Decimal;
    var
        SalesPrice : Record "7002";
    begin
        SalesPrice.RESET;
        SalesPrice.SETRANGE(SalesPrice."Item No.",ItemNo);
        SalesPrice.SETRANGE(SalesPrice."Variant Code",VariantCode);
        SalesPrice.SETRANGE("Sales Type",SalesPrice."Sales Type"::"All Customers");
        SalesPrice.SETFILTER("Starting Date",'<=t&<>''''');
        SalesPrice.SETFILTER("Ending Date"  ,'>=t|''''');
        IF SalesPrice.FINDLAST THEN
           EXIT(SalesPrice."Unit Price")
        ELSE EXIT(0);
    end;

    local procedure GetLastUnitCost(ItemNo : Code[30]) : Decimal;
    var
        Item : Record "27";
    begin
        CLEAR(Item);
        IF Item.GET(ItemNo) THEN
           EXIT(Item."Last Direct Cost")
        ELSE EXIT(0);
    end;

    local procedure GetAvrgCost(ItemNo : Code[30]) : Decimal;
    var
        Item : Record "27";
    begin
        CLEAR(Item);
        IF Item.GET(ItemNo) THEN
           EXIT(Item."Unit Cost")
        ELSE EXIT(0);
    end;

    procedure UpdateSalesPrice(NFact : Code[30]);
    var
        SalesPrice : Record "7002";
        NewSalesPrice : Record "7002";
        SalesPricebuffer : Record "60037";
        RecSalesPrice : Record "7002";
        RecItem : Record "27";
    begin
        CLEAR(SalesPricebuffer);
        //ADD KK MAZDA77.2
        SalesPricebuffer.SETRANGE("No. Document","No.");
        //END KK
        SalesPricebuffer.SETRANGE("Doc no",NFact);
        IF SalesPricebuffer.FINDFIRST THEN
        REPEAT
            RecSalesPrice.RESET;
            RecSalesPrice.SETRANGE("Item No.",SalesPricebuffer."Item no");
            RecSalesPrice.SETRANGE("Sales Type",RecSalesPrice."Sales Type"::"All Customers");
            RecSalesPrice.SETRANGE("Ending Date",0D);
            IF RecSalesPrice.COUNT > 1 THEN BEGIN
              ERROR(TXT50000,SalesPricebuffer."Item no")
            END;

            //TEST ITEM EXITE OR NO
            CLEAR(SalesPrice);
            SalesPrice.SETRANGE("Item No.",SalesPricebuffer."Item no");
            SalesPrice.SETRANGE("Sales Type",SalesPrice."Sales Type"::"All Customers");
            SalesPrice.SETRANGE(SalesPrice."Variant Code",SalesPricebuffer."Variant code");
            SalesPrice.SETFILTER("Starting Date",'<=%1&<>''''',SalesPricebuffer."Start Date");
            SalesPrice.SETFILTER("Ending Date"  ,'>=%1|''''',SalesPricebuffer."Start Date");
            IF  SalesPrice.COUNT > 1 THEN
              ERROR(TXT50001);

            //MESSAGE('%1',SalesPrice.COUNT);

            IF SalesPrice.FINDLAST THEN
               BEGIN
                  //MODIFY
                  //MESSAGE('MODIFY');
                  SalesPrice.VALIDATE("Ending Date",SalesPricebuffer."Start Date"-1);
                  IF SalesPrice.MODIFY THEN
                    SalesPricebuffer.Updated:=TRUE;

                  SalesPrice.RESET;
                  SalesPrice.INIT;
                  SalesPrice.VALIDATE("Sales Type",SalesPrice."Sales Type"::"All Customers");
                  SalesPrice."Item No." := SalesPricebuffer."Item no";
                  RecItem.GET(SalesPricebuffer."Item no");
                  SalesPrice."Unit of Measure Code" := RecItem."Sales Unit of Measure";
                  SalesPrice.VALIDATE("Variant Code",SalesPricebuffer."Variant code");
                  SalesPrice."Unit Price" := SalesPricebuffer."New Sales Price";
                  SalesPrice.VALIDATE("Starting Date",SalesPricebuffer."Start Date");
                  SalesPrice.INSERT;

               END
            ELSE
               BEGIN
                   //NEW LINE

                  CLEAR(RecSalesPrice);
                  RecSalesPrice.INIT;
                  RecSalesPrice.VALIDATE("Sales Type",RecSalesPrice."Sales Type"::"All Customers");
                  RecSalesPrice."Item No." := SalesPricebuffer."Item no";  //DELL VALIDATE
                  RecSalesPrice.VALIDATE("Variant Code",SalesPricebuffer."Variant code");
                  RecSalesPrice."Unit Price" := SalesPricebuffer."New Sales Price";
                  RecSalesPrice.VALIDATE("Starting Date",SalesPricebuffer."Start Date");
                  RecSalesPrice.INSERT;

               END
        UNTIL SalesPricebuffer.NEXT = 0;
    end;

    local procedure GetInventory(ItemNo : Code[30]) : Decimal;
    var
        Item : Record "27";
    begin
        CLEAR(Item);
        IF Item.GET(ItemNo) THEN BEGIN
           Item.CALCFIELDS(Inventory);
           EXIT(Item.Inventory);
        END ELSE EXIT(0);
    end;
}

