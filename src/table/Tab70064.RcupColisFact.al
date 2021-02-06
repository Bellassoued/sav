table 70064 "Récup. Colis/Fact"
{
    Caption = 'Récup. Colis/Fact';
    DrillDownPageID = 70082;
    LookupPageID = 70082;

    fields
    {
        field(1;"No. Dossier Arrivage";Code[20])
        {
        }
        field(2;"No. Colis";Code[20])
        {
        }
        field(3;"No. Facture Origine";Code[20])
        {
        }
        field(4;"Autres factures";Code[100])
        {
        }
        field(5;"Désignation";Code[100])
        {
        }
        field(6;"Total Montant";Decimal)
        {
        }
        field(7;"No. Cmd Achat";Code[20])
        {
        }
        field(8;Urgent;Boolean)
        {
        }
        field(52;"Totalement Colturer";Boolean)
        {
            CalcFormula = Min("Posted Whse. Receipt Header".Cloturer WHERE (No. Dossier Imprort=FIELD(No. Dossier Arrivage)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No. Dossier Arrivage","No. Colis")
        {
        }
    }

    fieldgroups
    {
    }
}

