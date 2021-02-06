table 60069 "TMP MAJ Articles"
{
    // version A supp


    fields
    {
        field(1;Article;Integer)
        {
        }
        field(2;"D-Code";Code[20])
        {
        }
        field(3;"Stock Min";Integer)
        {
        }
        field(4;Rotation;Option)
        {
            OptionCaption = '" ,A,B,C,D,E"';
            OptionMembers = " ",A,B,C,D,E;
        }
        field(5;Famille;Option)
        {
            OptionCaption = '" ,CARROSSERIE,CHASSIS,DIVERS,EQUIPEMENT,ESSIEUX,MOTEUR,TRANSMISSION"';
            OptionMembers = " ",CARROSSERIE,CHASSIS,DIVERS,EQUIPEMENT,ESSIEUX,MOTEUR,TRANSMISSION;
        }
        field(6;"Cpte Gl";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;Article)
        {
        }
    }

    fieldgroups
    {
    }
}

