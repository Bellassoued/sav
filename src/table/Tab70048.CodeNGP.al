table 70048 "Code NGP"
{
    DrillDownPageID = 70192;
    LookupPageID = 70192;

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;"Désignation";Text[250])
        {
        }
        field(3;"Controle Technique";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU=' ,PR,VN,Autre',
                              FRA=' ,PR,VN,Autre';
            OptionMembers = " ",PR,VN,Autre;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
    }

    fieldgroups
    {
    }
}

