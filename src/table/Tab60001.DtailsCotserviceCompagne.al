table 60001 "Détails Coût service/Compagne"
{
    // version RAD AUTO


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
        field(3;"Code Coût service";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Service Cost";

            trigger OnValidate();
            begin
                IF "Code Coût service" <> '' THEN
                  BEGIN
                    ServiceCost.GET("Code Coût service");
                    Description := ServiceCost.Description;
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
        field(50011;"Famille MO";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'KK_151020';
            TableRelation = "Famille MO".Nom;
        }
        field(50012;"Sous Famille MO";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'KK_151020';
            TableRelation = "Sous Famille MO".Nom WHERE (Famille MO=FIELD(Famille MO));
        }
        field(50013;Operation;Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'KK_151020';
            TableRelation = "Operation MO".Nom WHERE (Sous Famille MO=FIELD(Sous Famille MO));
        }
    }

    keys
    {
        key(Key1;"No. Compagne","Line No.","Code Coût service")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        DetailsCoutserviceCompagne.RESET;
        DetailsCoutserviceCompagne.SETRANGE("No. Compagne","No. Compagne");
        IF DetailsCoutserviceCompagne.FINDLAST THEN
          "Line No." := DetailsCoutserviceCompagne."Line No." + 10000
        ELSE
          "Line No." := 10000;
    end;

    var
        DetailsCoutserviceCompagne : Record "60001";
        ServiceCost : Record "5905";
}

