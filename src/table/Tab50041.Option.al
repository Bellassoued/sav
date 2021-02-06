table 50041 "Option"
{
    // version VNF001

    DrillDownPageID = 69093;
    LookupPageID = 69093;

    fields
    {
        field(1;"Code Option";Code[10])
        {
        }
        field(2;Description;Text[30])
        {
        }
        field(12;"Bi-ton";Boolean)
        {
            Description = 'SM VNF001';
        }
        field(13;"Annule Bi-ton";Boolean)
        {
            Description = 'SM VNF001';
        }
        field(14;Groupement;Boolean)
        {
            CalcFormula = Exist("Prix option/version" WHERE (Code=FIELD(Code Option),
                                                             Groupement=CONST(Yes)));
            Description = 'SM VNF001';
            FieldClass = FlowField;
        }
        field(15;Jante;Boolean)
        {
            Description = 'SM VNF001';
        }
    }

    keys
    {
        key(Key1;"Code Option")
        {
        }
    }

    fieldgroups
    {
    }

    procedure GetColorDescription(ParamColorCode : Code[20];ParamVersionCode : Code[20];ParamPerse : Code[20]) ColorDescription : Text[80];
    var
        RecLOption : Record "50041";
        RecLVersion : Record "50033";
        RecLPerse : Record "50034";
        RecLigneOptionPerse : Record "50038";
        RecLOptionBiton : Record "50041";
        CouleurArticle : Record "50035";
        DescriptColour : Text;
        OptionBitonExiste : Boolean;
    begin

        CouleurArticle.GET(ParamColorCode);

        //RecLOption.GET(ParamColorCode);

        IF CouleurArticle.Description <> '' THEN
          DescriptColour := CouleurArticle.Description;
        //ELSE
          //DescriptColour := RecLOption.Description;

        IF NOT RecLVersion.GET(ParamVersionCode) THEN BEGIN
           RecLVersion."Code version" := ParamVersionCode;
           RecLVersion.INSERT;
        END;

        //RecLPerse.GET(ParamPerse);
        RecLigneOptionPerse.RESET;
        RecLigneOptionPerse.SETRANGE(Code,RecLPerse."Code Perse");
        IF RecLigneOptionPerse.FINDSET THEN BEGIN
          ColorDescription := DescriptColour;

          BEGIN
            OptionBitonExiste := FALSE;

            REPEAT
              IF RecLOptionBiton.GET(RecLigneOptionPerse."Internal Code") THEN  BEGIN
                IF RecLOptionBiton."Bi-ton" THEN BEGIN
                   ColorDescription += '/'+RecLOptionBiton.Description;
                   OptionBitonExiste := TRUE;
                END ELSE IF RecLOptionBiton."Annule Bi-ton" THEN BEGIN
                    ColorDescription := DescriptColour;
                END;

              END;
            UNTIL RecLigneOptionPerse.NEXT = 0;

            IF NOT OptionBitonExiste THEN BEGIN
               IF RecLVersion.Biton THEN
                 ColorDescription := DescriptColour+'/'+RecLVersion."Biton Par Défaut";
            END;

            RecLigneOptionPerse.FINDSET;

            REPEAT
              IF RecLOptionBiton.GET(RecLigneOptionPerse."Internal Code") THEN
                IF RecLOptionBiton.Jante THEN
                   ColorDescription += '/'+RecLOptionBiton.Description;
            UNTIL RecLigneOptionPerse.NEXT = 0;

          END;
          END ELSE BEGIN
            ColorDescription := DescriptColour;
        END;

        EXIT(ColorDescription);
    end;
}

