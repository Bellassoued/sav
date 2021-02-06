table 50091 "Temp Import Détai Ecr. bsb."
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;COD_JRN;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3;LIBJRN;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"NV COD JRL";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;SEQ_ECRT;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;NUM_ECRT;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;NUM_PIEC;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;SEQ_ANNUL;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9;SEQ_REPRIS;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;D_ECRT;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;MOIS;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(12;ANNEE;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13;NUM_CPT;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;LIBCPT;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(15;COD_TIER;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"NV CG";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"TYPE TIERS";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"NV TIERS";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(19;MNT;Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3:3;
        }
        field(20;SENS;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"mt signé";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22;LIBECRT;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(23;ECRT_RAPP;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(24;SEQ_LETT;Integer)
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

