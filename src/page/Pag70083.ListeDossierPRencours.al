page 70083 "Liste Dossier PR en cours"
{
    CardPageID = "Entête Facture P.R / Colis";
    PageType = List;
    SourceTable = Table70060;
    SourceTableView = WHERE(Date Arrivée GEFCO=FILTER(<>''));

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
                field("Date Document";"Date Document")
                {
                }
                field("Nbr. Facture";"Nbr. Facture")
                {
                }
                field("Total Nbr. Colis";"Total Nbr. Colis")
                {
                }
                field("Montant Total Devis";"Montant Total Devis")
                {
                }
                field("Cous du jour";"Cous du jour")
                {
                }
                field("Montant Total TND";"Montant Total TND")
                {
                }
                field("No. Série";"No. Série")
                {
                }
                field("Date Saisie";"Date Saisie")
                {
                }
                field("Total Volume";"Total Volume")
                {
                }
                field("Total Poid Brut";"Total Poid Brut")
                {
                }
                field(Statut;Statut)
                {
                }
                field("Date Départ Marseille";"Date Départ Marseille")
                {
                }
                field("Date Arrivée GEFCO";"Date Arrivée GEFCO")
                {
                }
                field(Type;Type)
                {
                }
                field("Créer par";"Créer par")
                {
                }
                field("No. Arrivage PR";"No. Arrivage PR")
                {
                }
                field(Observation;Observation)
                {
                }
            }
        }
    }

    actions
    {
    }
}

