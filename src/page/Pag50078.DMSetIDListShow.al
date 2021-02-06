page 50078 "DM Set ID List Show"
{
    // version DM V1

    Editable = false;
    PageType = List;
    SourceTable = Table60059;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Dimension Set ID";"Dimension Set ID")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("Dimension Code";"Dimension Code")
                {
                }
                field("Dimension Value Code";"Dimension Value Code")
                {
                }
                field("Dimension Name";"Dimension Name")
                {
                }
                field("Dimension Value Name";"Dimension Value Name")
                {
                }
                field(Share;Share)
                {
                }
                field(Percent;Percent)
                {
                }
                field(Comment;Comment)
                {
                }
            }
        }
    }

    actions
    {
    }

    procedure SetSources(var DMDimensionSet : Record "60059");
    var
        xEntrySummary : Record "338";
        RecLigneCarteExistVIN : Record "60016";
    begin
        /*TempReservEntry.RESET;
        TempReservEntry.DELETEALL;
        IF ReservEntry.FIND('-') THEN
          REPEAT
            TempReservEntry := ReservEntry;
            TempReservEntry.INSERT;
          UNTIL ReservEntry.NEXT = 0;
        
        xEntrySummary.SETVIEW(GETVIEW);
        RESET;
        DELETEALL;
        IF EntrySummary.FINDSET THEN
          REPEAT
            RecLigneCarteExistVIN.RESET;
            RecLigneCarteExistVIN.SETRANGE(VIN,EntrySummary."Serial No.");
            IF RecLigneCarteExistVIN.ISEMPTY THEN BEGIN
              Rec := EntrySummary;
              INSERT;
            END;
          UNTIL EntrySummary.NEXT = 0;
        SETVIEW(xEntrySummary.GETVIEW);
        */

    end;

    procedure GetDimensionID() : Integer;
    begin
        //EXIT(DimSetID);
    end;

    procedure SetFormCaption(NewFormCaption : Text[250]);
    begin
        //FormCaption := COPYSTR(NewFormCaption + ' - ' + CurrPage.CAPTION,1,MAXSTRLEN(FormCaption));
    end;
}

