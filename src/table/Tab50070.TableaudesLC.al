table 50070 "Tableau des L.C"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
        }
        field(2;"Banque (Ancien Code)";Code[20])
        {
        }
        field(3;Banque;Code[20])
        {
            TableRelation = "Bank Account".No.;

            trigger OnValidate();
            begin
                CLEAR(BankAccount);
                BankAccount.GET("Banque (Ancien Code)");
                Banque := BankAccount.Name;
            end;
        }
        field(4;"No. L.C Nav.";Code[20])
        {
        }
        field(5;"Sous-Dossier";Code[20])
        {
        }
        field(6;"Montant Euro";Decimal)
        {
        }
        field(7;"Montant TND";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(8;"Date Echéance";Date)
        {
        }
        field(9;"No. proformat";Code[20])
        {
        }
        field(10;Position;Code[100])
        {
        }
        field(11;"No. Dossier";Code[20])
        {
        }
        field(12;"Taux de change";Decimal)
        {
            DecimalPlaces = 3:8;

            trigger OnValidate();
            begin
                "Montant TND" := "Montant Euro" * "Taux de change";
            end;
        }
        field(13;Coface;Code[20])
        {
        }
        field(14;"Banque Name";Code[100])
        {
        }
        field(15;AT;Boolean)
        {
        }
        field(16;FIN;Boolean)
        {
        }
        field(17;Commentaire;Text[250])
        {
        }
        field(18;Statut;Option)
        {
            OptionCaption = 'Lancer,Clôturé';
            OptionMembers = Lancer,"Clôturé";
        }
        field(19;"No. LC Banque";Code[50])
        {
        }
        field(20;"Montant Arrivage TND";Decimal)
        {
        }
        field(21;"Montant Arrivage Devise";Decimal)
        {
        }
        field(22;"Réglé";Boolean)
        {
        }
        field(23;"Cours Achat à Terme";Decimal)
        {
        }
        field(24;"Montant Achat à Terme";Decimal)
        {
        }
        field(25;"Cours Financement";Decimal)
        {
        }
        field(26;"Montant Total Financement";Decimal)
        {
        }
        field(27;"No. Financement";Code[20])
        {
        }
        field(28;"Date Financement";Date)
        {
        }
        field(29;"Ligne Financement";Boolean)
        {
        }
        field(30;"Date Echéance Achat A.Terme";Date)
        {
        }
        field(31;"Date Négociation Ahat A.T";Date)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        BankAccount : Record "270";
}

