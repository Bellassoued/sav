page 60021 "Ligne Vente Additionnel"
{
    // version SAV Automobile

    PageType = ListPart;
    SourceTable = Table60010;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field(Quantity;Quantity)
                {
                }
                field(status;status)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        "Type opération":="Type opération"::"Additional Sales" ;
        Type:=Type::Item;
    end;
}

