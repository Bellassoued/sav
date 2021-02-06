table 50072 "Lignes ORs"
{
    // version A ne pas toucher


    fields
    {
        field(1;"Customer No";Code[20])
        {
            CaptionML = ENU='Code client',
                        FRA='Code client';
        }
        field(2;VIN;Code[17])
        {
        }
        field(3;Amount;Decimal)
        {
        }
        field(4;"Source No.";Code[20])
        {
            CalcFormula = Lookup("Service Item"."Sales/Serv. Shpt. Document No." WHERE (Serial No.=FIELD(VIN)));
            FieldClass = FlowField;
        }
        field(5;Taxi;Text[30])
        {
        }
        field(6;Exists;Boolean)
        {
            CalcFormula = Exist("Sales Line" WHERE (Affecter sur=FIELD(VIN)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Customer No",Amount,VIN)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnModify();
    begin
        //IF "No."='' THEN "No."='';
    end;
}

