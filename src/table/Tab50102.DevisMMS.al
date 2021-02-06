table 50102 "Devis M&MS"
{
    // version M&MS


    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            Caption = 'No Ligne';
            DataClassification = ToBeClassified;
        }
        field(2;"Item No.";Code[20])
        {
            Caption = 'Code Article';
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Qty;Decimal)
        {
            Caption = 'Quantité';
            DataClassification = ToBeClassified;
        }
        field(5;"Unit Price";Decimal)
        {
            Caption = 'Prix Unitaire';
            DataClassification = ToBeClassified;
        }
        field(6;"Discount %";Decimal)
        {
            Caption = '% Remise';
            DataClassification = ToBeClassified;
        }
        field(7;"Ligne Amount HT";Decimal)
        {
            Caption = 'Montant Ligne HT';
            DataClassification = ToBeClassified;
        }
        field(8;"Ligne Amount TTC";Decimal)
        {
            Caption = 'Montant Ligne TTC';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.")
        {
        }
    }

    fieldgroups
    {
    }
}

