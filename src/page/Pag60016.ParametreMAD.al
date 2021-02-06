page 60016 "Parametre MAD"
{
    // version Reappro TYT V01

    PageType = List;
    SourceTable = Table50026;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Product_Code;Product_Code)
                {
                }
                field(Since_Regist;Since_Regist)
                {
                }
                field(Base_Month;Base_Month)
                {
                }
                field("C_Ref %";"C_Ref %")
                {
                }
                field("Coefficient N";"Coefficient N")
                {
                }
                field("Coefficient N-1";"Coefficient N-1")
                {
                }
                field("Coefficient N-2";"Coefficient N-2")
                {
                }
                field("Coefficient N-3";"Coefficient N-3")
                {
                }
                field("Coefficient N-4";"Coefficient N-4")
                {
                }
                field("Coefficient N-5";"Coefficient N-5")
                {
                }
                field("Coefficient N-6";"Coefficient N-6")
                {
                }
                field("Coefficient N-7";"Coefficient N-7")
                {
                }
                field("Coefficient N-8";"Coefficient N-8")
                {
                }
                field("Coefficient N-9";"Coefficient N-9")
                {
                }
                field("Coefficient N-10";"Coefficient N-10")
                {
                }
                field("Coefficient N-11";"Coefficient N-11")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        RecParametreMAD.RESET;
        IF RecParametreMAD.FINDSET THEN
          REPEAT
            CoefficientMAD[1] := RecParametreMAD."Coefficient N";
            CoefficientMAD[2] := RecParametreMAD."Coefficient N-1";
            CoefficientMAD[3] := RecParametreMAD."Coefficient N-2";
            CoefficientMAD[4] := RecParametreMAD."Coefficient N-3";
            CoefficientMAD[5] := RecParametreMAD."Coefficient N-4";
            CoefficientMAD[6] := RecParametreMAD."Coefficient N-5";
            CoefficientMAD[7] := RecParametreMAD."Coefficient N-6";
            CoefficientMAD[8] := RecParametreMAD."Coefficient N-7";
            CoefficientMAD[9] := RecParametreMAD."Coefficient N-8";
            CoefficientMAD[10] := RecParametreMAD."Coefficient N-9";
            CoefficientMAD[11] := RecParametreMAD."Coefficient N-10";
            CoefficientMAD[12] := RecParametreMAD."Coefficient N-11";
            FOR i:=1 TO RecParametreMAD.Base_Month+1 DO
              IF CoefficientMAD[i] = 0 THEN
                ERROR('La valeur du coefficient N-'+ FORMAT(i-1) + 'est nulle pour la famille ' + RecParametreMAD.Product_Code);
          UNTIL RecParametreMAD.NEXT = 0;
    end;

    var
        RecParametreMAD : Record "50026";
        CoefficientMAD : array [12] of Decimal;
        i : Integer;
}

