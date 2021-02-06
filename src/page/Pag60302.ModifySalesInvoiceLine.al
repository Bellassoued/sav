page 60302 "Modify Sales Invoice Line."
{
    PageType = List;
    Permissions = TableData 113=rm;
    SourceTable = Table113;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                }
                field(VIN;VIN)
                {
                }
                field("Affecter sur";"Affecter sur")
                {
                }
            }
        }
    }

    actions
    {
    }
}

