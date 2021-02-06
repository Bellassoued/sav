page 50109 "Liste des manquants"
{
    Editable = true;
    PageType = List;
    SourceTable = Table50075;
    SourceTableView = WHERE(Facturé=CONST(No));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("N°Seq";"N°Seq")
                {
                    Editable = false;
                }
                field("N°BLIV";"N°BLIV")
                {
                    Editable = false;
                }
                field(VIN;VIN)
                {
                    Editable = false;
                }
                field("Date rendez-vous";"Date rendez-vous")
                {
                }
                field(Ref;Ref)
                {
                    Editable = false;
                }
                field(Designation;Designation)
                {
                }
                field(Quantité;Quantité)
                {
                    Editable = false;
                }
                field(Livrée;Livrée)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Date B_Livraison";"Date B_Livraison")
                {
                    Editable = false;
                }
                field(Sélectionné;Sélectionné)
                {
                    Editable = false;
                }
                field("Ordre de préparation VN";"Ordre de préparation VN")
                {
                    Editable = false;
                }
                field(Facturé;Facturé)
                {
                    Editable = false;
                }
                field("N° facture";"N° facture")
                {
                    Editable = false;
                }
                field("Date facture";"Date facture")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sélectionner")
            {

                trigger OnAction();
                begin
                    UserSetup.GET(USERID);
                    IF NOT UserSetup."Sélectionner manquant VN" THEN
                      ERROR('Vous n''avez pas le droit');
                    GRecAccessoiresManquantVN.RESET;
                    GRecAccessoiresManquantVN.SETRANGE(Sélectionné,TRUE);
                    GRecAccessoiresManquantVN.SETFILTER(VIN,'<>%1',VIN);
                    //IF GRecAccessoiresManquantVN.FINDFIRST THEN
                      //ERROR(DIFFVINSELECTEDERROR);
                    Sélectionné:=NOT Sélectionné;
                    CurrPage.UPDATE;
                end;
            }
            action("Créer Ordre de préparation")
            {
                Image = PostedShipment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    RecPreparationVN : Record "60025";
                    LRecServiceHeader : Record "5900";
                    LRecServiceLine : Record "5902";
                    LRecServiceLineInsert : Record "5902";
                    LRecServiceItemLine : Record "5901";
                    LRecItem : Record "27";
                    LIntLineNo : Integer;
                    LRecServiceItem : Record "5940";
                begin
                    //TESTFIELD("Statut PVN","Statut PVN"::"Préparation lancée");
                    TESTFIELD(VIN);
                    TESTFIELD(Ref);
                    TESTFIELD(Sélectionné,TRUE);
                    //TESTFIELD("No Préparation",'');
                    //IF (Emplacement=Emplacement::"Chez Aures Auto") THEN
                    //BEGIN
                      CLEAR(RecPreparationVN);
                      RecPreparationVN.SETRANGE(VIN,VIN);
                      //RecPreparationVN.SETRANGE(RecPreparationVN."Service Type",RecPreparationVN."Service Type"::"Préparation");
                      RecPreparationVN.SETRANGE("Preparation No","Ordre de préparation VN");
                      IF NOT RecPreparationVN.FINDFIRST THEN
                      BEGIN
                         // IF CONFIRM(TXT50000)THEN
                          BEGIN
                              CLEAR(RecPreparationVN);
                              RecPreparationVN."Service Type":=RecPreparationVN."Service Type"::Préparation;
                              RecPreparationVN.FctSetAncientManquant(TRUE);
                              RecPreparationVN.VALIDATE(VIN,VIN);
                              IF RecPreparationVN.INSERT(TRUE) THEN BEGIN
                                LIntLineNo:=10000;
                    
                                CuSAVManagement.CreateServOrderFromPrpVN(RecPreparationVN);
                                GRecAccessoiresManquantVN.RESET;
                                GRecAccessoiresManquantVN.SETRANGE(VIN,VIN);
                                GRecAccessoiresManquantVN.SETRANGE(Sélectionné,TRUE);
                                //MESSAGE('%1',GRecAccessoiresManquantVN.COUNT);
                                LRecServiceHeader.RESET;
                                LRecServiceHeader.SETRANGE("Reception No",RecPreparationVN."Preparation No");
                                LRecServiceHeader.FINDFIRST;
                                LRecServiceLine.RESET;
                                LRecServiceLine.SETRANGE("Document Type",LRecServiceHeader."Document Type");
                                LRecServiceLine.SETRANGE("Document No.",LRecServiceHeader."No.");
                                IF LRecServiceLine.FINDSET THEN BEGIN
                                  LRecServiceLine.DELETEALL;
                                    END;
                                IF GRecAccessoiresManquantVN.FINDSET THEN BEGIN
                                  REPEAT
                                    LRecServiceHeader.RESET;
                                    //MESSAGE(GRecAccessoiresManquantVN.Ref);
                                    LRecServiceHeader.SETRANGE("Reception No",RecPreparationVN."Preparation No");
                                    LRecServiceHeader.FINDFIRST;
                                    LRecServiceItemLine.RESET;
                                    LRecServiceItemLine.SETRANGE("Document Type",LRecServiceHeader."Document Type");
                                    LRecServiceItemLine.SETRANGE("Document No.",LRecServiceHeader."No.");
                                    LRecServiceItemLine.FINDFIRST;
                                      LRecServiceLine.RESET;
                                      LRecServiceLine.SETRANGE("Document Type",LRecServiceHeader."Document Type");
                                      LRecServiceLine.SETRANGE("Document No.",LRecServiceHeader."No.");
                                      IF LRecServiceLine.FINDLAST THEN BEGIN
                                        LIntLineNo+=LRecServiceLine."Line No.";
                                        END;
                                      LRecServiceLineInsert.INIT;
                                      //LRecServiceLineInsert.VALIDATE("Line No.",LIntLineNo);
                                      LRecServiceLineInsert.VALIDATE("Document Type",LRecServiceHeader."Document Type");
                                      LRecServiceLineInsert.VALIDATE("Document No.",LRecServiceHeader."No.");
                                      LRecServiceLineInsert.VALIDATE("Service Item Line No.",LRecServiceItemLine."Line No.");
                                      LRecServiceLineInsert.INSERT(TRUE);
                                      LRecServiceLineInsert.VALIDATE("Service Item No.",LRecServiceItemLine."Service Item No.");
                    
                                      LRecServiceLineInsert.VALIDATE(Type,LRecServiceLineInsert.Type::Item);
                    
                                      //LRecItem.GET(COPYSTR(Article,1,STRLEN(Article)-3));
                                      //LRecServiceLineInsert.VALIDATE("No.",COPYSTR(Article,1,STRLEN(Article)-3));
                                     // MESSAGE(DELSTR(GRecAccessoiresManquantVN.Ref,STRLEN(GRecAccessoiresManquantVN.Ref)-2,3));
                                      LRecServiceLineInsert.VALIDATE("No.",DELSTR(GRecAccessoiresManquantVN.Ref,STRLEN(GRecAccessoiresManquantVN.Ref)-2,3));
                                      //LRecServiceLineInsert.Quantity:=Quantité;
                                      //LRecServiceLineInsert."Unit Price":=0.001;
                                     // LRecServiceLineInsert.INSERT;
                                     LRecServiceLineInsert.MODIFY(TRUE);
                                       // GRecAccessoiresManquantVN."Ordre de préparation VN":= RecPreparationVN."Preparation No";
                                        //GRecAccessoiresManquantVN.MODIFY;
                                      UNTIL GRecAccessoiresManquantVN.NEXT=0;
                                END;
                                  //PAGE.RUN(PAGE::"Fiche Preparation VN",RecPreparationVN);
                                 // "Ordre de préparation VN" := RecPreparationVN."Preparation No";
                                GRecAccessoiresManquantVN.RESET;
                                GRecAccessoiresManquantVN.SETRANGE(VIN,VIN);
                                GRecAccessoiresManquantVN.SETRANGE(Sélectionné,TRUE);
                                 IF GRecAccessoiresManquantVN.FINDSET THEN BEGIN
                                   GRecAccessoiresManquantVN.MODIFYALL("Ordre de préparation VN",RecPreparationVN."Preparation No") ;
                                   GRecAccessoiresManquantVN.MODIFYALL(Sélectionné,FALSE);
                                  END;
                                  //"Statut PVN" := "Statut PVN"::"Ordre de préparation crée";
                                  //"Début PVN"   :=CURRENTDATETIME;
                                  //MODIFY;
                    
                              END;
                          END;
                     // END ELSE ERROR(TXT50001,RecPreparationVN."Preparation No","Serial No.");
                    END ELSE PAGE.RUN(PAGE::"Fiche Preparation VN",RecPreparationVN);
                    /*LRecServiceItem.RESET;
                    LRecServiceItem.SETRANGE("Serial No.",VIN);
                    LRecServiceItem.FINDFIRST;
                    LRecServiceItem.Accepté:=FALSE;
                    LRecServiceItem."Commande Service PVN":=LRecServiceHeader."No.";
                    LRecServiceItem."Préparation/Livraison":=LRecServiceItem."Préparation/Livraison"::" ";
                    //LRecServiceItem."No Préparation"      :=RecPreparationVN."Preparation No";
                    
                    LRecServiceItem.MODIFY;
                    */

                end;
            }
            action("Consulter ordre de préparation")
            {

                trigger OnAction();
                var
                    RecPreparationVN : Record "60025";
                begin
                    CLEAR(RecPreparationVN);
                    RecPreparationVN.SETRANGE(VIN,VIN);
                      //RecPreparationVN.SETRANGE(RecPreparationVN."Service Type",RecPreparationVN."Service Type"::"Préparation");
                    RecPreparationVN.SETRANGE("Preparation No","Ordre de préparation VN");
                    IF  RecPreparationVN.FINDFIRST THEN
                      PAGE.RUN(PAGE::"Fiche Preparation VN",RecPreparationVN);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        IF NOT PreparationVN.GET("Ordre de préparation VN") THEN
          "Ordre de préparation VN":='';
    end;

    trigger OnAfterGetRecord();
    begin
        IF NOT PreparationVN.GET("Ordre de préparation VN") THEN
          "Ordre de préparation VN":='';
    end;

    var
        GRecAccessoiresManquantVN : Record "50075";
        DIFFVINSELECTEDERROR : Label 'Vous ne pouvez pas sélectionner des accessoires pour VINs différents';
        CuSAVManagement : Codeunit "50010";
        UserSetup : Record "91";
        PreparationVN : Record "60025";
}

