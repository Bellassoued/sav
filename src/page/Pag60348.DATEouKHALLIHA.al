page 60348 "DATE ou KHALLIHA"
{
    PageType = List;
    SourceTable = Table2000000007;
    SourceTableView = WHERE(Period Type=CONST(Date));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Period Type";"Period Type")
                {
                }
                field("Period Start";"Period Start")
                {
                }
                field("Period End";"Period End")
                {
                }
                field("Period No.";"Period No.")
                {
                }
                field("Period Name";"Period Name")
                {
                }
            }
        }
    }

    actions
    {
    }
}

