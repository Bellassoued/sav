page 50189 "Permission Licence"
{
    PageType = List;
    SourceTable = Table2000000043;
    SourceTableView = WHERE(Object Type=CONST(Page),
                            Object Number=FILTER(50000..100000));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Object Type";"Object Type")
                {
                }
                field("Object Number";"Object Number")
                {
                }
                field("Read Permission";"Read Permission")
                {
                }
                field("Insert Permission";"Insert Permission")
                {
                }
                field("Modify Permission";"Modify Permission")
                {
                }
                field("Delete Permission";"Delete Permission")
                {
                }
                field("Execute Permission";"Execute Permission")
                {
                }
                field("Limited Usage Permission";"Limited Usage Permission")
                {
                }
            }
        }
    }

    actions
    {
    }
}

