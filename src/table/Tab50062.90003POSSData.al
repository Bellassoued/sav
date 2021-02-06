table 50062 "90003 POSS Data"
{
    DrillDownPageID = 50149;
    LookupPageID = 50149;

    fields
    {
        field(1;DISTFDCODE;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;ORDERNO;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;LKCODE;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;TRANSPORTATION;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;BOINSTRUCTION;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;PORTION;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"PORTION TOTAL QTY";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"PORTION TOTAL AMOUNT";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;BOCODE;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;RACODE;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(11;ITEMNO;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;PROCESSEDPN;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13;ORDEREDPN;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;PROCESSEDQTY;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;ORDEREDQTY;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;UNITFOBPRICE;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;ROUTECODE;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(19;"Sur Commande";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"No Commande Vente";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"No Ligne Commande Vente";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Centre de gestion Cmd Vente";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Type Cmd achat";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,PR,VN,Service;
        }
        field(24;"Nom Client";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"VIN Reappro";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Date Insertion";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
        }
    }

    fieldgroups
    {
    }
}

