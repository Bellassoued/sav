table 60064 "Banque"
{
    // version FIN01

    DrillDownPageID = 69045;
    LookupPageID = 69045;

    fields
    {
        field(1;"No.";Code[20])
        {
            Caption = 'N°';
        }
        field(2;Description;Text[50])
        {
            Caption = 'Désignation';
        }
        field(3;"FACILITE DE CAISSE";Decimal)
        {
        }
        field(4;"ESC CEL";Decimal)
        {
        }
        field(5;"AVANCE/MARCHE";Decimal)
        {
        }
        field(6;CREDOC;Decimal)
        {
        }
        field(7;"FIN EN DEVISE";Decimal)
        {
        }
        field(8;"OBLIGATION /CAUTION";Decimal)
        {
        }
        field(9;"TOTAL MONTANT AUTORISE";Decimal)
        {
        }
        field(13;"TAUX FACILITE DE CAISSE";Text[100])
        {
        }
        field(14;"TAUX ESC CEL";Text[100])
        {
        }
        field(15;"TAUX AVANCE/MARCHE";Text[100])
        {
        }
        field(16;"TAUX CREDOC";Text[100])
        {
        }
        field(17;"TAUX FIN EN DEVISE";Text[100])
        {
        }
        field(18;"TAUX OBLIGATION /CAUTION";Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }
}

