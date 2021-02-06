table 50067 "Lignes Prêt/Société"
{
    // version MOE

    DrillDownPageID = 69096;
    LookupPageID = 69096;

    fields
    {
        field(1;"N° Prêt";Code[10])
        {
        }
        field(2;"Désignation";Text[30])
        {
        }
        field(3;"Date Prêt";Date)
        {
        }
        field(4;"Date Echéance";Date)
        {
        }
        field(5;"N° Ligne";Integer)
        {
        }
        field(6;"Code Filiale";Code[10])
        {
        }
        field(7;"Nom Filiale";Text[30])
        {
        }
        field(8;"Montant par Tranche";Decimal)
        {
        }
        field(9;"Payé";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"N° Ligne","N° Prêt")
        {
        }
    }

    fieldgroups
    {
    }
}

