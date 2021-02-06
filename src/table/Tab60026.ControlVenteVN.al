table 60026 "Control Vente VN"
{
    // version Preparation VN


    fields
    {
        field(1;"Document No";Code[20])
        {
        }
        field(2;"Line No";Integer)
        {
        }
        field(3;"Date de Creation";Date)
        {
        }
        field(4;"Cree par";Code[50])
        {
        }
        field(5;Group;Code[50])
        {
        }
        field(6;"Type Control";Option)
        {
            OptionMembers = " ","Réception VN","Réception VN inter Parc","Avant Livraison","Réception SAV";
        }
        field(7;Description;Text[250])
        {
        }
        field(8;Oui;Boolean)
        {
        }
        field(9;Non;Boolean)
        {
        }
        field(10;NA;Boolean)
        {
        }
        field(11;Titre;Boolean)
        {
        }
        field(12;"Titre Principale";Boolean)
        {
        }
        field(14;ShowDetail;Boolean)
        {
        }
        field(15;Correctif;Text[50])
        {
        }
        field(16;Pilot;Text[30])
        {
        }
        field(17;"Détails";Text[30])
        {
        }
        field(18;"No Chassis";Code[50])
        {
        }
        field(19;Valider;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Document No","No Chassis","Type Control","Line No")
        {
        }
    }

    fieldgroups
    {
    }
}

