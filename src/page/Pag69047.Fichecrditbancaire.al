page 69047 "Fiche crédit bancaire"
{
    PageType = Card;
    SourceTable = Table60063;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field(Type;Type)
                {
                }
                field("Bank Account";"Bank Account")
                {
                }
                field("Montant Crédit";"Montant Crédit")
                {
                }
                field("Total Principal ligne Paiement";"Total Principal ligne Paiement")
                {
                }
                field("Total Interêt ligne Paiement";"Total Interêt ligne Paiement")
                {
                }
                field("Nbre échéance";"Nbre échéance")
                {
                }
                field(Objet;Objet)
                {
                }
                field("Date du déblocage";"Date du déblocage")
                {
                }
                field("Type Financement";"Type Financement")
                {
                }
                field("Date première échéance";"Date première échéance")
                {
                }
                field("Taux d'intérêt";"Taux d'intérêt")
                {
                }
                field(Périodicité;Périodicité)
                {
                }
                field("Compte crédit principal";"Compte crédit principal")
                {
                }
                field("Compte Intérêt";"Compte Intérêt")
                {
                }
                field("Compte Commission";"Compte Commission")
                {
                }
                field("Compte TVA sur Commission";"Compte TVA sur Commission")
                {
                }
                field("Mensualité principal";"Mensualité principal")
                {
                }
                field("Montant Commission";"Montant Commission")
                {
                }
                field("Montant TVA";"Montant TVA")
                {
                }
            }
            part(;69048)
            {
                SubPageLink = Crédit Bancaire=FIELD(No.);
                SubPageView = SORTING(Due Date,Document No.)
                              WHERE(Payment Class=FILTER(CREDIT BANCAIRE|CREDIT LEASING|CREDIT BANC INT));
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Créer Bondereau Principal")
            {

                trigger OnAction();
                var
                    RecPaymentClass : Record "10860";
                    RecPaymentHeader : Record "10865";
                    NoSeriesMgt : Codeunit "396";
                    PagePaymentSlip : Page "10868";
                    RecPaymentLine : Record "10866";
                    I : Integer;
                    DueDate : Date;
                    NoLigne : Integer;
                    MontantDernierEch : Decimal;
                begin
                    TESTFIELD("Bank Account");
                    TESTFIELD("Montant Crédit");
                    TESTFIELD("Nbre échéance");
                    TESTFIELD(Périodicité);
                    TESTFIELD("Date première échéance");
                    TESTFIELD("Compte crédit principal");
                    TESTFIELD("Date du déblocage");
                    TESTFIELD("Mensualité principal");


                    IF Type = Type::Reçu THEN
                      RecPaymentClass.GET('CREDIT BANCAIRE')
                    ELSE IF Type = Type::Leasing THEN
                      RecPaymentClass.GET('CREDIT LEASING')
                    ELSE
                      ERROR('Type crédit non traité');


                     RecPaymentHeader.INIT;
                     RecPaymentClass.TESTFIELD("Header No. Series");
                     NoSeriesMgt.InitSeries(RecPaymentClass."Header No. Series",'',0D,RecPaymentHeader."No.",RecPaymentHeader."No. Series");
                     RecPaymentHeader.VALIDATE("Payment Class",RecPaymentClass.Code);
                     RecPaymentHeader.VALIDATE("Account Type",RecPaymentClass."Header Account Type");
                     RecPaymentHeader.Suggestions:=RecPaymentClass.Suggestions;
                     RecPaymentHeader."Type Règlement" := FORMAT(RecPaymentClass.Type_Reg);


                     RecPaymentHeader.INSERT(TRUE);


                     RecPaymentHeader.VALIDATE("Account Type",RecPaymentHeader."Account Type"::"Bank Account");
                     RecPaymentHeader.VALIDATE("Account No.","Bank Account");
                     RecPaymentHeader.VALIDATE("Crédit Bancaire","No.");
                     RecPaymentHeader.VALIDATE("Posting Date","Date du déblocage");
                     RecPaymentHeader.MODIFY(TRUE);

                     DueDate := "Date première échéance";
                     NoLigne := 10000;

                    FOR I := 1 TO "Nbre échéance" DO BEGIN

                      RecPaymentLine.INIT;
                      RecPaymentLine.VALIDATE("No.",RecPaymentHeader."No.");
                      RecPaymentLine."Line No." := NoLigne;
                      RecPaymentLine.VALIDATE("Account Type",RecPaymentLine."Account Type"::"G/L Account");
                      RecPaymentLine.VALIDATE("Account No.","Compte crédit principal");
                      MontantDernierEch += "Mensualité principal";
                      IF "Montant Crédit" < MontantDernierEch THEN
                        RecPaymentLine.VALIDATE(Amount,"Mensualité principal"-(MontantDernierEch-"Montant Crédit"))
                      ELSE
                        RecPaymentLine.VALIDATE(Amount,"Mensualité principal");
                      RecPaymentLine.VALIDATE("Due Date",DueDate);
                      RecPaymentLine.INSERT(TRUE);

                      DueDate := CALCDATE(Périodicité,DueDate);
                      NoLigne += 10000;

                    END;

                    MESSAGE('Bordereau No %1 a été crée.',RecPaymentHeader."No.");
                    COMMIT;
                    RecPaymentHeader.SETRANGE("No.",RecPaymentHeader."No.");
                    PagePaymentSlip.SETRECORD(RecPaymentHeader);
                    PagePaymentSlip.SETTABLEVIEW(RecPaymentHeader);
                    PagePaymentSlip.RUNMODAL
                end;
            }
            action("Créer Bondereau Intérêt")
            {

                trigger OnAction();
                var
                    RecPaymentClass : Record "10860";
                    RecPaymentHeader : Record "10865";
                    NoSeriesMgt : Codeunit "396";
                    PagePaymentSlip : Page "10868";
                    I : Integer;
                    DueDate : Date;
                    NoLigne : Integer;
                    RecPaymentLine : Record "10866";
                begin
                    TESTFIELD("Bank Account");
                    TESTFIELD("Montant Crédit");
                    TESTFIELD("Nbre échéance");
                    TESTFIELD(Périodicité);
                    TESTFIELD("Date première échéance");
                    TESTFIELD("Compte Intérêt");
                    TESTFIELD("Compte Commission");
                    TESTFIELD("Compte TVA sur Commission");
                    TESTFIELD("Date du déblocage");
                    TESTFIELD("Montant Commission");
                    TESTFIELD("Montant TVA");


                    RecPaymentClass.GET('CREDIT BANC INT');


                    RecPaymentHeader.INIT;
                    RecPaymentClass.TESTFIELD("Header No. Series");
                    NoSeriesMgt.InitSeries(RecPaymentClass."Header No. Series",'',0D,RecPaymentHeader."No.",RecPaymentHeader."No. Series");
                    RecPaymentHeader.VALIDATE("Payment Class",RecPaymentClass.Code);
                    RecPaymentHeader.VALIDATE("Account Type",RecPaymentClass."Header Account Type");
                    RecPaymentHeader.Suggestions:=RecPaymentClass.Suggestions;
                    RecPaymentHeader."Type Règlement" := FORMAT(RecPaymentClass.Type_Reg);


                    RecPaymentHeader.INSERT(TRUE);


                    RecPaymentHeader.VALIDATE("Account Type",RecPaymentHeader."Account Type"::"Bank Account");
                    RecPaymentHeader.VALIDATE("Account No.","Bank Account");
                    RecPaymentHeader.VALIDATE("Crédit Bancaire","No.");
                     RecPaymentHeader.VALIDATE("Posting Date","Date du déblocage");

                    RecPaymentHeader.MODIFY(TRUE);

                     DueDate := "Date première échéance";
                     NoLigne := 10000;

                    FOR I := 1 TO "Nbre échéance" DO BEGIN

                      RecPaymentLine.INIT;
                      RecPaymentLine.VALIDATE("No.",RecPaymentHeader."No.");
                      RecPaymentLine."Line No." := NoLigne;
                      RecPaymentLine.VALIDATE("Account Type",RecPaymentLine."Account Type"::"G/L Account");
                      RecPaymentLine.VALIDATE("Account No.","Compte Intérêt");
                      //RecPaymentLine.VALIDATE(Amount,);
                      RecPaymentLine.VALIDATE("Due Date",DueDate);
                      RecPaymentLine.INSERT(TRUE);

                      RecPaymentLine.INIT;
                      RecPaymentLine.VALIDATE("No.",RecPaymentHeader."No.");
                      RecPaymentLine."Line No." := NoLigne+5000;
                      RecPaymentLine.VALIDATE("Account Type",RecPaymentLine."Account Type"::"G/L Account");
                      RecPaymentLine.VALIDATE("Account No.","Compte Commission");
                      RecPaymentLine.VALIDATE(Amount,"Montant Commission");
                      RecPaymentLine.VALIDATE("Due Date",DueDate);
                      RecPaymentLine.INSERT(TRUE);

                      RecPaymentLine.INIT;
                      RecPaymentLine.VALIDATE("No.",RecPaymentHeader."No.");
                      RecPaymentLine."Line No." := NoLigne+7500;
                      RecPaymentLine.VALIDATE("Account Type",RecPaymentLine."Account Type"::"G/L Account");
                      RecPaymentLine.VALIDATE("Account No.","Compte TVA sur Commission");
                      RecPaymentLine.VALIDATE(Amount,"Montant TVA");
                      RecPaymentLine.VALIDATE("Due Date",DueDate);
                      RecPaymentLine.INSERT(TRUE);




                      DueDate := CALCDATE(Périodicité,DueDate);
                      NoLigne += 10000;

                    END;


                    MESSAGE('Bordereau No %1 a été crée.',RecPaymentHeader."No.");
                    COMMIT;

                    RecPaymentHeader.SETRANGE("No.",RecPaymentHeader."No.");
                    PagePaymentSlip.SETRECORD(RecPaymentHeader);
                    PagePaymentSlip.SETTABLEVIEW(RecPaymentHeader);
                    PagePaymentSlip.RUNMODAL
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        EVALUATE(Périodicité,'1M');
    end;

    var
        Periodicity : Code[10];
}

