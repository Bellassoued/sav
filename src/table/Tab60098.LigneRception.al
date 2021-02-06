table 60098 "Ligne Réception-"
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
            TableRelation = Customer.No.;

            trigger OnValidate();
            begin
                  CLEAR(Customer);
                  Customer.GET("Code Client");
                  "Nom Client" := Customer.Name;
            end;
        }
        field(4;"No. CIN";Code[20])
        {
        }
        field(5;"No. Téléphone";Code[20])
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
            OptionCaption = '" Ouvert,Lancer,Clôturer,Annuler,Reporter"';
            OptionMembers = " Ouvert",Lancer,"Clôturer",Annuler,Reporter;
        }
        field(16;"Reste à faire";Text[30])
        {
        }
        field(17;"Nbr. Heure";Code[20])
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
        field(22;"Dossier No.";Code[10])
        {
            TableRelation = "Reception SAV"."Reception No";
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
            end;
        }
        field(28;"Date préparation planning";Date)
        {
        }
        field(29;"Code technicien";Code[10])
        {
            TableRelation = Resource.No.;

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
    }

    keys
    {
        key(Key1;"No. Réception")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Mecaniciens : Record "156";
        Customer : Record "18";
}

