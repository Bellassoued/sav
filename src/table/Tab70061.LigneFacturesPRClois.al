table 70061 "Ligne Factures P.R /Clois"
{
    // version Finance Achat PR


    fields
    {
        field(1;"No. Document";Code[20])
        {
        }
        field(2;"No Facture";Code[20])
        {
        }
        field(3;"Date Facture";Date)
        {
        }
        field(4;"Montant Devise";Decimal)
        {
        }
        field(5;"Nbr Colis";Integer)
        {
        }
        field(6;Volume;Decimal)
        {
        }
        field(7;"Poid Brut";Decimal)
        {
        }
        field(8;"Cour du jour";Decimal)
        {
        }
        field(9;"Montant Tnd";Decimal)
        {
        }
        field(10;"No. Ligne";Integer)
        {
        }
        field(11;"Origine d'embarquement";Code[20])
        {
            TableRelation = "Origine d'embarquement".Code;
        }
        field(19;"No. Arrivage PR";Code[20])
        {
            TableRelation = "Entete Arrivage PR"."No. Arrivage";
        }
        field(20;"Poid Net";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"No. Document","No. Arrivage PR","No Facture")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        RecDossierImportFactFour.RESET;
        RecDossierImportFactFour.SETRANGE("No. Arrivage PR","No. Arrivage PR");
        RecDossierImportFactFour.SETRANGE("No. Facture Fournisseur","No Facture");
        IF RecDossierImportFactFour.FINDFIRST THEN
          BEGIN
            RecDossierImportFactFour."No. Dossier Import" := '';
            RecDossierImportFactFour.MODIFY;
          END;
        RecRécupColisFact.RESET;
        RecRécupColisFact.SETRANGE("No. Dossier Arrivage","No. Document");
        RecRécupColisFact.SETRANGE("No. Facture Origine","No Facture");
        IF RecRécupColisFact.FINDSET THEN
          REPEAT
            RecRécupColisFact.DELETE;
          UNTIL RecRécupColisFact.NEXT =0;
    end;

    trigger OnInsert();
    begin
        RecEntêteFacturePRColis.GET("No. Document");
    end;

    var
        RecEnteteFacturePRColis : Record "70060";
        Text0001 : TextConst ENU='Creating Sales Invoice Lines\',FRA='Création de lignes facture vente\';
        Text0002 : TextConst ENU='Inserted lines             #1######',FRA='Lignes insérées             #1######';
        NextLineNo : Integer;
        RecDossierImportFactFour : Record "70025";
        "RecRécupColisFact" : Record "70064";
        "RecEntêteFacturePRColis" : Record "70060";

    procedure SetFactPrFinance(EnteteFacturePRColis : Record "70060");
    begin
        RecEnteteFacturePRColis.GET(EnteteFacturePRColis."No.");
    end;

    procedure FctCreateInvLinesFinance(var RecDossierImportFactFour : Record "70025");
    var
        Window : Dialog;
        LineCount : Integer;
        LrecLigneFacturesPRClois : Record "70061";
        LrecLigneFacturesPRClois2 : Record "70061";
        LRecDossierImportColis : Record "70072";
        LRecRecupColisFact : Record "70064";
        LDecMontantTND : Decimal;
        LRecEnteteArrivagePR : Record "70020";
    begin
        WITH RecDossierImportFactFour DO
        BEGIN

          IF FINDSET THEN BEGIN
            LrecLigneFacturesPRClois.LOCKTABLE;
            LrecLigneFacturesPRClois.SETRANGE("No. Document",RecEnteteFacturePRColis."No.");
            Window.OPEN(Text0001 + Text0002);

           REPEAT
            LRecEnteteArrivagePR.RESET;
            LRecEnteteArrivagePR.SETRANGE("No. Arrivage",RecDossierImportFactFour."No. Arrivage PR");
            IF LRecEnteteArrivagePR.FINDFIRST THEN
              LRecEnteteArrivagePR.TESTFIELD(Statut,LRecEnteteArrivagePR.Statut::Lancer);
              IF LRecEnteteArrivagePR.Vérifier THEN
              BEGIN
                  CLEAR(LrecLigneFacturesPRClois2);
                  LrecLigneFacturesPRClois2.SETRANGE("No. Document",RecEnteteFacturePRColis."No.");
                  LrecLigneFacturesPRClois2.SETRANGE("No Facture",RecDossierImportFactFour."No. Facture Fournisseur");
                  IF LrecLigneFacturesPRClois2.FINDFIRST THEN
                    LrecLigneFacturesPRClois2.DELETE;

                 LineCount := LineCount + 1;
                  Window.UPDATE(1,LineCount);

                  IF LrecLigneFacturesPRClois.FIND('+') THEN
                     NextLineNo := LrecLigneFacturesPRClois."No. Ligne" + 10000
                      ELSE
                          NextLineNo := 10000;
                   LDecMontantTND := 0;
                  LrecLigneFacturesPRClois.INIT;
                  LrecLigneFacturesPRClois."No. Ligne" := NextLineNo;
                  LrecLigneFacturesPRClois."No. Document" := RecEnteteFacturePRColis."No.";
                  NextLineNo := NextLineNo + 10000;
                  LrecLigneFacturesPRClois.VALIDATE("No Facture",RecDossierImportFactFour."No. Facture Fournisseur");
                  LrecLigneFacturesPRClois."No. Arrivage PR" := RecDossierImportFactFour."No. Arrivage PR";
                  LrecLigneFacturesPRClois."Date Facture" := RecDossierImportFactFour."Date Facture";
                 // CALCFIELDS("Total Montant Par Facture","Nbre. Colis Par Facture","Total Poid Brut Par Facture","Total Poid Net Par Facture","Total Volume Par Facture");
                  CALCFIELDS("Nbre. Colis Par Facture");
                  LrecLigneFacturesPRClois."Poid Brut" :="Total Poid Brut Par Facture";
                  LrecLigneFacturesPRClois.VALIDATE("Montant Devise" ,"Montant Facture");
                  LDecMontantTND := LrecLigneFacturesPRClois."Montant Devise" * RecEnteteFacturePRColis."Cous du jour";
                  LrecLigneFacturesPRClois.VALIDATE("Montant Tnd" ,LDecMontantTND);
                  LrecLigneFacturesPRClois."Nbr Colis" := "Nbre. Colis Par Facture";
                  LrecLigneFacturesPRClois."Poid Net" := "Poid Net";
                  LrecLigneFacturesPRClois.Volume := Volume;
                  LrecLigneFacturesPRClois.INSERT(TRUE);

                  RecDossierImportFactFour."No. Dossier Import" :=RecEnteteFacturePRColis."No.";
                  RecDossierImportFactFour.MODIFY;
                  UpdateDossierImportFactFour(RecDossierImportFactFour,RecEnteteFacturePRColis."No.");

                  LRecDossierImportColis.RESET;
                  LRecDossierImportColis.SETRANGE("No. Arrivage PR",RecDossierImportFactFour."No. Arrivage PR");
                  LRecDossierImportColis.SETRANGE("No. Facture Fournisseur",LrecLigneFacturesPRClois."No Facture");
                  IF LRecDossierImportColis.FINDSET THEN
                    REPEAT
                      LRecRecupColisFact.RESET;
                      LRecRecupColisFact.SETRANGE("No. Dossier Arrivage",LrecLigneFacturesPRClois."No. Document");
                      LRecRecupColisFact.SETRANGE("No. Colis",LRecDossierImportColis."No Colis");
                      IF NOT LRecRecupColisFact.FINDFIRST THEN
                        BEGIN
                          LRecRecupColisFact.INIT;
                          LRecRecupColisFact."No. Dossier Arrivage":= LrecLigneFacturesPRClois."No. Document";
                          LRecRecupColisFact."No. Facture Origine" := LrecLigneFacturesPRClois."No Facture";
                          LRecRecupColisFact."No. Colis":= LRecDossierImportColis."No Colis";
                          LRecDossierImportColis.CALCFIELDS("Total Montant Par Colis");
                          LRecRecupColisFact."Total Montant" := LRecDossierImportColis."Total Montant Par Colis";
                          LRecRecupColisFact."Autres factures" := LRecDossierImportColis."Autres factures";
                          LRecRecupColisFact.Désignation := LRecDossierImportColis.Désignation;
                          LRecRecupColisFact."No. Cmd Achat" := LRecDossierImportColis."No. Commande Achat";
                          LRecRecupColisFact.Urgent := LRecDossierImportColis.Urgent;
                          IF LRecRecupColisFact.INSERT THEN;
                        END

                    UNTIL LRecDossierImportColis.NEXT = 0;
              END
                ELSE
                   BEGIN
                     ERROR('Le dossier Facture Colis N° %1 Contient des erreurs',RecDossierImportFactFour."No. Arrivage PR");
                   END;
            UNTIL NEXT = 0;

          END;
        END;
    end;

    local procedure UpdateDossierImportFactFour(RecGDossierImportFactFour : Record "70025";NoDossFinanaceFactPR : Code[20]);
    var
        RecLDossierImportFactFour : Record "70025";
    begin
        RecLDossierImportFactFour.SETRANGE("No. Facture Fournisseur",RecGDossierImportFactFour."No. Facture Fournisseur");
        IF RecLDossierImportFactFour.FINDFIRST THEN
          BEGIN
        RecLDossierImportFactFour."No. Dossier Finance PR" := NoDossFinanaceFactPR;
        RecLDossierImportFactFour.MODIFY;
        END;
    end;
}

