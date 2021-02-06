table 70009 "Table Fichier ADDIN"
{
    // version PR00011

    DrillDownPageID = 70012;
    LookupPageID = 70012;

    fields
    {
        field(1;"Séquence";Integer)
        {
        }
        field(2;"Réference";Code[12])
        {
        }
        field(3;"Déscription";Code[15])
        {
        }
        field(4;"Code Famille";Code[5])
        {
        }
        field(5;"Déscription Famille";Code[25])
        {
        }
        field(6;"Niveau de Concurrence";Code[1])
        {
        }
        field(7;"crénne";Code[3])
        {
        }
        field(8;Index;Code[2])
        {
        }
        field(9;"Ségment";Code[2])
        {
        }
        field(10;Poids;Decimal)
        {
        }
        field(11;Volume;Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(12;"unite de vente";Code[5])
        {
        }
        field(13;"volume integer";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(14;"volume final";Integer)
        {
        }
        field(15;traiterconv;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Séquence")
        {
        }
    }

    fieldgroups
    {
    }
}

