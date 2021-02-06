table 50038 "Ligne Option"
{
    // version CT16V002,VNF001


    fields
    {
        field(2;"Code";Code[20])
        {
        }
        field(3;"Internal Code";Code[20])
        {
            TableRelation = Option;

            trigger OnValidate();
            var
                RecOption : Record "50041";
            begin
                //ADD EM 17022017
                RecOption.GET("Internal Code");
                Description := RecOption.Description;
            end;
        }
        field(4;"Option Type";Option)
        {
            OptionCaptionML = ENU='Option,Couleur,Garnissage',
                              FRA='Option,Couleur,Garniture';
            OptionMembers = Option,Couleur,Garnissage;
        }
        field(5;Description;Text[30])
        {
        }
        field(6;Description1;Text[30])
        {
        }
        field(7;"Prix Achat";Decimal)
        {
        }
        field(8;"Series Option";Boolean)
        {
            Caption = 'Option de série';
        }
        field(9;"Option Class";Option)
        {
            Caption = 'Classe option';
            OptionMembers = "Son et communication",Personalisation,"Sécurité et protection";
        }
        field(10;"Filtre Version";Code[20])
        {
            Description = 'SM VNF001';
            FieldClass = FlowFilter;
        }
        field(11;"Prix achat By Version";Decimal)
        {
            CalcFormula = Lookup("Prix option/version"."Prix Achat" WHERE (Code version=FIELD(Filtre Version),
                                                                           Code=FIELD(Internal Code)));
            Description = 'SM VNF001';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Code","Internal Code","Option Type")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Option : Record "50041";
}

