table 60081 "Entête Minoration"
{

    fields
    {
        field(1;"No. Expédition";Code[20])
        {

            trigger OnValidate();
            begin
                Désignation := 'Minoration pour EXPEDITION N° :' + "No. Expédition";
            end;
        }
        field(2;"Désignation";Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"No. Expédition")
        {
        }
    }

    fieldgroups
    {
    }
}

