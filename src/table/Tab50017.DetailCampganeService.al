table 50017 "Detail Campgane/Service"
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
        field(3;"Code Nomenclature";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Rapid service BOM Header";

            trigger OnValidate();
            begin
                IF "Code Nomenclature" <> '' THEN
                  BEGIN
                    RapidserviceBOMHeader.GET("Code Nomenclature");
                    Description := RapidserviceBOMHeader.Description;
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
        field(5;"Product Code";Code[10])
        {
            DataClassification = ToBeClassified;
            Description = 'KK_1501020';
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
        NomoclatureServiceCompPromo.RESET;
        NomoclatureServiceCompPromo.SETRANGE("No. Compagne","No. Compagne");
        IF NomoclatureServiceCompPromo.FINDLAST THEN
          "Line No." := NomoclatureServiceCompPromo."Line No." + 10000
        ELSE
          "Line No." := 10000;
    end;

    var
        NomoclatureServiceCompPromo : Record "50017";
        RapidserviceBOMHeader : Record "60013";
}

