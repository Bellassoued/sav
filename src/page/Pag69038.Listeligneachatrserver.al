page 69038 "Liste ligne achat à réserver"
{
    // version CT16V002

    Editable = false;
    PageType = ListPart;
    SourceTable = Table39;
    SourceTableView = WHERE(Gen. Prod. Posting Group=CONST(VN),
                            Posting Group=CONST(VEHICULES),
                            Variant Code=FILTER(<>''),
                            Type=CONST(Item));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type";"Document Type")
                {
                }
                field("Document No.";"Document No.")
                {
                }
                field("No.";"No.")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Bin Code";"Bin Code")
                {
                }
                field(Quantity;Quantity)
                {
                    Visible = false;
                }
                field("Reserved Quantity";"Reserved Quantity")
                {
                    Visible = false;
                }
                field("Qté Non Réservé";Quantity-"Reserved Quantity")
                {
                    DecimalPlaces = 0:0;
                }
                field("Variant Code";"Variant Code")
                {
                }
                field("Type Commerciale";Designation)
                {
                }
                field(Production;Production)
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
        IF RecPurchaseHeader.GET("Document Type","Document No.") THEN
          Production :=  RecPurchaseHeader."Vendor Order No."
        ELSE
          Production := '';

        IF RecItem.GET("No.") THEN BEGIN
          IF RecFicheTechnique.GET(RecItem."No.") THEN
            Designation := RecFicheTechnique."Model Code"
        END ELSE
          Designation := '';
    end;

    var
        Production : Text[100];
        RecPurchaseHeader : Record "38";
        RecItem : Record "27";
        Designation : Text[100];
        RecFicheTechnique : Record "50032";
}

