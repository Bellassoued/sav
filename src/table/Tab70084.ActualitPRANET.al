table 70084 "Actualité PRANET"
{
    DrillDownPageID = 70184;
    LookupPageID = 70184;

    fields
    {
        field(1;ID;Code[50])
        {
        }
        field(2;"User ID";Code[100])
        {
        }
        field(3;Titre;Text[250])
        {
        }
        field(4;Description;BLOB)
        {
            SubType = Bitmap;
        }
        field(5;"Image actualité";BLOB)
        {
            SubType = Bitmap;
        }
        field(6;"Piece Jointe";BLOB)
        {
            SubType = Bitmap;
        }
        field(7;Afficher;Boolean)
        {
        }
        field(8;"Date du";Date)
        {
        }
        field(9;"Date au";Date)
        {
        }
        field(10;"Header Image";Text[250])
        {
        }
        field(11;"Header File";Text[250])
        {
        }
    }

    keys
    {
        key(Key1;ID)
        {
        }
    }

    fieldgroups
    {
    }
}

