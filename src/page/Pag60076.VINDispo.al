page 60076 "VIN Dispo"
{
    // version NAVW17.00

    CaptionML = ENU='Item Tracking Summary',
                FRA='Disponibilité VIN';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Table338;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Serial No.";"Serial No.")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        CurrPage.LOOKUPMODE(TRUE)
    end;

    var
        TempReservEntry : Record "337" temporary;
        ItemTrackingDataCollection : Codeunit "6501";
        CurrItemTrackingCode : Record "6502";
        MaxQuantity : Decimal;
        SelectedQuantity : Decimal;
        CurrBinCode : Code[20];
        xFilterRec : Record "338";
        [InDataSet]
        "Selected QuantityVisible" : Boolean;
        [InDataSet]
        "Bin ContentVisible" : Boolean;
        [InDataSet]
        MaxQuantity1Visible : Boolean;
        [InDataSet]
        Selected1Visible : Boolean;
        [InDataSet]
        Undefined1Visible : Boolean;
        [InDataSet]
        "Selected QuantityEditable" : Boolean;

    procedure SetSources(var ReservEntry : Record "337";var EntrySummary : Record "338");
    var
        xEntrySummary : Record "338";
        RecLigneCarteExistVIN : Record "60016";
    begin
        TempReservEntry.RESET;
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
    end;
}

