table 60029 "Labor standard Time"
{
    CaptionML = ENU='Labor standard Time',
                FRA='Temps standard de service';

    fields
    {
        field(1;"Service Cost";Code[20])
        {
            CaptionML = ENU='Service Cost',
                        FRA='Cout de service';
            TableRelation = "Service Cost".Code;
        }
        field(2;"Vehicule Model";Code[20])
        {
            CaptionML = ENU='Vehicule Model',
                        FRA='Modèle Vehicule';
            TableRelation = Item.No. WHERE (Item type=CONST(Vehicule));
        }
        field(3;Quantity;Decimal)
        {
            CaptionML = ENU='Quantity',
                        FRA='Quantité';
        }
        field(4;Description;Text[50])
        {
            CalcFormula = Lookup("Service Cost".Description WHERE (Code=FIELD(Service Cost)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Service Cost","Vehicule Model")
        {
        }
    }

    fieldgroups
    {
    }
}

