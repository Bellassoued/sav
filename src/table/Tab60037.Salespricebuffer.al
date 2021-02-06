table 60037 "Sales price buffer"
{
    // version MAZDA77,MAZDA77.1


    fields
    {
        field(1;"Doc no";Code[20])
        {
            CaptionML = ENU='Doc no',
                        FRA='Num document';
            Editable = false;
        }
        field(2;"Line No";Integer)
        {
            CaptionML = ENU='Line No',
                        FRA='Ligne Num';
            Editable = false;
        }
        field(3;"Item no";Code[20])
        {
            CaptionML = ENU='Item no',
                        FRA='Code Article';
            Editable = false;
            TableRelation = Item.No.;
        }
        field(4;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
            Editable = false;
        }
        field(5;"Actual Unit Price";Decimal)
        {
            CaptionML = ENU='Actual Unit Price',
                        FRA='Prix de vente actuel';
            Description = 'SM Sales Price';
            Editable = false;
        }
        field(6;"Last Direct Cost";Decimal)
        {
            Caption = 'Dernier Coût Direct';
            Description = 'SM Fiche Article';
            Editable = false;
        }
        field(7;"Coefficient vente";Decimal)
        {
        }
        field(8;"New Sales Price";Decimal)
        {
            CaptionML = ENU='New Sales Price',
                        FRA='Nouveau Prix de vente';
            Description = 'Prix d''achat Simulation DS * Coeff * Marge';

            trigger OnValidate();
            begin
                Marge :=  (("New Sales Price" / ("Unit cost Curr Inv Sim LCY" * "Coefficient vente")) * 100) -100  ;
                //SM
                "Différence Prix" := "New Sales Price" - "Actual Unit Price";
                //END SM
            end;
        }
        field(9;"Unit cost Curr Inv";Decimal)
        {
            CaptionML = ENU='Unit cost',
                        FRA='Prix d''achat Facture Encours';
            Description = 'SM Ligne Facture Achat';
            Editable = false;
        }
        field(10;"Variant code";Code[20])
        {
            Editable = false;
            TableRelation = "Item Variant".Code;
        }
        field(11;"Posting Group";Code[10])
        {
            CaptionML = ENU='Posting Group',
                        FRA='Groupe comptabilisation';
            Editable = false;
        }
        field(12;"User Id";Code[50])
        {
            Editable = false;
        }
        field(13;Updated;Boolean)
        {
            Editable = false;
        }
        field(14;"Unit cost Curr Inv LCY";Decimal)
        {
            CaptionML = ENU='Unit cost',
                        FRA='Prix d''achat Facture Encours DS';
            Description = 'SM Ligne Facture Achat';
            Editable = false;
        }
        field(15;"Unit Cost";Decimal)
        {
            Caption = 'Prix de Revient';
            Description = 'SM Fiche Article Coût Moyen Réel';
            Editable = false;
        }
        field(16;"Line Modified";Boolean)
        {
            Caption = 'Ligne Modifiée';
            Description = 'SM';
        }
        field(17;"Start Date";Date)
        {
            Caption = 'Date Début';
            Description = 'SM';
        }
        field(18;"Unit cost Curr Inv Sim LCY";Decimal)
        {
            CaptionML = ENU='Unit cost',
                        FRA='Prix d''achat Simulation DS';
            Description = 'SM Ligne Facture Achat Simule';
            Editable = false;
        }
        field(19;"Unit Cost Calc";Decimal)
        {
            Caption = 'Prix de Revient Calculé';
            Description = 'SM Prix d''achat Simulation DS * Coeff Coût Simulé';
            Editable = false;
        }
        field(20;Marge;Decimal)
        {
            Description = 'SM Marge Commerciale';

            trigger OnValidate();
            begin
                 "New Sales Price"   := ROUND ( "Unit cost Curr Inv Sim LCY" * "Coefficient vente" * ((100+Marge)/100),0.001,'=');
                //SM
                "Différence Prix" := "New Sales Price" - "Actual Unit Price";
                //END SM
            end;
        }
        field(21;"Type Document";Option)
        {
            Description = 'SM';
            OptionCaption = 'Commande Achat,Réception Achat Enregistrée,Facture Achat Enregistrée';
            OptionMembers = "Commande Achat","Réception Achat Enregistrée","Facture Achat Enregistrée";
        }
        field(5704;"Product Group Code";Code[10])
        {
            CaptionML = ENU='Product Group Code',
                        FRA='Code groupe produits';
            Description = 'SM';
        }
        field(60006;"Model Code";Text[50])
        {
            CaptionML = ENU='Model Code',
                        FRA='Code Modèle';
            Description = 'SM';
        }
        field(60007;"Différence Prix";Decimal)
        {
            Description = 'SM';
        }
        field(60009;"Coût Prévu";Decimal)
        {
            Description = 'SM MAZDA77.1';
        }
        field(60010;"CM Prévu";Decimal)
        {
            Description = 'SM MAZDA77.1';
        }
        field(60011;"CM Simulé";Decimal)
        {
            Description = 'SM MAZDA77.1';
        }
        field(60012;"CM Sécurité de Change";Decimal)
        {
            Description = 'SM 05012016';
        }
        field(60013;"No. Document";Code[20])
        {
            Description = 'KK MAZDA77.2';
        }
    }

    keys
    {
        key(Key1;"Doc no","Line No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnModify();
    begin
        //"Line Modified" := TRUE;
    end;

    var
        TXT50000 : Label 'Vous devez insérer date fin dans les lignes précédantes avant de créer une nouvelle ligne. Seulement la dernière ligne doit êtres avec date fin vide.Article %1.';
        TXT50001 : Label 'Il y''a plus qu''une ligne prix de vente valable pour cette date.';
        TXT50002 : Label 'Mode Calcule et Type Document Incompatible';
        "RecMargeParGroupePièce" : Record "60052";

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
          2  :BEGIN
                IF PuchaseInvHeader.GET(NFact) THEN
                   EXIT(TRUE)
                 ELSE ERROR(STRSUBSTNO(TXT0001,NFact));
              END;
        END;
    end;

    procedure CalcPrix(TypeDocOption : Option "Commande Achat","Réception Achat Enregistrée","Facture Achat Enregistrée";NFact : Code[30];ParamTauxChangeSim : Decimal;ParamCoef : Decimal;DateDebut : Date;ModeCalcul : Option "Prix de Vente = Coût Simulé * MARGE","Prix de Vente = CM Simulé * MARGE","Prix de Vente = Coût Prévu * MARGE","Prix de Vente = CM Prévu * MARGE","Prix de Vente = CM  Réel * MARGE";ParamTauxChange : Decimal);
    var
        PuchaseInvHeader : Record "122";
        PuchaseInvLine : Record "123";
        SalesPricebuffer : Record "60037";
        RecPurchRcptLine : Record "121";
        RecPurchaseLine : Record "39";
        RecItem : Record "27";
        RecItemLedgerEntry : Record "32";
        ParamMarge : Decimal;
        RecFicheTechniqueItem : Record "50032";
    begin
        DELETEALL;

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

                          SalesPricebuffer."Line No"           := RecPurchaseLine."Line No.";
                          SalesPricebuffer."Item no"           := RecPurchaseLine."No.";
                          SalesPricebuffer.Description         := RecPurchaseLine.Description;
                          SalesPricebuffer."Posting Group"     := RecPurchaseLine."Posting Group";

                          //SM MAZDA77.1
                          RecItem.GET(SalesPricebuffer."Item no");
                          IF RecFicheTechniqueItem.GET(RecItem."No.") THEN;
                          RecMargeParGroupePièce.GET(RecItem."Product Group Code");
                          RecMargeParGroupePièce.TESTFIELD("Marge en %");
                          ParamMarge := RecMargeParGroupePièce."Marge en %";
                          //END SM MAZDA77.1


                          SalesPricebuffer."Unit cost Curr Inv"             := RecPurchaseLine."Direct Unit Cost";
                          SalesPricebuffer."Unit cost Curr Inv LCY"         := RecPurchaseLine."Unit Cost (LCY)";
                          SalesPricebuffer."Unit cost Curr Inv Sim LCY"     := ROUND(RecPurchaseLine."Direct Unit Cost" * ParamTauxChangeSim,0.001,'=');
                          SalesPricebuffer."Unit Cost Calc"                 := ROUND(SalesPricebuffer."Unit cost Curr Inv Sim LCY" * ParamCoef,0.001,'=');
                          //OLD SalesPricebuffer."New Sales Price"                := ROUND((SalesPricebuffer."Unit Cost Calc" * (100+ParamMarge)) / 100,0.001,'=');

                          //-->GET FROM SALES PRICE
                          SalesPricebuffer."Actual Unit Price" :=  GetSalesPrice(RecPurchaseLine."No.",RecPurchaseLine."Variant Code");
                          //-->GET PMP
                          SalesPricebuffer."Last Direct Cost"        := GetLastUnitCost(RecPurchaseLine."No.");
                          SalesPricebuffer."Unit Cost"               := GetAvrgCost(RecPurchaseLine."No.");
                          //SM 050116
                          SalesPricebuffer."CM Sécurité de Change" :=  ROUND((SalesPricebuffer."Unit Cost"/ParamTauxChange) * ParamTauxChangeSim,0.001,'=');
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

                          SalesPricebuffer."Line No"           := RecPurchRcptLine."Line No.";
                          SalesPricebuffer."Item no"           := RecPurchRcptLine."No.";
                          SalesPricebuffer.Description         := RecPurchRcptLine.Description;
                          SalesPricebuffer."Posting Group"     := RecPurchRcptLine."Posting Group";
                          //SM MAZDA77.1
                          RecItem.GET(SalesPricebuffer."Item no");
                          RecMargeParGroupePièce.GET(RecItem."Product Group Code");
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

                IF CheckFactAchat(TypeDocOption,NFact) AND (ParamCoef<>0) AND (DateDebut<>0D) AND (ParamTauxChangeSim<>0)THEN
                BEGIN
                     //GET PuchaseInvLine
                     CLEAR(PuchaseInvLine);
                     PuchaseInvLine.SETRANGE("Document No.",NFact);
                     PuchaseInvLine.SETRANGE(Type,PuchaseInvLine.Type::Item);
                     IF PuchaseInvLine.FINDFIRST THEN
                     REPEAT
                          //NEW LINE OF Sales price buffer
                          CLEAR(SalesPricebuffer);
                          SalesPricebuffer."Doc no"            := NFact;
                          SalesPricebuffer."Type Document"     := TypeDocOption;

                          SalesPricebuffer."Line No"           := PuchaseInvLine."Line No.";
                          SalesPricebuffer."Item no"           := PuchaseInvLine."No.";
                          SalesPricebuffer.Description         := PuchaseInvLine.Description;
                          SalesPricebuffer."Posting Group"     := PuchaseInvLine."Posting Group";
                          //SM MAZDA77.1
                          RecItem.GET(SalesPricebuffer."Item no");
                          IF RecFicheTechniqueItem.GET(RecItem."No.") THEN;
                          RecMargeParGroupePièce.GET(RecItem."Product Group Code");
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
                          SalesPricebuffer.INSERT;
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

                  //MESSAGE('INSERT');
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

