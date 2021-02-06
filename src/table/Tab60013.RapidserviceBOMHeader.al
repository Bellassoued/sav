table 60013 "Rapid service BOM Header"
{
    // version NAVW17.00

    CaptionML = ENU='Production BOM Header',
                FRA='En-tête nomenclature';
    DataCaptionFields = "No.",Description;
    DrillDownPageID = 60070;
    LookupPageID = 60070;

    fields
    {
        field(1;"No.";Code[30])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            Description = 'NM190419';
        }
        field(10;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';

            trigger OnValidate();
            begin
                //"Search Name" := Description;
            end;
        }
        field(21;"Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Unit of Measure Code',
                        FRA='Code unité';
            TableRelation = "Unit of Measure";

            trigger OnValidate();
            var
                Item : Record "27";
                ItemUnitOfMeasure : Record "5404";
            begin
            end;
        }
        field(40;"Creation Date";Date)
        {
            CaptionML = ENU='Creation Date',
                        FRA='Date création';
            Editable = false;
        }
        field(43;"Last Date Modified";Date)
        {
            CaptionML = ENU='Last Date Modified',
                        FRA='Date dern. modification';
            Editable = false;
        }
        field(45;Status;Option)
        {
            CaptionML = ENU='Status',
                        FRA='Statut';
            OptionCaptionML = ENU='New,Certified,Under Development,Closed',
                              FRA='Création en cours,Validée,Modification en cours,Clôturée';
            OptionMembers = New,Certified,"Under Development",Closed;

            trigger OnValidate();
            var
                PlanningAssignment : Record "99000850";
                MfgSetup : Record "99000765";
                ProdBOMCheck : Codeunit "99000769";
            begin
            end;
        }
        field(51;"No. Series";Code[10])
        {
            CaptionML = ENU='No. Series',
                        FRA='Souches de n°';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(52;Prix;Decimal)
        {
            CalcFormula = Sum("Rapide service BOM Line".Prix WHERE (Rapid Service BOM No.=FIELD(No.)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        /*Item.SETCURRENTKEY("Production BOM No.");
        Item.SETRANGE("Production BOM No.","No.");
        IF Item.FINDFIRST THEN
          ERROR(Text000);
        
        ProdBOMLine.SETRANGE("Production BOM No.","No.");
        ProdBOMLine.DELETEALL(TRUE);
        
        ProdBOMVersion.SETRANGE("Production BOM No.","No.");
        ProdBOMVersion.DELETEALL;
        
        MfgComment.SETRANGE("Table Name",MfgComment."Table Name"::"Production BOM Header");
        MfgComment.SETRANGE("No.","No.");
        MfgComment.DELETEALL;
        */

    end;

    trigger OnInsert();
    begin
        /*MfgSetup.GET;
        IF "No." = '' THEN BEGIN
          MfgSetup.TESTFIELD("Production BOM Nos.");
          NoSeriesMgt.InitSeries(MfgSetup."Production BOM Nos.",xRec."No. Series",0D,"No.","No. Series");
        END;
        
        "Creation Date" := TODAY;
        */

    end;

    trigger OnModify();
    begin
        "Last Date Modified" := TODAY;
    end;

    trigger OnRename();
    begin
        IF Status = Status::Certified THEN
          ERROR(Text002,TABLECAPTION,FIELDCAPTION(Status),FORMAT(Status));
    end;

    var
        Text000 : TextConst ENU='This Production BOM is being used on Items.',FRA='Cette nomenclature est utilisée dans des articles.';
        Text001 : TextConst ENU='All versions attached to the BOM will be closed. Close BOM?',FRA='Toutes les versions rattachées à la nomenclature vont être clôturées. Souhaitez-vous clôturer la nomenclature ?';
        MfgSetup : Record "99000765";
        Item : Record "27";
        ProdBOMHeader : Record "99000771";
        ProdBOMVersion : Record "99000779";
        ProdBOMLine : Record "99000772";
        MfgComment : Record "99000770";
        NoSeriesMgt : Codeunit "396";
        Text002 : TextConst ENU='You cannot rename the %1 when %2 is %3.',FRA='Vous ne pouvez pas renommer l''enregistrement %1 lorsque la valeur %2 est %3.';

    procedure AssistEdit(OldProdBOMHeader : Record "99000771") : Boolean;
    begin
        /*
        WITH ProdBOMHeader DO BEGIN
          ProdBOMHeader := Rec;
          MfgSetup.GET;
          MfgSetup.TESTFIELD("Production BOM Nos.");
          IF NoSeriesMgt.SelectSeries(MfgSetup."Production BOM Nos.",OldProdBOMHeader."No. Series","No. Series") THEN BEGIN
            NoSeriesMgt.SetSeries("No.");
            Rec := ProdBOMHeader;
            EXIT(TRUE);
          END;
        END;
        */

    end;
}

