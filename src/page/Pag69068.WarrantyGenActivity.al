page 69068 "Warranty Gen. Activity."
{
    // version SAV Automobile,MAZDA19

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9052;

    layout
    {
        area(content)
        {
            cuegroup()
            {
                field("Big Service - With Warranty";"Big Service - With Warranty")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                }
                field("Big Service - Waitting Pick Ap";"Big Service - Waitting Pick Ap")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                }
                field("Big Service - Waitting Post";"Big Service - Waitting Post")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                }

                actions
                {
                    action("New Rapid Service")
                    {
                        CaptionML = ENU='New Rapid Service',
                                    FRA='Nouveau Service Rapide';
                        Image = Document;
                        Promoted = true;
                        PromotedIsBig = true;
                        RunObject = Page 60014;
                        RunPageMode = Create;
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        RESET;
        IF NOT GET THEN BEGIN
          INIT;
          INSERT;
        END;

        SetRespCenterFilter;
        SETRANGE("Date Filter",WORKDATE,WORKDATE);
    end;

    var
        DateDebut : Date;
        DateFin : Date;
}

