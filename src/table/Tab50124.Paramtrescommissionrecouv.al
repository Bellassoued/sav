table 50124 "Paramètres commission recouv."
{

    fields
    {
        field(1;"Groupe Compta Client";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Posting Group";
        }
        field(2;"Nombre de jours de retard";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50000;"% commission";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Groupe Compta Client","Nombre de jours de retard")
        {
        }
    }

    fieldgroups
    {
    }
}

