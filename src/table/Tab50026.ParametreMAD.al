table 50026 "Parametre MAD"
{
    // version Reappro TYT V01


    fields
    {
        field(1;Product_Code;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Segment."Code Segment";
        }
        field(2;Since_Regist;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Base_Month;Integer)
        {
            DataClassification = ToBeClassified;
            MaxValue = 12;
            MinValue = 0;
        }
        field(4;"C_Ref %";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Coefficient N";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Coefficient N-1";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Coefficient N-2";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Coefficient N-3";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Coefficient N-4";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Coefficient N-5";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Coefficient N-6";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Coefficient N-7";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Coefficient N-8";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Coefficient N-9";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Coefficient N-10";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Coefficient N-11";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Product_Code,Since_Regist)
        {
        }
        key(Key2;Since_Regist)
        {
        }
    }

    fieldgroups
    {
    }
}

