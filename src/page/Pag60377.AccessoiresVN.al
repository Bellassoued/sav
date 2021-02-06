page 60377 "Accessoires VN"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table27;
    SourceTableView = WHERE(No.=FILTER(*-M-VN));

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
                field(UnitPrice;UnitPrice)
                {
                }
                field(UnitPriceInclVAT;UnitPriceInclVAT)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    var
        RecItem : Record "27";
        CalcStdCost : Codeunit "5812";
    begin
        UnitPrice := 0;
        UnitPriceInclVAT := 0;
        IF RecItem.GET(DELSTR("No.",STRLEN("No.")-2,3)) THEN BEGIN
          //IF (RecItem."Replenishment System"=RecItem."Replenishment System"::Assembly) THEN BEGIN
           // CalcStdCost.CalcAssemblyItemPrice(RecItem."No.");
            UnitPrice := RecItem."Unit Price";
            UnitPriceInclVAT := RecItem."Unit Price incl. VAT"
          //END;
        END;
    end;

    trigger OnAfterGetRecord();
    var
        RecItem : Record "27";
        CalcStdCost : Codeunit "5812";
    begin
        UnitPrice := 0;
        UnitPriceInclVAT := 0;
        IF RecItem.GET(DELSTR("No.",STRLEN("No.")-2,3)) THEN BEGIN
          //IF (RecItem."Replenishment System"=RecItem."Replenishment System"::Assembly) THEN BEGIN
           // CalcStdCost.CalcAssemblyItemPrice(RecItem."No.");
            UnitPrice := RecItem."Unit Price";
            UnitPriceInclVAT := RecItem."Unit Price incl. VAT"
          //END;
        END;
    end;

    var
        UnitPrice : Decimal;
        UnitPriceInclVAT : Decimal;
}

