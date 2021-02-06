page 60356 "Entête réception12"
{
    // version Gestion RDV

    PageType = Document;
    SourceTable = Table60095;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("N° RDV";"No. Réception")
                {
                    CaptionML = ENU='N° RDV',
                                FRA='N° Réclamation';
                    Editable = false;
                }
                field(Type;Type)
                {
                    Visible = false;
                }
                field("Date réception";"Date réception")
                {
                    CaptionML = ENU='Date RDV',
                                FRA='Date réception';
                    Editable = false;
                }
                field("Réçu par";"Réçu par")
                {
                    Caption = 'Réçu par';
                    Editable = false;
                }
                field("Temp de réception";"Temp de réception")
                {
                    Caption = 'Temps de réception';
                    Editable = false;
                }
                field("No. Téléphone";"No. Téléphone")
                {
                    Caption = 'N° Téléphone';
                }
                field("No. CIN";"No. CIN")
                {
                    Caption = 'N° CIN';
                }
                field("Code Client";"Code Client")
                {
                    Caption = 'Code Client';

                    trigger OnValidate();
                    begin
                        /*
                        CLEAR(Customer);
                        Customer.GET("Code Client");
                        "No. CIN" := Customer."No. CIN" ;
                        "No. Téléphone" := Customer."Phone No.";
                        //Ligneréception.DELETEALL;
                        CLEAR(ItemLedgerEntry);
                        ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Entry Type",1);
                        ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Document Type",'%1|%2',1,2);
                        ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Source Type",1);
                        ItemLedgerEntry.SETRANGE(ItemLedgerEntry."Source No.","Code Client");
                        ItemLedgerEntry.SETFILTER(ItemLedgerEntry."Serial No.",'<>%1','');
                        IF ItemLedgerEntry.FINDSET THEN
                        REPEAT
                        
                         CLEAR(Ligneréception2);
                         Ligneréception2.SETRANGE(Ligneréception2."No. Réception",Rec."No. Réception");
                         IF Ligneréception2.FINDLAST THEN
                         Ligneréception."No. Ligne" := Ligneréception2."No. Ligne" + 1
                         ELSE
                        
                         Ligneréception."No. Ligne" := 1;
                         Ligneréception."Item Leadger Entry No." := ItemLedgerEntry."Entry No.";
                         Ligneréception."Code Client" := Rec."Code Client";
                         Ligneréception."No. Réception" := Rec."No. Réception";
                         Ligneréception."Date réception" :=Rec."Date réception"  ;
                         Ligneréception."No. CIN" := Rec."No. CIN"   ;
                         Ligneréception."No. Téléphone" := Customer."Phone No.";
                         Ligneréception."No. chassis"  :=  ItemLedgerEntry."Serial No.";
                         Ligneréception."Nom Client" := Customer.Name;
                         Ligneréception.Adresse := Customer.Address;
                         Ligneréception.Type := Rec.Type;
                         CLEAR(Item);
                         Item.SETRANGE(Item."No.",ItemLedgerEntry."Item No.");
                         IF Item.FIND('-') THEN;
                         Ligneréception.Marque  := Item."Global Dimension 1 Code";
                         //Ligneréception."Type machine" := Item."Product Group Code";
                         Ligneréception."Code article" := Item."No." ;
                         Ligneréception."Désignation article" := Item.Description;
                         Ligneréception.Gouvernerat := Customer."Territory Code";
                         Ligneréception."Date mise en route" := ItemLedgerEntry."Posting Date";
                         //Ligneréception."Accepter Réception" := TRUE;
                         Ligneréception.INSERT(TRUE);
                        UNTIL ItemLedgerEntry.NEXT = 0;
                        CurrPage.UPDATE;
                        */
                        CurrPage.UPDATE;

                    end;
                }
                field("No. chassis";"No. chassis")
                {
                    CaptionML = ENU='N° châssis',
                                FRA='N° chassis';
                    Style = Attention;
                    StyleExpr = TRUE;
                    Visible = true;
                }
                field("No.Matricule";"No.Matricule")
                {
                }
                field("No. Téléphone demandeur";"No. Téléphone demandeur")
                {
                    Caption = 'N° Téléphone demandeur';
                }
            }
            part(;60388)
            {
                SubPageLink = No. Réception=FIELD(No. Réception);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Créer Dossier SAV")
            {
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    CurrPage.UPDATE;
                    Selection := STRMENU(TXT50000,2);
                      IF Selection = 0 THEN
                        EXIT;
                      IF Selection = 1 THEN BEGIN
                      SAV := TRUE;
                      CHRONO := FALSE;
                      END
                      ELSE
                      IF Selection = 2 THEN BEGIN
                      SAV := FALSE;
                      CHRONO := TRUE;
                      END;
                    
                    
                    //ServicePost.PostWithLines(ServiceHeader,PassedServLine,Ship,Consume,Invoice);
                    
                    /*
                    //COMMIT;
                    SelectCentredegestion := STRMENU(TXT50001,3);
                            IF SelectCentredegestion = 0 THEN
                              EXIT;
                            IF SelectCentredegestion = 1 THEN BEGIN
                            Atelier := TRUE;
                            CHRONO := FALSE;
                            //CHR2 := FALSE;
                            END
                            ELSE
                            IF SelectCentredegestion = 2 THEN BEGIN
                            Atelier := FALSE;
                            CHRONO := TRUE;
                           // CHR2 := FALSE;
                            END
                            ELSE
                            IF SelectCentredegestion = 2 THEN BEGIN
                            Atelier := FALSE;
                            CHRONO:= FALSE;
                            //CHR2 := TRUE;
                            END;
                       // ServicePost.PostWithLines(ServiceHeader,PassedServLine,Ship,Consume,Invoice);
                      COMMIT;
                    */
                    
                    IF CONFIRM('êtes vous sûre de vouloir crére un dossier pour cette demande ?',TRUE,FALSE) THEN
                    BEGIN
                    
                      Ligneréception.SETFILTER(Ligneréception."No. Réception",'%1',Rec."No. Réception");
                      Ligneréception.SETFILTER(Ligneréception."Dossier No.",'%1','');
                      Ligneréception.SETFILTER(Ligneréception."Accepter Réception",'%1',TRUE);
                      Ligneréception.SETFILTER(Etat,'%1',Ligneréception.Etat::Lancer);
                      Ligneréception.FIND('-');
                      REPEAT
                         //CLEAR(Réparation);
                         IF Selection=1 THEN BEGIN
                         CLEAR(Réparation);
                        //Réparation.SETFILTER("Service Type",'%1',Réparation."Service Type"::"Big Service");
                        Réparation.VALIDATE("Service Type",Réparation."Service Type"::"Big Service");
                        END
                        ELSE IF Selection=2 THEN BEGIN
                          CLEAR(Réparation);
                        //Réparation.SETFILTER("Service Type",'%1',Réparation."Service Type"::"Rapid Service");
                        Réparation.VALIDATE("Service Type",Réparation."Service Type"::"Rapid Service");
                        END;
                         IF Ligneréception."Lieu de réparation" = Ligneréception."Lieu de réparation"::Atelier THEN
                          Réparation."Lieu de Livraison" := Réparation."Lieu de Livraison"::Atelier;
                    
                         IF Ligneréception."Lieu de réparation" = Ligneréception."Lieu de réparation"::Déplacement THEN
                          Réparation."Lieu de Livraison" := Réparation."Lieu de Livraison"::Déplacement;
                    
                         IF Ligneréception."Lieu de réparation" = Ligneréception."Lieu de réparation"::Atelier THEN
                           BEGIN
                            NoSeries.RESET;
                            NoSeriesLine.RESET;
                            ServiceMgtSetup.RESET;
                            ServiceMgtSetup.GET;
                            NoSeries.GET(ServiceMgtSetup."No Reception");
                            NoSeriesLine.SETRANGE("Series Code",ServiceMgtSetup."No Reception");
                            NoSeriesLine.FIND('+');
                            NoSeriesLine."Last No. Used"  := INCSTR(NoSeriesLine."Last No. Used");
                            NoSeriesLine.MODIFY;
                            Réparation."Reception No":=NoSeriesLine."Last No. Used";
                            COMMIT;
                           END;
                         IF Ligneréception."Lieu de réparation" = Ligneréception."Lieu de réparation"::Déplacement THEN
                           BEGIN
                            NoSeries.RESET;
                            ServiceMgtSetup.RESET;
                            ServiceMgtSetup.GET;
                            NoSeriesLine.RESET;
                            NoSeries.GET(ServiceMgtSetup."N° Dossier Deplacement");
                            NoSeriesLine.SETRANGE("Series Code",ServiceMgtSetup."N° Dossier Deplacement");
                            NoSeriesLine.FIND('+');
                            NoSeriesLine."Last No. Used"  := INCSTR(NoSeriesLine."Last No. Used");
                            NoSeriesLine.MODIFY;
                            Réparation."Reception No":=NoSeriesLine."Last No. Used";
                            COMMIT;
                          END;
                    
                            Réparation.VALIDATE(Réparation."Customer No.",Rec."Code Client");
                            //Réparation.VALIDATE(Réparation."Service Item No.",Ligneréception."Désignation article");
                            Réparation.VALIDATE(Réparation."Vehicle No.",Ligneréception."Code article");
                            Réparation.VALIDATE(Réparation.VIN,Ligneréception."No. chassis");
                            //Réparation."Description Dysfunction custom" := Ligneréception."Intervention demandé /client";
                            Réparation."nombre heure" := Ligneréception."Nbr. Heure";
                            Réparation.Matricule := Ligneréception."No.Matricule";
                            Réparation."Created By" := Rec."Réçu par";
                            Réparation."No. RDV" := Rec."No. Réception";
                            Réparation."Creation date" := WORKDATE;
                            UserSetup.GET(Rec."Réçu par");
                            Réparation."Responsibility Center" := UserSetup."Service Resp. Ctr. Filter";
                            Réparation."Reception Date" := Ligneréception."Date Intervention souhaitée";
                            Réparation."Shipment date Request" := Ligneréception."Date Intervention confirmée";
                            /*IF SelectCentredegestion = 1 THEN
                            //Réparation."Responsibility Center" := UserSetup."Service Resp. Ctr. Filter";
                            Réparation."Responsibility Center" := 'Atelier'
                            ELSE
                              IF SelectCentredegestion = 2 THEN
                            //Réparation."Responsibility Center" := UserSetup."Service Resp. Ctr. Filter";
                            Réparation."Responsibility Center" := 'CHR1'
                            ELSE
                                IF SelectCentredegestion = 3 THEN
                            //Réparation."Responsibility Center" := UserSetup."Service Resp. Ctr. Filter";
                            Réparation."Responsibility Center" := 'CHR2';*/
                    
                            Réparation.INSERT;
                            IF Selection=2 THEN BEGIN
                            LignereceptionserviceRapide1.INIT;
                            LignereceptionserviceRapide1.VALIDATE("Reception No.",Réparation."Reception No");
                            LignereceptionserviceRapide1.VALIDATE("Line No.",10000);
                            LignereceptionserviceRapide1.VALIDATE(LignereceptionserviceRapide1."Type Effet CLT",LignereceptionserviceRapide1."Type Effet CLT"::"EFFET CLIENT");
                            LignereceptionserviceRapide1.VALIDATE(LignereceptionserviceRapide1."Créé par",Rec."Réçu par");
                            LignereceptionserviceRapide1.VALIDATE(LignereceptionserviceRapide1.Type,LignereceptionserviceRapide1.Type::Resource);
                            LignereceptionserviceRapide1.VALIDATE("Description symptome", Ligneréception."Intervention demandé /client");
                            LignereceptionserviceRapide1.VALIDATE(LignereceptionserviceRapide1.Statut,LignereceptionserviceRapide1.Statut::Création);
                            LignereceptionserviceRapide1.INSERT();
                            END
                            ELSE
                            IF Selection=1 THEN BEGIN
                            LigneReceptionGrandService.INIT;
                            LigneReceptionGrandService.VALIDATE("Reception No",Réparation."Reception No");
                            LigneReceptionGrandService.VALIDATE("Num ligne",10000);
                            LigneReceptionGrandService.VALIDATE(LigneReceptionGrandService."Type Effet CLT",LigneReceptionGrandService."Type Effet CLT"::"EFFET CLIENT");
                            LigneReceptionGrandService.VALIDATE(LigneReceptionGrandService."Créé par",Rec."Réçu par");
                            //LigneReceptionGrandService.VALIDATE(LigneReceptionGrandService.ty,LignereceptionserviceRapide1.Type::Resource);
                            LigneReceptionGrandService.VALIDATE("Description symptome", Ligneréception."Intervention demandé /client");
                            LigneReceptionGrandService.VALIDATE(LigneReceptionGrandService.Statut,LignereceptionserviceRapide1.Statut::Création);
                            LigneReceptionGrandService.INSERT();
                            END;
                    
                        Ligneréception."Dossier No." := Réparation."Reception No";
                        Ligneréception."Date Dossier" := WORKDATE;
                        Ligneréception.MODIFY;
                    
                        UNTIL Ligneréception.NEXT = 0;
                       END;

                end;
            }
            action("Lancer RDV")
            {
                Caption = 'Lancer RDV';
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    LIintnbrRDV : Integer;
                begin
                    CurrPage.UPDATE;
                    
                    //AK150419
                    /*
                    LIintnbrRDV:=0;
                    ResourceGroupKKK.RESET;
                    ResourceGroupKKK.SETRANGE("Centre de gestion","Responsibility Center");
                    ResourceGroupKKK.SETFILTER("Date Filter", '%1',"Date réception");
                    IF ResourceGroupKKK.FINDSET THEN
                      REPEAT
                          ResourceGroupKKK.CALCFIELDS("Sum RDV");
                          LIintnbrRDV+=ResourceGroupKKK."Sum RDV";
                    
                      UNTIL ResourceGroupKKK.NEXT=0 ;
                    
                    RecResponsibilityCenter.GET("Responsibility Center");
                    IF (LIintnbrRDV > RecResponsibilityCenter."Nbr RDV")   THEN
                      ERROR('Le Nbr MAX de RDV est atteint')
                    ELSE
                       MESSAGE('%1 /%2',LIintnbrRDV,RecResponsibilityCenter."Nbr RDV");
                    */
                    //ENDAK
                    
                       TESTFIELD("No. Téléphone demandeur");
                       IF CONFIRM('êtes vous sûre de vouloir confirmer cette demande ?',TRUE,FALSE) THEN
                         BEGIN
                            CLEAR(Réparation);
                            CLEAR(Ligneréception);
                            Ligneréception.SETFILTER(Ligneréception."No. Réception",'%1',"No. Réception");
                            Ligneréception.SETFILTER(Ligneréception."Accepter Réception",'%1',TRUE);
                            Ligneréception.SETFILTER(Ligneréception.Etat ,'%1',0);
                            Ligneréception.FIND('-');
                          REPEAT
                    
                         Ligneréception.TESTFIELD("Intervention demandé /client");
                         Ligneréception.TESTFIELD("Source Réclamation");
                         Ligneréception.TESTFIELD(Ligneréception."Lieu de réparation");
                         Ligneréception.Etat := Ligneréception.Etat::Lancer;
                         Ligneréception.MODIFY;
                        UNTIL Ligneréception.NEXT = 0;
                    
                        CLEAR(Réparation);
                        CLEAR(Ligneréception);
                        Ligneréception.SETFILTER(Ligneréception."No. Réception",'%1',"No. Réception");
                        Ligneréception.SETFILTER(Ligneréception."Accepter Réception",'%1',TRUE);
                        Ligneréception.SETFILTER(Ligneréception.Etat ,'%1',3);
                        IF Ligneréception.FIND('-') THEN
                        REPEAT
                         Ligneréception.TESTFIELD(Ligneréception."Motif Annulation Réclamation");
                         Ligneréception.Etat := Ligneréception.Etat::Annuler;
                         Ligneréception.MODIFY;
                        UNTIL Ligneréception.NEXT = 0;
                    
                       END;

                end;
            }
            action("Ré-Ouvrir")
            {
                Image = ReOpen;

                trigger OnAction();
                begin
                    IF CONFIRM('êtes vous sûre de vouloir Ré-ouvrir cette demande ?',TRUE,FALSE) THEN
                       BEGIN
                        CLEAR(Réparation);
                        CLEAR(Ligneréception);
                        Ligneréception.SETFILTER(Ligneréception."No. Réception",'%1',"No. Réception");
                        Ligneréception.SETFILTER(Ligneréception."Accepter Réception",'%1',TRUE);
                        Ligneréception.SETFILTER(Ligneréception.Etat ,'%1',Ligneréception.Etat::Lancer);
                        Ligneréception.FIND('-');
                        REPEAT
                          Ligneréception.TESTFIELD("Dossier No.",'');
                          Ligneréception.Etat := Ligneréception.Etat::Ouvert;
                          Ligneréception.MODIFY;
                        UNTIL Ligneréception.NEXT = 0;
                      END;
                end;
            }
        }
    }

    var
        "Réparation" : Record "60008";
        "PRRéparation" : Record "5902";
        "Ligneréception" : Record "60096";
        NoSeries : Record "308";
        ServiceMgtSetup : Record "5911";
        NoSeriesRelationship : Record "310";
        NoSeriesLine : Record "309";
        Customer : Record "18";
        ItemLedgerEntry : Record "32";
        "Ligneréception2" : Record "60096";
        Item : Record "27";
        EffetCLient : Record "60010";
        LignereceptionserviceRapide1 : Record "60010";
        UserSetup : Record "91";
        EffetCLient2 : Record "60010";
        LignereceptionserviceRapide2 : Record "60010";
        ServicePost : Codeunit "5980";
        Selection : Integer;
        Text000 : TextConst ENU='&Ship,&Invoice,Ship &and Invoice,Ship and &Consume',FRA='&SAV,&CHRONO';
        Text001 : TextConst ENU='Do you want to post the %1?',FRA='Souhaitez-vous valider le document %1 ?';
        TXT50000 : TextConst ENU='&Ship,&Invoice,Ship &and Invoice,Ship and &Consume',FRA='&SAV,&CHRONO';
        TXT50001 : TextConst ENU='&Ship,&Invoice,Ship &and Invoice,Ship and &Consume',FRA='&Atelier,&CHR1,&CHR2';
        SAV : Boolean;
        CHRONO : Boolean;
        EffetClient3 : Record "60012";
        LigneReceptionGrandService : Record "60012";
        SelectCentredegestion : Integer;
        Atelier : Boolean;
        CHR1 : Boolean;
        CHR2 : Boolean;
        ResourceGroupKKK : Record "152";
        KKKServiceMgtSetup : Record "5911";
        RecResponsibilityCenter : Record "5714";
        RecResourceGroup : Record "152";
}

