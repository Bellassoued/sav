table 50082 "Campagne"
{
    // version SAVCompagne


    fields
    {
        field(2;"Code";Code[20])
        {
            Description = 'NM191118';
        }
        field(3;"Date de lancement";Date)
        {
        }
        field(4;"Date de création";DateTime)
        {
            Editable = false;
        }
        field(5;"Créée par";Code[50])
        {
            Editable = false;
        }
        field(6;"Code marque";Option)
        {
            OptionCaptionML = ENU='TOYOTA,LEXUS',
                              FRA='TOYOTA';
            OptionMembers = TOYOTA,LEXUS;
        }
        field(9;"Type Compagne";Option)
        {
            OptionCaption = '" ,4KET,5KET,15OSD"';
            OptionMembers = " ","4KET","5KET","15OSD";

            trigger OnValidate();
            var
                TypeCompagne : Record "50084";
            begin
                //SM 250817
                IF "Type Compagne" <> "Type Compagne"::" " THEN BEGIN
                  TypeCompagne.GET("Type Compagne");
                  IF TypeCompagne.Blocage = TypeCompagne.Blocage::Oui THEN
                    Bloquant := TRUE;
                  IF TypeCompagne.Blocage = TypeCompagne.Blocage::Non THEN
                    Bloquant := FALSE;
                END;
                //END SM
            end;
        }
        field(10;Bloquant;Boolean)
        {

            trigger OnValidate();
            var
                TypeCompagne : Record "50084";
            begin
                //SM 250817
                TESTFIELD("Type Compagne");
                IF "Type Compagne" <> "Type Compagne"::" "  THEN BEGIN
                  TypeCompagne.GET("Type Compagne");
                  IF TypeCompagne.Blocage = TypeCompagne.Blocage::Oui THEN
                    TESTFIELD(Bloquant,TRUE);
                  IF TypeCompagne.Blocage = TypeCompagne.Blocage::Non THEN
                    TESTFIELD(Bloquant,FALSE);
                END;
                //END SM
            end;
        }
        field(11;"Nbre total VIN comapgne";Integer)
        {
            CalcFormula = Count("List VIN Compagne" WHERE (Code=FIELD(Code)));
            FieldClass = FlowField;
        }
        field(12;"Nbre VIN non traité";Integer)
        {
            CalcFormula = Count("List VIN Compagne" WHERE (Code=FIELD(Code),
                                                           Traiter=CONST(No)));
            FieldClass = FlowField;
        }
        field(13;Description;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        "Créée par":=USERID;
        "Date de création":=CURRENTDATETIME;
    end;
}

