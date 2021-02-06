page 69021 "Préparation VN Activity."
{
    // version Preparation VN,MAZDA301

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9052;

    layout
    {
        area(content)
        {
            cuegroup("Préparation VN (Montage Accessoires)")
            {
                Caption = 'Préparation VN (Montage Accessoires)';
                field("Bordereau crée";"Bordereau crée")
                {
                }
                field("Préparation lancée";"Préparation lancée")
                {
                }
                field("Encours de préparation";"Encours de préparation")
                {
                }
                field("Véhicules préparés";"Véhicules préparés")
                {
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

