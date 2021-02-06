page 69093 "Liste Option"
{
    PageType = List;
    SourceTable = Table50041;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Option";"Code Option")
                {
                    DrillDownPageID = "Fiche Option";
                    LookupPageID = "Fiche Option";
                }
                field(Description;Description)
                {
                }
                field("Bi-ton";"Bi-ton")
                {
                }
                field("Annule Bi-ton";"Annule Bi-ton")
                {
                }
                field(Jante;Jante)
                {
                }
                field(Groupement;Groupement)
                {
                }
            }
        }
    }

    actions
    {
    }
}

