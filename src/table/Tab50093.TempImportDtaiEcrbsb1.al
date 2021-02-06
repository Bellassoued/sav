table 50093 "Temp Import Détai Ecr. bsb1"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"No Bodereau";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Montant credit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"No. Compte";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Centre de gestion";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Coffre;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Profil;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Doc externe";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"date echeance";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"type de reglement";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"no document";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;lbelle;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"type reglement";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"No. 2";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(15;Banque;Code[20])
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

