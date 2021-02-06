table 50047 "Journee commercial Buffer"
{

    fields
    {
        field(1;"No. sequence";Integer)
        {
        }
        field(2;Journee;Date)
        {
        }
        field(3;"Centre gestion";Code[10])
        {
        }
        field(4;"Profil reglement";Code[20])
        {
        }
        field(5;Coffre;Code[20])
        {
        }
        field(6;"Doc No.";Code[20])
        {
        }
        field(7;"Code Client";Code[20])
        {
        }
        field(8;"Nom client";Text[50])
        {
        }
        field(9;Montant;Decimal)
        {
        }
        field(10;"Type Doc";Option)
        {
            OptionMembers = Facture,Avoir;
        }
        field(11;Type;Option)
        {
            OptionCaption = 'VN,PR,SAV,Chrono';
            OptionMembers = VN,PR,SAV,Chrono;
        }
    }

    keys
    {
        key(Key1;"No. sequence")
        {
        }
    }

    fieldgroups
    {
    }
}

