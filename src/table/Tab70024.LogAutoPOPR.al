table 70024 "Log Auto PO PR"
{
    DrillDownPageID = 70062;
    LookupPageID = 70062;

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"No. Commande Achat";Code[20])
        {
        }
        field(3;"No. Line";Integer)
        {
        }
        field(4;"No. Article";Code[20])
        {
        }
        field(5;"Prix Master";Decimal)
        {
        }
        field(6;Prix;Decimal)
        {
        }
        field(7;Description;Text[100])
        {
        }
        field(8;"% Remise";Decimal)
        {
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

