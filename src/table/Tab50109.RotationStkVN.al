table 50109 "Rotation Stk VN"
{

    fields
    {
        field(1;"Item No.";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Item.No. WHERE (Item Tracking Code=FILTER(CHASSIS));
        }
        field(2;"Janvier : Entrée";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Janvier : Sorte";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Janvier : Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Fevrier : Entrée";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Fevrier : Sorte";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Fevrier : Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Mars : Entrée";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Mars : Sorte";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Mars : Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Avril : Entrée";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Avril : Sorte";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Avril : Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Mai : Entrée";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Mai : Sorte";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Mai : Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Juin : Entrée";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Juin : Sorte";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Juin : Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Juillet : Entrée";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Juillet : Sorte";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Juillet : Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Aout : Entrée";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Aout : Sorte";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Aout : Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Septembre : Entrée";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Septembre : Sorte";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Septembre  : Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Réf. Ligne";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(30;"Entry No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Total Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Octobre  : Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Novembre  : Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Décembre : Valeur Stock";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(35;Name;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(36;"Qte Sock Décembre";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Item No.")
        {
        }
    }

    fieldgroups
    {
    }
}

