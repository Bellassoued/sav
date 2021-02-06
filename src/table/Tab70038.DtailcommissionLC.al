table 70038 "Détail commission/ L.C"
{

    fields
    {
        field(1;"No. L.C";Code[20])
        {
        }
        field(3;"No. Ligne";Code[20])
        {
        }
        field(4;Banque;Code[30])
        {
            TableRelation = "Bank Account";
        }
        field(5;"Code Commission";Code[50])
        {
        }
        field(6;"Montant à comtabiliser";Decimal)
        {

            trigger OnValidate();
            begin
                "Ecart Montant" := "Montant paramétré" - "Montant à comtabiliser";
            end;
        }
        field(7;"Contre partie";Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(8;"Date création";Date)
        {
        }
        field(9;"Créer par";Code[50])
        {
        }
        field(10;"Commission transférée";Boolean)
        {
        }
        field(11;"Commission Validée en Cpt";Boolean)
        {
        }
        field(12;"Comptabilisée par";Code[50])
        {
        }
        field(13;"Base de calcule";Option)
        {
            OptionCaption = '% L.C,Montant Fixe';
            OptionMembers = "% L.C","Montant Fixe";
        }
        field(14;"Montant paramétré";Decimal)
        {
        }
        field(15;"Ecart Montant";Decimal)
        {
        }
        field(16;"No. Dossier VN";Code[20])
        {
        }
        field(17;"Affeter sur";Code[20])
        {
        }
        field(18;"No. Financement";Code[20])
        {
        }
        field(19;"Montant comptabilisé";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No. L.C","No. Ligne",Banque,"No. Dossier VN")
        {
        }
    }

    fieldgroups
    {
    }
}

