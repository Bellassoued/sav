page 60166 "Main d'oeuvre"
{
    PageType = List;
    SourceTable = Table5993;
    SourceTableView = SORTING(Type,No.)
                      WHERE(Type=CONST(Cost));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("No.";"No.")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Unit Price";"Unit Price")
                {
                }
                field(Description;Description)
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Type service";"Type service")
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field(Amount;Amount)
                {
                }
            }
        }
    }

    actions
    {
    }
}

