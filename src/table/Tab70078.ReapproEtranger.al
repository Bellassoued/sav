table 70078 "Reappro Etranger"
{
    DrillDownPageID = 70137;
    LookupPageID = 70137;

    fields
    {
        field(1;"Ref Origine";Code[20])
        {
        }
        field(2;"Ref Remplacante";Code[20])
        {
        }
        field(3;Famille;Code[10])
        {
        }
        field(4;Index;Code[10])
        {
        }
        field(5;Segment;Code[10])
        {
        }
        field(6;Description;Text[100])
        {
        }
        field(7;"Prix Achat A";Decimal)
        {
        }
        field(8;"Vente A TR1";Decimal)
        {
        }
        field(9;"vente A TR2";Decimal)
        {
        }
        field(10;"vente A TR4";Decimal)
        {
        }
        field(11;"Sock Ref Origine";Decimal)
        {
        }
        field(12;"Qty Reservé Ref Origine";Decimal)
        {
        }
        field(13;"Qty Cmd Achat Ref Origine";Decimal)
        {
        }
        field(14;"Nature A";Option)
        {
            OptionCaptionML = ENU=' ,SCD,NFP,EST,685,VIN,LST',
                              FRA=' ,SCD,NFP,EST,685,VIN,LST';
            OptionMembers = " ",SCD,NFP,EST,"685",VIN,LST;
        }
        field(15;"DGX A";Boolean)
        {
        }
        field(18;"Vente A TR3";Decimal)
        {
        }
        field(19;"Date Vente A TR1";Date)
        {
        }
        field(20;"Date Vente A TR2";Date)
        {
        }
        field(21;"Date Vente A TR3";Date)
        {
        }
        field(22;"Date Vente A TR4";Date)
        {
        }
        field(23;"Qty Cmd Service Ref Origine";Decimal)
        {
        }
        field(24;"Prix Achat B";Decimal)
        {
        }
        field(25;"Vente B TR1";Decimal)
        {
        }
        field(26;"vente B TR2";Decimal)
        {
        }
        field(27;"Vente B TR3";Decimal)
        {
        }
        field(28;"vente B TR4";Decimal)
        {
        }
        field(29;"Sock Ref remplacante";Decimal)
        {
        }
        field(30;"Qty Reservé Ref Remplacente";Decimal)
        {
        }
        field(31;"Qty Cmd Achat Ref Remplacente";Decimal)
        {
        }
        field(32;"Date Vente B TR1";Date)
        {
        }
        field(33;"Date Vente B TR2";Date)
        {
        }
        field(34;"Date Vente B TR3";Date)
        {
        }
        field(35;"Date Vente B TR4";Date)
        {
        }
        field(36;"Qty Cmd Service Ref Rempacente";Decimal)
        {
        }
        field(37;"Nature B";Option)
        {
            OptionCaptionML = ENU=' ,SCD,NFP,EST,685,VIN,LST',
                              FRA=' ,SCD,NFP,EST,685,VIN,LST';
            OptionMembers = " ",SCD,NFP,EST,"685",VIN,LST;
        }
        field(38;"DGX B";Boolean)
        {
        }
        field(39;"Pièce de origine";Boolean)
        {
        }
        field(40;"Qty Cmd Vente Ref Origine";Decimal)
        {
        }
        field(41;"Qty Cmd Vente Ref Remplacente";Decimal)
        {
        }
        field(42;"Article D";Code[20])
        {
        }
        field(43;"Qty En transit Ref Origine";Decimal)
        {
        }
        field(44;"Qty En transit Ref Remplacente";Decimal)
        {
        }
        field(45;"Référence Résultante";Code[20])
        {
        }
        field(46;"Date Injection";DateTime)
        {
        }
    }

    keys
    {
        key(Key1;"Ref Origine")
        {
        }
    }

    fieldgroups
    {
    }
}

