table 60022 "Type Paiement"
{
    DrillDownPageID = 60077;
    LookupPageID = 60077;

    fields
    {
        field(1;"Code Type Paiement";Code[10])
        {
        }
        field(2;"Désignation Type Paiement";Text[50])
        {
        }
        field(3;"Complément Immatriculation";Decimal)
        {
        }
        field(4;Type;Option)
        {
            Description = '// ADD GMED 180414 --> Type de paiement : leasing, crédit, bank';
            OptionMembers = " ",Comptant,"Crédit bancaires",Leasing;
        }
        field(5;Banque;Boolean)
        {
        }
        field(6;"Validité de réservation";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 03012018';
        }
        field(7;"Avec Contract";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code Type Paiement")
        {
        }
        key(Key2;"Désignation Type Paiement")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(KeyGroupe1;"Code Type Paiement","Désignation Type Paiement")
        {
        }
    }
}

