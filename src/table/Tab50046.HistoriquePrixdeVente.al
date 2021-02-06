table 50046 "Historique Prix de Vente"
{
    DrillDownPageID = 50151;
    LookupPageID = 50151;

    fields
    {
        field(1;"No. Article";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Prix HT";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5;"Nouveau Prix HT";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Old Prix Fob";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"New Prix Fob";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
        }
    }

    fieldgroups
    {
    }
}

