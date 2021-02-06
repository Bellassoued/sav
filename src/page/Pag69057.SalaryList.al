page 69057 "Salary List"
{
    // version MAZDA1004

    CaptionML = ENU='Vendor List',
                FRA='Liste des fournisseurs';
    CardPageID = "Salary Card";
    Editable = false;
    PageType = List;
    SourceTable = Table23;
    SourceTableView = WHERE(No.=FILTER(P*));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Post Code";"Post Code")
                {
                    Visible = false;
                }
                field(Balance;Balance)
                {
                }
                field("Balance (LCY)";"Balance (LCY)")
                {
                }
                field("Dimension Value Code";"Dimension Value Code")
                {
                }
                field("Country/Region Code";"Country/Region Code")
                {
                    Visible = false;
                }
                field("Phone No.";"Phone No.")
                {
                }
                field("Fax No.";"Fax No.")
                {
                    Visible = false;
                }
                field("IC Partner Code";"IC Partner Code")
                {
                    Visible = false;
                }
                field(Contact;Contact)
                {
                }
                field("Purchaser Code";"Purchaser Code")
                {
                    Visible = false;
                }
                field("Debit Amount";"Debit Amount")
                {
                }
                field("Credit Amount";"Credit Amount")
                {
                }
                field("Vendor Posting Group";"Vendor Posting Group")
                {
                    Visible = false;
                }
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                    Visible = false;
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                    Visible = false;
                }
                field("Payment Terms Code";"Payment Terms Code")
                {
                    Visible = false;
                }
                field("Fin. Charge Terms Code";"Fin. Charge Terms Code")
                {
                    Visible = false;
                }
                field("Currency Code";"Currency Code")
                {
                    Visible = false;
                }
                field("Language Code";"Language Code")
                {
                    Visible = false;
                }
                field("Search Name";"Search Name")
                {
                }
                field(Blocked;Blocked)
                {
                    Visible = false;
                }
                field("Last Date Modified";"Last Date Modified")
                {
                    Visible = false;
                }
                field("Application Method";"Application Method")
                {
                    Visible = false;
                }
                field("Location Code2";"Location Code")
                {
                    Visible = false;
                }
                field("Shipment Method Code";"Shipment Method Code")
                {
                    Visible = false;
                }
                field("Lead Time Calculation";"Lead Time Calculation")
                {
                    Visible = false;
                }
                field("Base Calendar Code";"Base Calendar Code")
                {
                    Visible = false;
                }
                field("Matricule Fiscal";"Matricule Fiscal")
                {
                }
                field("VAT Registration No.";"VAT Registration No.")
                {
                }
            }
        }
        area(factboxes)
        {
            part(;9093)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = false;
            }
            part(;9094)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = true;
            }
            part(;9095)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = true;
            }
            part(;9096)
            {
                SubPageLink = No.=FIELD(No.),
                              Currency Filter=FIELD(Currency Filter),
                              Date Filter=FIELD(Date Filter),
                              Global Dimension 1 Filter=FIELD(Global Dimension 1 Filter),
                              Global Dimension 2 Filter=FIELD(Global Dimension 2 Filter);
                Visible = false;
            }
            systempart(;Links)
            {
                Visible = true;
            }
            systempart(;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
        }
    }

    procedure GetSelectionFilter() : Text;
    var
        Vend : Record "23";
        SelectionFilterManagement : Codeunit "46";
    begin
        CurrPage.SETSELECTIONFILTER(Vend);
        EXIT(SelectionFilterManagement.GetSelectionFilterForVendor(Vend));
    end;

    procedure SetSelection(var Vend : Record "23");
    begin
        CurrPage.SETSELECTIONFILTER(Vend);
    end;
}

