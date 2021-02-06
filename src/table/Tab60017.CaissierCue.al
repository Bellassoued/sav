table 60017 "Caissier Cue"
{

    fields
    {
        field(1;"Primary Key";Code[10])
        {
            CaptionML = ENU='Primary Key',
                        FRA='Clé primaire';
        }
        field(2;"Solde encaissement";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Type_ED=CONST(Encaissement),
                                                                   Copied To No.=FILTER(' ')));
            FieldClass = FlowField;
        }
        field(3;"Solde décaissement";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Type_ED=CONST(Décaissement),
                                                                   Copied To No.=FILTER(' ')));
            FieldClass = FlowField;
        }
        field(4;"Caisse Recettes";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Type Règlement=FILTER(ESPÉCE),
                                                                   Type_ED=FILTER(Encaissement),
                                                                   En Banque=FILTER(No)));
            FieldClass = FlowField;
        }
        field(5;"Caisse Dépenses";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Type Règlement=FILTER(ESPÉCE),
                                                                   Type_ED=FILTER(Décaissement),
                                                                   En Banque=FILTER(No)));
            FieldClass = FlowField;
        }
        field(6;"Solde chèques en coffre";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Payment Class=FILTER(ENC-CHQ),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(20000),
                                                                    Coffre=FIELD(FiltreCoffre)));
            FieldClass = FlowField;
        }
        field(7;"Nombre chèques en coffre";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Payment Class=FILTER(ENC-CHQ),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(20000),
                                                      Coffre=FIELD(FiltreCoffre)));
            FieldClass = FlowField;
        }
        field(8;"Solde effets en coffre";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Type Règlement=FILTER(TRAITE),
                                                                    Copied To No.=FILTER(''),
                                                                    Status No.=FILTER(20000),
                                                                    Coffre=FIELD(FiltreCoffre)));
            FieldClass = FlowField;
        }
        field(9;"Nombre effets en coffre";Integer)
        {
            CalcFormula = Count("Payment Line" WHERE (Type Règlement=FILTER(TRAITE),
                                                      Copied To No.=FILTER(''),
                                                      Status No.=FILTER(20000),
                                                      Coffre=FIELD(FiltreCoffre)));
            FieldClass = FlowField;
        }
        field(10;"Versement chèques";Decimal)
        {
            CalcFormula = -Sum("Payment Line"."Amount (LCY)" WHERE (Type Règlement=FILTER(CHÈQUE),
                                                                    Posting Date=FIELD(DateFilter),
                                                                    Coffre=FIELD(FiltreCoffre),
                                                                    Status Name=FILTER(BORDEREAU DE REMISE/DECHARGE RECUE)));
            FieldClass = FlowField;
        }
        field(11;"Versement effets";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Type Règlement=FILTER(TRAITE),
                                                                   En Banque=FILTER(Yes),
                                                                   Posting Date=FIELD(DateFilter),
                                                                   Coffre=FIELD(FiltreCoffre)));
            FieldClass = FlowField;
        }
        field(12;"Versement espèce";Decimal)
        {
            CalcFormula = Sum("Payment Line"."Amount (LCY)" WHERE (Type Règlement=FILTER(ESPÈCE),
                                                                   En Banque=FILTER(Yes),
                                                                   Posting Date=FIELD(DateFilter),
                                                                   Coffre=FIELD(FiltreCoffre)));
            FieldClass = FlowField;
        }
        field(13;DateFilter;Date)
        {
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(14;FiltreCoffre;Text[30])
        {
            FieldClass = FlowFilter;
        }
        field(15;"Carte Grise Envoyé";Integer)
        {
            CalcFormula = Count("Carte Grise Entete" WHERE (Statut=CONST(Envoyé)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
}

