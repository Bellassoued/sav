page 60150 "Statistique Vehicule"
{
    // version NAVW17.00,MAZDA15

    CaptionML = ENU='Statistique Vehicule ',
                FRA='Statistique Vehicule';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    ModifyAllowed = false;
    PageType = ListPlus;
    RefreshOnActivate = true;
    SaveValues = true;

    layout
    {
        area(content)
        {
            group(Options)
            {
                CaptionML = ENU='Options',
                            FRA='Options';
                field(PeriodType;PeriodType)
                {
                    CaptionML = ENU='View by',
                                FRA='Afficher par';
                    OptionCaptionML = ENU='Day,Week,Month,Quarter,Year,Period',
                                      FRA='Jour,Semaine,Mois,Trimestre,Année,Période';
                    ToolTipML = ENU='Day',
                                FRA='Jour';

                    trigger OnValidate();
                    begin
                        IF PeriodType = PeriodType::Period THEN
                          PeriodPeriodTypeOnValidate;
                        IF PeriodType = PeriodType::Year THEN
                          YearPeriodTypeOnValidate;
                        IF PeriodType = PeriodType::Quarter THEN
                          QuarterPeriodTypeOnValidate;
                        IF PeriodType = PeriodType::Month THEN
                          MonthPeriodTypeOnValidate;
                        IF PeriodType = PeriodType::Week THEN
                          WeekPeriodTypeOnValidate;
                        IF PeriodType = PeriodType::Day THEN
                          DayPeriodTypeOnValidate;
                    end;
                }
                field(CentreGestion;CentreGestion)
                {
                    Caption = 'Centre de Gestion';
                    Editable = EditRespCtr;
                    LookupPageID = "Responsibility Center List";
                    TableRelation = "Responsibility Center";

                    trigger OnValidate();
                    begin
                        SalesPersonCode := '';
                        UpdateSubForm;
                    end;
                }
                field(SalesPersonCode;SalesPersonCode)
                {
                    Caption = 'Code Vendeur';
                    Editable = EditVendorCtr;

                    trigger OnLookup(Text : Text) : Boolean;
                    var
                        RecSalespersonPurchaser : Record "13";
                        RecUserSetup : Record "91";
                    begin
                        IF CentreGestion <> '' THEN BEGIN
                          IF EditVendorCtr THEN
                            BEGIN
                              CLEAR(PageVendor);
                              RecSalespersonPurchaser.RESET;
                              RecSalespersonPurchaser.SETRANGE("User Activity",RecSalespersonPurchaser."User Activity"::VN);
                              IF RecSalespersonPurchaser.FINDSET THEN BEGIN
                                REPEAT
                                  RecUserSetup.RESET;
                                  RecUserSetup.SETRANGE("Salespers./Purch. Code",RecSalespersonPurchaser.Code);
                                  RecUserSetup.SETRANGE("Sales Resp. Ctr. Filter",CentreGestion);
                                  IF NOT RecUserSetup.ISEMPTY THEN BEGIN
                                    RecSalespersonPurchaser.MARK(TRUE);
                                  END;
                                UNTIL RecSalespersonPurchaser.NEXT = 0;
                              END;
                              PageVendor.LOOKUPMODE(TRUE);
                              RecSalespersonPurchaser.MARKEDONLY(TRUE);
                              PageVendor.SETTABLEVIEW(RecSalespersonPurchaser);
                              IF PageVendor.RUNMODAL = ACTION::LookupOK THEN BEGIN
                                PageVendor.GETRECORD(RecSalespersonPurchaser);
                                SalesPersonCode := RecSalespersonPurchaser.Code;
                              END;
                            END;
                        END ELSE ERROR(TXT50001);
                        UpdateSubForm;
                    end;

                    trigger OnValidate();
                    begin
                        UpdateSubForm;
                    end;
                }
                field(ModelCode;ModelCode)
                {
                    Caption = 'Model';
                    LookupPageID = "Vehicule List";

                    trigger OnLookup(Text : Text) : Boolean;
                    var
                        RecItemVehicule : Record "27";
                    begin
                        CLEAR(PageModel);
                        RecItemVehicule.RESET;
                        RecItemVehicule.SETRANGE("Inventory Posting Group",RecSalesSetup."Groupe Compta. Véhicule");
                        PageModel.LOOKUPMODE(TRUE);
                        PageModel.SETTABLEVIEW(RecItemVehicule);
                        IF PageModel.RUNMODAL = ACTION::LookupOK THEN BEGIN
                          PageModel.GETRECORD(RecItemVehicule);
                          ModelCode := RecItemVehicule."No.";
                          VariantCode := '';
                        END;
                        UpdateSubForm;
                    end;

                    trigger OnValidate();
                    begin
                        UpdateSubForm;
                    end;
                }
                field(VariantCode;VariantCode)
                {
                    Caption = 'Variante';

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        IF ModelCode <> '' THEN BEGIN
                          CLEAR(PageVariant);
                          RecVariant.RESET;
                          RecVariant.SETRANGE("Item No.",ModelCode);
                          PageVariant.LOOKUPMODE(TRUE);
                          PageVariant.SETTABLEVIEW(RecVariant);
                          IF PageVariant.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            PageVariant.GETRECORD(RecVariant);
                            VariantCode := RecVariant.Code;
                          END;

                        END ELSE ERROR(TXT50000);
                        UpdateSubForm;
                    end;

                    trigger OnValidate();
                    begin
                        UpdateSubForm;
                    end;
                }
            }
            part(Services;60151)
            {
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        UpdateSubForm;
    end;

    trigger OnOpenPage();
    begin
        RecSalesSetup.GET;
        PeriodType := PeriodType::Month;

        SalesPersonCode := '';
        ModelCode       := '';
        VariantCode     := '';

        EditRespCtr := TRUE;
        CentreGestion := UserMgt.GetSalesFilter ;
        IF CentreGestion <> '' THEN
          EditRespCtr := FALSE;


        EditVendorCtr := TRUE;
        RecGUserSetup.GET(USERID);
        SalesPersonCode := RecGUserSetup."Salespers./Purch. Code" ;
        IF SalesPersonCode <> '' THEN
          EditVendorCtr := FALSE;

        UpdateSubForm;
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        IF CloseAction = ACTION::LookupOK THEN
          LookupOKOnPush;
    end;

    var
        ItemAvailFormsMgt : Codeunit "353";
        PeriodType : Option Day,Week,Month,Quarter,Year,Period;
        AmountType : Option "Net Change","Balance at Date";
        LastDate : Date;
        CentreGestion : Code[20];
        EditRespCtr : Boolean;
        UserMgt : Codeunit "5700";
        SalesPersonCode : Code[10];
        ModelCode : Code[20];
        VariantCode : Code[20];
        RecSalesSetup : Record "311";
        PageModel : Page "60017";
        PageVendor : Page "14";
        TXT50000 : Label 'Vous devez choisir le Model de Véhicule avant de choisir la variante.';
        PageVariant : Page "5401";
        RecVariant : Record "5401";
        TXT50001 : Label 'Vous devez choisir un centre de gestion avant de choisir le commercial.';
        RecGUserSetup : Record "91";
        EditVendorCtr : Boolean;

    procedure UpdateSubForm();
    begin
        CurrPage.Services.PAGE.Set(PeriodType,CentreGestion,SalesPersonCode,ModelCode,VariantCode);
    end;

    procedure GetLastDate() : Date;
    begin
        EXIT(LastDate);
    end;

    local procedure DayPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    local procedure WeekPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    local procedure MonthPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    local procedure QuarterPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    local procedure YearPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    local procedure PeriodPeriodTypeOnPush();
    begin
        UpdateSubForm;
    end;

    local procedure BalanceatDateAmountTypeOnPush();
    begin
        UpdateSubForm;
    end;

    local procedure NetChangeAmountTypeOnPush();
    begin
        UpdateSubForm;
    end;

    local procedure LookupOKOnPush();
    var
        Date : Record "2000000007";
    begin
        LastDate := Date."Period Start";
    end;

    local procedure DayPeriodTypeOnValidate();
    begin
        DayPeriodTypeOnPush;
    end;

    local procedure WeekPeriodTypeOnValidate();
    begin
        WeekPeriodTypeOnPush;
    end;

    local procedure MonthPeriodTypeOnValidate();
    begin
        MonthPeriodTypeOnPush;
    end;

    local procedure QuarterPeriodTypeOnValidate();
    begin
        QuarterPeriodTypeOnPush;
    end;

    local procedure YearPeriodTypeOnValidate();
    begin
        YearPeriodTypeOnPush;
    end;

    local procedure PeriodPeriodTypeOnValidate();
    begin
        PeriodPeriodTypeOnPush;
    end;

    local procedure NetChangeAmountTypeOnValidate();
    begin
        NetChangeAmountTypeOnPush;
    end;

    local procedure BalanceatDateAmountTypeOnValid();
    begin
        BalanceatDateAmountTypeOnPush;
    end;
}

