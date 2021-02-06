table 50066 "Entête Prêt/Société"
{
    // version MOE

    DrillDownPageID = 69095;
    LookupPageID = 69095;

    fields
    {
        field(1;"Loan Nos.";Code[10])
        {
            Caption = 'N° Prêt';
        }
        field(2;Description;Text[30])
        {
            Caption = 'Désignation';
        }
        field(3;"Loan Date";Date)
        {
            Caption = 'Date Prêt';
        }
        field(4;"First Date Of Payment";Date)
        {
            Caption = 'Date 1ére Echéance';
        }
        field(5;"Number of Slices";Integer)
        {
            Caption = 'Nombre de Tranches';
        }
        field(6;"Date End Loan";Date)
        {
        }
        field(7;"Subsidiary Code";Code[30])
        {
            Caption = 'Code Filiale';
            TableRelation = Customer.No.;

            trigger OnValidate();
            begin
                //ADD EM 17/05/2017
                CLEAR(Customer);
                IF Customer.GET("Subsidiary Code") THEN;
                "Subsidiary Name" := Customer.Name;
                EntetePretS.SETRANGE("Subsidiary Code","Subsidiary Code");
                EntetePretS.SETRANGE(Status,EntetePretS.Status::"En cours");
                EntetePretS.SETFILTER("Loan Nos.",'<>%1',"Loan Nos.");
                IF EntetePretS.FINDFIRST THEN
                   MESSAGE('Cette société a un prêt en cours');
            end;
        }
        field(8;"Subsidiary Name";Text[30])
        {
            Caption = 'Nom Filiale';
        }
        field(9;"Principal Amount";Decimal)
        {
            Caption = 'Montant Principal';
        }
        field(10;"% Interest";Decimal)
        {
            Caption = '% Intérêt';
        }
        field(11;"Total amount";Decimal)
        {
            Caption = 'Montant Total';
        }
        field(12;"Serial Nos.";Code[10])
        {
            CaptionML = ENU='No. Series',
                        FRA='Souches de n°';
            TableRelation = "No. Series";
        }
        field(13;Status;Option)
        {
            OptionMembers = "En cours","Clôturé";
        }
        field(14;"Interest Amount";Decimal)
        {
        }
        field(15;"Amount per Slices Souahité";Decimal)
        {
            Caption = 'Montant tranche Souhaité';
        }
        field(16;"Amount per Slices Calculé";Decimal)
        {
            Caption = 'Montant tranche Calculé';
        }
        field(17;"Crédit Filiale";Boolean)
        {
        }
        field(18;"Crédit Leasing";Boolean)
        {
        }
        field(19;"Crédit Investissement";Boolean)
        {
        }
        field(20;Banque;Code[20])
        {
            TableRelation = "Bank Account".No.;

            trigger OnValidate();
            begin
                CLEAR(BankAccount);
                BankAccount.GET(Banque);
                "Nom banque" := BankAccount.Name;
            end;
        }
        field(21;"Nom banque";Code[100])
        {
        }
        field(22;"Type Crédit";Option)
        {
            OptionCaption = 'Crédit L.T,Crédit C.T,Crédit M.T';
            OptionMembers = "Crédit L.T","Crédit C.T","Crédit M.T";
        }
    }

    keys
    {
        key(Key1;"Loan Nos.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
         //ADD EM 16/05/2017
           IF "Loan Nos." = '' THEN BEGIN
          GeneralLedgerSetup.GET;
          GeneralLedgerSetup.TESTFIELD("Loan Nos.");
          NoSeriesMgt.InitSeries(GeneralLedgerSetup."Loan Nos.",xRec."Serial Nos.",0D,"Loan Nos.","Serial Nos.");
          END;
    end;

    var
        ServMgtSetup : Record "5911";
        NoSeriesMgt : Codeunit "396";
        GeneralLedgerSetup : Record "98";
        BankAccount : Record "270";
        Customer : Record "18";
        EntetePretS : Record "50066";
}

