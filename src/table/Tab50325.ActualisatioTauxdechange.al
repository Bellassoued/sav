table 50325 "Actualisatio  Taux de change"
{

    fields
    {
        field(1;"Document No.";Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Montant Devise";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Montant Comptabilité";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Code Devise";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Taux de change Facture";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3:8;
        }
        field(8;"Nouveau Taux de change";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3:8;

            trigger OnValidate();
            begin
                //IF "Nouveau Taux de change" <> 0 THEN
                //"Nouveau Mnt à comptabiliser" := ROUND("Montant Devise" * "Nouveau Taux de change",0.001);
            end;
        }
        field(9;"Nouveau Mnt à comptabiliser";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Date Comptabilisation";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Actualisé Manuellement";Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Date DerniereActualisation";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"Montant Ouvert";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.")
        {
        }
    }

    fieldgroups
    {
    }
}

