table 50083 "Ligne article campagne"
{
    // version SAVCompagne


    fields
    {
        field(1;"Code";Code[20])
        {
            Description = 'NM191118';
            TableRelation = Campagne.Code;
        }
        field(2;"Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° Ligne';
        }
        field(4;"No.";Code[20])
        {
            TableRelation = IF (Type=CONST(Item)) Item.No.
                            ELSE IF (Type=CONST(Cost)) "Service Cost".Code
                            ELSE IF (Type=CONST(Resource)) Resource.No.;

            trigger OnValidate();
            var
                ServCost : Record "5905";
                Item : Record "27";
                Res : Record "156";
            begin
                //SM 290817
                CASE Type OF
                   Type::" ":
                    BEGIN
                      ServCost.GET("No.");
                      Description := ServCost.Description;
                      "Base Unit of Measure":=ServCost."Unit of Measure Code";
                    END;
                  Type::Item:
                    BEGIN
                      Item.GET("No.");
                      Description := Item.Description;
                      "Base Unit of Measure":=Item."Base Unit of Measure";
                    END;
                  Type::Resource:
                    BEGIN
                     Res.GET("No.");
                     Description := Res.Name;
                     "Base Unit of Measure":=Res."Base Unit of Measure";
                    END;
                END;
                //END SM
            end;
        }
        field(5;Description;Text[100])
        {
        }
        field(6;"Quantité";Decimal)
        {
        }
        field(7;"Creation Date";DateTime)
        {
        }
        field(8;"Créée par";Code[50])
        {
        }
        field(9;Type;Option)
        {
            OptionCaptionML = ENU=' ,Item,Resource,Cost,G/L Account',
                              FRA=' ,Article,Sous-traitance,MO,Compte général';
            OptionMembers = " ",Item,Resource,Cost,"G/L Account";
        }
        field(10;"Base Unit of Measure";Code[10])
        {
            CaptionML = ENU='Base Unit of Measure',
                        FRA='Unité de base';
            ValidateTableRelation = false;

            trigger OnValidate();
            var
                UnitOfMeasure : Record "204";
            begin
                /*IF "Base Unit of Measure" <> xRec."Base Unit of Measure" THEN BEGIN
                  TestNoOpenEntriesExist(FIELDCAPTION("Base Unit of Measure"));
                
                  "Sales Unit of Measure" := "Base Unit of Measure";
                  "Purch. Unit of Measure" := "Base Unit of Measure";
                  IF "Base Unit of Measure" <> '' THEN BEGIN
                    UnitOfMeasure.GET("Base Unit of Measure");
                
                    IF NOT ItemUnitOfMeasure.GET("No.","Base Unit of Measure") THEN BEGIN
                      ItemUnitOfMeasure.INIT;
                      ItemUnitOfMeasure.VALIDATE("Item No.","No.");
                      ItemUnitOfMeasure.VALIDATE(Code,"Base Unit of Measure");
                      ItemUnitOfMeasure."Qty. per Unit of Measure" := 1;
                      ItemUnitOfMeasure.INSERT;
                    END ELSE BEGIN
                      IF ItemUnitOfMeasure."Qty. per Unit of Measure" <> 1 THEN
                        ERROR(STRSUBSTNO(BaseUnitOfMeasureQtyMustBeOneErr,"Base Unit of Measure",ItemUnitOfMeasure."Qty. per Unit of Measure"));
                    END;
                  END;
                END;*/

            end;
        }
    }

    keys
    {
        key(Key1;"Code","Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    var
        LIntLineNo : Integer;
    begin
        LIntLineNo:=10000;
        "Creation Date":=CURRENTDATETIME;
        "Créée par":=USERID;
        GRecLignearticlecampagne.RESET;
        GRecLignearticlecampagne.SETRANGE(Code,Code);
        IF GRecLignearticlecampagne.FINDLAST THEN
          LIntLineNo+=GRecLignearticlecampagne."Line No.";
        "Line No.":=LIntLineNo;
    end;

    var
        GRecLignearticlecampagne : Record "50083";
}

