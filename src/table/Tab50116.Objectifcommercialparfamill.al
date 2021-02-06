table 50116 "Objectif commercial par famill"
{

    fields
    {
        field(1;Ligne;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Année";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Mois;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Janvier,"Février",Mars,Avril,Mai,Juin,Juillet,Aout,Septembre,Ocobre,Novembre,"Décembre";
        }
        field(4;"Code vendeur";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Salesperson/Purchaser;
        }
        field(5;"Famille commerciale";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Familles commerciales";
        }
        field(6;Objectif;Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Ligne)
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    var
        Objectifcommercialparfamill : Record "50116";
    begin
        Objectifcommercialparfamill.RESET;
        IF Objectifcommercialparfamill.FINDLAST THEN
          Ligne:=Objectifcommercialparfamill.Ligne+10000
        ELSE
          Ligne:=10000;
    end;
}

