table 50029 "Engagement Trésorerie"
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
        }
        field(3;"Q. Provisoires";Decimal)
        {
            Description = 'P12';
        }
        field(4;"Q. R. Garanties";Decimal)
        {
            Description = 'P12';
        }
        field(5;"Q.Définitives";Decimal)
        {
            Description = 'P3';
        }
        field(6;"Escompte Commerciale";Decimal)
        {
            Description = 'P3';
        }
        field(7;"Découvert";Decimal)
        {
        }
        field(8;"Cession Créance Profss.";Decimal)
        {
        }
        field(9;"Lettre de Crédit";Decimal)
        {
        }
        field(10;"Aval/Billet de trésorerie";Decimal)
        {
        }
        field(11;"Avance sur marché";Decimal)
        {
        }
        field(12;"Financement en Devise";Decimal)
        {
        }
        field(13;"Obilgation Cautionnée";Decimal)
        {
        }
        field(14;"Effet Mob/Fin. D. Douane";Decimal)
        {
        }
        field(15;Autorisation;Decimal)
        {
            Caption = 'Autorisation';
        }
        field(16;"Caution Douanière";Decimal)
        {
        }
        field(17;"Impayé";Decimal)
        {
        }
        field(18;"Montant Groupé";Decimal)
        {
            CalcFormula = Sum("Aurtorisations de CR Groupé".Autorisation WHERE (Code Banque=FIELD(Code Banque)));
            FieldClass = FlowField;
        }
        field(20;"Q. Provisoires (Réalisé)";Decimal)
        {
            Description = 'P12';
        }
        field(21;"Q. R. Garanties (Réalisé)";Decimal)
        {
            Description = 'P12';
        }
        field(22;"Q.Définitives (Réalisé)";Decimal)
        {
            Description = 'P3';
        }
        field(23;"Escompte Commerciale (Réalisé)";Decimal)
        {
            Description = 'P3';
        }
        field(24;"Découvert (Réalisé)";Decimal)
        {
        }
        field(25;"Cess Créance Profss. (Réalisé)";Decimal)
        {
        }
        field(26;"Lettre de Crédit (Réalisé)";Decimal)
        {
        }
        field(27;"Aval/Billet de tréso (Réalisé)";Decimal)
        {
        }
        field(28;"Avance sur marché (Réalisé)";Decimal)
        {
        }
        field(29;"Financement en Dev (Réalisé)";Decimal)
        {
        }
        field(30;"Obilgation Cautionn (Réalisé)";Decimal)
        {
        }
        field(31;"Effet Mob/Fin. D. D (Réalisé)";Decimal)
        {
        }
        field(33;"Caution Douanière (Réalisé)";Decimal)
        {
        }
        field(34;"Impayé (Réalisé)";Decimal)
        {
        }
        field(35;"Montant Groupé (Réalisé)";Decimal)
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
}

