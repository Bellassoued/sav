table 50105 "MAD par Magasin"
{
    DrillDownPageID = 50164;
    LookupPageID = 50164;

    fields
    {
        field(1;"No. Article";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Centre de gestion";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;MAD;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"STANDARD STOCK";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Qte en cours";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Stock Magasin";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;SOQ;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Product Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(10;ICC;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Stock Global";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"MAD Global";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"STD Stock Forcer";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Dernier Date Vente";Date)
        {
            CalcFormula = Max("Item Ledger Entry"."Posting Date" WHERE (Entry Type=CONST(Sale),
                                                                        Item No.=FIELD(No. Article),
                                                                        Responsibility Center=FIELD(Centre de gestion)));
            FieldClass = FlowField;
        }
        field(15;"Dernier Date Reception";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No. Article","Centre de gestion")
        {
        }
    }

    fieldgroups
    {
    }
}

