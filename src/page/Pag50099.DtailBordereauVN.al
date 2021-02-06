page 50099 "Détail Bordereau VN"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table10866;
    SourceTableView = SORTING(No.,Line No.)
                      ORDER(Ascending)
                      WHERE(Payment Class=FILTER(ENC-CHQ),
                            Activité=FILTER(VN),
                            No.=FILTER(EC*),
                            Status No.=FILTER(<95000));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("Status No.";"Status No.")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Account Type";"Account Type")
                {
                }
                field("Account No.";"Account No.")
                {
                }
                field("Copied To No.";"Copied To No.")
                {
                }
                field("Copied To Line";"Copied To Line")
                {
                }
                field("External Document No.";"External Document No.")
                {
                }
                field(LastPaymentStatus;LastPaymentStatus)
                {
                    Caption = 'NoStatut';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    begin
        // IF "Copied To No." = '' THEN
        //   NoStatut := "Status No."
        // ELSE
        // NoStatut := CheckLastPaymentStatus("No.","Account No.",95000);
    end;

    trigger OnAfterGetRecord();
    begin
        // IF "Copied To No." = '' THEN
        //  NoStatut := "Status No."
        // ELSE
        //  NoStatut := CheckLastPaymentStatus("No.","Account No.",95000);
    end;

    trigger OnOpenPage();
    begin
        //ADD KK 090316
        // Mettre à jour LastPaymentStatut ligne bordereau
        PaymentLine.RESET;
        PaymentLine.SETFILTER("Payment Class",'%1','ENC-CHQ');
        PaymentLine.SETRANGE(Activité,PaymentLine.Activité::VN);
        PaymentLine.SETFILTER("No.",'%1','EC*');
        PaymentLine.SETFILTER("Status No.",'<%1',95000);
        PaymentLine.SETFILTER(LastPaymentStatus,'<%1',95000);
        IF PaymentLine.FINDFIRST THEN
          REPEAT
            IF PaymentLine."Copied To No." = '' THEN
              NoStatut := PaymentLine."Status No."
            ELSE
              NoStatut := CheckLastPaymentStatus(PaymentLine."No.",PaymentLine."Account No.",95000);

            IF NoStatut <> PaymentLine.LastPaymentStatus THEN BEGIN
              PaymentLine.LastPaymentStatus := NoStatut;
              PaymentLine.MODIFY;
            END;

          UNTIL PaymentLine.NEXT=0;

        SETFILTER(LastPaymentStatus,'<%1',95000);
    end;

    var
        NoStatut : Integer;
        PaymentLine : Record "10866";
        FilterStatut : Integer;

    procedure CheckLastPaymentStatus(var NoBordereau : Code[20];var CustomerNo : Code[20];StatutNo : Integer) : Integer;
    var
        RecPaymentLine : Record "10866";
        RecPaymentLine2 : Record "10866";
    begin
        //ADD KK 04022016
        // PaymentCheked := FALSE;
        RecPaymentLine.RESET;
        RecPaymentLine.SETRANGE("No.",NoBordereau);
        RecPaymentLine.SETRANGE("Account Type",RecPaymentLine."Account Type"::Customer);
        RecPaymentLine.SETRANGE("Account No.",CustomerNo);
        IF RecPaymentLine.FINDFIRST THEN
          REPEAT
            RecPaymentLine2.GET(RecPaymentLine."No.",RecPaymentLine."Line No.");
            WHILE (RecPaymentLine2."Copied To No." <> '') AND (RecPaymentLine2."Status No."<StatutNo) DO BEGIN
              RecPaymentLine2.GET(RecPaymentLine2."Copied To No.",RecPaymentLine2."Copied To Line");
            END;
            EXIT(RecPaymentLine2."Status No.");
          UNTIL RecPaymentLine.NEXT=0;
        //END KK 04022016
    end;
}

