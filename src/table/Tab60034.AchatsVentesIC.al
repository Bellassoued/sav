table 60034 "Achats Ventes IC"
{
    DataPerCompany = false;

    fields
    {
        field(1;"Code Magasin";Code[20])
        {
        }
        field(2;"Code Article";Code[20])
        {
            TableRelation = Item;
        }
        field(3;"Sales Quantity (Base)";Decimal)
        {
        }
        field(4;"sales amount";Decimal)
        {
        }
        field(5;"Quantite Totale (Base)";Decimal)
        {
            CalcFormula = Sum("Achats Ventes IC"."Sales Quantity (Base)" WHERE (Code Article=FIELD(Code Article)));
            FieldClass = FlowField;
        }
        field(6;"Montant Total Ventes";Decimal)
        {
            CalcFormula = Sum("Achats Ventes IC"."sales amount" WHERE (Code Article=FIELD(Code Article)));
            FieldClass = FlowField;
        }
        field(7;Stock;Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE (Item No.=FIELD(Code Article),
                                                                  Posting Date=FIELD(date filter),
                                                                  Location Code=FIELD(Code Magasin)));
            FieldClass = FlowField;
        }
        field(8;"date filter";Date)
        {
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1;"Code Magasin","Code Article")
        {
            SumIndexFields = "Sales Quantity (Base)","sales amount";
        }
    }

    fieldgroups
    {
    }
}

