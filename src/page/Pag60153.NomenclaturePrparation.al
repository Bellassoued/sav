page 60153 "Nomenclature Préparation"
{
    // version MAZDA301

    PageType = List;
    SourceTable = Table60036;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Article";"Code Article")
                {
                    Visible = false;
                }
                field("Service Type";"Service Type")
                {
                }
                field("Type Opération";"Type Opération")
                {
                }
                field("Code Operation";"Code Operation")
                {
                }
                field(Quantity;Quantity)
                {
                }
            }
        }
    }

    actions
    {
    }
}

