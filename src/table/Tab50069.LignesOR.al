table 50069 "Lignes OR"
{

    fields
    {
        field(1;"Document Type";Text[30])
        {
        }
        field(2;"Sell-to Customer No.";Code[20])
        {
        }
        field(3;"Document No.";Code[20])
        {
        }
        field(4;"Line No.";Code[20])
        {
        }
        field(5;Type;Integer)
        {
        }
        field(6;"No.";Code[20])
        {
        }
        field(10;"Location Code";Code[20])
        {
        }
        field(11;Description;Text[250])
        {
        }
        field(12;"Unit of Measure";Text[30])
        {
        }
        field(13;Quantity;Decimal)
        {
        }
        field(14;"Quantity Shipped";Decimal)
        {
        }
        field(15;"Unit Price";Decimal)
        {
        }
        field(16;"VAT %";Decimal)
        {
        }
        field(29;"Line Discount %";Decimal)
        {
        }
        field(30;"Line Discount Amount";Decimal)
        {
        }
        field(31;Amount;Decimal)
        {
        }
        field(32;"Amount Including VAT";Decimal)
        {
        }
        field(33;"Traitée";Boolean)
        {
        }
        field(34;Existe;Boolean)
        {
            CalcFormula = Exist(Item WHERE (No.=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(35;"Ressource existe";Boolean)
        {
            CalcFormula = Exist(Resource WHERE (No.=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(36;"Cout existe";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Document Type","Line No.","Document No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        CASE "Unit of Measure" OF
          'Item': BEGIN "Unit of Measure"     :='PCS'; END;
          'Heure': BEGIN "Unit of Measure"    :='HRS'; END;
          'Standard': BEGIN "Unit of Measure" :='STD'; END;
          'Pack': BEGIN "Unit of Measure"     :='PACK'; END;
          'Litre': BEGIN "Unit of Measure"    :='L'; END;
          'MO': BEGIN "Unit of Measure"       :='MO'; END;
        END;
    end;
}

