page 50096 "VIN Par Statut Prep"
{
    PageType = List;
    SourceTable = Table60025;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Preparation No";"Preparation No")
                {
                }
                field("Vehicle No.";"Vehicle No.")
                {
                }
                field(VIN;VIN)
                {
                }
                field("Status Préparation";"Status Préparation")
                {
                }
            }
        }
    }

    actions
    {
    }
}

