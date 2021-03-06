table 70090 "Consolider Calcul Transfert"
{
    DrillDownPageID = 70198;
    LookupPageID = 70198;

    fields
    {
        field(1;"Réf 1";Code[20])
        {
        }
        field(2;"Company Name";Text[50])
        {
        }
        field(3;"Réf 2";Code[20])
        {
        }
        field(4;"Nature Réf1";Text[30])
        {
        }
        field(5;"Nature Réf2";Text[30])
        {
        }
        field(6;"Désignation Ref1";Text[80])
        {
        }
        field(7;"Désignation Réf2";Text[80])
        {
        }
        field(8;"Stock réf1";Decimal)
        {
        }
        field(9;"Code Magasin";Text[250])
        {
        }
        field(10;"Stock réf2";Decimal)
        {
        }
        field(11;"Qté Vente Réf1";Decimal)
        {
        }
        field(12;"Qté Vente Réf2";Decimal)
        {
        }
        field(13;"Qte sur commande Vente Réf1";Decimal)
        {
        }
        field(14;"Qte sur commande Vente Réf2";Decimal)
        {
        }
        field(15;"Qte sur commande Service Réf1";Decimal)
        {
        }
        field(16;"Qte sur commande Service Réf2";Decimal)
        {
        }
        field(17;"Qté réservée sur Stock Réf1";Decimal)
        {
        }
        field(18;"Qté réservée sur Stock Réf2";Decimal)
        {
        }
        field(19;"Qté en cours Transfert Réf1";Decimal)
        {
        }
        field(20;"Qté en cours Transfert Réf2";Decimal)
        {
        }
        field(21;"Qté Ventes Réf1";Decimal)
        {
        }
        field(22;"Qté Ventes Réf2";Decimal)
        {
        }
        field(23;"Transfer vers Magasin";Text[30])
        {
        }
        field(24;Index;Code[10])
        {
        }
        field(25;Segment;Code[10])
        {
        }
        field(26;Famille;Code[10])
        {
        }
        field(27;"Référence Resultante";Code[20])
        {
        }
        field(30;"Date injection";DateTime)
        {
        }
        field(70102;"Nature Piece Remplaçante";Option)
        {
            CalcFormula = Lookup(Item."Nature Piece" WHERE (No.=FIELD(Réf 2)));
            Description = 'PR0021';
            FieldClass = FlowField;
            OptionCaptionML = FRA=' ,SCD,NFP,EST,685,VIN,LST',
                              ENG=' ,SCD,NFP,EST,685,VIN,LST';
            OptionMembers = " ",SCD,NFP,EST,"685",VIN,LST;
        }
    }

    keys
    {
        key(Key1;"Réf 1","Code Magasin")
        {
        }
    }

    fieldgroups
    {
    }
}

