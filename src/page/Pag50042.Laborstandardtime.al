page 50042 "Labor standard time"
{
    CaptionML = ENU='Labor standard time',
                FRA='Temps standard service';
    PageType = List;
    SourceTable = Table60029;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Service Cost";"Service Cost")
                {
                }
                field("Vehicule Model";"Vehicule Model")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field(Description;Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

