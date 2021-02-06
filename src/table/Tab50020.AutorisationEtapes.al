table 50020 "Autorisation Etapes"
{
    // version Chéque @ DATASOFT 2013


    fields
    {
        field(1;Etape;Integer)
        {
            TableRelation = "Payment Step".Line WHERE ("Payment Class"=FIELD(Type Reglement));
        }
        field(2;User;Code[50])
        {
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(3;"Type Reglement";Text[30])
        {
            TableRelation = "Payment Class";
        }
        field(4;"Nom Etapes";Text[50])
        {
            CalcFormula = Lookup("Payment Step".Name WHERE ("Payment Class"=FIELD(Type Reglement),
                                                            Line=FIELD(Etape)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;Etape,"Type Reglement",User)
        {
        }
        key(Key2;User)
        {
        }
    }

    fieldgroups
    {
    }
}

