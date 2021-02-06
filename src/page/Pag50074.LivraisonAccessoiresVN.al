page 50074 "Livraison Accessoires VN"
{
    // version MAZDA988

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = Table5993;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No.";"Document No.")
                {
                    Editable = false;
                }
                field(Type;Type)
                {
                    Editable = false;
                }
                field("No.";"No.")
                {
                    Editable = false;
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    Editable = false;
                }
                field("Accessoire Livré PVN";"Accessoire Livré PVN")
                {
                }
            }
        }
    }

    actions
    {
    }
}

