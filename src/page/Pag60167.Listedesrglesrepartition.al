page 60167 "Liste des règles repartition"
{
    CardPageID = "Fiche Règle de repartition";
    PageType = List;
    SourceTable = Table60041;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Règle";"Code Règle")
                {
                }
                field(Désignation;Désignation)
                {
                }
                field("Code Axes";"Code Axes")
                {
                }
                field(Statut;Statut)
                {
                }
                field(Niveau;Niveau)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        LocalPurchLine : Record "39";
}

