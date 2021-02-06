page 50066 "Warehouse Entries VN Transfert"
{
    // version NAVW17.00,MAZDA456

    CaptionML = ENU='Warehouse Entries',
                FRA='Écritures entrepôt';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = Table7312;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Entry Type";"Entry Type")
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Variant Code";"Variant Code")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Bin Code";"Bin Code")
                {
                }
                field("Serial No.";"Serial No.")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("User ID";"User ID")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

