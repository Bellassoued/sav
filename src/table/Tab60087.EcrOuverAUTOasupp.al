table 60087 "Ecr Ouver AUTO a supp"
{

    fields
    {
        field(1;"No. Séquence";Integer)
        {
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(2;model;Code[30])
        {
        }
        field(3;"non feuille";Code[30])
        {
        }
        field(4;"type compta";Code[30])
        {
        }
        field(5;"Nouveau Compte";Code[30])
        {
        }
        field(6;"date compta";Date)
        {
        }
        field(7;"type doc";Code[30])
        {
        }
        field(8;"No. document";Code[30])
        {
        }
        field(9;"désigntaion";Code[100])
        {
        }
        field(10;"code devise";Code[30])
        {
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(11;Montant;Decimal)
        {
        }
        field(12;"groupe compta";Code[30])
        {
        }
        field(13;"Code vendeur/acheteur";Code[20])
        {
        }
        field(14;"code journal";Code[30])
        {
        }
        field(15;"date echéance";Date)
        {
        }
        field(16;"date dcoment";Date)
        {
        }
        field(17;"Doc externe";Code[20])
        {
        }
        field(18;"code departement";Code[20])
        {
        }
        field(19;"code etablissemen";Code[20])
        {
        }
        field(20;utilisateur;Code[20])
        {
        }
        field(21;vin;Code[30])
        {
        }
        field(22;"code marque";Code[30])
        {
        }
        field(23;"montant ouvert";Decimal)
        {
        }
        field(24;VVV;Code[20])
        {
        }
        field(25;"Ancien Compe comptable";Code[20])
        {
        }
        field(26;"No. logne 81";Integer)
        {
        }
        field(27;"No. logne 81-";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"No. Séquence")
        {
        }
    }

    fieldgroups
    {
    }
}

