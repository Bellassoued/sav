page 69018 "Receptionnaire Gen. Act RS."
{
    // version NAVW17.10

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9052;

    layout
    {
        area(content)
        {
            field(DateDebut;DateDebut)
            {
                Caption = 'Date debut';

                trigger OnValidate();
                begin
                    SETRANGE("Date Filter",DateDebut,DateFin);
                end;
            }
            field(DateFin;DateFin)
            {
                Caption = 'Date fin';

                trigger OnValidate();
                begin
                      SETRANGE("Date Filter",DateDebut,DateFin);
                end;
            }
            cuegroup()
            {
                field("Rapid Service - in Process RS";"Rapid Service - in Process RS")
                {
                }
                field("Rapid Service - Finished";"Rapid Service - Finished")
                {
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
            cuegroup()
            {
                field("Big Service - in Process";"Big Service - in Process")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("Big Service - Finished";"Big Service - Finished")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                }

                actions
                {
                    action("Page Fiche Reception Grande Rép")
                    {
                        CaptionML = ENU='New BiG Service',
                                    FRA='Nouveau Grand Service';
                        Image = Document;
                        Promoted = true;
                        PromotedIsBig = true;
                        RunObject = Page 60018;
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

