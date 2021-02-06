table 70072 "Dossier Import / Colis"
{

    fields
    {
        field(1;"No. Dossier Import";Code[20])
        {
        }
        field(2;"No. Facture Fournisseur";Code[20])
        {
        }
        field(3;"No Colis";Code[20])
        {
        }
        field(4;"Autres factures";Code[100])
        {
        }
        field(5;"Désignation";Code[100])
        {
        }
        field(6;"No. Arrivage PR";Code[20])
        {
        }
        field(7;"Total Poid Brut Par Colis";Decimal)
        {
        }
        field(8;"Total Poid Net Par Colis";Decimal)
        {
        }
        field(9;"Total Volume Par Colis";Decimal)
        {
        }
        field(10;"Total Montant Par Colis";Decimal)
        {
            CalcFormula = Sum("Arrivage PR"."Total Line Montant" WHERE (Numero Colis=FIELD(No Colis),
                                                                        No. Arrivage=FIELD(No. Arrivage PR)));
            FieldClass = FlowField;
        }
        field(11;"Nbre. Colis";Integer)
        {
        }
        field(12;"No. Commande Achat";Code[20])
        {
        }
        field(13;Urgent;Boolean)
        {
        }
        field(14;"Facture inserer";Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"No. Arrivage PR","No Colis","No. Facture Fournisseur")
        {
        }
    }

    fieldgroups
    {
    }
}

