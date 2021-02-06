table 70030 "Paramètre Compta. Réglement."
{

    fields
    {
        field(1;"Type de réglement";Code[20])
        {
            TableRelation = "Payment Class";
        }
        field(2;Etape;Integer)
        {
            TableRelation = "Payment Step".Line WHERE (Payment Class=FIELD(Type de réglement));
        }
        field(3;Site;Code[20])
        {
            TableRelation = Coffre;
        }
        field(4;User;Code[50])
        {
            TableRelation = "User Setup";
        }
        field(5;"Compte Débit";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(6;"Compte Crédit";Code[20])
        {
        }
        field(7;"Code journal";Code[10])
        {
            TableRelation = "Source Code";
        }
        field(8;"Souche Création Doc";Code[10])
        {
            TableRelation = "No. Series";
        }
        field(9;"Nom Etape";Code[50])
        {
            CalcFormula = Lookup("Payment Step".Name WHERE (Payment Class=FIELD(Type de réglement),
                                                            Line=FIELD(Etape)));
            FieldClass = FlowField;
        }
        field(10;Profil;Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Type de réglement",Etape,User)
        {
        }
    }

    fieldgroups
    {
    }
}

