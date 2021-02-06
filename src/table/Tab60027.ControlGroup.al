table 60027 "Control Group"
{
    // version Preparation VN


    fields
    {
        field(1;"Group No";Code[50])
        {
        }
        field(2;Description;Text[200])
        {
        }
        field(3;"Type Control";Option)
        {
            OptionMembers = " ","Réception VN","Réception VN inter Parc","Avant Livraison";
        }
    }

    keys
    {
        key(Key1;"Group No")
        {
        }
    }

    fieldgroups
    {
    }
}

