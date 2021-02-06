table 50074 "Doc NEcessaires VN"
{

    fields
    {
        field(1;"Type Payement";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"No Client";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"No. Document";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Copie Carte Identite";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Copie registre du commerce";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Dur;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Patente;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Dur Leasing";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Contrat;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10;PV;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Bon de Commande";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Lettre d engagement";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Payement integral";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Code Titre";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Group Compta. Client";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Type Payement","No Client","No. Document","Code Titre","Group Compta. Client")
        {
        }
    }

    fieldgroups
    {
    }
}

