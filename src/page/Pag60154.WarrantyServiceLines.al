page 60154 "Warranty Service Lines"
{
    // version MAZDA19

    AutoSplitKey = true;
    CaptionML = ENU='Service Lines',
                FRA='Lignes Commande Service Garantie';
    DataCaptionFields = "Document Type","Document No.";
    DelayedInsert = true;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = ListPart;
    PopulateAllFields = true;
    SourceTable = Table5902;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Service Item No.";"Service Item No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Service Item Serial No.";"Service Item Serial No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Service Item Line Description";"Service Item Line Description")
                {
                    DrillDown = false;
                    Visible = false;
                }
                field(Type;Type)
                {
                    Editable = false;

                    trigger OnValidate();
                    begin
                        TypeOnAfterValidate;
                        NoOnAfterValidate;
                    end;
                }
                field("No.";"No.")
                {
                    Editable = false;

                    trigger OnValidate();
                    begin
                        NoOnAfterValidate;
                    end;
                }
                field("Defaulting Item";"Defaulting Item")
                {
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;
                    DecimalPlaces = 0:5;
                    Editable = false;

                    trigger OnValidate();
                    begin
                        QuantityOnAfterValidate;
                    end;
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    BlankZero = true;
                    Editable = false;
                    Visible = false;
                }
                field("Unit Price";"Unit Price")
                {
                    BlankZero = true;
                    Editable = false;
                }
                field("Line Amount";"Line Amount")
                {
                    BlankZero = true;
                    Editable = false;
                }
                field("Fault Reason Code";"Fault Reason Code")
                {
                    Visible = false;
                }
                field("Fault Area Code";"Fault Area Code")
                {
                    Visible = false;
                }
                field("Symptom Code";"Symptom Code")
                {
                    Visible = false;
                }
                field("Fault Code";"Fault Code")
                {
                    Visible = false;
                }
                field("Resolution Code";"Resolution Code")
                {
                    Visible = false;
                }
                field(Warranty;Warranty)
                {
                    Editable = true;
                }
                field("Warranty Disc. %";"Warranty Disc. %")
                {
                    Editable = true;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    begin
        //SM MAZDA06
        CalcOrderedQty
        //END SM
    end;

    trigger OnAfterGetRecord();
    begin
        ShowShortcutDimCode(ShortcutDimCode);
        //SM MAZDA06
        CalcOrderedQty
        //END SM
    end;

    trigger OnDeleteRecord() : Boolean;
    var
        ReserveServLine : Codeunit "99000842";
    begin
        IF (Quantity <> 0) AND ItemExists("No.") THEN BEGIN
          COMMIT;
          IF NOT ReserveServLine.DeleteLineConfirm(Rec) THEN
            EXIT(FALSE);
          ReserveServLine.DeleteLine(Rec);
        END;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        CLEAR(ShortcutDimCode);

        IF ServHeader.GET("Document Type","Document No.") THEN BEGIN
          IF ServHeader."Link Service to Service Item" THEN
            IF SelectionFilter <> SelectionFilter::"Lines Not Item Related" THEN
              VALIDATE("Service Item Line No.",ServItemLineNo)
            ELSE
              VALIDATE("Service Item Line No.",0)
          ELSE
            VALIDATE("Service Item Line No.",0);
        END;
    end;

    trigger OnOpenPage();
    begin
        CLEAR(SelectionFilter);
        SelectionFilter := SelectionFilter::"All Service Lines";
        SetSelectionFilter;

        ServMgtSetup.GET;
        CASE ServMgtSetup."Fault Reporting Level" OF
          ServMgtSetup."Fault Reporting Level"::None:
            BEGIN
              "Fault Area CodeVisible" := FALSE;
              "Symptom CodeVisible" := FALSE;
              "Fault CodeVisible" := FALSE;
              "Resolution CodeVisible" := FALSE;
            END;
          ServMgtSetup."Fault Reporting Level"::Fault:
            BEGIN
              "Fault Area CodeVisible" := FALSE;
              "Symptom CodeVisible" := FALSE;
              "Fault CodeVisible" := TRUE;
              "Resolution CodeVisible" := TRUE;
            END;
          ServMgtSetup."Fault Reporting Level"::"Fault+Symptom":
            BEGIN
              "Fault Area CodeVisible" := FALSE;
              "Symptom CodeVisible" := TRUE;
              "Fault CodeVisible" := TRUE;
              "Resolution CodeVisible" := TRUE;
            END;
          ServMgtSetup."Fault Reporting Level"::"Fault+Symptom+Area (IRIS)":
            BEGIN
              "Fault Area CodeVisible" := TRUE;
              "Symptom CodeVisible" := TRUE;
              "Fault CodeVisible" := TRUE;
              "Resolution CodeVisible" := TRUE;
            END;
        END;
    end;

    var
        Text008 : TextConst ENU='You cannot open the window because %1 is %2 in the %3 table.',FRA='Vous ne pouvez pas ouvrir la fenêtre car %1 est à %2 dans la table %3.';
        ServMgtSetup : Record "5911";
        ServHeader : Record "5900";
        ServItemLine : Record "5901";
        SalesPriceCalcMgt : Codeunit "7000";
        ItemAvailFormsMgt : Codeunit "353";
        ShortcutDimCode : array [8] of Code[20];
        ServItemLineNo : Integer;
        SelectionFilter : Option "All Service Lines","Lines per Selected Service Item","Lines Not Item Related";
        Text011 : TextConst ENU='This will reset all price adjusted lines to default values. Continue?',FRA='Les lignes ajustement prix vont indiquer les valeurs par défaut. Souhaitez-vous continuer ?';
        [InDataSet]
        "Fault Area CodeVisible" : Boolean;
        [InDataSet]
        "Symptom CodeVisible" : Boolean;
        [InDataSet]
        "Fault CodeVisible" : Boolean;
        [InDataSet]
        "Resolution CodeVisible" : Boolean;
        [InDataSet]
        IPItemEnable : Boolean;
        [InDataSet]
        IPItemButtonEnable : Boolean;
        [InDataSet]
        IPItemCommentPBEnable : Boolean;
        [InDataSet]
        IPAvailabilityEnable : Boolean;
        [InDataSet]
        IPAvailabilityTextboxEnable : Boolean;
        [InDataSet]
        IPSubstitEnable : Boolean;
        [InDataSet]
        IPSubstitTextboxEnable : Boolean;
        [InDataSet]
        IPSalesPriceEnable : Boolean;
        [InDataSet]
        IPSalesPriceTextboxEnable : Boolean;
        [InDataSet]
        IPSalesLineDiscEnable : Boolean;
        [InDataSet]
        IPSalesLineDiscTextboxEnable : Boolean;
        Text012 : TextConst ENU='Do you want to create service lines from timesheets?',FRA='Souhaitez-vous créer des lignes service à partir des feuilles de temps ?';

    procedure CalcInvDisc(var ServLine : Record "5902");
    begin
        CODEUNIT.RUN(CODEUNIT::"Service-Calc. Discount",ServLine);
    end;

    procedure Initialize(ServItemLine : Integer);
    begin
        ServItemLineNo := ServItemLine;
    end;

    procedure SetSelectionFilter();
    begin
        CASE SelectionFilter OF
          SelectionFilter::"All Service Lines":
            SETRANGE("Service Item Line No.");
          SelectionFilter::"Lines per Selected Service Item":
            SETRANGE("Service Item Line No.",ServItemLineNo);
          SelectionFilter::"Lines Not Item Related":
            SETRANGE("Service Item Line No.",0);
        END;
        CurrPage.UPDATE(FALSE);
    end;

    procedure InsertExtendedText(Unconditionally : Boolean);
    var
        TransferExtendedText : Codeunit "378";
    begin
        IF TransferExtendedText.ServCheckIfAnyExtText(Rec,Unconditionally) THEN BEGIN
          CurrPage.SAVERECORD;
          TransferExtendedText.InsertServExtText(Rec);
        END;
        IF TransferExtendedText.MakeUpdate THEN
          CurrPage.UPDATE;
    end;

    procedure InsertStartFee();
    var
        ServOrderMgt : Codeunit "5900";
    begin
        CLEAR(ServOrderMgt);
        IF ServOrderMgt.InsertServCost(Rec,1,FALSE) THEN
          CurrPage.UPDATE;
    end;

    procedure InsertTravelFee();
    var
        ServOrderMgt : Codeunit "5900";
    begin
        CLEAR(ServOrderMgt);
        IF ServOrderMgt.InsertServCost(Rec,0,FALSE) THEN
          CurrPage.UPDATE;
    end;

    procedure SelectFaultResolutionCode();
    var
        ServSetup : Record "5911";
        FaultResolutionRelation : Page "5930";
    begin
        ServSetup.GET;
        CASE ServSetup."Fault Reporting Level" OF
          ServSetup."Fault Reporting Level"::None:
            ERROR(
              Text008,
              ServSetup.FIELDCAPTION("Fault Reporting Level"),
              ServSetup."Fault Reporting Level",ServSetup.TABLECAPTION);
        END;
        ServItemLine.GET("Document Type","Document No.","Service Item Line No.");
        CLEAR(FaultResolutionRelation);
        FaultResolutionRelation.SetDocument(DATABASE::"Service Line","Document Type","Document No.","Line No.");
        FaultResolutionRelation.SetFilters("Symptom Code","Fault Code","Fault Area Code",ServItemLine."Service Item Group Code");
        FaultResolutionRelation.RUNMODAL;
        CurrPage.UPDATE(FALSE);
    end;

    procedure ShowPrices();
    begin
        ServHeader.GET("Document Type","Document No.");
        CLEAR(SalesPriceCalcMgt);
        SalesPriceCalcMgt.GetServLinePrice(ServHeader,Rec);
    end;

    procedure ShowLineDisc();
    begin
        ServHeader.GET("Document Type","Document No.");
        CLEAR(SalesPriceCalcMgt);
        SalesPriceCalcMgt.GetServLineLineDisc(ServHeader,Rec);
    end;

    procedure InfopaneEnable(Value : Boolean);
    begin
        IPItemEnable := Value;
        IPItemButtonEnable := Value;
        IPItemCommentPBEnable := Value;
        IPAvailabilityEnable := Value;
        IPAvailabilityTextboxEnable := Value;
        IPSubstitEnable := Value;
        IPSubstitTextboxEnable := Value;
        IPSalesPriceEnable := Value;
        IPSalesPriceTextboxEnable := Value;
        IPSalesLineDiscEnable := Value;
        IPSalesLineDiscTextboxEnable := Value;
    end;

    local procedure TypeOnAfterValidate();
    begin
        InfopaneEnable((Type = Type::Item) AND ("No." <> ''));
    end;

    local procedure NoOnAfterValidate();
    begin
        InsertExtendedText(FALSE);
        InfopaneEnable((Type = Type::Item) AND ("No." <> ''));

        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("No." <> xRec."No.")
        THEN BEGIN

          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure LocationCodeOnAfterValidate();
    begin
        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("Location Code" <> xRec."Location Code")
        THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
        END;
        CurrPage.UPDATE(TRUE);
    end;

    local procedure QuantityOnAfterValidate();
    var
        UpdateIsDone : Boolean;
    begin
        IF Type = Type::Item THEN
          CASE Reserve OF
            Reserve::Always:
              BEGIN
                CurrPage.SAVERECORD;
                AutoReserve;
                CurrPage.UPDATE(FALSE);
                UpdateIsDone := TRUE;
              END;
            Reserve::Optional:
              IF (Quantity < xRec.Quantity) AND (xRec.Quantity > 0) THEN BEGIN
                CurrPage.SAVERECORD;
                CurrPage.UPDATE(FALSE);
                UpdateIsDone := TRUE;
              END;
          END;

        IF (Type = Type::Item) AND
           ((Quantity <> xRec.Quantity) OR ("Line No." = 0)) AND
           NOT UpdateIsDone
        THEN
          CurrPage.UPDATE(TRUE);
    end;

    local procedure PostingDateOnAfterValidate();
    begin
        IF (Reserve = Reserve::Always) AND
           ("Outstanding Qty. (Base)" <> 0) AND
           ("Posting Date" <> xRec."Posting Date")
        THEN BEGIN
          CurrPage.SAVERECORD;
          AutoReserve;
          CurrPage.UPDATE(FALSE);
        END;
    end;

    local procedure SelectionFilterOnAfterValidate();
    begin
        CurrPage.UPDATE;
        SetSelectionFilter;
    end;

    procedure SetServiceOrderNo(ServOrderNo : Code[20]);
    begin
        IF ServOrderNo <> '' THEN BEGIN
          SETRANGE("Document No.",ServOrderNo);
          CurrPage.UPDATE(FALSE);
        END ELSE BEGIN
          SETRANGE("Document No.",'XXXXXXXXXX');
          CurrPage.UPDATE(FALSE);
        END;
    end;
}

