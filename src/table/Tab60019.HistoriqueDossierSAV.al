table 60019 "Historique Dossier SAV"
{
    // version MAZDA19

    DrillDownPageID = 60118;
    LookupPageID = 60118;

    fields
    {
        field(1;SUCC;Text[100])
        {
        }
        field(2;Num_Dos;Code[30])
        {
        }
        field(3;Date_Dos;Date)
        {
        }
        field(4;Materiel;Text[50])
        {
        }
        field(5;Marque;Text[30])
        {
        }
        field(6;Type;Text[30])
        {
        }
        field(7;KM;Integer)
        {
        }
        field(8;No_Chassis;Code[30])
        {
        }
        field(9;"ANC Code_Client";Code[30])
        {
        }
        field(10;"NOUV Code_Client";Code[30])
        {
        }
        field(11;CT_intitule;Text[40])
        {
        }
        field(12;CT_Adresse;Text[50])
        {
        }
        field(13;CT_CodePostal;Text[10])
        {
        }
        field(14;CT_Ville;Text[20])
        {
        }
        field(15;CT_Pays;Text[20])
        {
        }
        field(16;CT_Telephone;Text[50])
        {
        }
        field(17;CT_Identifiant;Text[20])
        {
        }
        field(18;Matricule;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;Num_Dos)
        {
        }
        key(Key2;Date_Dos)
        {
        }
    }

    fieldgroups
    {
    }
}

