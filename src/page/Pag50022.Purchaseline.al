page 50022 "Purchase line"
{
    // version ETRANGER

    Caption = 'Ligne Achat';
    Editable = false;
    PageType = ListPart;
    SourceTable = Table39;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Document Type";"Document Type")
                {
                    HideValue = "Document TypeHideValue";
                    Style = Strong;
                    StyleExpr = TRUE;
                }
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
                field(Quantity*"Unit Cost (LCY)";Quantity*"Unit Cost (LCY)")
                {
                    Caption = 'Montant';
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
        "Document TypeHideValue" := FALSE;
        DocumentTypeOnFormat;
        DocumentNoOnFormat;
        BuyfromVendorNoOnFormat;
    end;

    var
        RecGTempPurchLines : Record "39";
        [InDataSet]
        "Document TypeHideValue" : Boolean;
        [InDataSet]
        "Document No.HideValue" : Boolean;
        [InDataSet]
        "Buy-from Vendor No.HideValue" : Boolean;

    local procedure IsFirstDocLine() : Boolean;
    begin
        RecGTempPurchLines.RESET;
        //RecGTempPurchLines.SETCURRENTKEY("N° dossier","Document Type","Document No.","Line No.",Type);
        RecGTempPurchLines.SETRANGE("No dossier","No dossier");
        RecGTempPurchLines.SETRANGE("Document Type","Document Type");
        RecGTempPurchLines.SETRANGE("Document No.","Document No.");
        RecGTempPurchLines.SETRANGE(Type,RecGTempPurchLines.Type::"Charge (Item)");

        IF RecGTempPurchLines.FIND('-') THEN
          IF RecGTempPurchLines."Line No." = "Line No." THEN
            EXIT(TRUE);

        EXIT(FALSE);
    end;

    local procedure DocumentTypeOnFormat();
    begin
        IF NOT IsFirstDocLine THEN
          "Document TypeHideValue" := TRUE;
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

