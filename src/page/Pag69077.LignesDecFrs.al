page 69077 "Lignes Dec Frs"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table10866;
    SourceTableView = WHERE(Payment Class=FILTER(DEC-CHQ|DEC-EFF|DEC-ESP),
                            Account Type=FILTER(Vendor),
                            Account No.=FILTER(PE*));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Account Type";"Account Type")
                {
                }
                field("Account No.";"Account No.")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Due Date";"Due Date")
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
                field("Bank Account Name";"Bank Account Name")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field(Libellé;Libellé)
                {
                }
                field("Code Retenue à la Source";"Code Retenue à la Source")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Consulter Bordereau")
            {
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    RecPaymentHeader.RESET;
                    RecPaymentHeader.SETRANGE("No.","No.");
                    IF RecPaymentHeader.FINDFIRST THEN BEGIN
                      PPaymentSlip.SETRECORD(RecPaymentHeader);
                      PPaymentSlip.RUN;
                    END;
                end;
            }
        }
    }

    var
        PPaymentSlip : Page "10868";
        RecPaymentHeader : Record "10865";
}

