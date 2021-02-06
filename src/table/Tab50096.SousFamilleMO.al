table 50096 "Sous Famille MO"
{
    // version AK010419


    fields
    {
        field(1;Nom;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Famille MO";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Famille MO".Nom;
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

