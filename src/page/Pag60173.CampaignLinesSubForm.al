page 60173 "Campaign Lines SubForm"
{
    // version RAD

    PageType = ListPart;
    SourceTable = Table60047;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Expense code";"Expense code")
                {
                    Lookup = true;
                    LookupPageID = "Liste articles marketing";
                }
                field("Expense Description";"Expense Description")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field("Gros Estimated Cost";"Gros Estimated Cost")
                {
                }
                field("Amount On Purchase Order";"Amount On Purchase Order")
                {
                }
                field("On Purchase Invoice";"On Purchase Invoice")
                {
                }
                field("Remainning Amount";"Remainning Amount")
                {
                }
                field("Buy-from Vendor No.";"Buy-from Vendor No.")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        //SM
        CALCFIELDS("Amount On Purchase Order","On Purchase Invoice");
        "Remainning Amount" := "Gros Estimated Cost"-("Amount On Purchase Order"+"On Purchase Invoice");
        //END SM
    end;
}

