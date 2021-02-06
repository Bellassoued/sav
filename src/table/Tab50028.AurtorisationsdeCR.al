table 50028 "Aurtorisations de CR"
{

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

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(3;"Q. Provisoires";Decimal)
        {
            Description = 'P12';

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(4;"Q. R. Garanties";Decimal)
        {
            Description = 'P12';

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(5;"Q.Définitives";Decimal)
        {
            Description = 'P3';

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(6;"Escompte Commerciale";Decimal)
        {
            Description = 'P3';

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(7;"Découvert";Decimal)
        {

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(8;"Cession Créance Profss.";Decimal)
        {

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(9;"Lettre de Crédit";Decimal)
        {

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(10;"Aval/Billet de trésorerie";Decimal)
        {

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(11;"Avance sur marché";Decimal)
        {

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(12;"Financement en Devise";Decimal)
        {

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(13;"Obilgation Cautionnée";Decimal)
        {

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(14;"Effet Mob/Fin. D. Douane";Decimal)
        {

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(15;Autorisation;Decimal)
        {
            Caption = 'Autorisation';

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(16;"Caution Douanière";Decimal)
        {

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(17;"Impayé";Decimal)
        {

            trigger OnValidate();
            begin
                CalcAutorisation
            end;
        }
        field(18;"Montant Groupé";Decimal)
        {
            CalcFormula = Sum("Aurtorisations de CR Groupé".Autorisation WHERE (Code Banque=FIELD(Code Banque)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Code Banque")
        {
        }
    }

    fieldgroups
    {
    }

    var
        BankAccount : Record "270";

    local procedure CalcAutorisation();
    begin
        Autorisation := "Q. Provisoires" + "Q. R. Garanties"+"Q.Définitives"+"Escompte Commerciale"+Découvert+"Cession Créance Profss."+
        "Lettre de Crédit"+"Aval/Billet de trésorerie"+"Avance sur marché"+"Financement en Devise"+"Obilgation Cautionnée"+"Effet Mob/Fin. D. Douane"+
        "Caution Douanière"+Impayé;
    end;
}

