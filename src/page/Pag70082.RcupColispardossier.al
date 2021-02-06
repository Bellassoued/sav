page 70082 "Récup Colis par dossier"
{
    PageType = ListPart;
    SourceTable = Table70064;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Dossier Arrivage";"No. Dossier Arrivage")
                {
                }
                field("No. Colis";"No. Colis")
                {
                }
                field("Total Montant";"Total Montant")
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
                field("No. Cmd Achat";"No. Cmd Achat")
                {
                }
                field(Urgent;Urgent)
                {
                }
            }
        }
    }

    actions
    {
    }
}

