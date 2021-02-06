page 60182 "Perse Article"
{
    // version CT16V002

    CardPageID = "Perse Options";
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = Table50034;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Perse";"Code Perse")
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
        area(processing)
        {
        }
    }
}

