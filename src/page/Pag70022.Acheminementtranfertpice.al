page 70022 "Acheminement tranfert pièce"
{
    Editable = true;
    PageType = List;
    SourceTable = Table70019;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No.";"Item No.")
                {
                }
                field("Magasin source";"Magasin source")
                {
                }
                field("Magasin destination";"Magasin destination")
                {
                }
                field(Quantité;Quantité)
                {
                }
                field("No. commande vente";"No. commande vente")
                {
                }
                field("No. Ligne commande";"No. Ligne commande")
                {
                }
                field("Entry No";"Entry No")
                {
                }
                field("No. ordre transfer";"No. ordre transfer")
                {
                }
                field("No. ligne transfer";"No. ligne transfer")
                {
                }
                field(Order;Order)
                {
                }
                field("Sales Order Location code";"Sales Order Location code")
                {
                }
                field("Source ID";"Source ID")
                {
                }
                field("No Doc Source";"No Doc Source")
                {
                }
                field("No Ligne Doc Source";"No Ligne Doc Source")
                {
                }
                field("No Doc Destinaton";"No Doc Destinaton")
                {
                }
                field("No Ligne Doc destination";"No Ligne Doc destination")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Demander pièce")
            {
                Image = ReservationLedger;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    AvailibilityItem : Record "70006";
                    CuStockFunctions : Codeunit "50000";
                begin
                    CuStockFunctions.CreateTransferOrderFromAcheminement(Rec);
                    CurrPage.UPDATE;
                end;
            }
        }
    }

    var
        TXT50000 : Label 'Il n''y a rien à demander';
}

