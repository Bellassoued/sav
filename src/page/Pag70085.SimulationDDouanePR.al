page 70085 "Simulation D.Douane PR"
{
    PageType = Card;
    SourceTable = Table70064;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("No. Dossier Arrivage";"No. Dossier Arrivage")
                {
                }
                field("No. Colis";"No. Colis")
                {
                }
                field("No. Facture Origine";"No. Facture Origine")
                {
                }
                field("Autres factures";"Autres factures")
                {
                }
                field(Désignation;Désignation)
                {
                }
                field("Total Montant";"Total Montant")
                {
                }
            }
            part(;70086)
            {
                SubPageLink = No.=FIELD(No. Dossier Arrivage);
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
    }
}

