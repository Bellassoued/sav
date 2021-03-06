table 60043 "Ligne Regle repartition Buffer"
{

    fields
    {
        field(1;"Code Règle";Code[20])
        {
        }
        field(2;"Num ligne";Integer)
        {
            AutoIncrement = true;
        }
        field(3;"Code Axe";Code[20])
        {
        }
        field(4;"Valeur Axe";Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FIELD(Code Axe));
        }
        field(5;Pourcentage;Decimal)
        {
            DecimalPlaces = 0:0;
            MaxValue = 100;
            MinValue = 1;
        }
    }

    keys
    {
        key(Key1;"Code Règle","Code Axe","Valeur Axe")
        {
            SumIndexFields = Pourcentage;
        }
    }

    fieldgroups
    {
    }
}

