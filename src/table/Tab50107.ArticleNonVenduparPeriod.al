table 50107 "Article Non Vendu par Period"
{
    DrillDownPageID = 50166;
    LookupPageID = 50166;

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Centre De gestion";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Article non Mvt 6M";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Article non Mvt 1A";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Article non Mvt 2A";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Article non Mvt 3A";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Article non Mvt plus 5A";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Stock Magasin";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Article mvt 0/ 6M";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Centre De gestion","Article non Mvt 6M","Article non Mvt 1A","Article non Mvt 2A","Article non Mvt 3A","Article non Mvt plus 5A","Article mvt 0/ 6M","Entry No")
        {
        }
        key(Key2;"Entry No")
        {
        }
    }

    fieldgroups
    {
    }
}

