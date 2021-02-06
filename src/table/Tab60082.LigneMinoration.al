table 60082 "Ligne Minoration"
{

    fields
    {
        field(1;"No. expédition";Code[20])
        {
        }
        field(2;"Code version";Code[30])
        {
        }
        field(3;"Code Pers";Code[10])
        {
        }
        field(4;Article;Code[30])
        {
        }
        field(5;"Désignation Version";Code[100])
        {
        }
        field(6;"Mino-Positionnement";Decimal)
        {
        }
        field(7;Volume;Integer)
        {
        }
        field(8;"Mnt Total affecté Min-Pos";Decimal)
        {
        }
        field(9;"Régularisation (Min-Anim)";Decimal)
        {
        }
        field(10;"Mnt Total affecté Min-Anim";Decimal)
        {
        }
        field(11;"Total Minoration";Decimal)
        {
        }
        field(12;"Aide Moyenne à la VN";Decimal)
        {
        }
        field(13;"Désignation Article";Code[100])
        {
        }
        field(14;"No. Proforma";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"No. expédition","Code version","Code Pers","No. Proforma")
        {
        }
    }

    fieldgroups
    {
    }
}

