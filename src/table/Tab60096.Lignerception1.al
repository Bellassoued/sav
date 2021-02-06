table 60096 "Ligne réception1"
{
    // version Gestion RDV


    fields
    {
        field(1;"No. Réception";Code[20])
        {
        }
        field(2;"Date réception";Date)
        {
        }
        field(3;"Code Client";Code[20])
        {
        }
        field(4;"No. CIN";Code[20])
        {
        }
        field(5;"No. Téléphone";Code[50])
        {
        }
        field(6;"No. chassis";Code[50])
        {
        }
        field(7;"Nom Client";Code[100])
        {
        }
        field(8;Adresse;Code[100])
        {
        }
        field(9;Marque;Code[10])
        {
        }
        field(10;"Type machine";Code[10])
        {
        }
        field(11;Gouvernerat;Code[10])
        {
            TableRelation = Région.Code WHERE (Code=FIELD(Gouvernerat));
        }
        field(12;"Intervention demandé /client";Text[200])
        {
        }
        field(13;"Date Intervention souhaitée";Date)
        {
            Description = 'Réclamation souhaite par le client';
        }
        field(14;"Date Intervention confirmée";Date)
        {
            Description = 'Planning';
        }
        field(15;Etat;Option)
        {
            OptionCaption = 'Ouvert,Lancer,Clôturer,Annuler,Reporter';
            OptionMembers = Ouvert,Lancer,"Clôturer",Annuler,Reporter;
        }
        field(16;"Reste à faire";Text[30])
        {
        }
        field(17;"Nbr. Heure";Decimal)
        {
        }
        field(18;"Date mise en route";Date)
        {
        }
        field(19;"Item Leadger Entry No.";Integer)
        {
        }
        field(20;"Code article";Code[20])
        {
        }
        field(21;"Désignation article";Text[100])
        {
        }
        field(22;"Dossier No.";Code[20])
        {
            TableRelation = "Reception SAV"."Reception No" WHERE (Reception No=FIELD(Dossier No.));
        }
        field(23;"Date Dossier";Date)
        {
        }
        field(24;"Accepter Réception";Boolean)
        {
        }
        field(25;"Motif Annulation Réclamation";Text[100])
        {
        }
        field(26;"Source Réclamation";Option)
        {
            OptionMembers = " ","Téléphone",Visite,"Contrôle",Rappel;
        }
        field(27;"Préparer Planning";Boolean)
        {

            trigger OnValidate();
            begin
                //TESTFIELD("Code technicien");
                //TESTFIELD(Etat,Etat::Lancer);
                IF "Dossier No." = '' THEN
                  ERROR('Vous ne pouvez pas préparer le planning');
            end;
        }
        field(28;"Date préparation planning";Date)
        {
        }
        field(29;"Code technicien";Code[10])
        {
            TableRelation = Resource.No. WHERE (Resource Group No.=FILTER(REC*),
                                                Centre de gestion=FIELD(Responsibility Center));

            trigger OnValidate();
            begin
                IF "Code technicien"  <> '' THEN
                BEGIN
                CLEAR(Mecaniciens);
                Mecaniciens.GET("Code technicien");
                "Nom technicien" := Mecaniciens.Name;
                END
                ELSE
                "Nom technicien" := '';
            end;
        }
        field(30;"Nom technicien";Text[50])
        {
        }
        field(31;"Planning Confirmé";Boolean)
        {
        }
        field(32;"Commentaire Technicient";Text[250])
        {
        }
        field(33;"Code Technicien 2";Code[10])
        {
            TableRelation = Resource.No.;
        }
        field(34;"Nom Technicien 2";Code[100])
        {
        }
        field(35;Matricule;Code[20])
        {
        }
        field(36;"Lieu de réparation";Option)
        {
            OptionCaption = '" ,Atelier,Déplacement"';
            OptionMembers = " ",Atelier,"Déplacement";
        }
        field(37;"No. Planning";Code[20])
        {
        }
        field(38;"Motif clôture planning";Text[200])
        {
        }
        field(39;"Ancien No. planning";Code[20])
        {
        }
        field(40;"No. Ligne";Integer)
        {
        }
        field(41;"Créer Planning";Boolean)
        {
        }
        field(42;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '" ,Rendez-Vous,Réclamation"';
            OptionMembers = " ","Rendez-Vous","Réclamation";
        }
        field(43;"No.Matricule";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(44;"Symptom Code";Code[30])
        {
            DataClassification = ToBeClassified;
            Description = 'NM260219';
            TableRelation = "Symptom Code".Code WHERE (Code=FIELD(Symptom Code));

            trigger OnValidate();
            begin
                //<<NM260219
                IF "Symptom Code"  <> '' THEN
                BEGIN
                CLEAR(SymptomCode);
                SymptomCode.GET("Symptom Code");
                "Intervention demandé /client" := SymptomCode.Description;
                END
                ELSE
                "Nom technicien" := '';
                //end NM260219
            end;
        }
        field(45;"heure debut";Time)
        {
            DataClassification = ToBeClassified;
            Description = 'NM080319';
        }
        field(46;"heure fin";Time)
        {
            DataClassification = ToBeClassified;
            Description = 'NM080319';
        }
        field(47;"Groupe ressources";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'NM110319';
            TableRelation = "Resource Group".No. WHERE (Atelier technique=FILTER(Yes),
                                                        Centre de gestion=FIELD(Responsibility Center));

            trigger OnValidate();
            begin
                IF  "Groupe ressources" <> '' THEN
                BEGIN
                CLEAR(GroupeRessources);
                GroupeRessources.GET("Groupe ressources");
                "Nom groupe ressources" :=GroupeRessources.Name;
                END
                ELSE
                "Nom groupe ressources" := '';
                //Entetréception.SETFILTER(GroupeRessources."Centre de gestion",'%1',"Responsibility Center");
            end;
        }
        field(48;"Nom groupe ressources";Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'NM110319';
        }
        field(49;"Responsibility Center";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'NM140319';
            TableRelation = "Responsibility Center";
        }
    }

    keys
    {
        key(Key1;"No. Réception","No. chassis")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    var
        Entetereception1L : Record "60095";
    begin
        Entetereception1L.GET("No. Réception");
        "Responsibility Center":=Entetereception1L."Responsibility Center";
        VALIDATE("Code Client",Entetereception1L."Code Client");
    end;

    var
        Mecaniciens : Record "156";
        ServiceItem : Record "5940";
        SymptomCode : Record "5916";
        GroupeRessources : Record "152";
        "Entetréception" : Record "60095";
}

