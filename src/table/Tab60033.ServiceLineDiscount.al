table 60033 "Service Line Discount"
{
    // version NAVW17.10

    CaptionML = ENU='Sales Line Discount',
                FRA='Remise ligne vente';
    LookupPageID = 7004;

    fields
    {
        field(1;"Code";Code[20])
        {
            CaptionML = ENU='Code',
                        FRA='Code';
            NotBlank = true;
            TableRelation = IF (Type=CONST(Service)) "Service Cost".Code
                            ELSE IF (Type=CONST(Service Disc. Group)) "Groupe Tarif MO".Code;

            trigger OnValidate();
            var
                Item : Record "27";
            begin
                IF xRec.Code <> Code THEN BEGIN
                  "Unit of Measure Code" := '';
                  "Variant Code" := '';

                  IF Type = Type::Service THEN
                    IF ServiceCost.GET(Code) THEN
                      "Unit of Measure Code" := ServiceCost."Unit of Measure Code"
                END;
            end;
        }
        field(2;"Sales Code";Code[20])
        {
            CaptionML = ENU='Sales Code',
                        FRA='Code vente';
            TableRelation = IF (Sales Type=CONST(Customer Disc. Group)) "Customer Discount Group MO"
                            ELSE IF (Sales Type=CONST(Customer)) Customer
                            ELSE IF (Sales Type=CONST(Campaign)) Campaign;

            trigger OnValidate();
            begin
                IF "Sales Code" <> '' THEN
                  CASE "Sales Type" OF
                    "Sales Type"::"All Customers":
                      ERROR(Text001,FIELDCAPTION("Sales Code"));
                    "Sales Type"::Campaign:
                      BEGIN
                        Campaign.GET("Sales Code");
                        "Starting Date" := Campaign."Starting Date";
                        "Ending Date" := Campaign."Ending Date";
                      END;
                  END;
            end;
        }
        field(3;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            TableRelation = Currency;
        }
        field(4;"Starting Date";Date)
        {
            CaptionML = ENU='Starting Date',
                        FRA='Date début';

            trigger OnValidate();
            begin
                IF ("Starting Date" > "Ending Date") AND ("Ending Date" <> 0D) THEN
                  ERROR(Text000,FIELDCAPTION("Starting Date"),FIELDCAPTION("Ending Date"));

                IF CurrFieldNo = 0 THEN
                  EXIT;
                IF "Sales Type" = "Sales Type"::Campaign THEN
                  ERROR(Text003,FIELDCAPTION("Starting Date"),FIELDCAPTION("Ending Date"),FIELDCAPTION("Sales Type"),"Sales Type");
            end;
        }
        field(5;"Line Discount %";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Line Discount %',
                        FRA='% remise ligne';
            MaxValue = 100;
            MinValue = 0;
        }
        field(13;"Sales Type";Option)
        {
            CaptionML = ENU='Sales Type',
                        FRA='Type vente';
            OptionCaptionML = ENU='Customer,Customer Disc. Group,All Customers,Campaign',
                              FRA='Client,Groupe remises client,Tous les clients,Campagne';
            OptionMembers = Customer,"Customer Disc. Group","All Customers",Campaign;

            trigger OnValidate();
            begin
                IF "Sales Type" <> xRec."Sales Type" THEN
                  VALIDATE("Sales Code",'');
            end;
        }
        field(14;"Minimum Quantity";Decimal)
        {
            CaptionML = ENU='Minimum Quantity',
                        FRA='Quantité minimum';
            MinValue = 0;
        }
        field(15;"Ending Date";Date)
        {
            CaptionML = ENU='Ending Date',
                        FRA='Date fin';

            trigger OnValidate();
            begin
                VALIDATE("Starting Date");

                IF CurrFieldNo = 0 THEN
                  EXIT;
                IF "Sales Type" = "Sales Type"::Campaign THEN
                  ERROR(Text003,FIELDCAPTION("Starting Date"),FIELDCAPTION("Ending Date"),FIELDCAPTION("Sales Type"),"Sales Type");
            end;
        }
        field(21;Type;Option)
        {
            CaptionML = ENU='Type',
                        FRA='Type';
            OptionCaptionML = ENU='Service,Service Disc. Group',
                              FRA='Service,Groupe rem. service';
            OptionMembers = Service,"Service Disc. Group";

            trigger OnValidate();
            begin
                IF xRec.Type <> Type THEN
                  VALIDATE(Code,'');
            end;
        }
        field(5400;"Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Unit of Measure Code',
                        FRA='Code unité';

            trigger OnValidate();
            begin
                TESTFIELD(Type,Type::Service);
            end;
        }
        field(5700;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code',
                        FRA='Code variante';

            trigger OnValidate();
            begin
                //TESTFIELD(Type,Type::Item);
            end;
        }
        field(5701;"Unit Price";Decimal)
        {
            Caption = 'Prix Unitaire';
            Description = 'SM020717';
        }
    }

    keys
    {
        key(Key1;Type,"Code","Sales Type","Sales Code","Starting Date","Currency Code","Variant Code","Unit of Measure Code","Minimum Quantity")
        {
        }
        key(Key2;"Sales Type","Sales Code",Type,"Code","Starting Date","Currency Code","Variant Code","Unit of Measure Code","Minimum Quantity")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        IF "Sales Type" = "Sales Type"::"All Customers" THEN
          "Sales Code" := ''
        ELSE
          TESTFIELD("Sales Code");
        TESTFIELD(Code);
    end;

    trigger OnRename();
    begin
        IF "Sales Type" <> "Sales Type"::"All Customers" THEN
          TESTFIELD("Sales Code");
        TESTFIELD(Code);
    end;

    var
        Text000 : TextConst ENU='%1 cannot be after %2',FRA='%1 ne peut pas être postérieur(e) à %2';
        Text001 : TextConst ENU='%1 must be blank.',FRA='%1 doit être blanc.';
        Campaign : Record "5071";
        Text003 : TextConst ENU='You can only change the %1 and %2 from the Campaign Card when %3 = %4.',FRA='Vous ne pouvez modifier les valeurs %1 et %2 des champs de la fiche campagne que lorsque %3 = %4.';
        ServiceCost : Record "5905";
}

