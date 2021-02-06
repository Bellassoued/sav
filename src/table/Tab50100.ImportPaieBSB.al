table 50100 "Import Paie  BSB"
{

    fields
    {
        field(1;"No Séquence";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"No. Compte Comptable";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Date Comptabilisation";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Désignation";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Mnt Débit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Mnt Crédit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Traiter;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Transférer en Cpt.";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"No. Document";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"No. Salarié";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Code journal";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;Site;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15;Direction;Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No Séquence")
        {
        }
    }

    fieldgroups
    {
    }
}

