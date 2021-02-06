page 70035 "Liste bordereau PVN"
{
    CardPageID = "Bordereau PVN";
    PageType = List;
    SourceTable = Table70021;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("N° Bordereau";"N° Bordereau")
                {
                }
                field("Date Création";"Date Création")
                {
                }
                field("Date Emission";"Date Emission")
                {
                }
                field("Nbre Véhicule";"Nbre Véhicule")
                {
                }
                field(Statut;Statut)
                {
                }
                field("Time Création";"Time Création")
                {
                }
                field("Time Emission";"Time Emission")
                {
                }
            }
        }
    }

    actions
    {
    }
}

