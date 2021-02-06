table 60068 "Ligne Réparation Grand Service"
{
    // version MAZDA1004


    fields
    {
        field(1;"Reparation No";Code[20])
        {
        }
        field(2;"Num ligne";Integer)
        {
        }
        field(3;"Code Zone panne";Code[20])
        {
            TableRelation = "Fault Area";
        }
        field(4;"Code Symptome";Code[20])
        {
            TableRelation = "Symptom Code";

            trigger OnValidate();
            var
                RecCodeSymptome : Record "5916";
            begin
                 IF RecCodeSymptome.GET("Code Symptome") THEN
                    "Description symptome":=RecCodeSymptome.Description;
            end;
        }
        field(5;"Description symptome";Text[50])
        {
        }
        field(6;"Description Zone";Text[50])
        {
            CalcFormula = Lookup("Fault Area".Description WHERE (Code=FIELD(Code Zone panne)));
            Description = 'SM';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Reparation No","Num ligne")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        DemandeRepVehParc.GET("Reparation No");
        IF DemandeRepVehParc."Operation Type" <> DemandeRepVehParc."Operation Type"::"Grands Travaux" THEN
          ERROR(TXT50000,DemandeRepVehParc."No.");

        "Num ligne":= 10000;
         Rec2 := Rec;
         Rec2.SETRECFILTER;
         IF Rec2.FINDLAST() THEN
         BEGIN
             Rec2.SETRANGE("Num ligne");
             IF Rec2.FINDLAST THEN
             BEGIN
               "Num ligne" := Rec2."Num ligne" + 10000;
             END;
         END;
    end;

    var
        Rec2 : Record "60068";
        DemandeRepVehParc : Record "60067";
        TXT50000 : Label 'Type Opération doite être grand réparation dans la demande N° %1';
}

