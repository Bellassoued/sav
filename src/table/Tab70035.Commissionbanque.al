table 70035 "Commission / banque"
{
    // version a supprimer


    fields
    {
        field(1;"Code";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Désignation";Code[50])
        {
        }
        field(3;Banque;Code[20])
        {
            TableRelation = "Bank Account".No.;

            trigger OnValidate();
            begin
                CLEAR(BankAccount);
                BankAccount.GET(Banque);
                Nom := BankAccount.Name
            end;
        }
        field(4;Nom;Code[50])
        {
        }
        field(5;"Type Commission";Option)
        {
            OptionMembers = " ","L.C";

            trigger OnValidate();
            begin
                IF "Type Commission" = 1 THEN
                  "Désignation type" := 'Commission sur L.C';
            end;
        }
        field(6;"Désignation type";Code[50])
        {
        }
        field(7;Montant;Decimal)
        {
        }
        field(8;"Compte contrepartie";Code[20])
        {
            TableRelation = "G/L Account".No.;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        BankAccount : Record "270";
}

