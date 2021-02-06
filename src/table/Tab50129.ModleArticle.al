table 50129 "Modèle Article"
{

    fields
    {
        field(1;"No Article";Code[20])
        {
            Caption = 'Item No';
            DataClassification = ToBeClassified;
        }
        field(2;"Modèle";Text[100])
        {
            Caption = 'Model';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No Article")
        {
        }
    }

    fieldgroups
    {
    }
}

