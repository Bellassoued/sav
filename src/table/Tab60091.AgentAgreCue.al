table 60091 "Agent Agrée Cue"
{

    fields
    {
        field(1;"Primary Key";Code[10])
        {
            CaptionML = ENU='Primary Key',
                        FRA='Clé primaire';
        }
        field(2;"VIN Vendu (Année)";Integer)
        {
            CalcFormula = Count("Service Item" WHERE (Salesperson Code=FIELD(SalesPersone Filter),
                                                      Sales Date=FIELD(Filter Date A)));
            FieldClass = FlowField;
        }
        field(3;"VIN Vendu (Mois)";Integer)
        {
            CalcFormula = Count("Service Item" WHERE (Salesperson Code=FIELD(SalesPersone Filter),
                                                      Sales Date=FIELD(Filter Date M)));
            FieldClass = FlowField;
        }
        field(4;"VIN Vendu (Semaine)";Integer)
        {
            CalcFormula = Count("Service Item" WHERE (Salesperson Code=FIELD(SalesPersone Filter),
                                                      Sales Date=FIELD(Filter Date S)));
            FieldClass = FlowField;
        }
        field(5;"VIN Livrée (Année)";Integer)
        {
            CalcFormula = Count("Service Item" WHERE (Salesperson Code=FIELD(SalesPersone Filter),
                                                      Date Livraison=FIELD(Filter Date A)));
            FieldClass = FlowField;
        }
        field(6;"VIN Livrée (Mois)";Integer)
        {
            CalcFormula = Count("Service Item" WHERE (Salesperson Code=FIELD(SalesPersone Filter),
                                                      Date Livraison=FIELD(Filter Date M)));
            FieldClass = FlowField;
        }
        field(7;"VIN Livrée (Semaine)";Integer)
        {
            CalcFormula = Count("Service Item" WHERE (Salesperson Code=FIELD(SalesPersone Filter),
                                                      Date Livraison=FIELD(Filter Date S)));
            FieldClass = FlowField;
        }
        field(8;"SalesPersone Filter";Code[10])
        {
            FieldClass = FlowFilter;
        }
        field(9;"Filter Date A";Date)
        {
            FieldClass = FlowFilter;
        }
        field(10;"Filter Date M";Date)
        {
            FieldClass = FlowFilter;
        }
        field(11;"Filter Date S";Date)
        {
            FieldClass = FlowFilter;
        }
        field(12;"CA PR (Année)";Decimal)
        {
            CalcFormula = Sum("Value Entry"."Sales Amount (Actual)" WHERE (Item Ledger Entry Type=CONST(Sale),
                                                                           Posting Date=FIELD(Filter Date A),
                                                                           Document Type=FILTER(Sales Invoice|Sales Shipment|Sales Return Receipt|Sales Credit Memo)));
            FieldClass = FlowField;
        }
        field(13;"CA PR (Mois)";Decimal)
        {
            CalcFormula = Sum("Value Entry"."Sales Amount (Actual)" WHERE (Item Ledger Entry Type=CONST(Sale),
                                                                           Posting Date=FIELD(Filter Date M),
                                                                           Document Type=FILTER(Sales Invoice|Sales Shipment|Sales Return Receipt|Sales Credit Memo)));
            FieldClass = FlowField;
        }
        field(14;"CA PR (Semaine)";Decimal)
        {
            CalcFormula = Sum("Value Entry"."Sales Amount (Actual)" WHERE (Item Ledger Entry Type=CONST(Sale),
                                                                           Posting Date=FIELD(Filter Date S),
                                                                           Document Type=FILTER(Sales Invoice|Sales Shipment|Sales Return Receipt|Sales Credit Memo)));
            FieldClass = FlowField;
        }
        field(15;"Montant Achat CTR (Année)";Decimal)
        {
            CalcFormula = Sum("Value Entry"."Cost Amount (Actual)" WHERE (Posting Date=FIELD(Filter Date A),
                                                                          Item Ledger Entry Type=CONST(Purchase),
                                                                          Source No.=FIELD(Vendor Filter),
                                                                          Source Type=FILTER(Vendor)));
            FieldClass = FlowField;
        }
        field(16;"Montant Achat CTR (Mois)";Decimal)
        {
            CalcFormula = Sum("Value Entry"."Cost Amount (Actual)" WHERE (Posting Date=FIELD(Filter Date M),
                                                                          Item Ledger Entry Type=CONST(Purchase),
                                                                          Source No.=FIELD(Vendor Filter),
                                                                          Source Type=FILTER(Vendor)));
            FieldClass = FlowField;
        }
        field(17;"Montant Achat CTR (Semaine)";Decimal)
        {
            CalcFormula = Sum("Value Entry"."Cost Amount (Actual)" WHERE (Posting Date=FIELD(Filter Date S),
                                                                          Item Ledger Entry Type=CONST(Purchase),
                                                                          Source No.=FIELD(Vendor Filter),
                                                                          Source Type=FILTER(Vendor)));
            FieldClass = FlowField;
        }
        field(18;"Vendor Filter";Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(19;"CA SAV (Année)";Decimal)
        {
            CalcFormula = Sum("Value Entry"."Sales Amount (Actual)" WHERE (Item Ledger Entry Type=CONST(Sale),
                                                                           Posting Date=FIELD(Filter Date A),
                                                                           Document Type=FILTER(Service Shipment|Service Invoice|Service Credit Memo)));
            FieldClass = FlowField;
        }
        field(20;"CA SAV (Mois)";Decimal)
        {
            CalcFormula = Sum("Value Entry"."Sales Amount (Actual)" WHERE (Item Ledger Entry Type=CONST(Sale),
                                                                           Posting Date=FIELD(Filter Date M),
                                                                           Document Type=FILTER(Service Shipment|Service Invoice|Service Credit Memo)));
            FieldClass = FlowField;
        }
        field(21;"CA SAV (Semaine)";Decimal)
        {
            CalcFormula = Sum("Value Entry"."Sales Amount (Actual)" WHERE (Item Ledger Entry Type=CONST(Sale),
                                                                           Posting Date=FIELD(Filter Date S),
                                                                           Document Type=FILTER(Service Shipment|Service Invoice|Service Credit Memo)));
            FieldClass = FlowField;
        }
        field(22;"Nombre d'entrée (Année)";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Creation date=FIELD(Filter Date A)));
            FieldClass = FlowField;
        }
        field(23;"Nombre d'entrée (Mois)";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Creation date=FIELD(Filter Date M)));
            FieldClass = FlowField;
        }
        field(24;"Nombre d'entrée (Semaine)";Integer)
        {
            CalcFormula = Count("Reception SAV" WHERE (Creation date=FIELD(Filter Date S)));
            FieldClass = FlowField;
        }
        field(25;"Nombre des Factures SAV(Année)";Integer)
        {
            CalcFormula = Count("Service Invoice Header" WHERE (Posting Date=FIELD(Filter Date A)));
            FieldClass = FlowField;
        }
        field(26;"Nombre des Factures SAV(Mois)";Integer)
        {
            CalcFormula = Count("Service Invoice Header" WHERE (Posting Date=FIELD(Filter Date M)));
            FieldClass = FlowField;
        }
        field(27;"Nombre des Factures SAV(Sem)";Integer)
        {
            CalcFormula = Count("Service Invoice Header" WHERE (Posting Date=FIELD(Filter Date S)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
}

