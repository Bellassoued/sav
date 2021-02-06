page 50026 "Service Line Discount"
{
    CaptionML = ENU='Service Line Discount',
                FRA='Remise Ligne Service';
    DelayedInsert = false;
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Table60033;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sales Type";"Sales Type")
                {
                }
                field("Sales Code";"Sales Code")
                {
                }
                field(Type;Type)
                {
                }
                field(Code;Code)
                {
                }
                field("Unit Price";"Unit Price")
                {
                }
                field("Line Discount %";"Line Discount %")
                {
                }
                field("Minimum Quantity";"Minimum Quantity")
                {
                }
                field("Starting Date";"Starting Date")
                {
                }
                field("Ending Date";"Ending Date")
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
                field("Variant Code";"Variant Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

