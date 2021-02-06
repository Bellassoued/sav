page 50081 "Calcule Ristourne Clients"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Worksheet;
    SourceTable = Table18;

    layout
    {
        area(content)
        {
            group()
            {
                field("No Client";CustomerFilter)
                {
                    TableRelation = Customer;

                    trigger OnValidate();
                    begin
                        IF CustomerFilter <> '' THEN
                          SETRANGE("No.",CustomerFilter)
                        ELSE
                          SETRANGE("No.");

                        CalcAmount;
                        CurrPage.UPDATE(FALSE)
                    end;
                }
                field("Année";YearFilter)
                {

                    trigger OnValidate();
                    begin
                        CalcAmount;
                        CurrPage.UPDATE(FALSE)
                    end;
                }
            }
            repeater(Group)
            {
                field("No.";"No.")
                {
                    Editable = false;
                }
                field(Name;Name)
                {
                    Editable = false;
                }
                field(MontantCAHTT1;MontantCAHTT1)
                {
                    CaptionML = ENU='MontantCAHTT1',
                                FRA='CA HT T1';
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field(MontantRistourneCalculeT1;MontantRistourneCalculeT1)
                {
                    Caption = 'Ristourne Calculé T1';
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field(MontantRistourneValideT1;MontantRistourneValideT1)
                {
                    Caption = 'Ristourne Validé T1';
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field(MontantRistourneAValider1;MontantRistourneCalculeT1-MontantRistourneValideT1)
                {
                    Caption = 'Ristourne A Valider T1';
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = TRUE;
                }
                field(MontantCAHTT2;MontantCAHTT2)
                {
                    CaptionML = ENU='MontantCAHTT2',
                                FRA='CA HT T2';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(MontantRistourneCalculeT2;MontantRistourneCalculeT2)
                {
                    Caption = 'Ristourne Calcul2 T2';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(MontantRistourneValideT2;MontantRistourneValideT2)
                {
                    Caption = 'Ristourne Validé T2';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(MontantRistourneAValider2;MontantRistourneCalculeT2-MontantRistourneValideT2)
                {
                    Caption = 'Ristourne A Valider T2';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field(MontantCAHTT3;MontantCAHTT3)
                {
                    CaptionML = ENU='MontantCAHTT3',
                                FRA='CA HT T3';
                    Editable = false;
                    Style = Unfavorable;
                    StyleExpr = TRUE;
                }
                field(MontantRistourneCalculeT3;MontantRistourneCalculeT3)
                {
                    Caption = 'Ristourne Calculé T3';
                    Editable = false;
                    Style = Unfavorable;
                    StyleExpr = TRUE;
                }
                field(MontantRistourneValideT3;MontantRistourneValideT3)
                {
                    Caption = 'Ristourne Validé T3';
                    Editable = false;
                    Style = Unfavorable;
                    StyleExpr = TRUE;
                }
                field(MontantRistourneAValider3;MontantRistourneCalculeT3-MontantRistourneValideT3)
                {
                    Caption = 'Ristourne A Valider T3';
                    Editable = false;
                    Style = Unfavorable;
                    StyleExpr = TRUE;
                }
                field(MontantCAHTT4;MontantCAHTT4)
                {
                    CaptionML = ENU='MontantCAHTT4',
                                FRA='CA HT T4';
                    Editable = false;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field(MontantRistourneCalculeT4;MontantRistourneCalculeT4)
                {
                    Caption = 'Ristourne Calculé T4';
                    Editable = false;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field(MontantRistourneValideT4;MontantRistourneValideT4)
                {
                    Caption = 'Ristourne Validé T4';
                    Editable = false;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field(MontantRistourneAValider4;MontantRistourneCalculeT4-MontantRistourneValideT4)
                {
                    Caption = 'Ristourne A Valider T4';
                    Editable = false;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Créer Avoir Financier T1")
            {

                trigger OnAction();
                begin
                    IF MontantRistourneCalculeT1-MontantRistourneValideT1 > 0 THEN BEGIN
                      CreateFinancialCrMemoT1;
                    END ELSE ERROR(TXT50000)
                end;
            }
            action("Créer Avoir Financier T2")
            {

                trigger OnAction();
                begin
                    IF MontantRistourneCalculeT2-MontantRistourneValideT2 > 0 THEN BEGIN
                      CreateFinancialCrMemoT2;
                    END ELSE ERROR(TXT50000)
                end;
            }
            action("Créer Avoir Financier T3")
            {

                trigger OnAction();
                begin
                    IF MontantRistourneCalculeT3-MontantRistourneValideT3 > 0 THEN BEGIN
                      CreateFinancialCrMemoT3;
                    END ELSE ERROR(TXT50000)
                end;
            }
            action("Créer Avoir Financier T4")
            {

                trigger OnAction();
                begin
                    IF MontantRistourneCalculeT4-MontantRistourneValideT4 > 0 THEN BEGIN
                      CreateFinancialCrMemoT4;
                    END ELSE ERROR(TXT50000)
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        CalcAmount()
    end;

    trigger OnOpenPage();
    begin
        SETRANGE(Catégorie,'R');
        YearFilter     := DATE2DMY(WORKDATE,3);
        //CustomerFilter := '';
        //SETRANGE("No.",CustomerFilter);
    end;

    var
        MontantCAHTT1 : Decimal;
        MontantFacturePRHTT1 : Decimal;
        MontantAvoirPRHTT1 : Decimal;
        MontantRistourneCalculeT1 : Decimal;
        MontantRistourneValideT1 : Decimal;
        MontantCAHTT2 : Decimal;
        MontantFacturePRHTT2 : Decimal;
        MontantAvoirPRHTT2 : Decimal;
        MontantRistourneCalculeT2 : Decimal;
        MontantRistourneValideT2 : Decimal;
        MontantCAHTT3 : Decimal;
        MontantFacturePRHTT3 : Decimal;
        MontantAvoirPRHTT3 : Decimal;
        MontantRistourneCalculeT3 : Decimal;
        MontantRistourneValideT3 : Decimal;
        MontantCAHTT4 : Decimal;
        MontantFacturePRHTT4 : Decimal;
        MontantAvoirPRHTT4 : Decimal;
        MontantRistourneCalculeT4 : Decimal;
        MontantRistourneValideT4 : Decimal;
        YearFilter : Integer;
        CustomerFilter : Code[20];
        RecSalesInvoiceHeader : Record "112";
        RecSalesInvoiceLine : Record "113";
        RecSalesCrMemoHeader : Record "114";
        RecSalesCrMemoLine : Record "115";
        SalesHeaderFinancialCrMemo : Record "36";
        SalesLineFinancialCrMemo : Record "37";
        PageSalesCreditMemo : Page "44";
        TXT50000 : Label 'Montant à valider doit être supérieur à zéro.';

    procedure CalcAmount();
    var
        Calendar : Record "2000000007";
        PeriodFormMgt : Codeunit "359";
    begin
        Calendar."Period Start" := DMY2DATE(1,1,YearFilter);
        Calendar."Period Type"  := Calendar."Period Type"::Quarter;

        //T1
        Calendar.FIND;
        MontantFacturePRHTT1      := CalcInvoicePR(Calendar."Period Start",Calendar."Period End");
        MontantAvoirPRHTT1        := CalcCrMemoPR(Calendar."Period Start",Calendar."Period End");
        MontantCAHTT1             := MontantFacturePRHTT1 - MontantAvoirPRHTT1;
        MontantRistourneValideT1  := CalcCrMemoFinancial(Calendar."Period Start",Calendar."Period End",0,YearFilter);
        MontantRistourneCalculeT1 := CalcRistourne(MontantCAHTT1);

        //T2
        Calendar.NEXT;
        MontantFacturePRHTT2      := CalcInvoicePR(Calendar."Period Start",Calendar."Period End");
        MontantAvoirPRHTT2        := CalcCrMemoPR(Calendar."Period Start",Calendar."Period End");
        MontantCAHTT2             := MontantFacturePRHTT2 - MontantAvoirPRHTT2;
        MontantRistourneValideT2  := CalcCrMemoFinancial(Calendar."Period Start",Calendar."Period End",1,YearFilter);
        MontantRistourneCalculeT2 := CalcRistourne(MontantCAHTT2);

        //T3
        Calendar.NEXT;
        MontantFacturePRHTT3      := CalcInvoicePR(Calendar."Period Start",Calendar."Period End");
        MontantAvoirPRHTT3        := CalcCrMemoPR(Calendar."Period Start",Calendar."Period End");
        MontantCAHTT3             := MontantFacturePRHTT3 - MontantAvoirPRHTT3;
        MontantRistourneValideT3  := CalcCrMemoFinancial(Calendar."Period Start",Calendar."Period End",2,YearFilter);
        MontantRistourneCalculeT3 := CalcRistourne(MontantCAHTT3);

        //T4
        Calendar.NEXT;
        MontantFacturePRHTT4      := CalcInvoicePR(Calendar."Period Start",Calendar."Period End");
        MontantAvoirPRHTT4        := CalcCrMemoPR(Calendar."Period Start",Calendar."Period End");
        MontantCAHTT4             := MontantFacturePRHTT4 - MontantAvoirPRHTT4;
        MontantRistourneValideT4  := CalcCrMemoFinancial(Calendar."Period Start",Calendar."Period End",3,YearFilter);
        MontantRistourneCalculeT4 := CalcRistourne(MontantCAHTT4);
    end;

    procedure CalcInvoicePR(DateStart : Date;DateEnd : Date) : Decimal;
    begin
        RecSalesInvoiceLine.RESET;
        RecSalesInvoiceLine.SETCURRENTKEY("Bill-to Customer No.");
        RecSalesInvoiceLine.SETRANGE("Bill-to Customer No.","No.");
        RecSalesInvoiceLine.SETRANGE("Posting Date",DateStart,DateEnd);
        RecSalesInvoiceLine.SETRANGE(Type,RecSalesInvoiceLine.Type::Item);
        RecSalesInvoiceLine.SETFILTER("Posting Group",'<>LUBRIFIANT');

        IF RecSalesInvoiceLine.FINDSET THEN BEGIN
          RecSalesInvoiceLine.CALCSUMS("Line Amount");
          EXIT(RecSalesInvoiceLine."Line Amount");
        END;
    end;

    procedure CalcCrMemoPR(DateStart : Date;DateEnd : Date) : Decimal;
    begin
        RecSalesCrMemoLine.RESET;
        RecSalesCrMemoLine.SETCURRENTKEY("Bill-to Customer No.");
        RecSalesCrMemoLine.SETRANGE("Bill-to Customer No.","No.");
        RecSalesCrMemoLine.SETRANGE("Posting Date",DateStart,DateEnd);
        RecSalesCrMemoLine.SETRANGE(Type,RecSalesCrMemoLine.Type::Item);
        RecSalesCrMemoLine.SETFILTER("Posting Group",'<>LUBRIFIANT');

        IF RecSalesCrMemoLine.FINDSET THEN BEGIN
          RecSalesCrMemoLine.CALCSUMS("Line Amount");
          EXIT(RecSalesCrMemoLine."Line Amount");
        END;
    end;

    procedure CalcCrMemoFinancial(DateStart : Date;DateEnd : Date;Quarter : Option T1,T2,T3,T4;Year : Integer) : Decimal;
    begin
        RecSalesCrMemoLine.RESET;
        RecSalesCrMemoLine.SETCURRENTKEY("Bill-to Customer No.");
        RecSalesCrMemoLine.SETRANGE("Bill-to Customer No.","No.");
        //RecSalesCrMemoLine.SETRANGE("Posting Date",DateStart,DateEnd);
        RecSalesCrMemoLine.SETRANGE(Type,RecSalesCrMemoLine.Type::"G/L Account");
        RecSalesCrMemoLine.SETRANGE("No.",'709001');
        //SM MAZDA854
        RecSalesCrMemoLine.SETRANGE("Discount Quarter",Quarter);
        RecSalesCrMemoLine.SETRANGE("Discount Year",Year);
        //SM MAZDA854

        IF RecSalesCrMemoLine.FINDSET THEN BEGIN
          RecSalesCrMemoLine.CALCSUMS("Line Amount");
          EXIT(RecSalesCrMemoLine."Line Amount");
        END;
    end;

    procedure CalcRistourne(ParamMontantCA : Decimal) : Decimal;
    begin
        //TODO TABLE
        //Pallier1
        //>=12500 Et <=20000
        //RMISE 1: (-12500+[Somme De SommeDeCA HT])*0,05
        IF (ParamMontantCA >= 12500) AND (ParamMontantCA <= 20000) THEN
          EXIT(ROUND((-12500+ParamMontantCA)*0.05,0.001));


        //Pallier2
        //>20000,001 Et <=40000
        //REMISE 2: 7500*0,05+([Somme De SommeDeCA HT]-20000,001)*0,07
        IF (ParamMontantCA > 20000) AND (ParamMontantCA <= 40000) THEN
          EXIT(ROUND(((7500*0.05)+(ParamMontantCA-20000.001)*0.07),0.001));


        //Pallier3
        //>40000
        //REMISE 3: 7500*0,05+20000*0,07+([Somme De SommeDeCA HT]-40000,001)*0,1
        IF (ParamMontantCA > 40000) THEN
          EXIT(ROUND(((7500*0.05)+(20000*0.07)+((ParamMontantCA-40000.001)*0.1)),0.001));

        EXIT(0);
    end;

    procedure CreateFinancialCrMemoT1();
    begin
        //SM MAZDA854
        TESTFIELD("Responsibility Center");
        TESTFIELD("Salesperson Code");
        TESTFIELD("Payment Method Code");
        TESTFIELD("Payment Terms Code");
        //SM MAZDA854

        SalesHeaderFinancialCrMemo.RESET;
        SalesHeaderFinancialCrMemo.INIT;
        SalesHeaderFinancialCrMemo."Document Type" := SalesHeaderFinancialCrMemo."Document Type"::"Credit Memo";
        //SalesHeaderFinancialCrMemo."Posting Date"
        SalesHeaderFinancialCrMemo.INSERT(TRUE);
        SalesHeaderFinancialCrMemo.VALIDATE("Sell-to Customer No.","No.");
        //SM MAZDA854
        SalesHeaderFinancialCrMemo."Discount Quarter" := SalesHeaderFinancialCrMemo."Discount Quarter"::T1;
        SalesHeaderFinancialCrMemo."Discount Year"    := YearFilter;
        SalesHeaderFinancialCrMemo.VALIDATE("External Document No.",FORMAT(SalesHeaderFinancialCrMemo."Discount Quarter")+'\'+FORMAT(SalesHeaderFinancialCrMemo."Discount Year"));

        SalesHeaderFinancialCrMemo.VALIDATE("Responsibility Center","Responsibility Center");
        SalesHeaderFinancialCrMemo.VALIDATE("Salesperson Code","Salesperson Code");
        SalesHeaderFinancialCrMemo.VALIDATE("Payment Method Code","Payment Method Code");
        SalesHeaderFinancialCrMemo.VALIDATE("Payment Terms Code","Payment Terms Code");
        SalesHeaderFinancialCrMemo.VALIDATE("Type Avoir",SalesHeaderFinancialCrMemo."Type Avoir"::"Av. Financier");
        SalesHeaderFinancialCrMemo.VALIDATE("Reason Code",'RISTOURNE');
        //END SM
        SalesHeaderFinancialCrMemo.MODIFY(TRUE);

        //INSERT LINE
        SalesLineFinancialCrMemo.RESET;
        SalesLineFinancialCrMemo."Document Type"  := SalesLineFinancialCrMemo."Document Type"::"Credit Memo";
        SalesLineFinancialCrMemo."Document No."   := SalesHeaderFinancialCrMemo."No.";
        SalesLineFinancialCrMemo."Line No."       := 10000;
        SalesLineFinancialCrMemo.INSERT(TRUE);

        SalesLineFinancialCrMemo.VALIDATE(Type,SalesLineFinancialCrMemo.Type::"G/L Account");
        SalesLineFinancialCrMemo.VALIDATE("No.",'709001');
        SalesLineFinancialCrMemo.VALIDATE(Quantity,1);
        SalesLineFinancialCrMemo.VALIDATE("Unit Price",MontantRistourneCalculeT1-MontantRistourneValideT1);
        //SM MAZDA854
        SalesLineFinancialCrMemo."Discount Quarter" := SalesLineFinancialCrMemo."Discount Quarter"::T1;
        SalesLineFinancialCrMemo."Discount Year"    := YearFilter;
        //END SM
        SalesLineFinancialCrMemo.MODIFY(TRUE);

        CurrPage.UPDATE(TRUE);
        PageSalesCreditMemo.SETRECORD(SalesHeaderFinancialCrMemo);
        PageSalesCreditMemo.RUN;
    end;

    procedure CreateFinancialCrMemoT2();
    begin
        //SM MAZDA854
        TESTFIELD("Responsibility Center");
        TESTFIELD("Salesperson Code");
        TESTFIELD("Payment Method Code");
        TESTFIELD("Payment Terms Code");
        //SM MAZDA854

        SalesHeaderFinancialCrMemo.RESET;
        SalesHeaderFinancialCrMemo.INIT;
        SalesHeaderFinancialCrMemo."Document Type" := SalesHeaderFinancialCrMemo."Document Type"::"Credit Memo";
        //SalesHeaderFinancialCrMemo."Posting Date"

        SalesHeaderFinancialCrMemo.INSERT(TRUE);
        SalesHeaderFinancialCrMemo.VALIDATE("Sell-to Customer No.","No.");
        //SM MAZDA854
        SalesHeaderFinancialCrMemo."Discount Quarter" := SalesHeaderFinancialCrMemo."Discount Quarter"::T2;
        SalesHeaderFinancialCrMemo."Discount Year"    := YearFilter;
        SalesHeaderFinancialCrMemo.VALIDATE("External Document No.",FORMAT(SalesHeaderFinancialCrMemo."Discount Quarter")+'\'+FORMAT(SalesHeaderFinancialCrMemo."Discount Year"));

        SalesHeaderFinancialCrMemo.VALIDATE("Responsibility Center","Responsibility Center");
        SalesHeaderFinancialCrMemo.VALIDATE("Salesperson Code","Salesperson Code");
        SalesHeaderFinancialCrMemo.VALIDATE("Payment Method Code","Payment Method Code");
        SalesHeaderFinancialCrMemo.VALIDATE("Payment Terms Code","Payment Terms Code");
        SalesHeaderFinancialCrMemo.VALIDATE("Type Avoir",SalesHeaderFinancialCrMemo."Type Avoir"::"Av. Financier");
        SalesHeaderFinancialCrMemo.VALIDATE("Reason Code",'RISTOURNE');
        //END SM

        SalesHeaderFinancialCrMemo.MODIFY(TRUE);

        //INSERT LINE
        SalesLineFinancialCrMemo.RESET;
        SalesLineFinancialCrMemo."Document Type"  := SalesLineFinancialCrMemo."Document Type"::"Credit Memo";
        SalesLineFinancialCrMemo."Document No."   := SalesHeaderFinancialCrMemo."No.";
        SalesLineFinancialCrMemo."Line No."       := 10000;
        SalesLineFinancialCrMemo.INSERT(TRUE);

        SalesLineFinancialCrMemo.VALIDATE(Type,SalesLineFinancialCrMemo.Type::"G/L Account");
        SalesLineFinancialCrMemo.VALIDATE("No.",'709001');
        SalesLineFinancialCrMemo.VALIDATE("Unit Price",MontantRistourneCalculeT2-MontantRistourneValideT2);
        //SM MAZDA854
        SalesLineFinancialCrMemo."Discount Quarter" := SalesLineFinancialCrMemo."Discount Quarter"::T2;
        SalesLineFinancialCrMemo."Discount Year"    := YearFilter;
        //END SM
        SalesLineFinancialCrMemo.MODIFY(TRUE);

        CurrPage.UPDATE(TRUE);
        PageSalesCreditMemo.SETRECORD(SalesHeaderFinancialCrMemo);
        PageSalesCreditMemo.RUN;
    end;

    procedure CreateFinancialCrMemoT3();
    begin
        //SM MAZDA854
        TESTFIELD("Responsibility Center");
        TESTFIELD("Salesperson Code");
        TESTFIELD("Payment Method Code");
        TESTFIELD("Payment Terms Code");
        //SM MAZDA854

        SalesHeaderFinancialCrMemo.RESET;
        SalesHeaderFinancialCrMemo.INIT;
        SalesHeaderFinancialCrMemo."Document Type" := SalesHeaderFinancialCrMemo."Document Type"::"Credit Memo";
        //SalesHeaderFinancialCrMemo."Posting Date"

        SalesHeaderFinancialCrMemo.INSERT(TRUE);
        SalesHeaderFinancialCrMemo.VALIDATE("Sell-to Customer No.","No.");
        //SM MAZDA854
        SalesHeaderFinancialCrMemo."Discount Quarter" := SalesHeaderFinancialCrMemo."Discount Quarter"::T3;
        SalesHeaderFinancialCrMemo."Discount Year"    := YearFilter;
        SalesHeaderFinancialCrMemo.VALIDATE("External Document No.",FORMAT(SalesHeaderFinancialCrMemo."Discount Quarter")+'\'+FORMAT(SalesHeaderFinancialCrMemo."Discount Year"));

        SalesHeaderFinancialCrMemo.VALIDATE("Responsibility Center","Responsibility Center");
        SalesHeaderFinancialCrMemo.VALIDATE("Salesperson Code","Salesperson Code");
        SalesHeaderFinancialCrMemo.VALIDATE("Payment Method Code","Payment Method Code");
        SalesHeaderFinancialCrMemo.VALIDATE("Payment Terms Code","Payment Terms Code");
        SalesHeaderFinancialCrMemo.VALIDATE("Type Avoir",SalesHeaderFinancialCrMemo."Type Avoir"::"Av. Financier");
        SalesHeaderFinancialCrMemo.VALIDATE("Reason Code",'RISTOURNE');
        //END SM

        SalesHeaderFinancialCrMemo.MODIFY(TRUE);

        //INSERT LINE
        SalesLineFinancialCrMemo.RESET;
        SalesLineFinancialCrMemo."Document Type"  := SalesLineFinancialCrMemo."Document Type"::"Credit Memo";
        SalesLineFinancialCrMemo."Document No."   := SalesHeaderFinancialCrMemo."No.";
        SalesLineFinancialCrMemo."Line No."       := 10000;
        SalesLineFinancialCrMemo.INSERT(TRUE);

        SalesLineFinancialCrMemo.VALIDATE(Type,SalesLineFinancialCrMemo.Type::"G/L Account");
        SalesLineFinancialCrMemo.VALIDATE("No.",'709001');
        SalesLineFinancialCrMemo.VALIDATE("Unit Price",MontantRistourneCalculeT3-MontantRistourneValideT3);
        //SM MAZDA854
        SalesLineFinancialCrMemo."Discount Quarter" := SalesLineFinancialCrMemo."Discount Quarter"::T3;
        SalesLineFinancialCrMemo."Discount Year"    := YearFilter;
        //END SM

        SalesLineFinancialCrMemo.MODIFY(TRUE);

        CurrPage.UPDATE(TRUE);
        PageSalesCreditMemo.SETRECORD(SalesHeaderFinancialCrMemo);
        PageSalesCreditMemo.RUN;
    end;

    procedure CreateFinancialCrMemoT4();
    begin
        //SM MAZDA854
        TESTFIELD("Responsibility Center");
        TESTFIELD("Salesperson Code");
        TESTFIELD("Payment Method Code");
        TESTFIELD("Payment Terms Code");
        //SM MAZDA854

        SalesHeaderFinancialCrMemo.RESET;
        SalesHeaderFinancialCrMemo.INIT;
        SalesHeaderFinancialCrMemo."Document Type" := SalesHeaderFinancialCrMemo."Document Type"::"Credit Memo";
        //SalesHeaderFinancialCrMemo."Posting Date"

        SalesHeaderFinancialCrMemo.INSERT(TRUE);
        SalesHeaderFinancialCrMemo.VALIDATE("Sell-to Customer No.","No.");
        //SM MAZDA854
        SalesHeaderFinancialCrMemo."Discount Quarter" := SalesHeaderFinancialCrMemo."Discount Quarter"::T4;
        SalesHeaderFinancialCrMemo."Discount Year"    := YearFilter;
        SalesHeaderFinancialCrMemo.VALIDATE("External Document No.",FORMAT(SalesHeaderFinancialCrMemo."Discount Quarter")+'\'+FORMAT(SalesHeaderFinancialCrMemo."Discount Year"));

        SalesHeaderFinancialCrMemo.VALIDATE("Responsibility Center","Responsibility Center");
        SalesHeaderFinancialCrMemo.VALIDATE("Salesperson Code","Salesperson Code");
        SalesHeaderFinancialCrMemo.VALIDATE("Payment Method Code","Payment Method Code");
        SalesHeaderFinancialCrMemo.VALIDATE("Payment Terms Code","Payment Terms Code");
        SalesHeaderFinancialCrMemo.VALIDATE("Type Avoir",SalesHeaderFinancialCrMemo."Type Avoir"::"Av. Financier");
        SalesHeaderFinancialCrMemo.VALIDATE("Reason Code",'RISTOURNE');
        //END SM

        SalesHeaderFinancialCrMemo.MODIFY(TRUE);

        //INSERT LINE
        SalesLineFinancialCrMemo.RESET;
        SalesLineFinancialCrMemo."Document Type"  := SalesLineFinancialCrMemo."Document Type"::"Credit Memo";
        SalesLineFinancialCrMemo."Document No."   := SalesHeaderFinancialCrMemo."No.";
        SalesLineFinancialCrMemo."Line No."       := 10000;
        SalesLineFinancialCrMemo.INSERT(TRUE);

        SalesLineFinancialCrMemo.VALIDATE(Type,SalesLineFinancialCrMemo.Type::"G/L Account");
        SalesLineFinancialCrMemo.VALIDATE("No.",'709001');
        SalesLineFinancialCrMemo.VALIDATE("Unit Price",MontantRistourneCalculeT4-MontantRistourneValideT4);
        //SM MAZDA854
        SalesLineFinancialCrMemo."Discount Quarter" := SalesLineFinancialCrMemo."Discount Quarter"::T4;
        SalesLineFinancialCrMemo."Discount Year"    := YearFilter;
        //END SM

        SalesLineFinancialCrMemo.MODIFY(TRUE);

        CurrPage.UPDATE(TRUE);
        PageSalesCreditMemo.SETRECORD(SalesHeaderFinancialCrMemo);
        PageSalesCreditMemo.RUN;
    end;
}

