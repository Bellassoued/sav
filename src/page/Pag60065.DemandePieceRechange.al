page 60065 "Demande Piece Rechange"
{
    // version SAV Automobile,MAZDA06,MAZDA07,MAZDA301,CT16V002

    DeleteAllowed = false;
    SourceTable = Table5902;

    layout
    {
        area(content)
        {
            field("Magasin de réservation";CodeMagasin)
            {
                Editable = false;

                trigger OnValidate();
                begin
                       CurrPage.UPDATE;
                end;
            }
            repeater(Group)
            {
                field(Selection;Selection)
                {

                    trigger OnValidate();
                    begin
                           IF Selection=TRUE THEN
                              Rec.MARK(TRUE)
                           ELSE Rec.MARK(FALSE);
                    end;
                }
                field("Reception No";"Reception No")
                {
                    CaptionML = ENU='Receive No.',
                                FRA='Num OR';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(Type;Type)
                {
                    Editable = false;
                }
                field("No.";"No.")
                {
                    Editable = false;
                }
                field(Description;Description)
                {
                    Editable = false;
                    TableRelation = Location.Code;
                }
                field(Quantity;Quantity)
                {
                    Editable = false;
                }
                field("Ordered Qty";"Ordered Qty")
                {
                    Editable = false;
                }
                field("Remaining Qty to Order";"Remaining Qty to Order")
                {
                    Editable = false;
                }
                field("Qty To Order";"Qty To Order")
                {
                    Caption = 'Quantité a commander';
                    Editable = false;

                    trigger OnValidate();
                    begin
                        //SM MAZDA06
                        // IF "Remaining Qty to Order" >= 0 THEN
                        //   IF "Qty To Order" > "Remaining Qty to Order" THEN
                        //     ERROR(' Quantité commandé %1 doit être inferieur a qunatité Restante %2 ',"Qty To Order","Remaining Qty to Order");
                        // IF "Remaining Qty to Order" <= 0 THEN
                        //   IF "Qty To Order" < "Remaining Qty to Order" THEN
                        //     ERROR(' Quantité commandé %1 doit être inferieur a qunatité Restante %2 ',"Qty To Order","Remaining Qty to Order");
                        //END SM
                    end;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    Editable = false;
                }
                field("Buy-from Vendor No.";"Buy-from Vendor No.")
                {
                    Editable = ShowRessource;
                    Style = AttentionAccent;
                    StyleExpr = TRUE;
                    Visible = ShowRessource;
                }
                field("Nom Fournisseur";"Nom Fournisseur")
                {
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("No. Order de Transfert";"No. Order de Transfert")
                {
                    Editable = false;
                }
                field("CompanyOrder Transfert";"CompanyOrder Transfert")
                {
                    Editable = false;
                }
                field("Qty Shipped Returned";"Qty Shipped Returned")
                {
                    Editable = false;
                }
                field("Qty Received";"Qty Received")
                {
                    Editable = false;
                }
                field("Quantity Shipped";"Quantity Shipped")
                {
                }
            }
        }
        area(factboxes)
        {
            part(;50013)
            {
                SubPageLink = Document Type=FIELD(Document Type),
                              Document No.=FIELD(Document No.),
                              Line No.=FIELD(Line No.);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Créer Ordre de Transfert")
            {
                Promoted = true;
                PromotedIsBig = true;
                Visible = ShowItem;

                trigger OnAction();
                var
                    CuSAVManagement : Codeunit "50010";
                    RecLServiceLine : Record "5902";
                    RecLServiceLineTMP : Record "5902" temporary;
                begin
                    IF CodeMagasin='' THEN
                      ERROR('Magasin de Réservation ne doit pas être vide !')
                    ELSE
                      BEGIN
                        RecLServiceLine.COPY(Rec);
                        //SM MAZDA06
                        IF RecLServiceLine.FINDSET THEN BEGIN
                          REPEAT
                            IF RecLServiceLine.MARK THEN BEGIN
                              CalcOrderedQty;
                              CALCFIELDS("Qty Received","Qty Received Transfert Order","Qty Shipped Returned","Qty Received Returned");
                              IF RecLServiceLine."Qty To Order" >  (RecLServiceLine.Quantity - RecLServiceLine."Ordered Qty" ) THEN
                                ERROR(TXT50000,RecLServiceLine."No.");
                            END;
                          UNTIL RecLServiceLine.NEXT = 0;
                        END;
                        //END SM
                        CuSAVManagement.CreateOrdreTransfer(RecLServiceLine,CodeMagasin);

                         Selection:=TRUE;

                         IF FINDFIRST THEN
                           REPEAT
                               //SM MAZDA06
                               //OLD CALCFIELDS("Qty on Transfer Order");
                               //OLD "Remaining Qty" := Quantity - "Qty on Transfer Order" ;
                               CalcOrderedQty;
                               "Remaining Qty to Order" := Quantity - "Ordered Qty";
                               VALIDATE("Qty To Order" , Quantity - "Ordered Qty");

                               //END SM

                               MODIFY;
                               MARK(TRUE);
                           UNTIL NEXT = 0 ;

                         SETFILTER("Remaining Qty to Order",'<>%1',0);

                         IF FINDFIRST THEN
                           REPEAT
                              IF Rec.MARK=TRUE THEN
                                 Selection:=TRUE
                              ELSE Selection:=FALSE;
                           UNTIL NEXT = 0 ;

                      END;
                    //SM MAZDA06

                    CurrPage.UPDATE(FALSE);
                end;
            }
            action("Créer Ordre de Transfert Retour")
            {
                Image = Return;
                Promoted = true;
                PromotedIsBig = true;
                Visible = ShowItem;

                trigger OnAction();
                var
                    CuSAVManagement : Codeunit "50010";
                    RecLServiceLine : Record "5902";
                    RecLServiceLineTMP : Record "5902" temporary;
                    StockFunctions : Codeunit "50000";
                begin
                    RecGInventorySetup.GET;
                    IF CodeMagasin='' THEN
                      ERROR('Magasin de Réservation ne doit pas être vide !')
                    ELSE
                      BEGIN
                        RecLServiceLine.COPY(Rec);
                        //SM MAZDA06
                        IF RecLServiceLine.FINDSET THEN BEGIN
                          REPEAT
                            IF RecLServiceLine.MARK THEN
                            BEGIN
                              CalcOrderedQty;
                              //<<ZMN 02/06/2017
                              IF RecLServiceLine."Qty To Order" > 0 THEN
                                RecLServiceLine."Qty To Order" :=0;

                               RecLServiceLine.CreateTempSalesLigneForOtherCompany(RecLServiceLineTMP);
                               RecLServiceLineTMP.CALCFIELDS("Qty Received","Qty Shipped Returned");
                               RecLServiceLine.CALCFIELDS("Qty Received","Qty Shipped Returned","Qte Current POS ADJUST");


                              IF RecLServiceLine."Qty To Order" < 0 THEN
                                BEGIN


                                    IF ABS(RecLServiceLine."Qty To Order") >  (RecLServiceLineTMP."Qty Received"- RecLServiceLineTMP."Qty Shipped Returned")
                                     + (RecLServiceLine."Qty Received"- RecLServiceLine."Qty Shipped Returned") + RecLServiceLine."Qte Current POS ADJUST" THEN

                                      RecLServiceLine."Qty To Order" := 0;

                                    //remplire demande piece
                                    //RecDemandePiece.DELETEALL;
                                    IF RecLServiceLine."Qty To Order" < 0 THEN
                                      BEGIN
                                        RecDemandePiece.INIT;//SM ADD 240917
                                        IF (RecLServiceLineTMP."Qty Received"- RecLServiceLineTMP."Qty Shipped Returned") > 0 THEN
                                          BEGIN
                                            RecDemandePiece.INIT;
                                            RecDemandePiece."No. Article" :=RecLServiceLine."No.";
                                            RecDemandePiece.CompanyName  := RecGInventorySetup."Socité stock consolidé";
                                            RecDemandePiece.Qty:= StockFunctions.FctMin(ABS(RecLServiceLine."Qty To Order") ,(RecLServiceLineTMP."Qty Received"- RecLServiceLineTMP."Qty Shipped Returned"));
                                            RecDemandePiece."Variante Code":=RecLServiceLine."Variant Code";
                                            RecDemandePiece."Line No.":=RecLServiceLine."Line No.";
                                            RecDemandePiece."Sell to customer No.":=RecLServiceLine."Customer No.";
                                            RecDemandePiece."Unit of Mesure":=RecLServiceLine."Unit of Measure Code";
                                            RecDemandePiece."Item Categorie cide":= RecLServiceLine."Item Category Code";
                                            RecDemandePiece."Prodect Group Code":=RecLServiceLine."Product Group Code";
                                            RecDemandePiece."Gen. Prod. Posting Group":=RecLServiceLine."Gen. Prod. Posting Group";
                                            RecDemandePiece."Posting Group":=RecLServiceLine."Posting Group";
                                            RecDemandePiece."Document Type"  :=FORMAT(RecLServiceLine."Document Type");
                                            RecDemandePiece."Document No.":=RecLServiceLine."Document No.";
                                            // LRecDemandePiece."Recept Date":=PRecSalesLine.rec
                                            // LRecDemandePiece."Shipment Date":=
                                            // LRecDemandePiece."Affecter sur":=PRecServiceLine."Affecter sur";
                                            RecDemandePiece.INSERT;
                                            //SM 161217
                                            RecLServiceLine."Qtée Manquant" := 0;
                                            RecLServiceLine."Date Manquant" := CURRENTDATETIME;
                                            RecLServiceLine.MODIFY;
                                            //END SM
                                          END;
                                        IF ((RecLServiceLine."Qty To Order" + RecDemandePiece.Qty) < 0) AND (((RecLServiceLine."Qty Received"- RecLServiceLine."Qty Shipped Returned")+RecLServiceLine."Qte Current POS ADJUST") > 0) THEN
                                          BEGIN
                                            //RecDemandePiece.INIT;
                                            RecDemandePiece."No. Article" :=RecLServiceLine."No.";
                                            RecDemandePiece.CompanyName  := COMPANYNAME;
                                            RecDemandePiece.Qty:= StockFunctions.FctMin(ABS(RecLServiceLine."Qty To Order" + RecDemandePiece.Qty) ,(RecLServiceLine."Qty Received"- RecLServiceLine."Qty Shipped Returned"+RecLServiceLine."Qte Current POS ADJUST"));
                                            RecDemandePiece."Variante Code":=RecLServiceLine."Variant Code";
                                            RecDemandePiece."Line No.":=RecLServiceLine."Line No.";
                                            RecDemandePiece."Sell to customer No.":=RecLServiceLine."Customer No.";
                                            RecDemandePiece."Unit of Mesure":=RecLServiceLine."Unit of Measure Code";
                                            RecDemandePiece."Item Categorie cide":= RecLServiceLine."Item Category Code";
                                            RecDemandePiece."Prodect Group Code":=RecLServiceLine."Product Group Code";
                                            RecDemandePiece."Gen. Prod. Posting Group":=RecLServiceLine."Gen. Prod. Posting Group";
                                            RecDemandePiece."Posting Group":=RecLServiceLine."Posting Group";
                                            RecDemandePiece."Document Type"  :=FORMAT(RecLServiceLine."Document Type");
                                            RecDemandePiece."Document No.":=RecLServiceLine."Document No.";
                                            RecDemandePiece.INSERT;
                                            //SM 161217
                                            RecLServiceLine."Qtée Manquant" := 0;
                                            RecLServiceLine."Date Manquant" := CURRENTDATETIME;
                                            RecLServiceLine.MODIFY;
                                            //END SM
                                          END;
                                       END;
                                END;
                              //>>ZMN 02/06/2017



                              IF ABS(RecLServiceLine."Qty To Order") > (RecLServiceLineTMP."Qty Received"- RecLServiceLineTMP."Qty Shipped Returned")
                                                                    + (RecLServiceLine."Qty Received"- RecLServiceLine."Qty Shipped Returned")+RecLServiceLine."Qte Current POS ADJUST" THEN
                                ERROR(TXT50001,RecLServiceLine."Location Code",RecLServiceLine."No.");

                            END;

                          UNTIL RecLServiceLine.NEXT = 0;
                        END;
                        //END SM

                        CuSAVManagement.CreateOrdreTransferRetour(RecLServiceLine,CodeMagasin,RecDemandePiece);

                         Selection:=TRUE;

                         IF FINDFIRST THEN
                           REPEAT
                               //SM MAZDA06
                               //OLD CALCFIELDS("Qty on Transfer Order");
                               //OLD "Remaining Qty" := Quantity - "Qty on Transfer Order" ;
                               CalcOrderedQty;
                               "Remaining Qty to Order" := Quantity - "Ordered Qty";
                               VALIDATE("Qty To Order" , Quantity - "Ordered Qty");
                               //END SM
                               MODIFY;
                               MARK(TRUE);
                           UNTIL NEXT = 0 ;

                         SETFILTER("Remaining Qty to Order",'<>%1',0);

                         IF FINDFIRST THEN
                           REPEAT
                              IF Rec.MARK=TRUE THEN
                                 Selection:=TRUE
                              ELSE Selection:=FALSE;
                           UNTIL NEXT = 0 ;

                      END;
                    //SM MAZDA06

                    CurrPage.UPDATE(FALSE);
                end;
            }
            action("Créer Commande Achat TE")
            {
                Promoted = true;
                PromotedIsBig = true;
                Visible = ShowRessource;

                trigger OnAction();
                var
                    CuSAVManagement : Codeunit "50010";
                    RecPurchHeader : Record "38";
                begin
                    //SM MAZDA07
                    CuSAVManagement.GetSpecialPurchOrdersForServiceLineOrder(Rec);
                    //50  RecPurchHeader
                    COMMIT;
                    RecPurchHeader.RESET;
                    RecPurchHeader.SETRANGE("No.","Special Order Purchase No.");

                    PAGE.RUNMODAL(PAGE::"Purchase Order",RecPurchHeader);
                    //SM
                    //SM MAZDA30
                    CurrPage.CLOSE;
                    //END SM
                end;
            }
            action("Créer OTt Retour SP")
            {
                Caption = 'Créer Ordre de Transfert Retour SP';
                Image = ReturnRelated;
                Visible = false;

                trigger OnAction();
                var
                    CuSAVManagement : Codeunit "50010";
                    RecLServiceLine : Record "5902";
                    RecLServiceLineTMP : Record "5902" temporary;
                    StockFunctions : Codeunit "50000";
                    RetourDetailPRSAV : Codeunit "70013";
                    ServiceHeaderSP : Record "5900";
                begin
                    //SM 11/12/17
                    RecGInventorySetup.GET;
                    IF CodeMagasin='' THEN
                      ERROR('Magasin de Réservation ne doit pas être vide !')
                    ELSE
                      BEGIN
                        RecLServiceLine.COPY(Rec);
                        //SM MAZDA06
                        IF RecLServiceLine.FINDSET THEN BEGIN
                          REPEAT
                            IF RecLServiceLine.MARK THEN
                            BEGIN
                              CalcOrderedQty;
                              //<<ZMN 02/06/2017
                              IF RecLServiceLine."Qty To Order" > 0 THEN
                                RecLServiceLine."Qty To Order" :=0;

                               RecLServiceLine.CreateTempSalesLigneForOtherCompany(RecLServiceLineTMP);
                               RecLServiceLineTMP.CALCFIELDS("Qty Received","Qty Shipped Returned");
                               RecLServiceLine.CALCFIELDS("Qty Received","Qty Shipped Returned","Qte Current POS ADJUST");


                              IF RecLServiceLine."Qty To Order" < 0 THEN
                                BEGIN


                                    IF ABS(RecLServiceLine."Qty To Order") >  (RecLServiceLineTMP."Qty Received"- RecLServiceLineTMP."Qty Shipped Returned")
                                     + (RecLServiceLine."Qty Received"- RecLServiceLine."Qty Shipped Returned") + RecLServiceLine."Qte Current POS ADJUST" THEN

                                      RecLServiceLine."Qty To Order" := 0;

                                    //remplire demande piece
                                    //RecDemandePiece.DELETEALL;
                                    IF RecLServiceLine."Qty To Order" < 0 THEN
                                      BEGIN
                                        RecDemandePiece.INIT;//SM ADD 240917
                                        IF (RecLServiceLineTMP."Qty Received"- RecLServiceLineTMP."Qty Shipped Returned") > 0 THEN
                                          BEGIN
                                            RecDemandePiece.INIT;
                                            RecDemandePiece."No. Article" :=RecLServiceLine."No.";
                                            RecDemandePiece.CompanyName  := RecGInventorySetup."Socité stock consolidé";
                                            RecDemandePiece.Qty:= StockFunctions.FctMin(ABS(RecLServiceLine."Qty To Order") ,(RecLServiceLineTMP."Qty Received"- RecLServiceLineTMP."Qty Shipped Returned"));
                                            RecDemandePiece."Variante Code":=RecLServiceLine."Variant Code";
                                            RecDemandePiece."Line No.":=RecLServiceLine."Line No.";
                                            RecDemandePiece."Sell to customer No.":=RecLServiceLine."Customer No.";
                                            RecDemandePiece."Unit of Mesure":=RecLServiceLine."Unit of Measure Code";
                                            RecDemandePiece."Item Categorie cide":= RecLServiceLine."Item Category Code";
                                            RecDemandePiece."Prodect Group Code":=RecLServiceLine."Product Group Code";
                                            RecDemandePiece."Gen. Prod. Posting Group":=RecLServiceLine."Gen. Prod. Posting Group";
                                            RecDemandePiece."Posting Group":=RecLServiceLine."Posting Group";
                                            RecDemandePiece."Document Type"  :=FORMAT(RecLServiceLine."Document Type");
                                            RecDemandePiece."Document No.":=RecLServiceLine."Document No.";
                                            // LRecDemandePiece."Recept Date":=PRecSalesLine.rec
                                            // LRecDemandePiece."Shipment Date":=
                                            // LRecDemandePiece."Affecter sur":=PRecServiceLine."Affecter sur";
                                            RecDemandePiece.INSERT;
                                          END;
                                        IF ((RecLServiceLine."Qty To Order" + RecDemandePiece.Qty) < 0) AND (((RecLServiceLine."Qty Received"- RecLServiceLine."Qty Shipped Returned")+RecLServiceLine."Qte Current POS ADJUST") > 0) THEN
                                          BEGIN
                                            //RecDemandePiece.INIT;
                                            RecDemandePiece."No. Article" :=RecLServiceLine."No.";
                                            RecDemandePiece.CompanyName  := COMPANYNAME;
                                            RecDemandePiece.Qty:= StockFunctions.FctMin(ABS(RecLServiceLine."Qty To Order" + RecDemandePiece.Qty) ,(RecLServiceLine."Qty Received"- RecLServiceLine."Qty Shipped Returned"+RecLServiceLine."Qte Current POS ADJUST"));
                                            RecDemandePiece."Variante Code":=RecLServiceLine."Variant Code";
                                            RecDemandePiece."Line No.":=RecLServiceLine."Line No.";
                                            RecDemandePiece."Sell to customer No.":=RecLServiceLine."Customer No.";
                                            RecDemandePiece."Unit of Mesure":=RecLServiceLine."Unit of Measure Code";
                                            RecDemandePiece."Item Categorie cide":= RecLServiceLine."Item Category Code";
                                            RecDemandePiece."Prodect Group Code":=RecLServiceLine."Product Group Code";
                                            RecDemandePiece."Gen. Prod. Posting Group":=RecLServiceLine."Gen. Prod. Posting Group";
                                            RecDemandePiece."Posting Group":=RecLServiceLine."Posting Group";
                                            RecDemandePiece."Document Type"  :=FORMAT(RecLServiceLine."Document Type");
                                            RecDemandePiece."Document No.":=RecLServiceLine."Document No.";
                                            RecDemandePiece.INSERT;
                                          END;
                                       END;
                                END;
                              //>>ZMN 02/06/2017



                              IF ABS(RecLServiceLine."Qty To Order") > (RecLServiceLineTMP."Qty Received"- RecLServiceLineTMP."Qty Shipped Returned")
                                                                    + (RecLServiceLine."Qty Received"- RecLServiceLine."Qty Shipped Returned")+RecLServiceLine."Qte Current POS ADJUST" THEN
                                ERROR(TXT50001,RecLServiceLine."Location Code",RecLServiceLine."No.");

                            END;

                          UNTIL RecLServiceLine.NEXT = 0;
                        END;
                        //END SM
                        //SM 11/12/2017
                        //SM OLD CuSAVManagement.CreateOrdreTransferRetour(RecLServiceLine,CodeMagasin,RecDemandePiece);
                        ServiceHeaderSP.GET("Document Type","Document No.");
                        RetourDetailPRSAV.FctCreateReturnOrderDPFromServiceHeader("Document No.",CodeMagasin,ServiceHeaderSP."Type Reception",RecDemandePiece);

                         Selection:=TRUE;

                         IF FINDFIRST THEN
                           REPEAT
                               //SM MAZDA06
                               //OLD CALCFIELDS("Qty on Transfer Order");
                               //OLD "Remaining Qty" := Quantity - "Qty on Transfer Order" ;
                               CalcOrderedQty;
                               "Remaining Qty to Order" := Quantity - "Ordered Qty";
                               VALIDATE("Qty To Order" , Quantity - "Ordered Qty");
                               //END SM
                               MODIFY;
                               MARK(TRUE);
                           UNTIL NEXT = 0 ;

                         SETFILTER("Remaining Qty to Order",'<>%1',0);

                         IF FINDFIRST THEN
                           REPEAT
                              IF Rec.MARK=TRUE THEN
                                 Selection:=TRUE
                              ELSE Selection:=FALSE;
                           UNTIL NEXT = 0 ;

                      END;
                    //SM MAZDA06

                    CurrPage.UPDATE(FALSE);
                    //END SM
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
           IF Rec.MARK=TRUE THEN
              Selection:=TRUE
           ELSE Selection:=FALSE;
    end;

    trigger OnInit();
    begin
        //SM MAZDA07
        ShowItemOrResource;
        //END SM

        Selection:=TRUE;
    end;

    trigger OnOpenPage();
    var
        RecLServiceLineTMP : Record "5902" temporary;
    begin
        Selection:=TRUE;

        IF FINDFIRST THEN
          REPEAT
              //SM MAZDA06
              //OLD CALCFIELDS("Qty on Transfer Order");
              //OLD "Remaining Qty" := Quantity - "Qty on Transfer Order" ;
              CalcOrderedQty;
              "Remaining Qty to Order" := ("Quantity Shipped" + "Qty. to Ship")- "Ordered Qty";
              //MAZDA06
              //SM MAZDA06
                IF "Remaining Qty to Order" < 0 THEN BEGIN
                CreateTempSalesLigneForOtherCompany(RecLServiceLineTMP);

                RecLServiceLineTMP.CALCFIELDS("Qty Received","Qty Shipped Returned");
                  CALCFIELDS("Qty Received","Qty Shipped Returned","Qte Current POS ADJUST");
                  IF ABS("Remaining Qty to Order") > (RecLServiceLineTMP."Qty Received"- RecLServiceLineTMP."Qty Shipped Returned")
                                                  + ("Qty Received"- "Qty Shipped Returned") +"Qte Current POS ADJUST" THEN
                    "Remaining Qty to Order" := 0;
                END;


              VALIDATE("Qty To Order" ,("Quantity Shipped" + "Qty. to Ship") - "Ordered Qty");

              //END SM
              //SM 121017
              IF Type = Type::Resource THEN BEGIN
                CALCFIELDS("Qty Purchase Line");
                CALCFIELDS("Qty Received Purchase");

                  IF "Qty Received Purchase" > "Qty Purchase Line" THEN
                   "Ordered Qty" := "Qty Received Purchase"
                  ELSE
                    "Ordered Qty" := "Qty Purchase Line" ;

               VALIDATE("Qty To Order" , Quantity - "Ordered Qty");
               "Remaining Qty to Order" := Quantity - "Ordered Qty";
              END;
              //END SM
              MODIFY;
              //SM MAZDA06
              IF "Remaining Qty to Order" <> 0 THEN
              //END SM
                MARK(TRUE);
          UNTIL NEXT = 0 ;
        SETFILTER("Remaining Qty to Order",'<>%1',0);
        IF RecUserSetup.GET(USERID) THEN
          //SM MAZDA301
          BEGIN
            RecServiceHeader.RESET;
            RecServiceHeader.GET("Document Type","Document No.");
            IF RecServiceHeader."Type Reception" = RecServiceHeader."Type Reception"::VN THEN
              CodeMagasin := RecServiceHeader."Mag Réservation"
            ELSE
              CodeMagasin := RecUserSetup."Mag Reservation/Defaut"
          END
          //END SM MAZDA301
        ELSE
          BEGIN
          ERROR('Utilisateur %1 doit avoir une magazin de Réservation',USERID);
          CurrPage.CLOSE;
          END;
        //SM 170517
        IF COUNT = 0 THEN
          ERROR('Rien à demander');
        //END SM170517
    end;

    var
        Selection : Boolean;
        CodeMagasin : Code[20];
        DecGRemainQtytotransf : Decimal;
        RecUserSetup : Record "91";
        TXT50000 : Label 'Vous avez une quantité en transit pour l''article %1 qui vont satisfaire la quantité demandé.';
        TXT50001 : Label 'Vous n''avez pas une quantité suffisante dans magasin %1 pour l''article %2.';
        ShowRessource : Boolean;
        ShowItem : Boolean;
        RecServiceHeader : Record "5900";
        GRecReceptionSAV : Record "60008";
        RecGInventorySetup : Record "313";
        RecDemandePiece : Record "70086" temporary;

    procedure ShowItemOrResource();
    begin
        //SM MAZDA07
        //<< CT16V0002 ZMN 05/07/2016
        IF (GETFILTER(Type) = FORMAT(Type::Resource)) THEN BEGIN
        //>> CT16V0002 ZMN 05/07/2016
        ////IF (GETFILTER(Type) = FORMAT(Type::Resource)) OR (GETFILTER(Type) = FORMAT(Type::Cost)) THEN BEGIN
          ShowRessource := TRUE ;
          ShowItem      := FALSE;
        END ELSE IF GETFILTER(Type) = FORMAT(Type::Item) THEN BEGIN
          ShowRessource := FALSE;
          ShowItem      := TRUE ;
        END;
        //END SM
    end;
}

