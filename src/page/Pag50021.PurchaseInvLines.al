page 50021 "Purchase Inv. Lines"
{
    // version ETRANGER

    Caption = 'Ligne Facture Achat';
    Editable = false;
    PageType = ListPart;
    SourceTable = Table123;

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
                field(Amount;Amount)
                {
                }
                field("Expected Receipt Date";"Expected Receipt Date")
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
        "Buy-from Vendor No.HideValue" := FALSE;
        "Document No.HideValue" := FALSE;
        DocumentNoOnFormat;
        BuyfromVendorNoOnFormat;
    end;

    var
        RecGTempPurchInvLines : Record "123";
        [InDataSet]
        "Document No.HideValue" : Boolean;
        [InDataSet]
        "Buy-from Vendor No.HideValue" : Boolean;

    local procedure IsFirstDocLine() : Boolean;
    begin
        RecGTempPurchInvLines.RESET;
        //RecGTempPurchInvLines.SETCURRENTKEY("N° dossier","Document No.","Line No.",Type);
        RecGTempPurchInvLines.SETRANGE("N° dossier","N° dossier");
        RecGTempPurchInvLines.SETRANGE("Document No.","Document No.");
        RecGTempPurchInvLines.SETRANGE(Type,RecGTempPurchInvLines.Type::"Charge (Item)");

        IF RecGTempPurchInvLines.FIND('-') THEN
          IF RecGTempPurchInvLines."Line No." = "Line No." THEN
            EXIT(TRUE);

        EXIT(FALSE);
    end;

    local procedure DocumentNoOnFormat();
    begin
        IF NOT IsFirstDocLine THEN
          "Document No.HideValue" := TRUE;
    end;

    local procedure BuyfromVendorNoOnFormat();
    begin
        IF NOT IsFirstDocLine THEN
          "Buy-from Vendor No.HideValue" := TRUE;
    end;
}

