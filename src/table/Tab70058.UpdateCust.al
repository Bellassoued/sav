table 70058 "Update Cust"
{

    fields
    {
        field(1;"code";Code[10])
        {
        }
        field(2;mat;Text[30])
        {
        }
        field(3;Insert;Boolean)
        {
        }
        field(4;Cpt;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"New Cpt";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Sequence;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Exist 25";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"No Client";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Nom client";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Code vendeur";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Nom vendeur";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Date commande";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Num commande";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"No Ligne cmd";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Code titre";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Centre de gestion";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Sequence)
        {
        }
        key(Key2;"code")
        {
        }
    }

    fieldgroups
    {
    }
}

