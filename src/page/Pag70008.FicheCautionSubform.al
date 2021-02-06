page 70008 "Fiche Caution Subform"
{
    // version CT16V002.2

    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = Table10866;
    SourceTableView = WHERE(Caution=FILTER(Yes));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Payment Class";"Payment Class")
                {
                }
                field("Status No.";"Status No.")
                {
                }
                field("Status Name";"Status Name")
                {
                }
                field("Account Type";"Account Type")
                {
                }
                field("Account No.";"Account No.")
                {
                }
                field("Due Date";"Due Date")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Type caution bancaire";"Type caution bancaire")
                {
                }
                field("Statut caution bancaire";"Statut caution bancaire")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field("Référence Caution bancaire";"Référence Caution bancaire")
                {
                }
            }
        }
    }

    actions
    {
    }
}

