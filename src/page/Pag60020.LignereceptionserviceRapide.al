page 60020 "Ligne reception service Rapide"
{
    // version SAV Automobile

    InsertAllowed = true;
    PageType = ListPart;
    SourceTable = Table60010;

    layout
    {
        area(content)
        {
            field(Services;ItemService)
            {
                TableRelation = Item.No. WHERE (Type=CONST(Service));
                Visible = true;

                trigger OnLookup(Text : Text) : Boolean;
                var
                    LRecReceptionSAV : Record "60008";
                begin


                    //ajouter le code ici

                    IF RecGReception.GET(NumeroReception) THEN
                       BEGIN
                         //SM 280419
                          RecGNomSRVRapide.RESET;
                          RecGNomSRVRapide.SETRANGE(RecGNomSRVRapide."Vehicule No.",RecGReception."Model Code");
                          //SM
                       //SM TMP 170817 RecGNomSRVRapide.SETRANGE(RecGNomSRVRapide."Vehicule No.",RecGReception."Vehicle No.");
                        IF PAGE.RUNMODAL(PAGE::"Liste Nomenclature ServiceRap",RecGNomSRVRapide) = ACTION::LookupOK THEN
                          BEGIN
                           ItemService:= RecGNomSRVRapide."Item No." ;
                           //SM MAZDA672
                           IF RecGReception."Status SR" <> RecGReception."Status SR"::Facturée THEN BEGIN
                            RecGReception."Code Entretien" := RecGNomSRVRapide."Item No.";
                             //KT 170817
                             CASE RecGNomSRVRapide."Item No." OF
                               'E10000': BEGIN
                                 LRecReceptionSAV.RESET;
                                 LRecReceptionSAV.SETRANGE(VIN,RecGReception.VIN);
                                 LRecReceptionSAV.SETRANGE("Entretien 10 000",TRUE);
                                 LRecReceptionSAV.SETRANGE("Code Entretien",'E10000');
                                 IF LRecReceptionSAV.FINDFIRST THEN
                                   ERROR('Entretien déjà effectué');
                                 RecGReception.CALCFIELDS("OR Entretien 10 000");
                                 IF (RecGReception."Entretien 10 000") AND(RecGReception."OR Entretien 10 000"='') THEN BEGIN
                                   RecGReception.Intern:=TRUE;
                                   RecGReception."Intern Type":=RecGReception."Intern Type"::"Interne Commercial";
                                  END;
                              END;
                               'E20000': BEGIN
                                 LRecReceptionSAV.RESET;
                                 LRecReceptionSAV.SETRANGE(VIN,RecGReception.VIN);
                                 LRecReceptionSAV.SETRANGE("Entretien 20 000",TRUE);
                                 LRecReceptionSAV.SETRANGE("Code Entretien",'E20000');
                                 IF LRecReceptionSAV.FINDFIRST THEN
                                   ERROR('Entretien déjà effectué');
                                 RecGReception.CALCFIELDS("OR Entretien 20 000");
                                  IF (RecGReception."Entretien 20 000") AND (RecGReception."OR Entretien 20 000"='') THEN BEGIN
                                   RecGReception.Intern:=TRUE;
                                   RecGReception."Intern Type":=RecGReception."Intern Type"::"Interne Commercial";
                                  END;
                              END;
                               'E30000': BEGIN
                                 LRecReceptionSAV.RESET;
                                 LRecReceptionSAV.SETRANGE(VIN,RecGReception.VIN);
                                 LRecReceptionSAV.SETRANGE("Entretien 30 000",TRUE);
                                 LRecReceptionSAV.SETRANGE("Code Entretien",'E30000');
                                 IF LRecReceptionSAV.FINDFIRST THEN
                                   ERROR('Entretien déjà effectué');
                                 RecGReception.CALCFIELDS("OR Entretien 30 000");
                                IF (RecGReception."Entretien 30 000") AND (RecGReception."OR Entretien 30 000"='') THEN BEGIN
                                   RecGReception.Intern:=TRUE;
                                   RecGReception."Intern Type":=RecGReception."Intern Type"::"Interne Commercial";
                                END;
                              END;
                            END;
                    //END KT
                            RecGReception.MODIFY;
                           END;
                           //END SM
                            ValidateService(RecGNomSRVRapide."Item No.");
                           END

                       END;
                    //ExplodeLines;
                end;

                trigger OnValidate();
                var
                    RecGNomSRVRapide1 : Record "60011";
                    LRecRapidserviceBOMHeader : Record "60013";
                    LRecRapideserviceBOMLine : Record "60014";
                    LignereceptionserviceRapide : Record "60010";
                begin
                end;
            }
            field("Prix Total";"Prix Total")
            {
            }
            repeater(Group)
            {
                field("Reception No.";"Reception No.")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field(Quantity;Quantity)
                {
                }
                field(status;status)
                {
                }
                field("Prix Estimatif";"Prix Estimatif")
                {
                }
                field("% Remise Compagne";"% Remise Compagne")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord() : Boolean;
    begin

        CurrPage.UPDATE ;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        //"Unit Of Measure":="Unit Of Measure"::"0";
    end;

    var
        ItemService : Code[30];
        CuSrvMangment : Codeunit "50010";
        PageFicheRecp : Page "60014";
        NumeroReception : Code[30];
        RecRecpRap : Record "60008";
        RecGReception : Record "60008";
        RecGNomSRVRapide : Record "60011";
        NomenclatureServiceRapideK : Record "60011";
        TxtErr001 : Label '"Il existe plusieurs campagnes promotionnelles encours ! Veuillez contacter votre administrateur ! "';

    procedure ChargerNomenclature("No Reception" : Code[30];"Vehicule No" : Code[30];"Item SerNo" : Code[30]);
    var
        RecNomenclatureServRap : Record "60011";
        RecRapideBOMLine : Record "60014";
        RecRapidBOMHeader : Record "60013";
        RecLigneNew : Record "60010";
        XRecLigne : Record "60010";
        LigneNo : Integer;
        ReceptionSAV : Record "60008";
        AppliqueRemiseCompagne : Boolean;
        Customer : Record "18";
        NomoclatureServiceCompPromo : Record "50017";
        ClientCompagnePromo : Record "50016";
        CustOk : Boolean;
        NomenclatureOk : Boolean;
        Campaign : Record "5071";
        CampaignExist : Boolean;
        CampaignDiscount : Decimal;
        L_Item : Record "27";
    begin

        //---> Chercher la liste des nomenclature service
        IF RecNomenclatureServRap.GET("Item SerNo","Vehicule No") THEN
        BEGIN
           //---> Vérifier la statu de la nomenclature
           RecNomenclatureServRap.TESTFIELD(RecNomenclatureServRap."Kit No.");
           //KK___Remise Compagne
           CampaignExist := FALSE;
           Campaign.RESET;
           Campaign.SETFILTER("Starting Date",'<=%1',WORKDATE);
           Campaign.SETFILTER("Ending Date",'>=%1',WORKDATE);
           IF Campaign.COUNT > 1 THEN
             ERROR(TxtErr001);
           IF Campaign.FINDFIRST THEN
             BEGIN
               CampaignExist := TRUE;
               CampaignDiscount := Campaign."% Remise";
               AppliqueRemiseCompagne := FALSE;
               IF (Campaign."Tous les Clients") THEN
                 AppliqueRemiseCompagne := TRUE;

               IF NOT AppliqueRemiseCompagne THEN
                 BEGIN
                   //Check Customer
                   CustOk := FALSE;
                   NomenclatureOk := FALSE;
                   IF Campaign."Tous les Clients" THEN
                     CustOk := TRUE
                   ELSE
                     BEGIN
                       ReceptionSAV.GET("Reception No.");
                       Customer.GET(ReceptionSAV."Customer No.");
                       Customer.TESTFIELD("Customer Posting Group");

                       ClientCompagnePromo.RESET;
                       ClientCompagnePromo.SETRANGE("No. Compagne",Campaign."No.");
                       ClientCompagnePromo.SETRANGE("Groupe Compta. Client",Customer."Customer Posting Group");
                       IF ClientCompagnePromo.FINDFIRST THEN
                         CustOk := TRUE;
                      END;

        //           IF CustOk THEN
        //             BEGIN
        //               //Check nomenclature
        //               IF Campaign."Toutes les nomenclatures" THEN
        //                 NomenclatureOk := TRUE
        //               ELSE
        //                 BEGIN
        //                   NomoclatureServiceCompPromo.RESET;
        //                   NomoclatureServiceCompPromo.SETRANGE("No. Compagne",Campaign."No.");
        //                   NomoclatureServiceCompPromo.SETRANGE("Code Nomenclature","Item SerNo");
        //                   IF NomoclatureServiceCompPromo.FINDFIRST THEN
        //                     NomenclatureOk := TRUE;
        //                  END;
        //             END;

                  IF CustOk AND CampaignExist THEN
                    AppliqueRemiseCompagne := TRUE;
                 END;
             END;
           //END KK
           CLEAR(RecRapidBOMHeader);
           IF RecRapidBOMHeader.GET(RecNomenclatureServRap."Kit No.") //AND
            // ( RecRapidBOMHeader.Status=RecRapidBOMHeader.Status::Certified )
             THEN
           BEGIN
                RecRapideBOMLine.SETRANGE(RecRapideBOMLine."Rapid Service BOM No.",RecRapidBOMHeader."No.");
                IF RecRapideBOMLine.FINDFIRST THEN
                   REPEAT
                         //---> Entrer les lignes Réception
                         RecLigneNew.INIT;
                         RecLigneNew."Reception No.":="Reception No.";
                         RecLigneNew.Type:=RecRapideBOMLine.Type;
                         RecLigneNew."Type opération" :=RecLigneNew."Type opération"::"rapid service";
                         RecLigneNew.VALIDATE("No.",RecRapideBOMLine."No.");
                         RecLigneNew.Quantity:=RecRapideBOMLine.Quantity;
                         // RecLigneNew.Gratuit := RecRapideBOMLine.Gratuit;
                         IF AppliqueRemiseCompagne THEN
                           BEGIN
                             IF RecLigneNew.Type = RecLigneNew.Type::Item THEN
                               BEGIN
                                 L_Item.GET(RecLigneNew."No.");
                                 L_Item.TESTFIELD("Product Code");

                                 NomoclatureServiceCompPromo.RESET;
                                 NomoclatureServiceCompPromo.SETRANGE("No. Compagne",Campaign."No.");
                                 NomoclatureServiceCompPromo.SETRANGE("Product Code",L_Item."Product Code");
                                 IF NomoclatureServiceCompPromo.FINDFIRST THEN
                                   RecLigneNew."% Remise Compagne" := CampaignDiscount;
                               END;
                           END;
                         RecLigneNew.INSERT(TRUE);
                         //CLEAR(RecLigneNew);
                   UNTIL RecRapideBOMLine.NEXT=0
               ELSE ERROR('La Nomenclature n'' %1 pas des lignes service !',RecNomenclatureServRap."Kit No.")
           END
           ELSE ERROR('La nomenclature N° %1 n''est pas validé ! ',RecRapidBOMHeader."No.")

        END;
        //TMP KT 140917 ELSE ERROR('Le service %1 n''a pas une nomenclature de services !', "Item SerNo");
        CurrPage.UPDATE;
    end;

    procedure SetNumReception(NumReception : Code[20]);
    begin
        NumeroReception := NumReception;
    end;

    procedure ValidateService(Service : Code[30]);
    begin
        IF RecRecpRap.GET(NumeroReception) THEN
        BEGIN
             RecRecpRap.TESTFIELD(RecRecpRap."Vehicle No.");
             //KK_
             //OLD ChargerNomenclature(NumeroReception,RecRecpRap."Vehicle No.",Service);
             ChargerNomenclature(NumeroReception,RecRecpRap."Model Code",Service);
        END
        ELSE ERROR('Fiche réparation rapide N° %1 n''existe pas! ',NumeroReception);
    end;

    local procedure ExplodeLines();
    var
        RecGNomSRVRapide1 : Record "60011";
        LRecRapidserviceBOMHeader : Record "60013";
        LRecRapideserviceBOMLine : Record "60014";
        LignereceptionserviceRapide : Record "60010";
    begin
        IF RecGNomSRVRapide1.GET(ItemService) THEN
        IF LRecRapidserviceBOMHeader.GET(RecGNomSRVRapide1."Kit No.") THEN BEGIN
          LRecRapideserviceBOMLine.SETRANGE("Rapid Service BOM No.",LRecRapidserviceBOMHeader."No.");
          IF LRecRapideserviceBOMLine.FINDSET THEN
            REPEAT
              LignereceptionserviceRapide.INIT;
              LignereceptionserviceRapide."Reception No.":="Reception No.";
              LignereceptionserviceRapide.Type:=LRecRapideserviceBOMLine.Type;
              LignereceptionserviceRapide."No.":=LRecRapideserviceBOMLine."No.";
              LignereceptionserviceRapide.INSERT(TRUE);
            UNTIL LRecRapideserviceBOMLine.NEXT=0;
            END;
        CurrPage.UPDATE;
    end;
}

