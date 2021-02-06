table 60044 "Param. expiration réservat VN"
{

    fields
    {
        field(1;Emplacement;Code[20])
        {
            TableRelation = Bin.Code WHERE (Location Code=CONST(PARC - VN));
        }
        field(2;"Mode de règlement";Code[20])
        {
            TableRelation = "Type Paiement"."Code Type Paiement";
        }
        field(3;"Délais d'expiration";Integer)
        {
        }
        field(4;"Base de calcule";Option)
        {
            OptionCaption = 'Date Reservation,Date Réception prévue';
            OptionMembers = "Date Reservation","Date Réception prévue";
        }
    }

    keys
    {
        key(Key1;Emplacement,"Mode de règlement")
        {
        }
    }

    fieldgroups
    {
    }
}

