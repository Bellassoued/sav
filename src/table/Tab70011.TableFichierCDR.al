table 70011 "Table Fichier CDR"
{
    // version PR00011

    DrillDownPageID = 70014;
    LookupPageID = 70014;

    fields
    {
        field(1;"Séquence CDR";Integer)
        {
        }
        field(2;Champ3;Code[4])
        {
        }
        field(3;"Nom Tarif";Code[6])
        {
        }
        field(4;"Réference ( Tassée à gauche)";Code[12])
        {
        }
        field(5;"Désignation Francais";Code[10])
        {
        }
        field(6;"Désignation Anglaise";Code[10])
        {
        }
        field(7;Vehicule;Code[2])
        {
        }
        field(8;Tarif;Decimal)
        {
        }
        field(9;"Unité de  conditionnement";Code[4])
        {
        }
        field(10;Volume;Decimal)
        {
            DecimalPlaces = 3:3;
        }
    }

    keys
    {
        key(Key1;"Séquence CDR")
        {
        }
    }

    fieldgroups
    {
    }
}

