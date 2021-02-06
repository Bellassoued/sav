table 70076 "Login PRANET"
{
    DrillDownPageID = 70122;
    LookupPageID = 70122;

    fields
    {
        field(1;"Login PRANET";Code[50])
        {
            TableRelation = "User Setup";
        }
        field(2;"Code Client";Code[10])
        {
            TableRelation = Customer;

            trigger OnValidate();
            begin
                Customer.GET("Code Client");
                VALIDATE("Raison Sociale",Customer.Name)
            end;
        }
        field(3;"Raison Sociale";Text[100])
        {
        }
        field(4;Nom;Text[50])
        {
        }
        field(5;"Prénom";Text[50])
        {
        }
        field(6;Magasin;Code[10])
        {
            TableRelation = Location WHERE (Use As In-Transit=CONST(No),
                                            Exclure du disponible=CONST(No));
        }
        field(7;Actif;Boolean)
        {
        }
        field(8;Email;Text[250])
        {
        }
        field(9;"Vendeur Iténérant";Code[10])
        {
        }
        field(10;"Changé Clientéle";Code[10])
        {
            TableRelation = Salesperson/Purchaser;
        }
        field(11;"Code Utilisateur PRANET";Code[20])
        {
        }
        field(12;"Mot De Passe PRANET";Code[20])
        {
        }
        field(13;Connexion;Boolean)
        {
        }
        field(14;"Password Windows User";Code[20])
        {
            Description = 'SM041017';
        }
    }

    keys
    {
        key(Key1;"Code Utilisateur PRANET")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Customer : Record "18";
}

