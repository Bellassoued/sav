table 50097 "Operation MO"
{

    fields
    {
        field(1;Nom;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Sous Famille MO";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sous Famille MO".Nom;
        }
        field(3;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Nom)
        {
        }
    }

    fieldgroups
    {
    }
}

