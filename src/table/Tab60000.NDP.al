table 60000 "NDP"
{
    // version RAD AUTO

    Caption = 'NDP';
    DrillDownPageID = 60000;
    LookupPageID = 60000;

    fields
    {
        field(1;"Code NDP";Code[20])
        {
            Caption = 'Code NDP';
        }
        field(2;"Désignation";Text[200])
        {
            Caption = 'Désignation';
        }
        field(3;Origine;Option)
        {
            OptionCaption = 'CE,HORS CE';
            OptionMembers = CE,"HORS CE";
        }
        field(4;Taxes;Integer)
        {
        }
        field(5;"Pièce";Integer)
        {
        }
        field(6;"Véhicules";Integer)
        {
        }
        field(7;"Complément";Text[50])
        {
        }
        field(8;"Code article";Code[20])
        {
        }
        field(9;QCS;Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Code NDP",Origine)
        {
        }
    }

    fieldgroups
    {
    }
}

