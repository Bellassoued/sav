page 70071 "Code remise Master"
{
    CaptionML = ENU='Code remise Master',
                FRA='Product Code';
    PageType = List;
    SourceTable = Table70050;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Remise";"Code Remise")
                {
                }
                field("SCC Manualle";"SCC Manualle")
                {
                }
            }
        }
    }

    actions
    {
    }
}

