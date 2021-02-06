table 70025 "Dossier Import Fact. Four."
{
    DrillDownPageID = 70063;
    LookupPageID = 70063;

    fields
    {
        field(1;"Line No";Integer)
        {
        }
        field(2;"No. Dossier Import";Code[20])
        {
        }
        field(3;"No. Facture Fournisseur";Code[20])
        {
        }
        field(4;"No. Dossier Finance PR";Code[25])
        {
            Description = 'RH pour la partie Finance PR';
        }
        field(5;"No. Arrivage PR";Code[20])
        {
        }
        field(6;"Autres factures";Code[20])
        {
        }
        field(7;"Désignation";Text[250])
        {
        }
        field(8;"Total Poid Brut Par Facture";Decimal)
        {
            CalcFormula = Sum("Dossier Import / Colis"."Total Poid Brut Par Colis" WHERE (No. Arrivage PR=FIELD(No. Arrivage PR),
                                                                                          No. Facture Fournisseur=FIELD(No. Facture Fournisseur)));
            FieldClass = FlowField;
        }
        field(9;"Total Volume Par Facture";Decimal)
        {
            CalcFormula = Sum("Dossier Import / Colis"."Total Volume Par Colis" WHERE (No. Arrivage PR=FIELD(No. Arrivage PR),
                                                                                       No. Facture Fournisseur=FIELD(No. Facture Fournisseur)));
            FieldClass = FlowField;
        }
        field(10;"Total Montant Par Facture";Decimal)
        {
            FieldClass = Normal;
        }
        field(11;"Total Poid Net Par Facture";Decimal)
        {
            CalcFormula = Sum("Dossier Import / Colis"."Total Poid Net Par Colis" WHERE (No. Arrivage PR=FIELD(No. Arrivage PR),
                                                                                         No. Facture Fournisseur=FIELD(No. Facture Fournisseur)));
            FieldClass = FlowField;
        }
        field(12;"Nbre. Colis Par Facture";Integer)
        {
            CalcFormula = Sum("Dossier Import / Colis"."Nbre. Colis" WHERE (No. Arrivage PR=FIELD(No. Arrivage PR),
                                                                            No. Facture Fournisseur=FIELD(No. Facture Fournisseur)));
            FieldClass = FlowField;
        }
        field(13;"Date Facture";Date)
        {
        }
        field(14;Device;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(15;Coefficient;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Montant Facture";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Poid Brut";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Poid Net";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19;Volume;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Shipment date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Estimated time of arrival";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Total Montant Importer";Decimal)
        {
            CalcFormula = Sum("Arrivage PR"."Total Line Montant" WHERE (No. Facture=FIELD(No. Facture Fournisseur),
                                                                        No. Arrivage=FIELD(No. Arrivage PR)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No. Arrivage PR","No. Facture Fournisseur")
        {
        }
    }

    fieldgroups
    {
    }

    var
        RecEnteteFacturePRColis : Record "70060";
        RecArrivagePR : Record "70017";

    procedure SetDossFin(EnteteFacturePRColis : Record "70060");
    begin
        //HR 23/10/16
        RecEnteteFacturePRColis.GET(EnteteFacturePRColis."No.");
    end;

    procedure FctSetArrivagePR(ArrivagePR : Record "70017");
    begin
        RecArrivagePR.SETRANGE("No. Arrivage",ArrivagePR."No. Arrivage");
        IF RecArrivagePR.FINDFIRST THEN;
    end;

    procedure FctCreateInvLinesFinance(var PRecArrivagePR : Record "70017";PCdeDossierImport : Code[20]);
    var
        Window : Dialog;
        LineCount : Integer;
        LrecLigneFacturesPRClois : Record "70061";
        LrecLigneFacturesPRClois2 : Record "70061";
        RecDossierImportFactFour : Record "70025";
        RecDossierImportColis : Record "70072";
    begin
        WITH PRecArrivagePR DO
        BEGIN
          IF FINDSET THEN BEGIN
            REPEAT
             RecDossierImportFactFour.INIT;
             RecDossierImportFactFour."Line No"  :=FctGetnextLineNo(PCdeDossierImport) + 10000;
             RecDossierImportFactFour.VALIDATE("No. Dossier Import",PCdeDossierImport);
             RecDossierImportFactFour. VALIDATE("No. Facture Fournisseur",PRecArrivagePR."No. Facture");
             RecDossierImportFactFour."No. Arrivage PR":= PRecArrivagePR."No. Arrivage";
             IF  RecDossierImportFactFour.INSERT THEN;
             RecDossierImportColis.RESET;
             RecDossierImportColis.SETRANGE("No. Dossier Import",PCdeDossierImport);
             RecDossierImportColis.SETRANGE("No Colis",PRecArrivagePR."Numero Colis");
             IF NOT RecDossierImportColis.FINDFIRST THEN
               BEGIN
                 RecDossierImportColis.INIT;
                 RecDossierImportColis."No. Dossier Import"     := PCdeDossierImport;
                 RecDossierImportColis."No Colis" := PRecArrivagePR."Numero Colis";
                 RecDossierImportColis."No. Facture Fournisseur" :=PRecArrivagePR."No. Facture";
                 RecDossierImportColis."Autres factures" := '';
                 RecDossierImportColis.Désignation   := '';
                 IF  RecDossierImportColis.INSERT THEN;
               END
                  ELSE
                    BEGIN
                      IF RecDossierImportColis."No. Facture Fournisseur" <> PRecArrivagePR."No. Facture" THEN
                        BEGIN
                         RecDossierImportColis."Autres factures" := RecDossierImportColis."No. Facture Fournisseur" + '|' + PRecArrivagePR."No. Facture";
                         RecDossierImportColis.Désignation   := 'Colis Commun' ;
                         RecDossierImportColis.MODIFY;
                       END;
                    END;

             UNTIL NEXT = 0;
          END;
        END;
    end;

    local procedure FctGetnextLineNo(PCdeDossierImport : Code[20]) : Integer;
    var
        RecDossierImportFactFour : Record "70025";
    begin
        RecDossierImportFactFour.RESET;
        RecDossierImportFactFour.SETRANGE("No. Dossier Import",PCdeDossierImport);
        IF RecDossierImportFactFour.FINDLAST THEN
          EXIT(RecDossierImportFactFour."Line No")
         ELSE
            EXIT(0);
    end;
}

