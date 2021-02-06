table 50048 "Objectif Livraison VN"
{

    fields
    {
        field(1;"Point de Vente";Code[50])
        {
        }
        field(2;"Code Vendeur";Code[20])
        {
        }
        field(3;"Année";Integer)
        {
        }
        field(4;Mois;Option)
        {
            OptionCaption = 'Janvier,Février,Mars,Avril,Mai,Juin,Juillet,Aout,Septembre,Octobre,Novembre,Décembre';
            OptionMembers = Janvier,"Février",Mars,Avril,Mai,Juin,Juillet,Aout,Septembre,Octobre,Novembre,"Décembre";
        }
        field(5;"Objectif Livraison";Integer)
        {
        }
        field(6;"Centre Vente";Code[50])
        {
        }
    }

    keys
    {
        key(Key1;"Centre Vente","Point de Vente","Code Vendeur","Année",Mois)
        {
        }
    }

    fieldgroups
    {
    }
}

