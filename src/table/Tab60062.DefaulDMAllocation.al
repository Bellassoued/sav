table 60062 "Defaul DM Allocation"
{
    // version DM


    fields
    {
        field(1;"Table ID";Integer)
        {
            CaptionML = ENU='Table ID',
                        FRA='ID table';
            Editable = false;
            NotBlank = true;
            TableRelation = Object.ID WHERE (Type=CONST(Table));

            trigger OnLookup();
            var
                TempObject : Record "2000000058" temporary;
            begin
                CLEAR(TempObject);
                //ZMN MIG DimMgt.SetupObjectNoList(TempObject);
                IF PAGE.RUNMODAL(358,TempObject) = ACTION::LookupOK THEN BEGIN
                  "Table ID" := TempObject."Object ID";
                  VALIDATE("Table ID");
                END;
            end;

            trigger OnValidate();
            var
                TempObject : Record "2000000058" temporary;
            begin
                CALCFIELDS("Table Caption");
                //ZMN MIG DimMgt.SetupObjectNoList(TempObject);
                TempObject."Object Type" := TempObject."Object Type"::Table;
                TempObject."Object ID":= "Table ID";
                IF NOT TempObject.FIND THEN
                  FIELDERROR("Table ID");
            end;
        }
        field(2;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            Editable = false;
            TableRelation = IF (Table ID=CONST(13)) Salesperson/Purchaser
                            ELSE IF (Table ID=CONST(15)) "G/L Account"
                            ELSE IF (Table ID=CONST(18)) Customer
                            ELSE IF (Table ID=CONST(23)) Vendor
                            ELSE IF (Table ID=CONST(27)) Item
                            ELSE IF (Table ID=CONST(152)) "Resource Group"
                            ELSE IF (Table ID=CONST(156)) Resource
                            ELSE IF (Table ID=CONST(167)) Job
                            ELSE IF (Table ID=CONST(270)) "Bank Account"
                            ELSE IF (Table ID=CONST(413)) "IC Partner"
                            ELSE IF (Table ID=CONST(5071)) Campaign
                            ELSE IF (Table ID=CONST(5200)) Employee
                            ELSE IF (Table ID=CONST(5600)) "Fixed Asset"
                            ELSE IF (Table ID=CONST(5628)) Insurance
                            ELSE IF (Table ID=CONST(5903)) "Service Order Type"
                            ELSE IF (Table ID=CONST(5904)) "Service Item Group"
                            ELSE IF (Table ID=CONST(5940)) "Service Item"
                            ELSE IF (Table ID=CONST(5714)) "Responsibility Center"
                            ELSE IF (Table ID=CONST(5800)) "Item Charge"
                            ELSE IF (Table ID=CONST(99000754)) "Work Center"
                            ELSE IF (Table ID=CONST(5965)) "Service Contract Header"
                            ELSE IF (Table ID=CONST(5105)) "Customer Template";
        }
        field(6;"Table Caption";Text[250])
        {
            CalcFormula = Lookup(AllObjWithCaption."Object Caption" WHERE (Object Type=CONST(Table),
                                                                           Object ID=FIELD(Table ID)));
            CaptionML = ENU='Table Caption',
                        FRA='Légende table';
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"Axes Principal 1";Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));
        }
        field(9;"Type Répartition";Option)
        {
            OptionCaption = '" ,Petite dépense,Comptabilité"';
            OptionMembers = " ","Petite dépense","Comptabilité";
        }
        field(10;"Code Règle";Code[20])
        {
            TableRelation = "Entête Règle Répartion Ana.";
        }
    }

    keys
    {
        key(Key1;"Table ID","No.","Axes Principal 1","Type Répartition")
        {
        }
    }

    fieldgroups
    {
    }

    var
        GLSetup : Record "98";
        DimMgt : Codeunit "408";
}

