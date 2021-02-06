table 60078 "Déclaration sur arrivage VN"
{
    DrillDownPageID = 60398;
    LookupPageID = 60398;

    fields
    {
        field(1;"No. Dossier";Code[20])
        {
        }
        field(2;"No. Réception Achat VN";Code[30])
        {
        }
        field(3;"No. Projet Expédition";Code[30])
        {
        }
        field(4;"No. L.C";Code[30])
        {
        }
        field(5;"Date déclaration";Date)
        {
        }
        field(6;"No. Déclaration";Code[20])
        {
        }
        field(7;"Cours déclrartion";Decimal)
        {
            DecimalPlaces = 3:8;

            trigger OnValidate();
            begin
                "Montant en TND" := "Cours déclrartion"*"Montant en Devise";
            end;
        }
        field(8;"Qté. déclaration";Integer)
        {
        }
        field(9;"Montant en Devise";Decimal)
        {

            trigger OnValidate();
            begin
                "Montant en TND" := "Cours déclrartion"*"Montant en Devise";
            end;
        }
        field(10;"Montant en TND";Decimal)
        {
        }
        field(11;"No. BR Obligation";Code[20])
        {
            TableRelation = "Payment Header".No. WHERE (No. Arrivage=FIELD(No. Dossier));
        }
        field(12;"Entry No.";Integer)
        {
        }
        field(13;"Qté arrivage";Integer)
        {
        }
    }

    keys
    {
        key(Key1;"No. Dossier","Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

