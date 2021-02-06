page 69009 "Receptionnaire Gen. Activity."
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
            cuegroup()
            {
                field("Rapid Service - in Process";"Rapid Service - in Process")
                {
                    CaptionML = ENU='Rapid Service - in Process',
                                FRA='Service CHRONO - En cour';
                }
                field("Rapid Service - Finished";"Rapid Service - Finished")
                {
                    CaptionML = ENU='Rapid Service - Finished',
                                FRA='Service CHRONO - Terminé';
                }

                actions
                {
                    action("New Rapid Service")
                    {
                        CaptionML = ENU='New Rapid Service',
                                    FRA='Nouveau CHRONO';
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
                    CaptionML = ENU='Big Service - in Process',
                                FRA='ATELIER - En cours';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("Big Service - Finished";"Big Service - Finished")
                {
                    CaptionML = ENU='Big Service - Finished',
                                FRA='ATELIER - Terminé';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                }

                actions
                {
                    action("Page Fiche Reception Grande Rép")
                    {
                        CaptionML = ENU='New BiG Service',
                                    FRA='Nouveau ATELIER';
                        Image = Document;
                        Promoted = true;
                        PromotedIsBig = true;
                        RunObject = Page 60018;
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup()
            {
                field("Rapid Service - Jour";"Rapid Service - Jour")
                {
                    CaptionML = ENU='Rapid Service - in Process',
                                FRA='Nbr Serv CHRONO/jr';
                }
                field("Rapid Service - Solder";"Rapid Service - Solder")
                {
                    CaptionML = ENU='Rapid Service - in Process',
                                FRA='Nbr Serv CHRONO Soldé/jr';
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

