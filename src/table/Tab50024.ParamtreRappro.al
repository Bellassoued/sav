table 50024 "Paramétre Réappro"
{
    // version Reappro TYT V01

    DrillDownPageID = 60360;
    LookupPageID = 60360;

    fields
    {
        field(1;Code_Classe;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Désignation_Classe";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;MAD_Min;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4;MAD_Max;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;FC_Min;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;FC_Max;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"S/S for demand";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Moyenne of S/S for demand";Decimal)
        {
            CalcFormula = Average(Item."S/S For Demand" WHERE (Rotation=FIELD(Code_Classe),
                                                               Vendor No.=FILTER(FR000656)));
            FieldClass = FlowField;
        }
        field(9;"Appliquer Short Warning";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Code_Classe)
        {
        }
    }

    fieldgroups
    {
    }
}

