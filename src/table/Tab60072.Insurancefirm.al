table 60072 "Insurance firm"
{
    DrillDownPageID = 60198;
    LookupPageID = 60198;

    fields
    {
        field(1;"Code";Code[20])
        {
            CaptionML = ENU='Firm code',
                        FRA='Code client';
            TableRelation = Customer;

            trigger OnValidate();
            begin
                GRecCustomer.GET(Code);
                Description:=GRecCustomer.Name;
            end;
        }
        field(2;Description;Text[50])
        {
            CaptionML = ENU='Company name',
                        FRA='Nom société';
        }
        field(3;Blocked;Boolean)
        {
            CaptionML = ENU='Blocked',
                        FRA='Bloqué';
        }
        field(4;RC;Code[20])
        {
            Caption = 'Registre de commerce';
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

    var
        GRecCustomer : Record "18";
}

