page 69075 "Responsable RH Activité"
{
    // version MAZDA1004

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
                field("Demande ouvert";"Demande ouvert")
                {
                }
                field("En attende d'pprobation";"En attende d'pprobation")
                {
                }
                field("Demande approuvée";"Demande apprové")
                {
                    Caption = 'Demande approuvée';
                }

                actions
                {
                    action("New Rapid Service")
                    {
                        CaptionML = ENU='New Rapid Service',
                                    FRA='Nouvelle demande de réparation';
                        Image = Document;
                        Promoted = true;
                        PromotedIsBig = true;
                        RunObject = Page 69071;
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

