page 60200 "Liste Commande PSA"
{
    PageType = List;
    Permissions = TableData 50087=rimd;
    SourceTable = Table50087;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("N° séquence";"N° séquence")
                {
                }
                field("Type commende";"Type commende")
                {
                }
                field("N° Client";"N° Client")
                {
                }
                field("Date Commende";"Date Commende")
                {
                }
                field("N° De commende";"N° De commende")
                {
                }
                field("N° Pièce";"N° Pièce")
                {
                }
                field(Quantité;Quantité)
                {
                }
            }
        }
    }

    actions
    {
    }
}

