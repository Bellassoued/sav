table 50118 "Détail Stock à date VN"
{

    fields
    {
        field(1;"No. Chassi";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"No. Réception achat";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Date Réception achat";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. Facture achat";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Date Facture achat";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Code devise facture achat";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Taux devise facture achat";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Taux devise A.T Doss. Import";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Cout Chassi / Devise Fact. Ach";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Cout Chassi / Devise A.T";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"No. Dossier d'import";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"DAte Achat à Terme";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Cout unitaire en devise";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Total Frais";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Mois de valoristion";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Année de valorisation";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Date Début";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Date Fin";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Coût Unitaire TND Hors Frais";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21;Type;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(22;Famille;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Quantité";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Sous-Famille";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"No. Article";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

