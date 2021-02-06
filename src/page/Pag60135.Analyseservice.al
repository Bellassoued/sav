page 60135 "Analyse service"
{
    // version NAVW17.00

    CaptionML = ENU='Analyse Journalier Réception ',
                FRA='Analyse Journalier Réception ';
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
                        UpdateSubForm;
                    end;
                }
            }
            part(Services;60136)
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

        EditRespCtr := TRUE;
        CentreGestion := UserMgt.GetServiceFilter ;
        IF  CentreGestion <> '' THEN
            EditRespCtr := FALSE;
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

    procedure UpdateSubForm();
    begin
        CurrPage.Services.PAGE.Set(PeriodType,CentreGestion);
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
        //CurrPage.Services.PAGE.GETRECORD(Date);
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

