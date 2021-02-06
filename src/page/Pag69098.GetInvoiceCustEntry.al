page 69098 "Get Invoice Cust Entry."
{
    // version CT16V002

    CaptionML = ENU='Get List of Invoice',
                FRA='Extraire Liste des Factures';
    PageType = List;
    Permissions = TableData 112=rim;
    SourceTable = Table21;
    SourceTableView = WHERE(Document Type=FILTER(Invoice));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer No.";"Customer No.")
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
                field(Description;Description)
                {
                }
                field(Amount;Amount)
                {
                }
                field("Remaining Amount";"Remaining Amount")
                {
                }
                field("Salesperson Code";"Salesperson Code")
                {
                }
                field("User ID";"User ID")
                {
                }
                field("Due Date";"Due Date")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        IF CloseAction IN [ACTION::OK,ACTION::LookupOK] THEN
          FctCreateLines;
    end;

    var
        RecRecouvrementLine : Record "70001";
        RecRecouvrementEntete : Record "70000";

    local procedure FctCreateLines();
    var
        SalesCustLedgerEntry : Record "21";
    begin
        CurrPage.SETSELECTIONFILTER(Rec);
        RecRecouvrementLine.FctSetRecouvrement(RecRecouvrementEntete);
        RecRecouvrementLine.FctCreateInvLinesCustEntry(Rec);
    end;

    procedure FctSetRecouvrement(PrecRecouvrementEntete : Record "70000");
    begin
        RecRecouvrementEntete.GET(PrecRecouvrementEntete."No. Bord. Recouvrement");
    end;
}

