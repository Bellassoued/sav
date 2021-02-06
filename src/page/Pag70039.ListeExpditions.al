page 70039 "Liste Expéditions"
{
    // version new

    CardPageID = "Expédition VN";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Table70033;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Expédition";"No. Expédition")
                {
                }
                field(Désignation;Désignation)
                {
                }
                field("Date Création";"Date Création")
                {
                }
                field("crée par";"crée par")
                {
                }
                field("Total minoration";"Total minoration")
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
                field("Tot. en TND (avec Mino)";"Tot. en TND (avec Mino)")
                {
                }
                field("Tot. En Devise (avec Mino)";"Tot. En Devise (avec Mino)")
                {
                }
                field("Total Qté Expéd.";"Total Qté Expéd.")
                {
                    DecimalPlaces = 0:0;
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

