table 60021 "Coffre"
{
    DrillDownPageID = 60119;
    LookupPageID = 60119;

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;"Désignation";Text[250])
        {
        }
        field(3;"Centre de Gestion";Code[20])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(4;"Activité";Option)
        {
            OptionCaptionML = ENU=' ,VN,PR,SAV,Chrono',
                              FRA=' ,VN,PR,SAV,Chrono,AssM1,AssM2,AssM3';
            OptionMembers = " ",VN,PR,SAV,Chrono,AssM1,AssM2,AssM3;
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
        fieldgroup(DropDown;"Code","Désignation")
        {
        }
    }
}

