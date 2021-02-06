page 50131 "License Permission Page"
{
    PageType = List;
    SourceTable = Table2000000043;
    SourceTableView = SORTING(Object Type,Object Number)
                      WHERE(Object Type=CONST(Page),
                            Insert Permission=CONST(Yes));

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

