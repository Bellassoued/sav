table 50088 "Update Pack Price"
{
    CaptionML = ENU='Update Pack Price',
                FRA='Mise A Jour Prix Pack';

    fields
    {
        field(1;"Code Forfait";Code[20])
        {
        }
        field(2;"Libelle Forfait";Text[100])
        {
        }
        field(3;"Type Forfait";Text[20])
        {
        }
        field(4;Famille;Code[10])
        {
        }
        field(5;"Libelle Famille";Text[30])
        {
        }
        field(6;Lcdv1;Code[10])
        {
        }
        field(7;"Libelle Lcdv1";Text[100])
        {
        }
        field(8;Lcdv2;Code[10])
        {
        }
        field(9;"Libelle Lcdv2";Text[100])
        {
        }
        field(10;Lcdv3;Code[10])
        {
        }
        field(11;"Libelle Lcdv3";Text[100])
        {
        }
        field(12;Lcdv4;Code[10])
        {
        }
        field(13;"Libelle Lcdv4";Text[100])
        {
        }
        field(14;Lcdv5;Code[10])
        {
        }
        field(15;"Libelle Lcdv5";Text[100])
        {
        }
        field(16;Lcdv6;Code[10])
        {
        }
        field(17;"Libelle Lcdv6";Text[100])
        {
        }
        field(18;Lcdv7;Code[10])
        {
        }
        field(19;"Libelle Lcdv7";Text[100])
        {
        }
        field(20;Lcdv8;Code[10])
        {
        }
        field(21;"Libelle Lcdv8";Text[100])
        {
        }
        field(22;Lcdv9;Code[10])
        {
        }
        field(23;"Libelle Lcdv9";Text[100])
        {
        }
        field(24;"Lcdvs Compl";Text[40])
        {
        }
        field(25;"Libelle Lcdvs Compl";Text[30])
        {
        }
        field(26;"Code Veh";Code[10])
        {
        }
        field(27;"Type Validite1";Text[10])
        {
        }
        field(28;"Debut Validite1";Text[30])
        {
        }
        field(29;"Fin Validate1";Text[30])
        {
        }
        field(30;"Type Validate2";Text[10])
        {
        }
        field(31;"Debut Validate2";Text[30])
        {
        }
        field(32;"Fin Validate2";Text[30])
        {
        }
        field(33;Modifiable;Integer)
        {
        }
        field(34;Niveau;Integer)
        {
        }
        field(35;Prix;Integer)
        {
        }
        field(36;"Debut Validate Prix";Date)
        {
        }
        field(37;"Fin Validate Prix";Date)
        {
        }
        field(38;Marge;Decimal)
        {
        }
        field(39;Type1;Text[10])
        {
        }
        field(40;Reference1;Code[20])
        {
        }
        field(41;Libelle1;Text[100])
        {
        }
        field(42;"Libelle Four1";Text[30])
        {
        }
        field(43;"Temps Qte1";Decimal)
        {
        }
        field(44;Unite1;Text[10])
        {
        }
        field(45;Type2;Text[10])
        {
        }
        field(46;Reference2;Code[20])
        {
        }
        field(47;Libelle2;Text[100])
        {
        }
        field(48;"Libellle Four2";Text[30])
        {
        }
        field(49;"Temps Qte2";Decimal)
        {
        }
        field(50;Unite2;Text[10])
        {
        }
        field(51;Type3;Text[10])
        {
        }
        field(52;Reference3;Code[20])
        {
        }
        field(53;Libelle3;Text[100])
        {
        }
        field(54;"Libelle Four3";Text[30])
        {
        }
        field(55;"Temps Qte3";Decimal)
        {
        }
        field(56;Unite3;Text[10])
        {
        }
        field(57;Type4;Text[10])
        {
        }
        field(58;Reference4;Code[20])
        {
        }
        field(59;Libelle4;Text[100])
        {
        }
        field(60;"Libelle Four4";Text[30])
        {
        }
        field(61;"Temps Qte4";Decimal)
        {
        }
        field(62;Unite4;Text[10])
        {
        }
        field(63;Type5;Text[10])
        {
        }
        field(64;Reference5;Code[20])
        {
        }
        field(65;Libelle5;Text[100])
        {
        }
        field(66;"Libelle Four5";Text[30])
        {
        }
        field(67;"Temps Qte5";Decimal)
        {
        }
        field(68;Unite5;Text[10])
        {
        }
        field(69;SeqNo;Integer)
        {
        }
    }

    keys
    {
        key(Key1;SeqNo)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        UpdatePackPrice.RESET;
        IF UpdatePackPrice.FINDLAST THEN
          SeqNo := UpdatePackPrice.SeqNo + 1
        ELSE
          SeqNo := 1;
    end;

    var
        UpdatePackPrice : Record "50088";
}

