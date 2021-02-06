table 60039 "Mise à jour axe analytique Cli"
{

    fields
    {
        field(1;"Table ID";Integer)
        {
            CaptionML = ENU='Table ID',
                        FRA='ID table';
            Editable = true;
            NotBlank = true;

            trigger OnLookup();
            var
                TempObject : Record "2000000001" temporary;
            begin
            end;

            trigger OnValidate();
            var
                TempObject : Record "2000000001" temporary;
            begin
            end;
        }
        field(2;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            Editable = true;
        }
        field(3;"Dimension Code";Code[20])
        {
            CaptionML = ENU='Dimension Code',
                        FRA='Code axe';
            NotBlank = true;
            TableRelation = Dimension;
        }
        field(4;"Dimension Value Code";Code[20])
        {
            CaptionML = ENU='Dimension Value Code',
                        FRA='Code section';
        }
        field(5;"Value Posting";Option)
        {
            CaptionML = ENU='Value Posting',
                        FRA='Contrôle validation';
            OptionCaptionML = ENU=' ,Code Mandatory,Same Code,No Code',
                              FRA=' ,Code obligatoire,Même code,Pas de code';
            OptionMembers = " ","Code Mandatory","Same Code","No Code";
        }
        field(6;"Table Caption";Text[250])
        {
            CaptionML = ENU='Table Caption',
                        FRA='Légende table';
            Editable = true;
        }
        field(7;"Multi Selection Action";Option)
        {
            CaptionML = ENU='Multi Selection Action',
                        FRA='Action multi-sélection';
            OptionCaptionML = ENU=' ,Change,Delete',
                              FRA=' ,Modifie,Supprime';
            OptionMembers = " ",Change,Delete;
        }
    }

    keys
    {
        key(Key1;"Table ID","No.","Dimension Code","Dimension Value Code")
        {
        }
    }

    fieldgroups
    {
    }
}

