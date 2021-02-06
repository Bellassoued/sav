table 70037 "Détail L.C"
{
    // version a remplacer par une seule table


    fields
    {
        field(1;"No. L.C";Code[20])
        {
        }
        field(2;"No. Ligne";Integer)
        {
        }
        field(3;"No. Expédition";Code[20])
        {
        }
        field(4;"No. Ligne Expédition";Integer)
        {
        }
        field(5;"No. Proforma";Code[20])
        {
        }
        field(6;"Type proforma";Code[50])
        {
        }
        field(7;"Quantité";Decimal)
        {
        }
        field(8;"Montant Devise";Decimal)
        {
        }
        field(9;"Montant Tnd";Decimal)
        {
        }
        field(10;"Qty restante";Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Outstanding Quantity" WHERE (Document Type=CONST(Order),
                                                                            No. Expédition=FIELD(No. Expédition),
                                                                            No. L.C=FIELD(No. L.C),
                                                                            No. Line Expédition=FIELD(No. Ligne Expédition)));
            FieldClass = FlowField;
        }
        field(11;"Qty Reçu";Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Quantity Received" WHERE (Document Type=CONST(Order),
                                                                         No. Expédition=FIELD(No. Expédition),
                                                                         No. L.C=FIELD(No. L.C),
                                                                         No. Proforma VN=FIELD(No. Proforma)));
            FieldClass = FlowField;
        }
        field(12;"Montant arrivage Devise";Decimal)
        {
        }
        field(13;"Date creation";Date)
        {
        }
        field(37;Statut;Option)
        {
            OptionCaption = 'Ouvert,Lancer,Clôturé';
            OptionMembers = Ouvert,Lancer,"Clôturé";
        }
        field(38;"Montant arrivage Tnd";Decimal)
        {
        }
        field(39;Provenance;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(40;"Qty Arrivage";Decimal)
        {
            CalcFormula = Sum("Purch. Rcpt. Line".Quantity WHERE (No. L.C=FIELD(No. L.C),
                                                                  No. Line Expédition=FIELD(No. Ligne Expédition)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No. L.C","No. Proforma","No. Expédition","No. Ligne")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        "Date creation" := WORKDATE;
    end;
}

