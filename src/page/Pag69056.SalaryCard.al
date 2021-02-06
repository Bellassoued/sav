page 69056 "Salary Card"
{
    // version MAZDA1004

    CaptionML = ENU='Vendor Card',
                FRA='Fiche fournisseur';
    Editable = false;
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Table23;

    layout
    {
        area(content)
        {
            group(General)
            {
                CaptionML = ENU='General',
                            FRA='Général';
                field("No.";"No.")
                {
                    Editable = true;
                    Enabled = true;
                    Importance = Promoted;

                    trigger OnAssistEdit();
                    begin
                        IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                    end;
                }
                field(Name;Name)
                {
                    Importance = Promoted;
                }
                field(Address;Address)
                {
                }
                field("Address 2";"Address 2")
                {
                }
                field(County;County)
                {
                }
                field("Post Code";"Post Code")
                {
                    Importance = Promoted;
                }
                field("Country/Region Code";"Country/Region Code")
                {
                }
                field("Balance (LCY)";"Balance (LCY)")
                {

                    trigger OnDrillDown();
                    var
                        VendLedgEntry : Record "25";
                        DtldVendLedgEntry : Record "380";
                    begin
                        DtldVendLedgEntry.SETRANGE("Vendor No.","No.");
                        COPYFILTER("Global Dimension 1 Filter",DtldVendLedgEntry."Initial Entry Global Dim. 1");
                        COPYFILTER("Global Dimension 2 Filter",DtldVendLedgEntry."Initial Entry Global Dim. 2");
                        COPYFILTER("Currency Filter",DtldVendLedgEntry."Currency Code");
                        VendLedgEntry.DrillDownOnEntries(DtldVendLedgEntry);
                    end;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field(Blocked;Blocked)
                {
                }
                field("Last Date Modified";"Last Date Modified")
                {
                }
                field(Statut;Statut)
                {
                    Editable = true;
                }
                field("Lettrage Obligatoire";"Lettrage Obligatoire")
                {
                }
                field("Phone No.2";"Phone No.")
                {
                    Importance = Promoted;
                }
                field("Fax No.";"Fax No.")
                {
                }
                field("E-Mail";"E-Mail")
                {
                    Importance = Promoted;
                }
            }
            group(Invoicing)
            {
                CaptionML = ENU='Invoicing',
                            FRA='Facturation';
                field("Gen. Bus. Posting Group";"Gen. Bus. Posting Group")
                {
                    Importance = Promoted;
                }
                field("VAT Bus. Posting Group";"VAT Bus. Posting Group")
                {
                }
                field("Vendor Posting Group";"Vendor Posting Group")
                {
                    Importance = Promoted;
                }
            }
        }
        area(factboxes)
        {
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
        }
    }

    actions
    {
        area(navigation)
        {
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        ActivateFields;
    end;

    trigger OnAfterGetRecord();
    begin
        ActivateFields;
    end;

    trigger OnInit();
    begin
        ContactEditable := TRUE;
        MapPointVisible := TRUE;
    end;

    trigger OnOpenPage();
    var
        MapMgt : Codeunit "802";
    begin
        ActivateFields;
        IF NOT MapMgt.TestSetup THEN
          MapPointVisible := FALSE;
    end;

    var
        CalendarMgmt : Codeunit "7600";
        PaymentToleranceMgt : Codeunit "426";
        CustomizedCalEntry : Record "7603";
        CustomizedCalendar : Record "7602";
        Text001 : TextConst ENU='Do you want to allow payment tolerance for entries that are currently open?',FRA='Souhaitez-vous autoriser les écarts de règlement pour les écritures actuellement ouvertes ?';
        Text002 : TextConst ENU='Do you want to remove payment tolerance from entries that are currently open?',FRA='Souhaitez-vous supprimer les écarts de règlement pour les écritures actuellement ouvertes ?';
        [InDataSet]
        MapPointVisible : Boolean;
        [InDataSet]
        ContactEditable : Boolean;

    procedure ActivateFields();
    begin
        ContactEditable := "Primary Contact No." = '';
    end;

    local procedure ContactOnAfterValidate();
    begin
        ActivateFields;
    end;
}

