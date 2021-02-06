page 60010 "Proposition Article"
{
    // version CT16V002

    DelayedInsert = true;
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = List;
    SaveValues = false;
    ShowFilter = true;
    SourceTable = Table60035;

    layout
    {
        area(content)
        {
            group(Filtres)
            {
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                field(IntNbreMoisCouvert;IntNbreMoisCouvert)
                {
                    Caption = 'Nombre de mois hisstorique vente';

                    trigger OnValidate();
                    begin

                        EndDate := TODAY;
                        startDate := CALCDATE('<-'+FORMAT(IntNbreMoisCouvert)+'M>',EndDate);
                        TxtPeriodeCalcule := 'Du ' + FORMAT(startDate) + '   au ' + FORMAT(EndDate);
                        CurrPage.UPDATE ;
                    end;
                }
                field(TxtPeriodeCalcule;TxtPeriodeCalcule)
                {
                    Caption = 'Periode de référence';
                    Editable = false;
                }
                field(IntNbreMoisDelaiFour;IntNbreMoisDelaiFour)
                {
                    Caption = 'Nombre de mois delai fournisseur';
                    Editable = false;
                }
                field(CodeModelePR;CodeModelePR)
                {
                    Caption = 'Famille';
                    TableRelation = "Hiérarchie Pièce"."Item Family";
                }
            }
            repeater(Group)
            {
                Editable = true;
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                field("No.";"No.")
                {
                    Editable = false;
                }
                field("Article Racine";"Article Racine")
                {
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field("Stock Actuel";Stock)
                {
                    Editable = false;
                }
                field("Qté Min";"Qté Min")
                {
                }
                field("Quantité Préconisé";"Quantité Préconisé")
                {
                    Editable = false;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Quantié à commander";"Quantié à commander")
                {
                    Style = Ambiguous;
                    StyleExpr = TRUE;
                }
                field("Sales 2008 (QTY)";"Sales 2008 (QTY)")
                {
                }
                field("Sales 2009 (QTY)";"Sales 2009 (QTY)")
                {
                }
                field("Sales 2010 (QTY)";"Sales 2010 (QTY)")
                {
                }
                field("Sales 2011 (QTY)";"Sales 2011 (QTY)")
                {
                }
                field("Sales 2012 (QTY)";"Sales 2012 (QTY)")
                {
                }
                field("Sales 2013 (QTY)";"Sales 2013 (QTY)")
                {
                }
                field("Sales 2014 (QTY)";"Sales 2014 (QTY)")
                {
                    Editable = false;
                }
                field("Sales 2015 (QTY)";"Sales 2015 (QTY)")
                {
                }
                field("Cosomation Moyenne";"Consommation moyenne")
                {
                    DecimalPlaces = 1:1;
                    Editable = false;
                }
                field("Delai Fournisseur";IntNbreMoisDelaiFour)
                {
                    Caption = 'Delai Fournisseur';
                    Editable = false;
                }
                field(Qmax;Qmax)
                {
                    Caption = 'Qmax';
                    Editable = false;
                }
                field("Stock Disponible à la vente";"stock dispo vente")
                {
                    Editable = false;
                }
                field("Qtté sur commande Achat";"qty sur cde achat")
                {
                    Editable = false;
                }
                field("Modèle PR";"Modèle PR")
                {
                    Caption = 'Famille';
                    Editable = false;
                }
                field("Code Modèle";"Code Modèle")
                {
                }
                field("Product group code";"Product group code")
                {
                    Editable = false;
                }
                field("vendor No.";"vendor No.")
                {
                    Editable = false;
                }
                field(JANVIER;JANVIER)
                {
                    Caption = 'M-1';
                }
                field(FEVRIER;FEVRIER)
                {
                    Caption = 'M-2';
                }
                field(MARS;MARS)
                {
                    Caption = 'M-3';
                }
                field(AVRIL;AVRIL)
                {
                    Caption = 'M-4';
                }
                field(MAI;MAI)
                {
                    Caption = 'M-5';
                }
                field(JUIN;JUIN)
                {
                    Caption = 'M-6';
                }
                field(JUILLET;JUILLET)
                {
                    Caption = 'M-7';
                }
                field(AOUT;AOUT)
                {
                    Caption = 'M-8';
                }
                field(SEPTEMBRE;SEPTEMBRE)
                {
                    Caption = 'M-9';
                }
                field(OCTOBRE;OCTOBRE)
                {
                    Caption = 'M-10';
                }
                field(NOVEMBRE;NOVEMBRE)
                {
                    Caption = 'M-11';
                }
                field(DECEMBRE;DECEMBRE)
                {
                    Caption = 'M-12';
                }
                field("ANNEE EN COURS ANNEE EN COURS";JANVIER+FEVRIER+MARS+AVRIL+MAI+JUIN+JUILLET+AOUT+SEPTEMBRE+OCTOBRE+NOVEMBRE+DECEMBRE)
                {
                    Caption = 'ANNEE EN COURS';
                }
                field("Date dernier Commande Achat";"Date dernier Commande Achat")
                {
                }
                field("Age Stock (mois)";"Age Stock (mois)")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Extraire Ligne")
            {

                trigger OnAction();
                var
                    RecLPurchReqLine : Record "50008";
                    NumLigne : Integer;
                begin
                    IF CONFIRM(CstText001) THEN;
                     BEGIN
                     RecPurchasesPayablesSetup.GET;
                     SETFILTER("Quantié à commander" , '<>0');
                     //Test TYPE Doc Demande Achat
                        IF RecGTypeDoc = 1 THEN
                          BEGIN
                          RecLPurchReqLine.SETRANGE(RecLPurchReqLine."Request No.",RecGNumDA);
                          IF RecLPurchReqLine.FINDLAST THEN
                             BEGIN
                                NumLigne:=RecLPurchReqLine."Line No." + 10000;
                          END
                          ELSE BEGIN
                                NumLigne:=10000;
                          END;
                          IF Rec.COUNT <> 0 THEN
                            IF Rec.FINDSET THEN
                              BEGIN
                               REPEAT
                                  // Affectation des Champs DA
                                  RecLPurchReqLine.INIT;
                                  RecLPurchReqLine.Type:=RecLPurchReqLine.Type::Item;
                                  RecLPurchReqLine."Request No." :=RecGNumDA  ;
                                  RecLPurchReqLine."Line No.":= NumLigne ;
                                  RecLPurchReqLine."Item No." := "No.";
                                  RecLPurchReqLine.Description := Description;
                                  IF RecLPurchReqLine.INSERT THEN;
                                  NumLigne+=10000;
                              UNTIL Rec.NEXT = 0 ;
                             END;
                          END;
                    //Test TYPE Doc Commande achat
                        IF RecGTypeDoc = 2 THEN
                          BEGIN

                          RecGPurchaseLine.SETRANGE(RecGPurchaseLine."Document Type",RecGPurchaseLine."Document Type"::Order);
                          RecGPurchaseLine.SETRANGE(RecGPurchaseLine."Document No.",RecGNumDA);
                          IF RecGPurchaseLine.FINDLAST THEN
                                NumLigne:=RecGPurchaseLine."Line No." + 10000
                            ELSE NumLigne:=10000;


                          IF Rec.COUNT <> 0 THEN
                            IF Rec.FINDSET THEN
                              REPEAT
                                // Affectation des Champs DA
                                 RecGPurchaseLine.INIT;
                                 RecGPurchaseLine.VALIDATE(RecGPurchaseLine."Document Type",RecGPurchaseLine."Document Type"::Order);
                                 RecGPurchaseLine.VALIDATE(RecGPurchaseLine."Document No.",RecGNumDA) ;
                                 RecGPurchaseLine.VALIDATE(RecGPurchaseLine.Type,RecGPurchaseLine.Type::Item);
                                 RecGPurchaseLine."Line No.":= NumLigne;
                                 RecGPurchaseLine.VALIDATE(RecGPurchaseLine."No.","No.");
                                 RecGPurchaseLine.VALIDATE(RecGPurchaseLine.Quantity,"Quantié à commander");

                                 //SM Code Emplacement
                                 //RecPurchasesPayablesSetup.GET;

                                 //RecBinContent.RESET;
                                 //RecBinContent.CHANGECOMPANY(RecGInventorySetup."Socité stock consolidé");
                                 //RecBinContent.SETRANGE("Location Code",RecUserSetup."Mag Reservation/Defaut");
                                 //RecBinContent.SETRANGE("Item No.",RecGSalesorderLines."No.");
                                 //RecBinContent.SETRANGE("Variant Code",RecGSalesorderLines."Variant Code");
                                 //RecBinContent.SETRANGE(Default,TRUE);
                                 //IF RecBinContent.FINDFIRST THEN
                                 //  RecTransferLine."Transfer-from Bin Code" := RecBinContent."Bin Code";
                                 //END SM




                                 IF RecGPurchaseLine.INSERT THEN;

                                 NumLigne+=10000;
                             UNTIL Rec.NEXT = 0 ;
                          END;


                    //Test TYPE Ordre de Transfert
                        IF RecGTypeDoc = 3 THEN
                          BEGIN

                          RecGTransferLine.SETRANGE(RecGTransferLine."Document No.",RecGNumDA);
                          IF RecGTransferLine.FINDLAST THEN
                             BEGIN
                                NumLigne:=RecGTransferLine."Line No." + 10000;
                          END
                          ELSE BEGIN
                                NumLigne:=10000;
                          END;


                          IF Rec.COUNT <> 0 THEN
                            IF Rec.FINDSET THEN
                              BEGIN
                               REPEAT
                                 // Affectation des Champs Ordre de transfert
                                  RecGTransferLine.INIT;
                                  RecGTransferLine."Document No.":=RecGNumDA ;
                                  RecGTransferLine."Line No.":= NumLigne;
                                  RecGTransferLine."Item No." := "No.";
                                   RecGTransferLine.Description :=Description;
                                  RecGTransferLine.INSERT;
                                  NumLigne+=10000;
                              UNTIL Rec.NEXT = 0 ;
                             END;
                          END;

                    END;
                end;
            }
            action("Calculer Préconisation")
            {

                trigger OnAction();
                begin
                    //SM MAZDA333
                    IF IntNbreMoisCouvert <= 0 THEN
                      ERROR(TXT50000);


                    EndDate := TODAY;
                    startDate := CALCDATE('<-'+FORMAT(IntNbreMoisCouvert)+'M>',EndDate);

                    TxtPeriodeCalcule := 'Du ' + FORMAT(startDate) + '   au ' + FORMAT(EndDate);

                    InitTablePreconisation;
                end;
            }
            action("Calculer Préconisation Article Racine")
            {
                Caption = 'Calculer Précon. Racine';

                trigger OnAction();
                begin
                    //SM MAZDA333
                    IF IntNbreMoisCouvert <= 0 THEN
                      ERROR(TXT50000);


                    EndDate := TODAY;
                    startDate := CALCDATE('<-'+FORMAT(IntNbreMoisCouvert)+'M>',EndDate);

                    TxtPeriodeCalcule := 'Du ' + FORMAT(startDate) + '   au ' + FORMAT(EndDate);

                    InitTablePreconisationRacine;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        //RecgItem."Quantity to order" := DecGQuantityToOrder;
        //"Flag Préconisation" := TRUE;
        //RecgItem.MODIFY;
    end;

    trigger OnAfterGetRecord();
    begin

        DecGPréconisation :=  "Quantié à commander" ;
        //CalculatePréconisation("No.");
    end;

    trigger OnInit();
    begin

        RecGPurchaseSetup.GET;

        IntNbreMoisCouvert := RecGPurchaseSetup."Nbre mois couverture stk Art.";
        IntNbreMoisDelaiFour := RecGPurchaseSetup."Default Delai Livraison PR" ;

        EndDate := TODAY;
        startDate := CALCDATE('<-'+FORMAT(IntNbreMoisCouvert)+'M>',EndDate);
        //SETRANGE("Date Filter",startDate,EndDate);

        TxtPeriodeCalcule := 'Du ' + FORMAT(startDate) + '   au ' + FORMAT(EndDate);
        CurrPage.UPDATE
    end;

    trigger OnOpenPage();
    begin
        //SM MAZDA333 Comment
        //InitTablePreconisation ;
        RecGPreconisation.DELETEALL;
        CurrPage.UPDATE
    end;

    var
        RecGSaisonnalite : Decimal;
        RecGDelaiFrs : Decimal;
        DecGConsoMoy : Decimal;
        RecGStckDispoVente : Decimal;
        RecGStckPrvison : Decimal;
        RecGQteACommande : Decimal;
        RecGFournisseur : Record "23";
        TxtGFrsFilter : Text[100];
        RecgTempTextFilter : Text[250];
        RecGMagasinFilter : Text[250];
        RecGMagasin : Record "14";
        RecGNumDA : Code[20];
        RecGPurchaseRequestLine : Record "50008";
        CstText001 : Label 'Vous Confirmer l''extraction de se(s) article(s)';
        RecGTypeDoc : Integer;
        RecGPurchaseLine : Record "39";
        RecGTransferLine : Record "5741";
        IntNbreMoisCouvert : Integer;
        RecGPurchaseSetup : Record "312";
        startDate : Date;
        EndDate : Date;
        TxtPeriodeCalcule : Text[100];
        TxtGModePRFilter : Text[100];
        RecGProductGroup : Record "5723";
        TxtGProductGroupFilter : Text[100];
        IntNbreMoisDelaiFour : Integer;
        Qmax : Decimal;
        DecGInventory : Decimal;
        DecGVenteNav : Decimal;
        DecGQtyOnPurchOrders : Decimal;
        DecGQuantityToOrder : Decimal;
        DecGVenteTotale : Decimal;
        DecGVenteOld : Decimal;
        RecgItem : Record "27";
        RecGArticle : Record "27";
        RecGPreconisation : Record "60035";
        "DecGPréconisation" : Decimal;
        DateDebutMois : Date;
        DateFinMois : Date;
        MOISANNEE : array [12] of Decimal;
        CurrMonth : Integer;
        RecBinContent : Record "7302";
        RecPurchasesPayablesSetup : Record "312";
        VENTE2014 : Decimal;
        TXT50000 : Label 'Merci de Saisie Période Couverture Stock';
        CodeModelePR : Code[30];
        DecGInventoryRacine : Decimal;
        DecGVenteNavRacine : Decimal;
        DecGVenteOldRacine : Decimal;
        DecGVenteTotaleRacine : Decimal;
        DecGConsoMoyRacine : Decimal;
        QmaxRacine : Decimal;
        RecGStckDispoVenteRacine : Decimal;
        DecGQtyOnPurchOrdersRacine : Decimal;
        DecGQuantityToOrderRacine : Decimal;
        LastPurchasedDateRacine : Date;

    procedure SetPurchaseRequest(var NumDa : Code[20];var TypeDoc : Integer);
    begin
        RecGNumDA := NumDa;
        RecGTypeDoc:=TypeDoc;
    end;

    procedure "CalculatePréconisation"(ItemNo : Code[20]);
    begin
        
        DecGInventory := 0;
        DecGVenteNav := 0 ;
        DecGVenteOld := 0 ;
        DecGVenteTotale := 0 ;
        DecGConsoMoy := 0;
        Qmax := 0;
        RecGStckDispoVente := 0;
        DecGQtyOnPurchOrders := 0;
        DecGQuantityToOrder :=0 ;
        
        CLEAR(RecgItem);
        RecgItem.GET(ItemNo);
        
        // Calcul stock Actuel
        RecgItem.CALCFIELDS(Inventory);
        DecGInventory := RecgItem.Inventory ;
        
        // calcule Qté vendu sur nav et sur historique
        RecgItem.SETRANGE("Date Filter",startDate,EndDate);
        RecgItem.CALCFIELDS("Sales (Qty.)");
        DecGVenteNav := RecgItem."Sales (Qty.)" ;
        RecgItem.CALCFIELDS(RecgItem."Qty sales Old System");
        DecGVenteOld :=  RecgItem."Qty sales Old System"  ;
        DecGVenteTotale := DecGVenteNav + DecGVenteOld ;
        
        // calcule Consommation moyenne
        
        IF IntNbreMoisCouvert <> 0 THEN
          DecGConsoMoy := ROUND(DecGVenteTotale/IntNbreMoisCouvert,0.00001);
        
        // Calcule Quantité Max
        Qmax := ROUND(DecGConsoMoy * IntNbreMoisDelaiFour,1,'=') ;
        
        IF Qmax <> 0 THEN BEGIN
        
          //Quantité dans les Magasin
          RecgItem.SETRANGE("Date Filter",0D,EndDate);
          RecgItem.SETFILTER("Location Filter",'%1','MAG*');
          RecgItem.CALCFIELDS(Inventory);
          RecGStckDispoVente := RecgItem.Inventory ;
        
          //calcule quantité sur commande Achats
        
          RESET;
          RecgItem.SETRANGE("Date Filter",0D,EndDate);
          RecgItem.CALCFIELDS("Qty. on Purch. Order");
          DecGQtyOnPurchOrders := RecgItem."Qty. on Purch. Order" ;
        
        
          /*SM MAZDA333
          CurrMonth := 1;
          REPEAT
            DateDebutMois := DMY2DATE(1,CurrMonth,DATE2DMY(TODAY,3));
            DateFinMois   := CALCDATE('<-1D>',CALCDATE('<+1M>',DateDebutMois));
            RecgItem.GET(ItemNo);
            RecgItem.RESET;
            RecgItem.SETRANGE("Date Filter",DateDebutMois,DateFinMois);
            RecgItem.CALCFIELDS("Sales (Qty.)");
            MOISANNEE[CurrMonth] := RecgItem."Sales (Qty.)" ;
            CurrMonth += 1;
          UNTIL CurrMonth = 12;
          SM MAZDA333*/
        
          //RecgItem.RESET;
          //RecgItem.SETRANGE("Date Filter",010114D,311214D);
          //RecgItem.CALCFIELDS("Sales (Qty.)");
          //VENTE2014 := RecgItem."Sales (Qty.)" ;
        
        
        
          // Calcule quantité à commander
          IF Qmax > (RecGStckDispoVente + DecGQtyOnPurchOrders ) THEN
              DecGQuantityToOrder := Qmax - (RecGStckDispoVente + DecGQtyOnPurchOrders )
            ELSE DecGQuantityToOrder := 0 ;
        END;

    end;

    procedure InitTablePreconisation();
    var
        RecFicheTechnique : Record "50032";
    begin
        
        RecGPreconisation.DELETEALL;
        RecGArticle.SETRANGE(Type,RecGArticle.Type::Inventory);
        RecGArticle.SETFILTER("Item type",'<>%1',0);
        RecGArticle.SETFILTER("Inventory Posting Group",'<>%1 & <>%2','LUBRIFIANT','VEHICULES');
        //SM MAZDA333
        IF CodeModelePR <> '' THEN
          RecGArticle.SETFILTER("Code Modèle PR",CodeModelePR);
        //END SM
        
        IF RecGArticle.FINDFIRST THEN
          REPEAT
            CalculatePréconisation(RecGArticle."No.");
            IF (DecGInventory < RecGArticle."Reorder Point") OR (Qmax <> 0) THEN BEGIN
              RecGPreconisation.INIT;
              RecGPreconisation."No." := RecGArticle."No.";
              RecGPreconisation.Description := RecGArticle.Description;
              //<<CT16V001 ZM 08/06/2016
              IF RecFicheTechnique.GET(RecGArticle."No.") THEN
              //>>CT16V001 ZM 08/06/2016
                //SM 191115
                RecGPreconisation."Code Modèle"  := RecFicheTechnique."Model Code";
                //END SM
              RecGPreconisation."Modèle PR" := RecGArticle."Code Modèle PR";
              RecGPreconisation."Product group code" := RecGArticle."Product Group Code";
              RecGPreconisation."vendor No." := RecGArticle."Vendor No.";
        
              RecGPreconisation.Stock := DecGInventory ;
              RecGPreconisation."Consommation moyenne" := DecGConsoMoy ;
              RecGPreconisation.Qmax := Qmax ;
              RecGPreconisation."stock dispo vente" := RecGStckDispoVente ;
              RecGPreconisation."qty sur cde achat" := DecGQtyOnPurchOrders ;
              RecGPreconisation."Quantié à commander" := 0;//DecGQuantityToOrder ;
              RecGPreconisation."Quantité Préconisé"  := DecGQuantityToOrder ;
              //<<CT16V001 ZM 08/06/2016
              /*
              RecGPreconisation."Sales 2008 (QTY)" := RecGArticle."Sales 2008 (QTY)" ;
              RecGPreconisation."Sales 2009 (QTY)" := RecGArticle."Sales 2009 (QTY)" ;
              RecGPreconisation."Sales 2010 (QTY)" := RecGArticle."Sales 2010 (QTY)" ;
              RecGPreconisation."Sales 2011 (QTY)" := RecGArticle."Sales 2011 (QTY)" ;
              RecGPreconisation."Sales 2012 (QTY)" := RecGArticle."Sales 2012 (QTY)" ;
              RecGPreconisation."Sales 2013 (QTY)" := RecGArticle."Sales 2013 (QTY)" ;
              RecGPreconisation."Sales 2014 (QTY)" := RecGArticle."Sales 2014 SAV"+RecGArticle."Sales 2014 VPR";//VENTE2014;;
              RecGPreconisation."Sales 2015 (QTY)" := RecGArticle."Sales 2015 (QTY)";
        
              //MAZDA333
              RecGPreconisation.JANVIER            := RecGArticle."Sales M-1";//MOISANNEE[1];
              RecGPreconisation.FEVRIER            := RecGArticle."Sales M-2";//MOISANNEE[2];
              RecGPreconisation.MARS               := RecGArticle."Sales M-3";//MOISANNEE[3];
              RecGPreconisation.AVRIL              := RecGArticle."Sales M-4";//MOISANNEE[4];
              RecGPreconisation.MAI                := RecGArticle."Sales M-5";//MOISANNEE[5];
              RecGPreconisation.JUIN               := RecGArticle."Sales M-6";//MOISANNEE[6];
              RecGPreconisation.JUILLET            := RecGArticle."Sales M-7";//MOISANNEE[7];
              RecGPreconisation.AOUT               := RecGArticle."Sales M-8";//MOISANNEE[8];
              RecGPreconisation.SEPTEMBRE          := RecGArticle."Sales M-9";//MOISANNEE[9];
              RecGPreconisation.OCTOBRE            := RecGArticle."Sales M-10";//MOISANNEE[10];
              RecGPreconisation.NOVEMBRE           := RecGArticle."Sales M-11";//MOISANNEE[11];
              RecGPreconisation.DECEMBRE           := RecGArticle."Sales M-12";//MOISANNEE[12];
              */
              //>>CT16V001 ZM 08/06/2016
              RecGPreconisation."Qté Min"          := RecGArticle."Reorder Point";
        
              RecGArticle.CALCFIELDS("Last Purchase Date");
              RecGPreconisation."Date dernier Commande Achat" := RecGArticle."Last Purchase Date";
              IF (RecGArticle."Last Purchase Date" <> 0D) THEN//AND (RecGArticle."Last Purchase Date" <> TODAY) AND ((TODAY - RecGArticle."Last Purchase Date") <> 0) THEN
                RecGPreconisation."Age Stock (mois)"            := ROUND((WORKDATE - RecGArticle."Last Purchase Date")/30,1)
              ELSE
                RecGPreconisation."Age Stock (mois)"            := 0;
        
              RecGPreconisation.INSERT ;
            END;
          UNTIL RecGArticle.NEXT = 0 ;

    end;

    procedure "CalculatePréconisationRacine"(ItemNo : Code[20]);
    var
        RecItemRacine : Record "27";
    begin
        
        DecGInventory := 0;
        DecGVenteNav := 0 ;
        DecGVenteOld := 0 ;
        DecGVenteTotale := 0 ;
        DecGConsoMoy := 0;
        Qmax := 0;
        RecGStckDispoVente := 0;
        DecGQtyOnPurchOrders := 0;
        DecGQuantityToOrder :=0 ;
        
        CLEAR(RecgItem);
        RecgItem.GET(ItemNo);
        RecgItem.TESTFIELD("Article Racine");
        
        //SM MAZDA1003
        CLEAR(RecItemRacine);
        RecItemRacine.SETRANGE("Article Racine",RecgItem."Article Racine");
        RecItemRacine.FINDSET;
        
        // Calcul stock Actuel
        RecgItem.CALCFIELDS(Inventory);
        DecGInventory := RecgItem.Inventory ;
        
        DecGInventoryRacine := 0;
        REPEAT
          RecItemRacine.CALCFIELDS(Inventory);
          DecGInventoryRacine += RecItemRacine.Inventory ;
        UNTIL RecItemRacine.NEXT = 0;
        RecItemRacine.FINDFIRST;
        
        // calcule Qté vendu sur nav et sur historique
        RecgItem.SETRANGE("Date Filter",startDate,EndDate);
        RecgItem.CALCFIELDS("Sales (Qty.)");
        DecGVenteNav := RecgItem."Sales (Qty.)" ;
        RecgItem.CALCFIELDS(RecgItem."Qty sales Old System");
        DecGVenteOld :=  RecgItem."Qty sales Old System"  ;
        DecGVenteTotale := DecGVenteNav + DecGVenteOld ;
        
        
        DecGVenteNavRacine := 0;
        DecGVenteOldRacine := 0;
        DecGVenteTotaleRacine := 0;
        REPEAT
          RecItemRacine.SETRANGE("Date Filter",startDate,EndDate);
          RecItemRacine.CALCFIELDS("Sales (Qty.)","Qty sales Old System");
          DecGVenteNavRacine += RecItemRacine."Sales (Qty.)" ;
          DecGVenteOldRacine +=  RecItemRacine."Qty sales Old System"  ;
        UNTIL RecItemRacine.NEXT = 0;
        DecGVenteTotaleRacine := DecGVenteNavRacine + DecGVenteOldRacine ;
        RecItemRacine.FINDFIRST;
        
        // calcule Consommation moyenne
        
        IF IntNbreMoisCouvert <> 0 THEN
          DecGConsoMoy := ROUND(DecGVenteTotale/IntNbreMoisCouvert,0.00001);
        
        IF IntNbreMoisCouvert <> 0 THEN
          DecGConsoMoyRacine := ROUND(DecGVenteTotaleRacine/IntNbreMoisCouvert,0.00001);
        
        // Calcule Quantité Max
        Qmax := ROUND(DecGConsoMoy * IntNbreMoisDelaiFour,1,'=') ;
        
        QmaxRacine := ROUND(DecGConsoMoyRacine * IntNbreMoisDelaiFour,1,'=') ;
        
        
        IF (Qmax <> 0) AND (QmaxRacine <> 0) THEN BEGIN //TO VERIFY
        
          //Quantité dans les Magasin
          RecgItem.SETRANGE("Date Filter",0D,EndDate);
          RecgItem.SETFILTER("Location Filter",'%1','MAG*');
          RecgItem.CALCFIELDS(Inventory);
          RecGStckDispoVente := RecgItem.Inventory ;
        
          RecGStckDispoVenteRacine := 0;
          RecItemRacine.SETRANGE("Date Filter",0D,EndDate);
          RecItemRacine.SETFILTER("Location Filter",'%1','MAG*');
          RecItemRacine.FINDSET;
          REPEAT
            RecItemRacine.CALCFIELDS(Inventory);
            RecGStckDispoVenteRacine += RecItemRacine.Inventory ;
          UNTIL RecItemRacine.NEXT = 0;
          RecItemRacine.FINDFIRST;
        
          //calcule quantité sur commande Achats
        
          RESET;
          RecgItem.SETRANGE("Date Filter",0D,EndDate);
          RecgItem.CALCFIELDS("Qty. on Purch. Order");
          DecGQtyOnPurchOrders := RecgItem."Qty. on Purch. Order" ;
        
          DecGQtyOnPurchOrdersRacine := 0;
          RecItemRacine.SETRANGE("Location Filter");
          RecItemRacine.FINDSET;
          REPEAT
            RecItemRacine.CALCFIELDS("Qty. on Purch. Order");
            DecGQtyOnPurchOrdersRacine += RecItemRacine."Qty. on Purch. Order" ;
          UNTIL RecItemRacine.NEXT =0;
        
          /*SM MAZDA333
          CurrMonth := 1;
          REPEAT
            DateDebutMois := DMY2DATE(1,CurrMonth,DATE2DMY(TODAY,3));
            DateFinMois   := CALCDATE('<-1D>',CALCDATE('<+1M>',DateDebutMois));
            RecgItem.GET(ItemNo);
            RecgItem.RESET;
            RecgItem.SETRANGE("Date Filter",DateDebutMois,DateFinMois);
            RecgItem.CALCFIELDS("Sales (Qty.)");
            MOISANNEE[CurrMonth] := RecgItem."Sales (Qty.)" ;
            CurrMonth += 1;
          UNTIL CurrMonth = 12;
          SM MAZDA333*/
        
          //RecgItem.RESET;
          //RecgItem.SETRANGE("Date Filter",010114D,311214D);
          //RecgItem.CALCFIELDS("Sales (Qty.)");
          //VENTE2014 := RecgItem."Sales (Qty.)" ;
        
        
        
          // Calcule quantité à commander
          IF Qmax > (RecGStckDispoVente + DecGQtyOnPurchOrders ) THEN
              DecGQuantityToOrder := Qmax - (RecGStckDispoVente + DecGQtyOnPurchOrders )
            ELSE DecGQuantityToOrder := 0 ;
        
          IF QmaxRacine > (RecGStckDispoVenteRacine + DecGQtyOnPurchOrdersRacine ) THEN
              DecGQuantityToOrderRacine := QmaxRacine - (RecGStckDispoVenteRacine + DecGQtyOnPurchOrdersRacine)
            ELSE DecGQuantityToOrderRacine := 0 ;
        
          LastPurchasedDateRacine := 0D;
          CLEAR(RecItemRacine);
          RecItemRacine.SETRANGE("Article Racine",RecgItem."Article Racine");
          RecItemRacine.FINDSET;
          REPEAT
            RecItemRacine.CALCFIELDS("Last Purchase Date");
            IF RecItemRacine."Last Purchase Date" > LastPurchasedDateRacine THEN
              LastPurchasedDateRacine := RecItemRacine."Last Purchase Date"
          UNTIL RecItemRacine.NEXT =0;
        
        
        END;

    end;

    procedure InitTablePreconisationRacine();
    var
        RecItemRac : Record "27";
        ReorderRacine : Decimal;
        RecFicheTechnique : Record "50032";
    begin
        
        RecGPreconisation.DELETEALL;
        RecGArticle.SETRANGE(Type,RecGArticle.Type::Inventory);
        RecGArticle.SETFILTER("Item type",'<>%1',0);
        RecGArticle.SETFILTER("Inventory Posting Group",'<>%1 & <>%2','LUBRIFIANT','VEHICULES');
        //SM MAZDA333
        IF CodeModelePR <> '' THEN
          RecGArticle.SETFILTER("Code Modèle PR",CodeModelePR);
        //END SM
        
        IF RecGArticle.FINDFIRST THEN
          REPEAT
        
            RecGPreconisation.SETCURRENTKEY("Article Racine");
            RecGPreconisation.SETRANGE("Article Racine",RecGArticle."Article Racine");
            IF RecGPreconisation.ISEMPTY AND FormatChattani(RecGArticle."No.") THEN BEGIN
        
        
              CalculatePréconisationRacine(RecGArticle."No.");
              ReorderRacine := RecGArticle."Reorder Point";
        
              CLEAR(RecItemRac);
              RecItemRac.SETRANGE("Article Racine",RecgItem."Article Racine");
              IF RecItemRac.FINDSET THEN
                REPEAT
                  IF RecItemRac."Reorder Point" > ReorderRacine THEN
                    ReorderRacine := RecItemRac."Reorder Point"
                UNTIL RecItemRac.NEXT = 0;
        
              IF (DecGInventoryRacine < ReorderRacine) OR (QmaxRacine <> 0) THEN BEGIN
                RecGPreconisation.INIT;
                RecGPreconisation."No." := RecGArticle."No.";
                RecGPreconisation.Description := RecGArticle.Description;
                RecGPreconisation."Article Racine" := RecGArticle."Article Racine";
                //<<CT16V001 ZM 08/06/2016
                IF RecFicheTechnique.GET(RecGArticle."No.") THEN
                //>>CT16V001 ZM 08/06/2016
                //SM 191115
                RecGPreconisation."Code Modèle"  := RecFicheTechnique."Model Code";
                //END SM
                RecGPreconisation."Modèle PR" := RecGArticle."Code Modèle PR";
                RecGPreconisation."Product group code" := RecGArticle."Product Group Code";
                RecGPreconisation."vendor No." := RecGArticle."Vendor No.";
        
                RecGPreconisation.Stock := DecGInventoryRacine ;
                RecGPreconisation."Consommation moyenne" := DecGConsoMoyRacine ;
                RecGPreconisation.Qmax := QmaxRacine ;
                RecGPreconisation."stock dispo vente" := RecGStckDispoVenteRacine ;
                RecGPreconisation."qty sur cde achat" := DecGQtyOnPurchOrdersRacine ;
                RecGPreconisation."Quantié à commander" := 0;//DecGQuantityToOrder ;
                RecGPreconisation."Quantité Préconisé"  := DecGQuantityToOrderRacine ;
        
                IF RecItemRac.FINDSET THEN
                  REPEAT
                    //<<CT16V001 ZM 15/05/2016
                    /*
                    RecGPreconisation."Sales 2008 (QTY)" += RecItemRac."Sales 2008 (QTY)" ;
                    RecGPreconisation."Sales 2009 (QTY)" += RecItemRac."Sales 2009 (QTY)" ;
                    RecGPreconisation."Sales 2010 (QTY)" += RecItemRac."Sales 2010 (QTY)" ;
                    RecGPreconisation."Sales 2011 (QTY)" += RecItemRac."Sales 2011 (QTY)" ;
                    RecGPreconisation."Sales 2012 (QTY)" += RecItemRac."Sales 2012 (QTY)" ;
                    RecGPreconisation."Sales 2013 (QTY)" += RecItemRac."Sales 2013 (QTY)" ;
                    RecGPreconisation."Sales 2014 (QTY)" += RecItemRac."Sales 2014 SAV"+RecItemRac."Sales 2014 VPR";//VENTE2014;;
                    RecGPreconisation."Sales 2015 (QTY)" += RecItemRac."Sales 2015 (QTY)";
                  UNTIL RecItemRac.NEXT = 0;
                IF RecItemRac.FINDSET THEN
                  REPEAT
                    RecGPreconisation.JANVIER            += RecItemRac."Sales M-1";//MOISANNEE[1];
                    RecGPreconisation.FEVRIER            += RecItemRac."Sales M-2";//MOISANNEE[2];
                    RecGPreconisation.MARS               += RecItemRac."Sales M-3";//MOISANNEE[3];
                    RecGPreconisation.AVRIL              += RecItemRac."Sales M-4";//MOISANNEE[4];
                    RecGPreconisation.MAI                += RecItemRac."Sales M-5";//MOISANNEE[5];
                    RecGPreconisation.JUIN               += RecItemRac."Sales M-6";//MOISANNEE[6];
                    RecGPreconisation.JUILLET            += RecItemRac."Sales M-7";//MOISANNEE[7];
                    RecGPreconisation.AOUT               += RecItemRac."Sales M-8";//MOISANNEE[8];
                    RecGPreconisation.SEPTEMBRE          += RecItemRac."Sales M-9";//MOISANNEE[9];
                    RecGPreconisation.OCTOBRE            += RecItemRac."Sales M-10";//MOISANNEE[10];
                    RecGPreconisation.NOVEMBRE           += RecItemRac."Sales M-11";//MOISANNEE[11];
                    RecGPreconisation.DECEMBRE           += RecItemRac."Sales M-12";//MOISANNEE[12];
                    */
                    //<<CT16V001 ZM 15/05/2016
                  UNTIL RecItemRac.NEXT = 0;
        
        
                RecGPreconisation."Qté Min"          := RecGArticle."Reorder Point";
        
                //RecGArticle.CALCFIELDS("Last Purchase Date");
        
                RecGPreconisation."Date dernier Commande Achat" := LastPurchasedDateRacine;//RecGArticle."Last Purchase Date";
                IF (LastPurchasedDateRacine <> 0D) THEN//AND (RecGArticle."Last Purchase Date" <> TODAY) AND ((TODAY - RecGArticle."Last Purchase Date") <> 0) THEN
                  RecGPreconisation."Age Stock (mois)"            := ROUND((WORKDATE - LastPurchasedDateRacine)/30,1)
                ELSE
                  RecGPreconisation."Age Stock (mois)"            := 0;
        
                RecGPreconisation.INSERT ;
              END;
            END;
          UNTIL RecGArticle.NEXT = 0 ;

    end;

    procedure FormatChattani(NoItem : Code[20]) : Boolean;
    begin
        IF (STRLEN(NoItem) > 11) AND (STRPOS(NoItem,'-') = 5) AND (STRPOS(COPYSTR(NoItem,6,7),'-') = 3)  THEN BEGIN
            EXIT(TRUE);
        END;
        EXIT(FALSE)
    end;
}

