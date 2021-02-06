page 69055 "Liste substitution FactBox"
{
    PageType = CardPart;
    SourceTable = Table5715;

    layout
    {
        area(content)
        {
            group()
            {
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                field(TabSubs[1,1];TabSubs[1,1])
                {
                }
                field(TabSubs[1,2];TabSubs[1,2])
                {
                }
                field(TabSubs[2,1];TabSubs[2,1])
                {
                }
                field(TabSubs[2,2];TabSubs[2,2])
                {
                }
                field(TabSubs[3,1];TabSubs[3,1])
                {
                }
                field(TabSubs[3,2];TabSubs[3,2])
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
        //SM TODO CONTINUE TO 10 AND LAYOUT REVIEW
        IF FINDFIRST THEN BEGIN
          TabSubs[1,1] := "Substitute No.";
          CALCFIELDS("Inventory All Location");
          TabSubs[1,2] := FORMAT("Inventory All Location");
            IF NEXT <> 0 THEN BEGIN
              TabSubs[2,1] := "Substitute No.";
              CALCFIELDS("Inventory All Location");
              TabSubs[2,2] := FORMAT("Inventory All Location");
              IF NEXT <> 0 THEN BEGIN
                TabSubs[3,1]  := "Substitute No.";
                CALCFIELDS("Inventory All Location");
                TabSubs[3,2]  := FORMAT("Inventory All Location");
               END;
            END;
        END;
    end;

    var
        TabSubs : array [10,10] of Code[20];
}

