table 70077 "PdaUserMenu"
{
    // version PDA

    DrillDownPageID = 70123;
    LookupPageID = 70123;

    fields
    {
        field(1;"USER ID";Code[50])
        {
            TableRelation = "User Setup";
        }
        field(2;"Paramétrage";Boolean)
        {
        }
        field(3;Inventaire;Boolean)
        {
        }
        field(4;PreparationOrdreReparation;Boolean)
        {
        }
        field(5;Reception;Boolean)
        {
        }
        field(6;PreparationCmd;Boolean)
        {
        }
        field(7;TransfertS;Boolean)
        {
        }
        field(8;DetailCasier;Boolean)
        {
        }
        field(9;DetailArticle;Boolean)
        {
        }
        field(10;PointageColis;Boolean)
        {
        }
        field(11;Magasin;Code[10])
        {
            TableRelation = Location;
        }
        field(12;Login;Code[20])
        {
        }
        field(13;"Mot de passe";Text[30])
        {
        }
        field(14;"Info Colis";Boolean)
        {
        }
        field(15;"Transfer inter site";Boolean)
        {
        }
        field(16;"Reception comptoire";Boolean)
        {
        }
        field(17;"Reception Atelier";Boolean)
        {
        }
        field(18;"Retour Comptoire";Boolean)
        {
        }
        field(19;"Retour atelier";Boolean)
        {
        }
        field(20;"Magasin Inventaire";Code[10])
        {
            TableRelation = Location;
        }
    }

    keys
    {
        key(Key1;"USER ID",Login)
        {
        }
    }

    fieldgroups
    {
    }
}

