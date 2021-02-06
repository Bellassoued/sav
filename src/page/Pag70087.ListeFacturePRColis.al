page 70087 "Liste Facture P.R / Colis"
{
    CardPageID = "Entête Facture P.R / Colis";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Table70060;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("No. Remorque";"No. Remorque")
                {
                }
                field(Désignation;Désignation)
                {
                }
                field("Date Arrivage Magasin";"Date Arrivage Magasin")
                {
                }
                field("Cous du jour";"Cous du jour")
                {
                }
                field("No L.C";"No L.C")
                {
                }
                field("Date Déclaration";"Date Déclaration")
                {
                }
                field("Date de clôture";"Date de clôture")
                {
                }
                field(Statut;Statut)
                {
                }
            }
        }
    }

    actions
    {
    }
}

