page 50054 "Ligne Titre D'importation"
{
    // version ETRANGER

    PageType = ListPart;
    SaveValues = true;
    SourceTable = Table50012;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No. Ligne";"No. Ligne")
                {
                    Editable = false;
                }
                field("Ref. article";"Ref. article")
                {
                }
                field("Désignation Article";"Désignation Article")
                {
                }
                field(Quantité;Quantité)
                {
                }
                field("Prix Unitaire Devise";"Prix Unitaire Devise")
                {
                }
                field("Prix Unitaire TND";"Prix Unitaire TND")
                {
                }
                field("Montant Devise";"Montant Devise")
                {
                }
                field("Montant TND";"Montant TND")
                {
                }
            }
        }
    }

    actions
    {
    }
}

