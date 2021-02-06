table 70085 "Tmp Item LE"
{

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;Variante;Code[10])
        {
        }
        field(3;Magasin;Code[10])
        {
        }
        field(4;Emplacement;Code[20])
        {
        }
        field(5;"Quantité";Decimal)
        {
        }
        field(6;CoutUnitaire;Decimal)
        {
        }
        field(7;VIN;Text[30])
        {
        }
        field(8;Existe;Boolean)
        {
            CalcFormula = Exist(Item WHERE (No.=FIELD(No.)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;Variante,"No.",Magasin,Emplacement)
        {
        }
    }

    fieldgroups
    {
    }
}

