table 60014 "Rapide service BOM Line"
{
    // version NAVW17.10

    CaptionML = ENU='Production BOM Line',
                FRA='Ligne nomenclature production';

    fields
    {
        field(1;"Rapid Service BOM No.";Code[30])
        {
            CaptionML = ENU='Production BOM No.',
                        FRA='N° nomenclature production';
            Description = 'NM190419';
            NotBlank = true;
            TableRelation = "Rapid service BOM Header";
        }
        field(2;"Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne';
        }
        field(10;Type;Option)
        {
            CaptionML = ENU='Type',
                        FRA='Type';
            OptionCaptionML = ENU='Item,Cost',
                              FRA='Article,Coût';
            OptionMembers = Item,Cost;

            trigger OnValidate();
            var
                WhseValidateSourceLine : Codeunit "5777";
            begin
            end;
        }
        field(11;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            TableRelation = IF (Type=CONST(Item)) Item WHERE (Type=CONST(Inventory))
                            ELSE IF (Type=CONST(Cost)) "Service Cost";

            trigger OnValidate();
            var
                WhseValidateSourceLine : Codeunit "5777";
                LRecBOMComponent : Record "60014";
            begin
                //KT
                /* TMP Sugg Marouen 170619
                LRecBOMComponent.RESET;
                LRecBOMComponent.SETRANGE("Rapid Service BOM No.","Rapid Service BOM No.");
                LRecBOMComponent.SETRANGE("No.","No.");
                LRecBOMComponent.SETFILTER("Line No.",'<>%1',"Line No.");
                IF LRecBOMComponent.FINDFIRST THEN
                  ERROR('Le composant de type %1 N° %2 est déjà mentionné',Type,"No.");
                */
                //END KT
                 IF Type=Type::Item THEN
                 BEGIN
                     RecItem.GET("No.");
                     IF RecItem.Description <> '' THEN
                       Description :=  RecItem.Description
                     ELSE
                       Description :=  RecItem."Description 2";
                     "Unit of Measure Code" := RecItem."Base Unit of Measure";
                      Prix:= RecItem."Unit Price";
                 END
                 ELSE
                 BEGIN
                     RecServicesCost.GET("No.");
                     Description :=  RecServicesCost.Description;
                     "Unit of Measure Code" := RecServicesCost."Unit of Measure Code";
                     Prix:=RecServicesCost."Default Unit Price";
                
                 END;

            end;
        }
        field(12;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';
        }
        field(13;"Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Unit of Measure Code',
                        FRA='Code unité';
            TableRelation = IF (Type=CONST(Item)) "Item Unit of Measure".Code WHERE (Item No.=FIELD(No.));

            trigger OnValidate();
            begin
                //TESTFIELD("No.");
            end;
        }
        field(14;Quantity;Decimal)
        {
            CaptionML = ENU='Quantity',
                        FRA='Quantité';
            DecimalPlaces = 0:5;
            Editable = true;
        }
        field(21;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code variante';
            TableRelation = IF (Type=CONST(Item)) "Item Variant".Code WHERE (Item No.=FIELD(No.));

            trigger OnValidate();
            begin
                /*
                IF "Variant Code" = '' THEN
                  EXIT;
                TESTFIELD("No.");
                ItemVariant.GET("No.","Variant Code");
                Description := ItemVariant.Description;
                */

            end;
        }
        field(22;Prix;Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate();
            begin

                    IF Type = Type::Item THEN
                      REPEAT
                    RecItem.RESET;
                    RecItem.SETRANGE("No.","No.");
                    Prix := RecItem."Unit Price";
                      UNTIL RecItem.NEXT = 0;
                    IF Type = Type::Cost THEN
                      REPEAT
                     RecServicesCost.RESET;
                     RecServicesCost.SETRANGE(Code,"No.");
                     Prix:= RecServicesCost."Default Unit Cost";
                      UNTIL RecServicesCost.NEXT = 0;
            end;
        }
        field(50000;"Remplacé par";Code[20])
        {
            CalcFormula = Lookup(Item."Alternative Item No." WHERE (No.=FIELD(No.)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Rapid Service BOM No.","Line No.")
        {
        }
        key(Key2;Type,"No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        ProdBOMComment : Record "99000776";
        PlanningAssignment : Record "99000850";
    begin
    end;

    trigger OnInsert();
    begin
        TestStatus;
    end;

    var
        Text000 : TextConst ENU='%1 must be later than %2.',FRA='%1 doit être postérieur(e) à %2.';
        RecItem : Record "27";
        ProdBOMHeader : Record "99000771";
        ItemVariant : Record "5401";
        RecServicesCost : Record "5905";

    procedure TestStatus();
    var
        ProdBOMVersion : Record "99000779";
    begin
    end;

    procedure GetQtyPerUnitOfMeasure() : Decimal;
    var
        Item : Record "27";
        UOMMgt : Codeunit "5402";
    begin
    end;
}

