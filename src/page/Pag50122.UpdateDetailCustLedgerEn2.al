page 50122 "Update Detail Cust Ledger En2"
{
    PageType = List;
    Permissions = TableData 17=rimd,
                  TableData 379=rimd;
    SourceTable = Table379;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";"Entry No.")
                {
                }
                field("Cust. Ledger Entry No.";"Cust. Ledger Entry No.")
                {
                }
                field("Entry Type";"Entry Type")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Document Type";"Document Type")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Amount (LCY)";"Amount (LCY)")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
                field("User ID";"User ID")
                {
                }
                field("Source Code";"Source Code")
                {
                }
                field("Transaction No.";"Transaction No.")
                {
                }
                field("Journal Batch Name";"Journal Batch Name")
                {
                }
                field("Reason Code";"Reason Code")
                {
                }
                field("Debit Amount";"Debit Amount")
                {
                }
                field("Credit Amount";"Credit Amount")
                {
                }
                field("Debit Amount (LCY)";"Debit Amount (LCY)")
                {
                }
                field("Credit Amount (LCY)";"Credit Amount (LCY)")
                {
                }
                field("Initial Entry Due Date";"Initial Entry Due Date")
                {
                }
                field("Initial Entry Global Dim. 1";"Initial Entry Global Dim. 1")
                {
                }
                field("Initial Entry Global Dim. 2";"Initial Entry Global Dim. 2")
                {
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                }
                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {
                }
                field("Use Tax";"Use Tax")
                {
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {
                }
                field("Initial Document Type";"Initial Document Type")
                {
                }
                field("Applied Cust. Ledger Entry No.";"Applied Cust. Ledger Entry No.")
                {
                }
                field(Unapplied;Unapplied)
                {
                }
                field("Unapplied by Entry No.";"Unapplied by Entry No.")
                {
                }
                field("Remaining Pmt. Disc. Possible";"Remaining Pmt. Disc. Possible")
                {
                }
                field("Max. Payment Tolerance";"Max. Payment Tolerance")
                {
                }
                field("Tax Jurisdiction Code";"Tax Jurisdiction Code")
                {
                }
                field("Application No.";"Application No.")
                {
                }
                field("Ledger Entry Amount";"Ledger Entry Amount")
                {
                }
                field("Groupe compta client";"Groupe compta client")
                {
                }
            }
        }
    }

    actions
    {
    }
}

