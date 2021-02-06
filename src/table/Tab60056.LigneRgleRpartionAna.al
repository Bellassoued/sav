table 60056 "Ligne Règle Répartion Ana."
{
    // version DM V1


    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;"Line No";Integer)
        {
            Caption = 'No. Ligne';
        }
        field(6;Percent;Decimal)
        {
            Caption = 'Pourcentage';
            DecimalPlaces = 0:2;
            MaxValue = 100;
            MinValue = 1;
        }
        field(216;"Dimension Code";Code[20])
        {
            CaptionML = ENU='Dimension Code',
                        FRA='Code axe';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(217;"Dimension Value Code";Code[20])
        {
            CaptionML = ENU='Dimension Value Code',
                        FRA='Code section axe';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FIELD(Dimension Code));
        }
        field(218;"Dimension Name";Text[30])
        {
            CalcFormula = Lookup(Dimension.Name WHERE (Code=FIELD(Dimension Code)));
            CaptionML = ENU='Dimension Name',
                        FRA='Nom axe analytique';
            Editable = false;
            FieldClass = FlowField;
        }
        field(219;"Dimension Value Name";Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE (Dimension Code=FIELD(Dimension Code),
                                                               Code=FIELD(Dimension Value Code)));
            CaptionML = ENU='Dimension Value Name',
                        FRA='Nom de la section analytique axe';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Code","Line No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        EntêteRègle.GET(Code);
        EntêteRègle.TESTFIELD(Statut,EntêteRègle.Statut::"En Attente");
    end;

    trigger OnInsert();
    begin
        EntêteRègle.GET(Code);
        EntêteRègle.TESTFIELD(Statut,EntêteRègle.Statut::"En Attente");
    end;

    trigger OnModify();
    begin
        EntêteRègle.GET(Code);
        EntêteRègle.TESTFIELD(Statut,EntêteRègle.Statut::"En Attente");
    end;

    trigger OnRename();
    begin
        EntêteRègle.GET(Code);
        EntêteRègle.TESTFIELD(Statut,EntêteRègle.Statut::"En Attente");
    end;

    var
        "EntêteRègle" : Record "60055";
}

