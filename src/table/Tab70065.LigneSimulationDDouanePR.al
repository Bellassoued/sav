table 70065 "Ligne Simulation D.Douane PR"
{

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"No. Remorque";Code[20])
        {
        }
        field(3;"Désignation";Text[100])
        {
        }
        field(4;"Date Document";Date)
        {
        }
        field(5;"Nbr. Facture";Integer)
        {
        }
        field(6;"Total Nbr. Colis";Integer)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois"."Nbr Colis" WHERE (No. Document=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(7;"Montant Total Devis";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois"."Montant Devise" WHERE (No. Document=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(8;"Cous du jour";Decimal)
        {
        }
        field(9;"Montant Total TND";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois"."Montant Tnd" WHERE (No. Document=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(10;"No. Série";Code[20])
        {
        }
        field(11;"Date Saisie";Date)
        {
        }
        field(12;"Total Volume";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois".Volume WHERE (No. Document=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(13;"Total Poid Brut";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois"."Poid Brut" WHERE (No. Document=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(14;Statut;Option)
        {
            OptionCaption = '" ,en cour,lancer,Clôturer"';
            OptionMembers = " ","En cour",lancer,"Clôturer";
        }
        field(15;"Date Départ Marseille";Date)
        {
        }
        field(16;"Date Arrivée GEFCO";Date)
        {
        }
        field(17;Type;Option)
        {
            OptionCaption = '" ,Remorque,Groupage"';
            OptionMembers = " ",Remorque,Groupage;
        }
        field(18;"Créer par";Code[50])
        {
        }
        field(19;"No. Arrivage PR";Code[20])
        {
            TableRelation = "Entete Arrivage PR"."No. Arrivage";
        }
        field(20;Observation;Text[250])
        {
        }
        field(21;"Montant Assurance";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }
}

