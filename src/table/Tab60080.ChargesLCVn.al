table 60080 "Charges LC Vn"
{

    fields
    {
        field(1;"No. Dossier Vn";Code[20])
        {
        }
        field(2;"No. L.C";Code[20])
        {
        }
        field(3;"No. Expédition Vn";Code[20])
        {
        }
        field(4;"No. Proforma";Code[20])
        {
        }
        field(5;"No. Commande Vn";Code[20])
        {
        }
        field(6;"Nbr. Arrivage";Integer)
        {
        }
        field(7;Montant;Decimal)
        {
        }
        field(12;"Total Facture frais";Decimal)
        {
        }
        field(13;"Nbr. Facture Frais";Integer)
        {
        }
        field(15;"Type Document";Option)
        {
            OptionCaption = '" ,Commission,Facture,Paiement"';
            OptionMembers = " ",Commission,Facture,Paiement;
        }
        field(16;"No. Document";Code[20])
        {
        }
        field(17;"No. Ligne";Integer)
        {
        }
        field(18;"Date comptabilisation";Date)
        {
        }
        field(19;"Désignation";Code[100])
        {
        }
    }

    keys
    {
        key(Key1;"No. Ligne","No. L.C")
        {
        }
    }

    fieldgroups
    {
    }
}

