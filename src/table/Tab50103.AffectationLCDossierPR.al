table 50103 "Affectation LC/Dossier PR"
{

    fields
    {
        field(1;"No. LC PR";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Lettre de crédit L.C";
        }
        field(2;"No. Dossier";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Entête Facture P.R / Colis";
        }
        field(3;"Total Volume";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois".Volume WHERE (No. Document=FIELD(No. Dossier)));
            FieldClass = FlowField;
        }
        field(4;"Total Poid Brut";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois"."Poid Brut" WHERE (No. Document=FIELD(No. Dossier)));
            FieldClass = FlowField;
        }
        field(5;"Nbr. Facture";Integer)
        {
            CalcFormula = Count("Ligne Factures P.R /Clois" WHERE (No. Document=FIELD(No. Dossier)));
            FieldClass = FlowField;
        }
        field(6;"Total Nbr. Colis";Integer)
        {
            CalcFormula = Count("Récup. Colis/Fact" WHERE (No. Dossier Arrivage=FIELD(No. Dossier)));
            FieldClass = FlowField;
        }
        field(7;"Montant Total Devis";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois"."Montant Devise" WHERE (No. Document=FIELD(No. Dossier)));
            FieldClass = FlowField;

            trigger OnValidate();
            begin
                //"Montant Total TND" := "Cous du jour" * "Montant Total Devis";
            end;
        }
        field(9;"Montant Total TND";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois"."Montant Tnd" WHERE (No. Document=FIELD(No. Dossier)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No. LC PR","No. Dossier")
        {
        }
    }

    fieldgroups
    {
    }
}

