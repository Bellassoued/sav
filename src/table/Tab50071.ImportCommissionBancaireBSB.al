table 50071 "Import Commission Bancaire BSB"
{

    fields
    {
        field(1;"No Séquence";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"No. Compte";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Date Comptabilisation";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Date Document";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. Doc. Externe";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Désignation";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Mnt Débit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Mnt Crédit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Traiter;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Transférer en Cpt.";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"No Salarié";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Code département";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Code Journal";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(14;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Commission,Paie';
            OptionMembers = Commission,Paie;
        }
        field(15;Site;Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No Séquence",Type)
        {
        }
    }

    fieldgroups
    {
    }
}

