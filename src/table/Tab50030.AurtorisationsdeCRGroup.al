table 50030 "Aurtorisations de CR Groupé"
{
    DrillDownPageID = 70247;
    LookupPageID = 70247;

    fields
    {
        field(1;"Code Banque";Code[20])
        {
            TableRelation = "Bank Account".No.;

            trigger OnValidate();
            begin
                BankAccount.GET("Code Banque");
                "Nom Banque" := BankAccount.Name;
            end;
        }
        field(2;"Nom Banque";Text[150])
        {
        }
        field(3;"Q. Provisoires";Boolean)
        {
        }
        field(4;"Q. R. Garanties";Boolean)
        {
        }
        field(5;"Q.Définitives";Boolean)
        {
        }
        field(6;"Escompte Commerciale";Boolean)
        {
        }
        field(7;"Découvert";Boolean)
        {
        }
        field(8;"Cession Créance Profss.";Boolean)
        {
        }
        field(9;"Lettre de Crédit";Boolean)
        {
        }
        field(10;"Aval/Billet de trésorerie";Boolean)
        {
        }
        field(11;"Avance sur marché";Boolean)
        {
        }
        field(12;"Financement en Devise";Boolean)
        {
        }
        field(13;"Obilgation Cautionnée";Boolean)
        {
        }
        field(14;"Effet Mob/Fin. D. Douane";Boolean)
        {
        }
        field(15;Autorisation;Decimal)
        {
            Caption = 'Autorisation';
        }
        field(16;"Caution Douanière";Boolean)
        {
        }
        field(17;"Impayé";Boolean)
        {
        }
        field(18;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1;"Code Banque","Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        BankAccount : Record "270";
}

