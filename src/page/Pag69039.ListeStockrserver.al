page 69039 "Liste Stock à réserver"
{
    // version CT16V002

    Editable = false;
    PageType = ListPart;
    SourceTable = Table32;
    SourceTableView = WHERE(Open=CONST(Yes),
                            Positive=CONST(Yes),
                            Serial No.=FILTER(<>''),
                            Variant Code=FILTER(<>''),
                            Reserved Quantity=CONST(0));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No.";"Item No.")
                {
                }
                field("Posting Date";"Posting Date")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Remaining Quantity";"Remaining Quantity")
                {
                }
                field("Reserved Quantity";"Reserved Quantity")
                {
                }
                field("Variant Code";"Variant Code")
                {
                }
                field("Serial No.";"Serial No.")
                {
                }
                field("Type Commerciale";Designation)
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
        IF RecItem.GET("Item No.") THEN BEGIN
          IF RecFicheTechnique.GET(RecItem."No.") THEN
            Designation := RecFicheTechnique."Model Code"
        END ELSE
          Designation := '';
    end;

    var
        RecItem : Record "27";
        Designation : Text[100];
        RecFicheTechnique : Record "50032";
}

