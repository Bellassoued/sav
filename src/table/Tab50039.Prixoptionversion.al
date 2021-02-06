table 50039 "Prix option/version"
{
    // version CT16V002


    fields
    {
        field(2;"Code";Code[20])
        {
        }
        field(3;"Code version";Code[20])
        {
            TableRelation = "Version Article";
        }
        field(4;"Option Type";Option)
        {
            OptionCaption = 'Option,Couleur,Garniture';
            OptionMembers = Option,Couleur,Garniture;
        }
        field(5;Description;Text[250])
        {
        }
        field(6;Description1;Text[250])
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
        field(10;Groupement;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Code","Code version")
        {
        }
    }

    fieldgroups
    {
    }
}

