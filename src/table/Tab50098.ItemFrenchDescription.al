table 50098 "Item French Description"
{

    fields
    {
        field(1;"Item No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Language;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Item Existe";Boolean)
        {
            CalcFormula = Exist(Item WHERE (No.=FIELD(Item No.)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Item No.")
        {
        }
    }

    fieldgroups
    {
    }
}

