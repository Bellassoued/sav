page 69072 "Liste des demandes réparation"
{
    // version MAZDA1004

    CardPageID = "Demande réparation";
    PageType = List;
    SourceTable = Table60067;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("No Article Service";"No Article Service")
                {
                }
                field(VIN;VIN)
                {
                }
                field("Operation Type";"Operation Type")
                {
                }
                field("Model Code";"Model Code")
                {
                }
                field("Code Entretien";"Code Entretien")
                {
                }
                field("Approbation RH";"Approbation RH")
                {
                }
                field("Fiche Réception Liée";"Fiche Réception Liée")
                {
                }
                field("Commande Achat Liée";"Commande Achat Liée")
                {
                }
                field("Date Création";"Date Création")
                {
                }
            }
        }
    }

    actions
    {
    }
}

