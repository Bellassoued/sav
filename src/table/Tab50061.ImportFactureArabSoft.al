table 50061 "Import Facture ArabSoft"
{

    fields
    {
        field(1;"No. Facture";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Date Facture";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Type Document";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Facture ou avoir';
        }
        field(4;Site;Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'code centre';
        }
        field(5;"Activité";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'COD_DEPT    PR ou SAV';
        }
        field(6;"No. client Arabsoft";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Nom client AranSoft";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Montant H.T";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Montant remise";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Montant TVA";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"ExoTva/Oui/Non";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Appliquer timbre";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Transferer vers Compta.";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Valider en comptabilité";Boolean)
        {
            CalcFormula = Exist("G/L Entry" WHERE (Document No.=FIELD(No. Facture)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No. Facture")
        {
        }
    }

    fieldgroups
    {
    }
}

