page 50107 "Ligne Compagne VIN"
{
    // version SAVCompagne

    PageType = ListPart;
    SourceTable = Table50083;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code;Code)
                {
                    Visible = false;
                }
                field("Line No.";"Line No.")
                {
                    Visible = false;
                }
                field(Type;Type)
                {
                }
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field(Quantité;Quantité)
                {
                }
                field("Base Unit of Measure";"Base Unit of Measure")
                {
                }
            }
        }
    }

    actions
    {
    }
}

