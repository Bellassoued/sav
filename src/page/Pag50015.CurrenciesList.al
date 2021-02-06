page 50015 "Currencies List"
{
    // version CT16V001

    CaptionML = ENU='Currencies',
                FRA='Devises';
    Editable = false;
    PageType = List;
    SourceTable = 4;

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Code;Code)
                {
                }
                field(Description;Description)
                {
                }
            }
        }
    }

    actions
    {
    }

    procedure GetSelectionFilter() : Code[80];
    var
        Currency : Record "4";
        FirstCurrency : Code[30];
        LastCurrency : Code[30];
        SelectionFilter : Code[250];
        CurrencyCount : Integer;
        More : Boolean;
    begin
        CurrPage.SETSELECTIONFILTER(Currency);
        CurrencyCount := Currency.COUNT;
        IF CurrencyCount > 0 THEN BEGIN
          Currency.FIND('-');
          WHILE CurrencyCount > 0 DO BEGIN
            CurrencyCount := CurrencyCount - 1;
            Currency.MARKEDONLY(FALSE);
            FirstCurrency := Currency.Code;
            LastCurrency := FirstCurrency;
            More := (CurrencyCount > 0);
            WHILE More DO
              IF Currency.NEXT = 0 THEN
                More := FALSE
              ELSE
                IF NOT Currency.MARK THEN
                  More := FALSE
                ELSE BEGIN
                  LastCurrency := Currency.Code;
                  CurrencyCount := CurrencyCount - 1;
                  IF CurrencyCount = 0 THEN
                    More := FALSE;
                END;
            IF SelectionFilter <> '' THEN
              SelectionFilter := SelectionFilter + '|';
            IF FirstCurrency = LastCurrency THEN
              SelectionFilter := SelectionFilter + FirstCurrency
            ELSE
              SelectionFilter := SelectionFilter + FirstCurrency + '..' + LastCurrency;
            IF CurrencyCount > 0 THEN BEGIN
              Currency.MARKEDONLY(TRUE);
              Currency.NEXT;
            END;
          END;
        END;
        EXIT(SelectionFilter);
    end;

    procedure GetCurrency(var "Currency Code" : Code[10]);
    begin
        "Currency Code" := Rec.Code;
    end;
}

