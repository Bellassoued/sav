page 50092 "Projet Lines SubForm"
{
    // version RAD,MAZDA307

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
                    LookupPageID = "Liste Articles Projet";
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
                field(Avance;Avance)
                {
                }
                field("Amortissement Avance";"Amortissement Avance")
                {
                }
                field("Retenue de Garantie";"Retenue de Garantie")
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

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        //SM MAZDA307
        Type := Type::Projet
        //END SM
    end;
}

