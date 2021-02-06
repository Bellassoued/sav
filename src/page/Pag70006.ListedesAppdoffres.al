page 70006 "Liste des App. d'offres"
{
    // version CT16V002.2

    CardPageID = "Fiche caution";
    PageType = List;
    SourceTable = Table70004;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("No. appel d'offre";"No. appel d'offre")
                {
                }
                field("Date création";"Date création")
                {
                }
                field("Code client";"Code client")
                {
                }
                field("Nom client";"Nom client")
                {
                }
                field("Adresse client";"Adresse client")
                {
                }
                field(Statut;Statut)
                {
                }
                field("Reference caution bancaire";"Reference caution bancaire")
                {
                }
                field("Montant marché";"Montant marché")
                {
                }
                field(Objet;Objet)
                {
                }
                field("No. Bord. Cau. Prov.";"No. Bord. Cau. Prov.")
                {
                }
                field("No. Bord Cau. Def.";"No. Bord Cau. Def.")
                {
                }
                field("No. Bord Cau. RG";"No. Bord Cau. RG")
                {
                }
            }
        }
    }

    actions
    {
    }
}

