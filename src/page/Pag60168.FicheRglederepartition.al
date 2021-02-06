page 60168 "Fiche Règle de repartition"
{
    PageType = Card;
    SourceTable = Table60041;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("Code Règle";"Code Règle")
                {
                    Editable = false;
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
            group("Ligne Répartition")
            {
                part(;60169)
                {
                    SubPageLink = Code Règle=FIELD(Code Règle),
                                  Code Axe=FIELD(Code Axes);
                    SubPageView = SORTING(Code Règle,Num ligne)
                                  ORDER(Ascending);
                }
            }
        }
    }

    actions
    {
    }
}

