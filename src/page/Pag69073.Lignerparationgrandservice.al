page 69073 "Ligne réparation grand service"
{
    // version MAZDA1004

    PageType = ListPart;
    SourceTable = Table60068;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Num ligne";"Num ligne")
                {
                    Editable = false;
                }
                field("Code Zone panne";"Code Zone panne")
                {
                }
                field("Description Zone";"Description Zone")
                {
                }
                field("Code Symptome";"Code Symptome")
                {
                }
                field("Description symptome";"Description symptome")
                {
                }
            }
        }
    }

    actions
    {
    }
}

