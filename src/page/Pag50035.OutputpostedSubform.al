page 50035 "Output posted Subform"
{
    // version DOC STOCK

    AutoSplitKey = true;
    CaptionML = ENU='Item Journal',
                FRA='Ecritures articles';
    DelayedInsert = true;
    Editable = false;
    PageType = ListPart;
    SaveValues = true;
    SourceTable = Table32;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Posting Date";"Posting Date")
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Item Description";"Item Description")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field(Quantity;Quantity)
                {
                }
            }
        }
    }

    actions
    {
    }
}

