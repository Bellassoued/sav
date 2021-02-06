table 60063 "Crédit Bancaire"
{
    // version FIN01

    DrillDownPageID = 69046;
    LookupPageID = 69046;

    fields
    {
        field(1;"No.";Code[20])
        {
            Caption = 'N°';
        }
        field(2;Description;Text[50])
        {
            Caption = 'Désignation';
        }
        field(3;Type;Option)
        {
            OptionCaption = 'Reçu,Octroyé,Leasing';
            OptionMembers = "Reçu","Octroyé",Leasing;
        }
        field(4;"Bank Account";Code[20])
        {
            Caption = 'Compte Bancaire';
            TableRelation = "Bank Account".No.;
        }
        field(5;"Montant Crédit";Decimal)
        {
        }
        field(6;"Total Principal ligne Paiement";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(CREDIT LEASING|CREDIT BANCAIRE),
                                                           Crédit Bancaire=FIELD(No.)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;"Total Interêt ligne Paiement";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(CREDIT BANC INT),
                                                           Crédit Bancaire=FIELD(No.),
                                                           Account No.=FIELD(Compte Intérêt)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"Nbre échéance";Integer)
        {
        }
        field(9;Objet;Text[100])
        {
        }
        field(10;"Date du déblocage";Date)
        {
        }
        field(11;"Type Financement";Option)
        {
            OptionCaption = 'CMT,Billet Trésorerie,Avance sur marché';
            OptionMembers = CMT,"Billet Trésorerie","Avance sur marché";
        }
        field(12;"Date première échéance";Date)
        {
        }
        field(13;"Taux d'intérêt";Decimal)
        {
        }
        field(14;"Périodicité";DateFormula)
        {
        }
        field(15;"Compte crédit principal";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(16;"Compte Intérêt";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(17;"Compte Commission";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(18;"Compte TVA sur Commission";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(19;"Mensualité principal";Decimal)
        {
        }
        field(20;"Montant Commission";Decimal)
        {
        }
        field(21;"Montant TVA";Decimal)
        {
        }
        field(22;"Total Commission ligne Pai.";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(CREDIT BANC INT),
                                                           Crédit Bancaire=FIELD(No.),
                                                           Account No.=FIELD(Compte Commission)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(23;"Total TVA comm. ligne Paiement";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (Payment Class=FILTER(CREDIT BANC INT),
                                                           Crédit Bancaire=FIELD(No.),
                                                           Account No.=FIELD(Compte TVA sur Commission)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }
}

