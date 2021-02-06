page 60378 "Warehouse Entries CORR"
{
    // version CORRECTION

    // CT16V001 ZM 16/05/2016 : upgrade

    CaptionML = ENU='Warehouse Entries',
                FRA='Écritures entrepôt';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    Permissions = TableData 7312=rm;
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
                field("Journal Batch Name";"Journal Batch Name")
                {
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                    Visible = false;
                }
                field("Serial No.";"Serial No.")
                {
                    Visible = false;
                }
                field("Lot No.";"Lot No.")
                {
                    Visible = false;
                }
                field("Expiration Date";"Expiration Date")
                {
                    Visible = false;
                }
                field("Zone Code";"Zone Code")
                {
                }
                field("Bin Code";"Bin Code")
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Reference Document";"Reference Document")
                {
                }
                field("Reference No.";"Reference No.")
                {
                }
                field("Variant Code";"Variant Code")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Qty. (Base)";"Qty. (Base)")
                {
                    Visible = false;
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Qty. per Unit of Measure";"Qty. per Unit of Measure")
                {
                    Visible = false;
                }
                field("Source Type";"Source Type")
                {
                    Visible = false;
                }
                field("Source Subtype";"Source Subtype")
                {
                    Visible = false;
                }
                field("Source Document";"Source Document")
                {
                }
                field("Source No.";"Source No.")
                {
                }
                field("Source Line No.";"Source Line No.")
                {
                }
                field("Source Subline No.";"Source Subline No.")
                {
                    Visible = false;
                }
                field("Reason Code";"Reason Code")
                {
                }
                field("No. Series";"No. Series")
                {
                }
                field(Cubage;Cubage)
                {
                    Visible = false;
                }
                field(Weight;Weight)
                {
                    Visible = false;
                }
                field("Journal Template Name";"Journal Template Name")
                {
                    Visible = false;
                }
                field("Whse. Document Type";"Whse. Document Type")
                {
                }
                field("Whse. Document No.";"Whse. Document No.")
                {
                }
                field("Registering Date";"Registering Date")
                {
                }
                field("User ID";"User ID")
                {
                    Visible = false;
                }
                field("Entry No.";"Entry No.")
                {
                }
            }
        }
        area(factboxes)
        {
            systempart(;Links)
            {
                Visible = false;
            }
            systempart(;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
    }
}

