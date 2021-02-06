page 50020 "Purchase Recept. Lines"
{
    // version ETRANGER

    Caption = 'Ligne Reception Achat';
    Editable = false;
    PageType = ListPart;
    SourceTable = Table121;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Document No.";"Document No.")
                {
                    HideValue = "Document No.HideValue";
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Buy-from Vendor No.";"Buy-from Vendor No.")
                {
                    CaptionML = ENU='Vendor No.',
                                FRA='N° fournisseur';
                    HideValue = "Buy-from Vendor No.HideValue";
                }
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Direct Unit Cost";"Direct Unit Cost")
                {
                }
                field("Expected Receipt Date";"Expected Receipt Date")
                {
                }
                field("VIN.";"VIN.")
                {
                    DrillDown = false;
                    Lookup = false;
                }
                field("Item Charge Base Amount";"Item Charge Base Amount")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        "Buy-from Vendor No.HideValue" := FALSE;
        "Document No.HideValue" := FALSE;
        DocumentNoOnFormat;
        BuyfromVendorNoOnFormat;
        CALCFIELDS("VIN.");
    end;

    var
        RecGTempPurchRecepLines : Record "121";
        [InDataSet]
        "Document No.HideValue" : Boolean;
        [InDataSet]
        "Buy-from Vendor No.HideValue" : Boolean;

    local procedure IsFirstDocLine() : Boolean;
    begin
        RecGTempPurchRecepLines.RESET;
        //RecGTempPurchRecepLines.SETCURRENTKEY("N° dossier","Document No.","Line No.",Type);
        RecGTempPurchRecepLines.SETRANGE("N° dossier","N° dossier");
        RecGTempPurchRecepLines.SETRANGE(RecGTempPurchRecepLines."Document No.","Document No.");
        RecGTempPurchRecepLines.SETFILTER(RecGTempPurchRecepLines.Type,'%1|%2'
                 ,RecGTempPurchRecepLines.Type::Item,RecGTempPurchRecepLines.Type::"Fixed Asset");

        IF RecGTempPurchRecepLines.FIND('-') THEN
          IF RecGTempPurchRecepLines."Line No." = "Line No." THEN
            EXIT(TRUE);

        EXIT(FALSE);
    end;

    local procedure DocumentNoOnFormat();
    begin
        //IF NOT IsFirstDocLine THEN
        //  "Document No.HideValue" := TRUE;
    end;

    local procedure BuyfromVendorNoOnFormat();
    begin
        IF NOT IsFirstDocLine THEN
          "Buy-from Vendor No.HideValue" := TRUE;
    end;
}

