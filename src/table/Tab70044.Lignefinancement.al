table 70044 "Ligne financement"
{

    fields
    {
        field(1;"No. Financement";Code[20])
        {
        }
        field(3;"No. Arrivage";Code[20])
        {
        }
        field(6;"No. L.C";Code[20])
        {
        }
        field(7;"No. Ligne";Integer)
        {
        }
        field(8;"Cour du jour";Decimal)
        {
        }
        field(9;"Cour de financement";Decimal)
        {

            trigger OnValidate();
            begin
                "Montant Financement" :=  "Montant Arrivage (Devise)" * "Cour de financement";
                "Ecart Arrivage/Financement" := "Montant Financement" - "Montant Arrivage (Tnd)";
            end;
        }
        field(10;"Montant Arrivage (Tnd)";Decimal)
        {
            Description = 'Calculer : dossier transit  : Montant devise * court de déclaration';
        }
        field(11;"Montant C / Financement";Decimal)
        {
            Description = '% au court de financement';
        }
        field(12;"Ecart Montant";Decimal)
        {
        }
        field(13;"Montant Arrivage (Devise)";Decimal)
        {
            Description = 'a partir de dossier transit';

            trigger OnValidate();
            begin
                "Montant Arrivage (Tnd)" :=  "Montant Arrivage (Devise)"*"Cour arrivage";
            end;
        }
        field(14;Banque;Code[20])
        {
            TableRelation = "Bank Account";
        }
        field(15;"Cour arrivage";Decimal)
        {
            DecimalPlaces = 2:5;
        }
        field(16;"Montant Court / jour";Decimal)
        {
        }
        field(17;"Montant Financement";Decimal)
        {
        }
        field(18;"Date Création";Date)
        {
        }
        field(19;"Date Echéance";Date)
        {

            trigger OnValidate();
            begin
                 "Nb. jours" :=  "Date Echéance"- "Date Création";
            end;
        }
        field(20;"Nb. jours";Integer)
        {
        }
        field(21;"Ecart Arrivage/Financement";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"No. Financement","No. Ligne")
        {
        }
    }

    fieldgroups
    {
    }
}

