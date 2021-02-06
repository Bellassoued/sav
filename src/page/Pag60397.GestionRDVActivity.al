page 60397 "Gestion RDV Activity"
{
    // version Gestion RDV

    PageType = CardPart;
    SourceTable = Table9052;

    layout
    {
        area(content)
        {
            cuegroup()
            {
                field("OR-RDV SAV";"OR-RDV SAV")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("OR-RDV CHRONO";"OR-RDV CHRONO")
                {
                }
                field("Rendez-Vous";"Rendez-Vous")
                {
                    DrillDownPageID = "Liste Rendez-vous";
                    LookupPageID = "Liste Rendez-vous";
                }
                field(Réclamations;Réclamations)
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

