table 70017 "Arrivage PR"
{
    DrillDownPageID = 70021;
    LookupPageID = 70021;

    fields
    {
        field(1;"Entry No.";Integer)
        {
        }
        field(2;"Numero UT";Code[10])
        {
        }
        field(3;"Date UT";Date)
        {
        }
        field(4;Mag;Code[10])
        {
        }
        field(5;"Numero Colis";Code[20])
        {

            trigger OnValidate();
            begin
                
                RecDossierImportColis.RESET;
                RecDossierImportColis.SETRANGE("No. Arrivage PR","No. Arrivage");
                RecDossierImportColis.SETRANGE("No Colis","Numero Colis");
                 RecDossierImportColis.SETRANGE("No. Facture Fournisseur","No. Facture");
                IF NOT RecDossierImportColis.FINDFIRST THEN
                BEGIN
                  RecDossierImportColis.INIT;
                  //RecDossierImportColis."No. Dossier Import"     := PCdeDossierImport;
                  RecDossierImportColis."No. Arrivage PR" := "No. Arrivage";
                  RecDossierImportColis."No Colis" := "Numero Colis";
                  RecDossierImportColis."No. Facture Fournisseur":="No. Facture";
                  RecDossierImportColis.Désignation   := '';
                  /*
                  RecDossierImportColis."No. Commande Achat":=CdeNocommande;
                  RecDossierImportColis.Urgent := BolUrgent;
                  */
                  RecDossierImportColis."Nbre. Colis" :=1;
                  RecDossierImportColis.INSERT;
                END
                 ELSE
                   ERROR('');

            end;
        }
        field(6;"Poids Brut Colis";Decimal)
        {
        }
        field(7;"Poids Net Colis";Decimal)
        {
        }
        field(8;"Dimension Colis";Decimal)
        {
        }
        field(9;"No. Client DPR";Code[10])
        {
        }
        field(10;"No. Facture";Code[20])
        {

            trigger OnValidate();
            begin
                FctGetArrivagePR("No. Arrivage");
                RecDossierImportFactFour.RESET;
                RecDossierImportFactFour.SETRANGE("No. Arrivage PR","No. Arrivage");
                RecDossierImportFactFour.SETRANGE("No. Facture Fournisseur","No. Facture");
                IF NOT RecDossierImportFactFour.FINDFIRST THEN BEGIN
                  RecDossierImportFactFour.INIT;
                  RecDossierImportFactFour."Line No"  :=FctGetnextLineNo("No. Arrivage") + 10000;
                  RecDossierImportFactFour."No. Arrivage PR":= "No. Arrivage";
                  RecDossierImportFactFour. "No. Facture Fournisseur":="No. Facture";
                  RecDossierImportFactFour."No. Arrivage PR":= "No. Arrivage";
                  RecDossierImportFactFour."Shipment date" := RecEnteteArrivagePR."Shipment date";
                  RecDossierImportFactFour."Estimated time of arrival" := RecEnteteArrivagePR."Estimated time of arrival";
                  RecDossierImportFactFour.Device := RecEnteteArrivagePR.Device;
                  RecDossierImportFactFour.Coefficient := RecEnteteArrivagePR.Coeficient;
                  RecDossierImportFactFour.INSERT;
                END ELSE
                  BEGIN
                    ERROR('');
                  END
            end;
        }
        field(11;"Date Facture";Date)
        {
        }
        field(12;CR;Code[10])
        {
        }
        field(13;Type;Text[30])
        {
        }
        field(14;"No. Article";Code[20])
        {
        }
        field(15;Designation;Text[30])
        {
        }
        field(16;"Poid Unitaire Piece";Decimal)
        {
        }
        field(17;"No. Commande";Code[20])
        {
        }
        field(18;"Date Commande";Date)
        {
        }
        field(19;"Prix unitaire LCY";Decimal)
        {
        }
        field(20;"Qte Servie";Decimal)
        {
        }
        field(21;"Tp commande";Code[10])
        {
        }
        field(22;"No. Piece servie";Code[20])
        {
        }
        field(23;Rp;Code[10])
        {
        }
        field(24;Prix;Decimal)
        {
        }
        field(25;"Commande Devise";Code[10])
        {
        }
        field(26;D;Code[10])
        {
        }
        field(27;F;Code[10])
        {
        }
        field(28;"No. Arrivage";Code[20])
        {
        }
        field(29;"No. Dossier Import";Code[20])
        {
            CalcFormula = Lookup("Dossier Import Fact. Four."."No. Dossier Import" WHERE (No. Arrivage PR=FIELD(No. Arrivage),
                                                                                          No. Facture Fournisseur=FIELD(No. Facture)));
            FieldClass = FlowField;
            TableRelation = "Entête Facture P.R / Colis";
        }
        field(30;"No. Dossier Finance";Code[20])
        {
            Description = 'RH : Finance Arrivage PR';
        }
        field(31;"No. Facture Frs Associé";Code[20])
        {
            Description = 'Préfixe 103';
        }
        field(32;"A Supprimer";Boolean)
        {
        }
        field(33;"Total Line Poid";Decimal)
        {
        }
        field(34;"Total Line Volume";Decimal)
        {
        }
        field(35;"Total Line Montant";Decimal)
        {

            trigger OnValidate();
            begin
                TESTFIELD("No. Arrivage");
                TESTFIELD("Numero Colis");
                TESTFIELD("No. Facture");
                TESTFIELD("Qte Servie");
                TESTFIELD(Prix);

                FctGetArrivagePR("No. Arrivage");
                RecDossierImportFactFour.RESET;
                RecDossierImportFactFour.SETRANGE("No. Arrivage PR","No. Arrivage");
                RecDossierImportFactFour.SETRANGE("No. Facture Fournisseur","No. Facture");
                IF RecDossierImportFactFour.FINDFIRST THEN BEGIN
                  RecDossierImportFactFour."Montant Facture" += "Total Line Montant" ;
                  RecDossierImportFactFour.MODIFY;

                END
            end;
        }
        field(36;"Reception Colis Crée";Boolean)
        {
        }
        field(37;Urgent;Boolean)
        {
        }
        field(38;"No. Fournisseur";Code[20])
        {
        }
        field(39;"Code Motif";Code[10])
        {
        }
        field(40;"Déballer";Boolean)
        {
            CalcFormula = Exist("CAB Mouvement" WHERE (Code a barre=FIELD(No. Article),
                                                       No. Dossier Import=FIELD(No. Dossier Import)));
            FieldClass = FlowField;
        }
        field(41;"Date arrivage MG Exist";Boolean)
        {
            CalcFormula = Exist("Entête Facture P.R / Colis" WHERE (No.=FIELD(No. Dossier Import),
                                                                    Date Arrivage Magasin=FILTER(<>'')));
            FieldClass = FlowField;
        }
        field(42;"Rcp Entr Exist";Code[20])
        {
            CalcFormula = Lookup("Warehouse Receipt Line".No. WHERE (Item No.=FIELD(No. Article),
                                                                     No. Colis=FIELD(Numero Colis),
                                                                     No Facture Fournisseur=FIELD(No. Facture),
                                                                     No. Arrivage PR=FIELD(No. Arrivage),
                                                                     No. Dossier Import=FIELD(No. Dossier Import)));
            FieldClass = FlowField;
        }
        field(43;"Rcp Entr enrg Exist";Code[20])
        {
            CalcFormula = Lookup("Posted Whse. Receipt Line".No. WHERE (Item No.=FIELD(No. Article),
                                                                        No. Colis=FIELD(Numero Colis),
                                                                        No Facture Fournisseur=FIELD(No. Facture),
                                                                        No. Arrivage PR=FIELD(No. Arrivage),
                                                                        No. Dossier Import=FIELD(No. Dossier Import)));
            FieldClass = FlowField;
        }
        field(44;"Type Cmd Achat";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(45;"Type Transport";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(46;"Type Order";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(47;"Type FD";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(48;"Poid Master";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(49;"No Reception Enterpot";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50;"No Reception Enterpot Ereg";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(51;"Sur Commande";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(52;"No Commande Vente";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(53;"No Ligne Commande Vente";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(54;"Centre Gestion Cmd Vente";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(55;"Type Cmd Achat Urg";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",PR,Service;
        }
    }

    keys
    {
        key(Key1;"No. Arrivage","Entry No.")
        {
        }
        key(Key2;"Numero Colis","No. Commande","No. Facture","No. Article")
        {
        }
        key(Key3;"Entry No.","No. Article")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //<<ZMN 12/04/2017
        ERROR('vous ne pouvez pas supprimer des lines DFC !');
        /*
        RecDossierImportFactFour.SETRANGE("No. Arrivage PR","No. Arrivage");
        IF RecDossierImportFactFour.FINDSET THEN
          REPEAT
            RecDossierImportColis.SETRANGE("No. Arrivage PR",RecDossierImportFactFour."No. Arrivage PR");
            IF RecDossierImportColis.FINDSET THEN
              REPEAT
                RecDossierImportColis.DELETE;
              UNTIL RecDossierImportColis.NEXT = 0;
              RecDossierImportFactFour.DELETE;
          UNTIL RecDossierImportFactFour.NEXT =0;
          */
        //>>ZMN 12/04/2017

    end;

    trigger OnInsert();
    begin
        RecPurchasesPayablesSetup.GET;
        "No. Fournisseur" := RecPurchasesPayablesSetup."Default PR Vendor"
    end;

    var
        RecPurchasesPayablesSetup : Record "312";
        RecDossierImportFactFour : Record "70025";
        RecDossierImportColis : Record "70072";
        RecEnteteArrivagePR : Record "70020";

    local procedure FctGetnextLineNo(PCdeDossFactColis : Code[20]) : Integer;
    var
        RecDossierImportFactFour : Record "70025";
    begin
        RecDossierImportFactFour.RESET;
        RecDossierImportFactFour.SETRANGE("No. Arrivage PR",PCdeDossFactColis);
        IF RecDossierImportFactFour.FINDLAST THEN
          EXIT(RecDossierImportFactFour."Line No")
         ELSE
            EXIT(0);
    end;

    local procedure FctGetArrivagePR(PCdeArrivage : Code[20]);
    begin
        IF PCdeArrivage <> '' THEN
         RecEnteteArrivagePR.GET(PCdeArrivage)
         ELSE
          EXIT;
    end;
}

