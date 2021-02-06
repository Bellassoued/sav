table 50016 "Detail Campgane/Clients"
{
    // version Chéque @ DATASOFT 2013


    fields
    {
        field(1;"No. Compagne";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Campaign;
        }
        field(2;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Groupe Compta. Client";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Posting Group";

            trigger OnValidate();
            begin
                IF "Groupe Compta. Client" <> '' THEN
                  BEGIN
                    CustomerPostingGroup.GET("Groupe Compta. Client");
                    Description := CustomerPostingGroup.Description;
                  END
                ELSE
                  Description := '';
            end;
        }
        field(4;Description;Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"No. Compagne","Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        ClientCompagnePromo.RESET;
        ClientCompagnePromo.SETRANGE("No. Compagne","No. Compagne");
        IF ClientCompagnePromo.FINDLAST THEN
          "Line No." := ClientCompagnePromo."Line No." + 10000
        ELSE
          "Line No." := 10000;
    end;

    var
        Text01 : Label 'Veuillez saisir une valeur correcte';
        Text02 : Label 'Vous ne pouvez pas supprimer cet enregistrement';
        ClientCompagnePromo : Record "50016";
        CustomerPostingGroup : Record "92";
}

