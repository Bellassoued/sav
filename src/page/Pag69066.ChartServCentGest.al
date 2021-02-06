page 69066 "Chart Serv/ CentGest"
{
    Caption = 'Service Rapide';
    PageType = Card;
    SourceTable = Table485;

    layout
    {
        area(content)
        {
            field(MyChart;'')
            {
                //The property ControlAddIn is not yet supported. Please convert manually.
                //ControlAddIn = 'Microsoft.Dynamics.Nav.Client.BusinessChart;PublicKeyToken=31bf3856ad364e35';
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Générer Graph")
            {
                Caption = 'Générer Graph';

                trigger OnAction();
                var
                    I : Integer;
                begin
                    //PAGE.RUNMODAL(PAGE::"MyChart Example");
                    Initialize;

                    //Set and define the XAxis data type
                    SetXAxis('Date', "Data Type"::DateTime);
                    AddMeasure('nbr Fiche' ,0,"Data Type"::Decimal,"Chart Type"::Line);

                    IF UserMgt.GetServiceFilter <> '' THEN
                      Recp1.SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
                      MESSAGE(UserMgt.GetServiceFilter);
                      Recp1.SETRANGE(Recp1."Service Type",Recp1."Service Type"::"Rapid Service");

                    IF Recp1.FINDSET  THEN REPEAT
                      AddColumn(Recp1."Creation date");

                      IF UserMgt.GetServiceFilter <> '' THEN
                        Recp2.SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);

                      Recp2.SETRANGE(Recp2."Creation date",Recp1."Creation date");
                      Recp2.SETRANGE("Service Type",Recp1."Service Type"::"Rapid Service");
                      SetValue('nbr Fiche',I,Recp2.COUNT);
                      I += 1;
                    UNTIL Recp1.NEXT = 0;

                    CLEAR(Recp1);
                    CLEAR(Recp2);
                    //Set and define the XAxis data type
                    SetXAxis('DateG', "Data Type"::DateTime);
                    AddMeasure('nbr FicheG' ,0,"Data Type"::Decimal,"Chart Type"::Line);

                    IF UserMgt.GetServiceFilter <> '' THEN
                      Recp1.SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
                      MESSAGE(UserMgt.GetServiceFilter);
                      Recp1.SETRANGE(Recp1."Service Type",Recp1."Service Type"::"Big Service");

                    IF Recp1.FINDSET  THEN REPEAT
                      AddColumn(Recp1."Creation date");

                      IF UserMgt.GetServiceFilter <> '' THEN
                        Recp2.SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);

                      Recp2.SETRANGE(Recp2."Creation date",Recp1."Creation date");
                      Recp2.SETRANGE("Service Type",Recp1."Service Type"::"Big Service");
                      SetValue('nbr FicheG',I,Recp2.COUNT);
                      I += 1;
                    UNTIL Recp1.NEXT = 0;


                    Update(CurrPage.MyChart);


                    ///--------------------------
                end;
            }
        }
    }

    trigger OnFindRecord(Which : Text) : Boolean;
    var
        I : Integer;
    begin
    end;

    var
        Location : Record "14";
        SalesHeader : Record "36";
        SalesHeader2 : Record "36";
        Recp1 : Record "60008";
        Recp2 : Record "60008";
        UserMgt : Codeunit "5700";
        RespCenter : Record "5714";

    //event MyChart(point : DotNet "'Microsoft.Dynamics.Nav.Client.BusinessChart.Model, Version=7.1.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Client.BusinessChart.BusinessChartDataPoint");
    //begin
        /*
        */
    //end;

    //event MyChart(point : DotNet "'Microsoft.Dynamics.Nav.Client.BusinessChart.Model, Version=7.1.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Client.BusinessChart.BusinessChartDataPoint");
    //begin
        /*
        */
    //end;

    //event MyChart();
    //begin
        /*
        */
    //end;
}

