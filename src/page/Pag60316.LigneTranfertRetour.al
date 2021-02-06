page 60316 "Ligne Tranfert Retour"
{
    // version RT001

    Editable = false;
    PageType = ListPart;
    SourceTable = Table60074;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No.";"Item No.")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Qty. to Ship";"Qty. to Ship")
                {
                    Visible = false;
                }
                field("Quantity Shipped";"Quantity Shipped")
                {
                    Visible = false;
                }
                field("Qty. to Receive";"Qty. to Receive")
                {
                    Visible = false;
                }
                field("Quantity Received";"Quantity Received")
                {
                    Visible = false;
                }
                field(Description;Description)
                {
                }
                field("Transfer-from Bin Code";"Transfer-from Bin Code")
                {
                }
                field("Transfer-To Bin Code";"Transfer-To Bin Code")
                {
                }
                field("Transfer-from Code";"Transfer-from Code")
                {
                }
                field("Transfer-to Code";"Transfer-to Code")
                {
                }
            }
        }
    }

    actions
    {
    }
}

