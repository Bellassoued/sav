page 70047 "Get Invoice Cust"
{
    // version CT16V002

    CaptionML = ENU='Get List of Invoice',
                FRA='Extraire Liste des Factures';
    PageType = List;
    Permissions = TableData 112=rim;
    SourceTable = Table112;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                }
                field("Bill-to Name";"Bill-to Name")
                {
                }
                field("Bill-to City";"Bill-to City")
                {
                }
                field("Ship-to Code";"Ship-to Code")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Posting Description";"Posting Description")
                {
                }
                field("Due Date";"Due Date")
                {
                }
                field("Prices Including VAT";"Prices Including VAT")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field("No. Bordereau";"No. Bordereau")
                {
                }
                field("Your Reference";"Your Reference")
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
        SalesInvoiceHeader : Record "112";
    begin
        CurrPage.SETSELECTIONFILTER(Rec);
        RecRecouvrementLine.FctSetRecouvrement(RecRecouvrementEntete);
        RecRecouvrementLine.FctCreateInvLines(Rec);
    end;

    procedure FctSetRecouvrement(PrecRecouvrementEntete : Record "70000");
    begin
        RecRecouvrementEntete.GET(PrecRecouvrementEntete."No. Bord. Recouvrement");
    end;
}

