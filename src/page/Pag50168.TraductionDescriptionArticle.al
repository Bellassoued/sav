page 50168 "Traduction Description Article"
{
    PageType = List;
    SourceTable = Table50110;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Part Name Code";"Part Name Code")
                {
                }
                field("Description FR";"Description FR")
                {
                }
                field("Description ENU";"Description ENU")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Métre à jour Description")
            {

                trigger OnAction();
                var
                    Item : Record "27";
                begin
                    TESTFIELD("Part Name Code");
                    Item.RESET;
                    Item.SETRANGE("PART NAME CODE","Part Name Code");
                    IF Item.FINDSET THEN
                      REPEAT
                        IF STRPOS(Item.Description,'01') = 0 THEN BEGIN
                           Item.Description := "Description FR";
                           Item.MODIFY;
                        END;
                      UNTIL Item.NEXT = 0;
                end;
            }
        }
    }
}

