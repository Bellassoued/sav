table 60061 "Default DM Dimension"
{
    // version DM

    CaptionML = ENU='Default Dimension',
                FRA='Affectation analytique';

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
                  "Table ID" := TempObject."Object ID" ;
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
                TempObject."Object ID" := "Table ID";
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
        field(3;"Dimension Code";Code[20])
        {
            CaptionML = ENU='Dimension Code',
                        FRA='Code axe';
            NotBlank = true;
            TableRelation = Dimension;

            trigger OnValidate();
            begin
                IF NOT DimMgt.CheckDim("Dimension Code") THEN
                  ERROR(DimMgt.GetDimErr);
            end;
        }
        field(4;"Dimension Value Code";Code[20])
        {
            CaptionML = ENU='Dimension Value Code',
                        FRA='Code section';
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FIELD(Dimension Code));

            trigger OnValidate();
            begin
                IF NOT DimMgt.CheckDimValue("Dimension Code","Dimension Value Code") THEN
                  ERROR(DimMgt.GetDimErr);
            end;
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
    }

    keys
    {
        key(Key1;"Table ID","No.","Dimension Code")
        {
        }
        key(Key2;"Dimension Code")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnRename();
    begin
        ERROR(Text000,TABLECAPTION);
    end;

    var
        Text000 : TextConst ENU='You can''t rename a %1.',FRA='Vous ne pouvez pas renommer un(e) %1';
        GLSetup : Record "98";
        DimMgt : Codeunit "408";

    procedure GetCaption() : Text[250];
    var
        ObjTransl : Record "377";
        CurrTableID : Integer;
        NewTableID : Integer;
        NewNo : Code[20];
        SourceTableName : Text[100];
    begin
        IF NOT EVALUATE(NewTableID,GETFILTER("Table ID")) THEN
          EXIT('');

        IF NewTableID = 0 THEN
          IF GETRANGEMIN("Table ID") = GETRANGEMAX("Table ID") THEN
            NewTableID := GETRANGEMIN("Table ID")
          ELSE
            NewTableID := 0;

        IF NewTableID <> CurrTableID THEN
          SourceTableName := ObjTransl.TranslateObject(ObjTransl."Object Type"::Table,NewTableID);
        CurrTableID := NewTableID;

        IF GETFILTER("No.") <> '' THEN
          IF GETRANGEMIN("No.") = GETRANGEMAX("No.") THEN
            NewNo := GETRANGEMIN("No.")
          ELSE
            NewNo := '';

        IF NewTableID <> 0 THEN
          EXIT(STRSUBSTNO('%1 %2',SourceTableName,NewNo));

        EXIT('');
    end;
}

