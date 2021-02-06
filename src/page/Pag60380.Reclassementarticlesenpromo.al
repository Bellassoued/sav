page 60380 "Reclassement articles en promo"
{
    // version PROMO

    PageType = List;
    SourceTable = Table50059;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code article";"Code article")
                {
                }
                field("Code magasin";"Code magasin")
                {
                }
                field("Code Casier destination";"Code Casier destination")
                {
                }
                field("Stock magasin";"Stock magasin")
                {
                }
                field("Stock casier destination";"Stock casier destination")
                {
                }
                field("Quantité restante";"Quantité restante")
                {
                }
                field("Quantité préconisée";"Quantité préconisée")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Tranférer vers emplacement promotion")
            {
                Caption = 'Tranférer vers emplacement promotion';

                trigger OnAction();
                begin
                    TESTFIELD("Code Casier destination");
                end;
            }
        }
    }

    var
        ItemJournalLine : Record "83";
        WarehouseEntry : Record "7312";
}

