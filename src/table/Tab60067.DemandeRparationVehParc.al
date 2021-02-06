table 60067 "Demande Réparation Veh. Parc"
{
    // version MAZDA1004

    // <<-- ADD KK MAAZDA1004 160316
    // Entête demande de réparation des voitures du parc -->>


    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"No Article Service";Code[20])
        {
            TableRelation = "Service Item";

            trigger OnValidate();
            begin
                ServiceItem.RESET;
                ServiceItem.SETRANGE("No.","No Article Service");
                IF ServiceItem.FINDFIRST THEN BEGIN
                  "Model Code" := ServiceItem."Item No.";
                  VIN          := ServiceItem."Serial No.";
                  Matricule    := ServiceItem.Matricule;
                END;
            end;
        }
        field(3;"Operation Type";Option)
        {
            Caption = 'Type Opération';
            OptionCaption = '" ,Service Rapide,Grands Travaux,Lavage,Réparation Externe"';
            OptionMembers = " ","Service Rapide","Grands Travaux",Lavage,"Réparation Externe";

            trigger OnValidate();
            begin
                IF xRec."Operation Type" <> "Operation Type" THEN
                  "Code Entretien" := '';

                IF xRec."Operation Type"<>"Operation Type" THEN BEGIN
                  LigneRepGS.RESET;
                  LigneRepGS.SETRANGE(LigneRepGS."Reparation No","No.");
                  IF LigneRepGS.FINDSET THEN
                    LigneRepGS.DELETEALL;
                END;
            end;
        }
        field(4;"Model Code";Text[50])
        {
            CaptionML = ENU='Model Code',
                        FRA='Code Modèle';
        }
        field(5;"Code Entretien";Code[20])
        {
            Editable = false;
            TableRelation = Item;

            trigger OnLookup();
            begin
                // ADD KK MAZDA1004
                IF "Model Code"='' THEN
                  ERROR(TXT50000);

                IF "Operation Type"=0 THEN
                  ERROR(TXT50001);

                IF "Operation Type" = "Operation Type"::"Service Rapide" THEN BEGIN
                  RecGNomSRVRapide.SETRANGE(RecGNomSRVRapide."Vehicule No.","Model Code");
                  IF PAGE.RUNMODAL(PAGE::"Liste Nomenclature ServiceRap",RecGNomSRVRapide) = ACTION::LookupOK THEN
                    BEGIN
                     "Code Entretien" :=  RecGNomSRVRapide."Item No.";
                    END;
                END;
                //END MAZDA1004
            end;

            trigger OnValidate();
            begin
                TESTFIELD("Operation Type");
            end;
        }
        field(6;Commentaire;Text[250])
        {
        }
        field(7;"Zone Panne 1";Code[20])
        {
        }
        field(8;"Symptome 1";Code[20])
        {
            TableRelation = "Symptom Code";
        }
        field(9;"Zone Panne 2";Code[20])
        {
        }
        field(10;"Symptome 2";Code[20])
        {
            TableRelation = "Symptom Code";
        }
        field(11;"Zone Panne 3";Code[20])
        {
        }
        field(12;"Symptome 3";Code[20])
        {
            TableRelation = "Symptom Code";
        }
        field(13;"Description Achat";Text[250])
        {
        }
        field(14;"Fiche Réception Liée";Code[20])
        {
        }
        field(15;"Commande Achat Liée";Code[20])
        {
        }
        field(16;"Date Création";DateTime)
        {
        }
        field(17;"Crée Par";Code[50])
        {
        }
        field(18;"Date Modification";DateTime)
        {
        }
        field(19;"Modifiée Par";Code[50])
        {
        }
        field(20;"Approbation RH";Option)
        {
            OptionCaption = 'Ouvert,Demande Envoyé,Approuvé,Refusé';
            OptionMembers = Ouvert,"Demande Envoyé","Approuvé","Refusé";
        }
        field(21;"Lavage Approuver";Boolean)
        {
        }
        field(22;"Date Approbation";DateTime)
        {
        }
        field(23;"Date Envoie Demande";DateTime)
        {
        }
        field(24;"No. Series";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(25;"No Réception SAV";Code[20])
        {
        }
        field(26;VIN;Code[20])
        {
        }
        field(27;Matricule;Code[20])
        {

            trigger OnValidate();
            begin
                CLEAR(ServiceItem);
                ServiceItem.SETRANGE(Matricule,Matricule);
                IF ServiceItem.FINDFIRST THEN
                  VALIDATE("No Article Service",ServiceItem."No.")
                ELSE
                  ERROR(TXT50004,Matricule);
            end;
        }
        field(28;"No Devis Client";Code[20])
        {
        }
        field(29;"Status SR";Option)
        {
            CalcFormula = Lookup("Reception SAV"."Status SR" WHERE (Reception No=FIELD(No Réception SAV)));
            Caption = 'Status SR';
            Editable = false;
            FieldClass = FlowField;
            OptionMembers = "Fiche Crée","Lancée","Commande Crée","Pièces demandé","Facturée","Annulé","Livré",Suspendu;
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
        TESTFIELD("Approbation RH","Approbation RH"::Ouvert);
    end;

    trigger OnInsert();
    begin
        //ADD KK MAZDA1004
        ServiceMgtSetup.GET;
        ServiceMgtSetup.TESTFIELD("No. Demande réparation");
        IF "No." = '' THEN BEGIN
          NoSeriesMgt.InitSeries(ServiceMgtSetup."No. Demande réparation",xRec."No.",TODAY,"No.","No. Series");
        END;

        "Crée Par"      := USERID;
        "Date Création" := CURRENTDATETIME;
        //END KK MAZDA1004
    end;

    trigger OnModify();
    begin
        //ADD KK MAZDA1004
        IF (xRec."Approbation RH"="Approbation RH") THEN
          TESTFIELD("Approbation RH","Approbation RH"::Ouvert);

        "Modifiée Par"      := USERID;
        "Date Modification" := CURRENTDATETIME;
        //END KK MAZDA1004
    end;

    var
        ServiceMgtSetup : Record "5911";
        NoSeriesMgt : Codeunit "396";
        ServiceItem : Record "5940";
        RecGNomSRVRapide : Record "60011";
        TXT50000 : Label 'Veuillez spécifier l''article de service !';
        TXT50001 : Label 'Veuillez spécifier le type d''opération à faire !';
        LigneRepGS : Record "60068";
        TXT50002 : Label '"Voulez vous consulter la fiche crée ? "';
        FicheReceptionSR : Page "60014";
        FicheReceptionGS : Page "60018";
        TXT50003 : Label '"Vous n''avez pas le droit de créer une fiche réception SAV ! "';
        TXT50004 : Label '"Matricule %1 n''existe pas ! "';

    procedure CreationFicheReception(var DemandeReparation : Record "60067");
    var
        ReceptionSAV : Record "60008";
        LigneReceptionGS : Record "60012";
        LigneReparationGS : Record "60068";
        PLigneRecepServiceRapide : Page "60020";
        UserSetup : Record "91";
    begin
        UserSetup.GET(USERID);
        IF NOT UserSetup."Créer RecepSav" THEN
          ERROR(TXT50003);

        // Création Fiche réception
        ReceptionSAV.INIT;
        ReceptionSAV."Reception No" := '';
        ReceptionSAV.VALIDATE("Service Item No.",DemandeReparation."No Article Service");
        ReceptionSAV.VALIDATE(ReceptionSAV.VIN,VIN);


        IF DemandeReparation."Operation Type" = DemandeReparation."Operation Type"::"Grands Travaux" THEN BEGIN
          ReceptionSAV.VALIDATE("Service Type",ReceptionSAV."Service Type"::"Big Service");
        END ELSE
          IF DemandeReparation."Operation Type" = DemandeReparation."Operation Type"::"Service Rapide" THEN BEGIN
            ReceptionSAV.VALIDATE("Service Type",ReceptionSAV."Service Type"::"Rapid Service");
            ReceptionSAV."Code Entretien" := DemandeReparation."Code Entretien";
          END;

        ReceptionSAV.INSERT(TRUE);

        // Charger nomenclature code entretien service rapide
        IF DemandeReparation."Operation Type" = DemandeReparation."Operation Type"::"Service Rapide" THEN BEGIN
          // PLigneRecepServiceRapide.SetNumReception(ReceptionSAV."Reception No");
          ValidateService(ReceptionSAV."Code Entretien",ReceptionSAV."Reception No");
        END;

        // Insertion Ligne Réception si type d'opération grand service
        IF DemandeReparation."Operation Type" = DemandeReparation."Operation Type"::"Grands Travaux" THEN BEGIN
          LigneReparationGS.RESET;
          LigneReparationGS.SETRANGE("Reparation No",DemandeReparation."No.");
          IF LigneReparationGS.FINDSET THEN
            REPEAT
              LigneReceptionGS.INIT;
              LigneReceptionGS."Reception No"          := ReceptionSAV."Reception No";
              LigneReceptionGS."Code Zone panne"       := LigneReparationGS."Code Zone panne";
              LigneReceptionGS."Code Symptome"         := LigneReparationGS."Code Symptome";
              LigneReceptionGS."Description symptome"  := LigneReparationGS."Description symptome";
              LigneReceptionGS."Description Zone"      := LigneReparationGS."Description Zone";
              LigneReceptionGS.INSERT(TRUE);
            UNTIL LigneReparationGS.NEXT=0;
        END;

        //Affectation numéro réception SAV à la demande de réparation
        DemandeReparation."No Réception SAV" := ReceptionSAV."Reception No";
        DemandeReparation.MODIFY;

        IF CONFIRM(TXT50002) THEN BEGIN
          IF DemandeReparation."Operation Type" = DemandeReparation."Operation Type"::"Grands Travaux" THEN
            PAGE.RUN(60018,ReceptionSAV)
          ELSE
          IF DemandeReparation."Operation Type" = DemandeReparation."Operation Type"::"Service Rapide" THEN
            PAGE.RUN(60014,ReceptionSAV)
        END;
    end;

    procedure ChargerNomenclature("No Reception" : Code[20];"Vehicule No" : Code[20];"Item SerNo" : Code[20]);
    var
        RecNomenclatureServRap : Record "60011";
        RecRapideBOMLine : Record "60014";
        RecRapidBOMHeader : Record "60013";
        RecLigneNew : Record "60010";
        XRecLigne : Record "60010";
        LigneNo : Integer;
    begin
        //---> Chercher la liste des nomenclature service
        IF RecNomenclatureServRap.GET("Item SerNo","Vehicule No") THEN
        BEGIN
           //---> Vérifier la statu de la nomenclature
           RecNomenclatureServRap.TESTFIELD(RecNomenclatureServRap."Kit No.");
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
                         RecLigneNew."Reception No.":="No Reception";
                         RecLigneNew.Type:=RecRapideBOMLine.Type;
                         RecLigneNew."Type opération" :=RecLigneNew."Type opération"::"rapid service";
                         RecLigneNew.VALIDATE("No.",RecRapideBOMLine."No.");
                         RecLigneNew.Quantity:=RecRapideBOMLine.Quantity;
                         RecLigneNew.INSERT(TRUE);
                         //CLEAR(RecLigneNew);
                   UNTIL RecRapideBOMLine.NEXT=0
               ELSE ERROR('La Nomenclature n'' %1 pas des lignes service !',RecNomenclatureServRap."Kit No.")
           END
           ELSE ERROR('La nomenclature N° %1 n''est pas validé ! ',RecRapidBOMHeader."No.")
        END
        ELSE ERROR('Le service %1 n''a pas une nomenclature de services !', "Item SerNo");
        // CurrPage.UPDATE;
    end;

    procedure ValidateService(Service : Code[20];NumeroReception : Code[20]);
    var
        RecRecpRap : Record "60008";
    begin
        IF RecRecpRap.GET(NumeroReception) THEN
        BEGIN
             RecRecpRap.TESTFIELD(RecRecpRap."Vehicle No.");
             ChargerNomenclature(NumeroReception,RecRecpRap."Vehicle No.",Service);
        END
        ELSE ERROR('Fiche réparation rapide N° %1 n''existe pas! ',NumeroReception);
    end;
}

