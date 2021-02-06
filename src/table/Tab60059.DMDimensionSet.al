table 60059 "DM Dimension Set"
{
    // version DM V1

    CaptionML = ENU='Dimension Set Entry',
                FRA='Écriture de l''ensemble de dimensions';
    DrillDownPageID = 479;
    LookupPageID = 479;
    Permissions = TableData 480=ri,
                  TableData 481=rim;

    fields
    {
        field(1;"Dimension Set ID";Code[50])
        {
            CaptionML = ENU='Dimension Set ID',
                        FRA='ID ensemble de dimensions';
        }
        field(2;"Line No.";Integer)
        {
            Caption = 'No Ligne';
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

                IF "Dimension Code" <> xRec."Dimension Code" THEN BEGIN
                  "Dimension Value Code" := '';
                END;
            end;
        }
        field(4;"Dimension Value Code";Code[20])
        {
            CaptionML = ENU='Dimension Value Code',
                        FRA='Code section';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FIELD(Dimension Code));

            trigger OnValidate();
            var
                DMDimensionSet : Record "60059";
            begin
                IF NOT DimMgt.CheckDimValue("Dimension Code","Dimension Value Code") THEN
                  ERROR(DimMgt.GetDimErr);

                WITH DMDimensionSet DO BEGIN
                  SETRANGE("Dimension Set ID",Rec."Dimension Set ID");
                  SETFILTER("Line No.",'<>%1',Rec."Line No.");
                  SETRANGE("Dimension Code",Rec."Dimension Code");
                  SETRANGE("Dimension Value Code",Rec."Dimension Value Code");
                  IF NOT ISEMPTY THEN
                    ERROR(STRSUBSTNO(TXT50000,Rec."Dimension Value Code"));
                END;
            end;
        }
        field(5;"Dimension Name";Text[30])
        {
            CalcFormula = Lookup(Dimension.Name WHERE (Code=FIELD(Dimension Code)));
            CaptionML = ENU='Dimension Name',
                        FRA='Nom axe analytique';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;"Dimension Value Name";Text[50])
        {
            CalcFormula = Lookup("Dimension Value".Name WHERE (Dimension Code=FIELD(Dimension Code),
                                                               Code=FIELD(Dimension Value Code)));
            CaptionML = ENU='Dimension Value Name',
                        FRA='Nom de la section analytique';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7;Share;Decimal)
        {
            CaptionML = ENU='Share',
                        FRA='Part';
            DecimalPlaces = 2:5;
            MinValue = 0;
        }
        field(8;Percent;Decimal)
        {
            CaptionML = ENU='Percent',
                        FRA='Pour cent';
            DecimalPlaces = 2:5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(9;Comment;Text[50])
        {
            CaptionML = ENU='Comment',
                        FRA='Commentaire';
        }
        field(10;"Last Date Modified";Date)
        {
            CaptionML = ENU='Last Date Modified',
                        FRA='Date dern. modification';
            Editable = false;
        }
        field(11;"User ID";Code[50])
        {
            CaptionML = ENU='User ID',
                        FRA='Code utilisateur';
            Editable = false;
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            trigger OnLookup();
            var
                UserMgt : Codeunit "418";
            begin
            end;
        }
        field(12;"Global Percent";Decimal)
        {
            CaptionML = ENU='Percent',
                        FRA='Pour cent Global';
            DecimalPlaces = 2:5;
            Editable = false;
            MaxValue = 100;
            MinValue = 0;
        }
        field(1000;"Table ID";Integer)
        {
            CaptionML = ENU='Table ID',
                        FRA='ID table';
            NotBlank = true;
            TableRelation = Object.ID WHERE (Type=CONST(Table));
        }
        field(1001;"No.";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            Description = 'Pour les tables maîtres';
            TableRelation = IF (Table ID=CONST(13)) Salesperson/Purchaser
                            ELSE IF (Table ID=CONST(15)) "G/L Account"
                            ELSE IF (Table ID=CONST(18)) Customer
                            ELSE IF (Table ID=CONST(23)) Vendor
                            ELSE IF (Table ID=CONST(27)) Item
                            ELSE IF (Table ID=CONST(152)) "Resource Group"
                            ELSE IF (Table ID=CONST(156)) Resource
                            ELSE IF (Table ID=CONST(167)) Job
                            ELSE IF (Table ID=CONST(270)) "Bank Account"
                            ELSE IF (Table ID=CONST(406)) "IC Partner"
                            ELSE IF (Table ID=CONST(5071)) Campaign
                            ELSE IF (Table ID=CONST(5200)) Employee
                            ELSE IF (Table ID=CONST(5600)) "Fixed Asset"
                            ELSE IF (Table ID=CONST(5628)) Insurance
                            ELSE IF (Table ID=CONST(5903)) "Service Order Type"
                            ELSE IF (Table ID=CONST(5904)) "Service Item Group"
                            ELSE IF (Table ID=CONST(5940)) "Service Item";
        }
        field(1003;"Journal Template Name";Code[10])
        {
            CaptionML = ENU='Journal Template Name',
                        FRA='Nom modèle feuille';
            Description = 'Pour les journaux';
            TableRelation = IF (Table ID=FILTER(81|221)) "Gen. Journal Template".Name
                            ELSE IF (Table ID=CONST(83)) "Item Journal Template".Name
                            ELSE IF (Table ID=CONST(207)) "Res. Journal Template".Name
                            ELSE IF (Table ID=CONST(210)) "Job Journal Template".Name
                            ELSE IF (Table ID=CONST(246)) "Req. Wksh. Template".Name
                            ELSE IF (Table ID=CONST(5621)) "FA Journal Template".Name
                            ELSE IF (Table ID=CONST(5635)) "Insurance Journal Template".Name;
        }
        field(1004;"Journal Batch Name";Code[10])
        {
            CaptionML = ENU='Journal Batch Name',
                        FRA='Nom feuille';
            Description = 'Pour les journaux';
            TableRelation = IF (Table ID=FILTER(81|221)) "Gen. Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name))
                            ELSE IF (Table ID=CONST(83)) "Item Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name))
                            ELSE IF (Table ID=CONST(207)) "Res. Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name))
                            ELSE IF (Table ID=CONST(210)) "Job Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name))
                            ELSE IF (Table ID=CONST(246)) "Requisition Wksh. Name".Name WHERE (Worksheet Template Name=FIELD(Journal Template Name))
                            ELSE IF (Table ID=CONST(5621)) "FA Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name))
                            ELSE IF (Table ID=CONST(5635)) "Insurance Journal Batch".Name WHERE (Journal Template Name=FIELD(Journal Template Name));
        }
        field(1005;"Journal Line No.";Integer)
        {
            CaptionML = ENU='Journal Line No.',
                        FRA='N° ligne feuille';
            Description = 'Pour les journaux';
        }
        field(1006;"Allocation Line No.";Integer)
        {
            CaptionML = ENU='Allocation Line No.',
                        FRA='N° ligne ventilation';
        }
        field(1007;"Document Type";Option)
        {
            CaptionML = ENU='Document Type',
                        FRA='Type document';
            Description = 'Pour les documents';
            OptionCaptionML = ENU='Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order, ',
                              FRA='Devis,Commande,Facture,Avoir,Commande ouverte,Retour, ';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order"," ";
        }
        field(1008;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.',
                        FRA='N° document';
            Description = 'Pour les documents';
        }
        field(1009;"Document Line No.";Integer)
        {
            CaptionML = ENU='Line No.',
                        FRA='N° ligne document';
            Description = 'Pour les documents';
        }
    }

    keys
    {
        key(Key1;"Dimension Set ID","Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        GeneralLedgerSetup.GET;

        IF "Dimension Set ID" = '' THEN BEGIN
          NoSeriesMgt.InitSeries(GeneralLedgerSetup."Souche No DM",GeneralLedgerSetup."Souche No DM",TODAY,"Dimension Set ID",GeneralLedgerSetup."Souche No DM");
        END;

        TESTFIELD("Dimension Code");
        //TESTFIELD("Dimension Value Code");
    end;

    var
        DimVal : Record "349";
        DimMgt : Codeunit "408";
        TXT50000 : Label 'Section %1 existe déjà !';
        GeneralLedgerSetup : Record "98";
        NoSeriesMgt : Codeunit "396";
        TXT50001 : Label 'Total Axe %1 égale à %2 ID %3 ! Total des section Analytique d''un même axe doit être égla à 100%.';

    procedure CalcPercent(var ParamDMDimensionSet : Record "60059");
    var
        PctTotal : Decimal;
        TotalShare : Decimal;
        TEMPORARYDMDimensionSet : Record "60059" temporary;
    begin
        TEMPORARYDMDimensionSet.COPY(ParamDMDimensionSet,TRUE);
        ParamDMDimensionSet.FINDFIRST;
        REPEAT
          WITH TEMPORARYDMDimensionSet DO BEGIN
            SETRANGE("Dimension Set ID",ParamDMDimensionSet."Dimension Set ID");
            SETFILTER("Line No.",'<>%1',ParamDMDimensionSet."Line No.");
            SETRANGE("Dimension Code",ParamDMDimensionSet."Dimension Code");
            CALCSUMS(Share);
            TotalShare := Share + ParamDMDimensionSet.Share;

            IF TotalShare = 0 THEN BEGIN
              MODIFYALL(Percent,0);
              ParamDMDimensionSet.Percent := 0;
              EXIT;
            END;

            IF FINDSET THEN
              REPEAT
                Percent := ROUND(100 * Share / TotalShare,0.00001);
                MODIFY;
              UNTIL NEXT = 0;
            ParamDMDimensionSet.Percent := ROUND(100 * ParamDMDimensionSet.Share / TotalShare,0.00001);
            ParamDMDimensionSet.MODIFY;
            // distribute rounding error:
            CALCSUMS(Percent);
            PctTotal := Percent + ParamDMDimensionSet.Percent;
            IF PctTotal <> 100 THEN BEGIN
              IF (ParamDMDimensionSet."Line No." <> 0) AND FINDLAST AND ("Line No." > ParamDMDimensionSet."Line No.") THEN BEGIN
                Percent := Percent + (100 - PctTotal);
                MODIFY;
              END ELSE
                ParamDMDimensionSet.Percent := ParamDMDimensionSet.Percent + (100 - PctTotal);
            END;
          END;
        UNTIL ParamDMDimensionSet.NEXT = 0;
    end;

    procedure CalcGlobalPercent(var ParamDMDimensionSet : Record "60059");
    var
        TEMPORARYDMDimensionSet : Record "60059" temporary;
    begin
        TEMPORARYDMDimensionSet.COPY(ParamDMDimensionSet,TRUE);
        ParamDMDimensionSet.FINDFIRST;
        REPEAT
          ParamDMDimensionSet.TESTFIELD(Percent);
          WITH TEMPORARYDMDimensionSet DO BEGIN
            SETRANGE("Dimension Set ID",ParamDMDimensionSet."Dimension Set ID");
            SETRANGE("Dimension Code",ParamDMDimensionSet."Dimension Code");
            FINDSET;
            CALCSUMS(Percent);
            IF Percent <> 100 THEN
              ERROR(TXT50001,ParamDMDimensionSet."Dimension Code",Percent,ParamDMDimensionSet."Dimension Set ID");
          END;
        UNTIL ParamDMDimensionSet.NEXT = 0;
    end;

    procedure CheckDimensionValueExist(var ParamDMDimensionSet : Record "60059");
    var
        TEMPORARYDMDimensionSet : Record "60059" temporary;
    begin
        TEMPORARYDMDimensionSet.COPY(ParamDMDimensionSet,TRUE);

        IF NOT DimMgt.CheckDimValue(ParamDMDimensionSet."Dimension Code",ParamDMDimensionSet."Dimension Value Code") THEN
          ERROR(DimMgt.GetDimErr);

        WITH TEMPORARYDMDimensionSet DO BEGIN
          SETRANGE("Dimension Set ID",ParamDMDimensionSet."Dimension Set ID");
          SETFILTER("Line No.",'<>%1',ParamDMDimensionSet."Line No.");
          SETRANGE("Dimension Code",ParamDMDimensionSet."Dimension Code");
          SETRANGE("Dimension Value Code",ParamDMDimensionSet."Dimension Value Code");
          IF NOT ISEMPTY THEN
            ERROR(STRSUBSTNO(TXT50000,ParamDMDimensionSet."Dimension Value Code"));
        END;
    end;
}

