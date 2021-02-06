page 69025 "VN - Directeur commercial ACT2"
{
    // version NAVW17.10,MAZDA15

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9055;

    layout
    {
        area(content)
        {
            cuegroup("Statiqtique VN arrivage")
            {
                field("Nbr Véhicules";"Nbr Véhicules")
                {
                    Image = "None";
                }
                field("Nbr Véhicules produites";"Nbr Véhicules produites")
                {
                    Image = "None";
                }
                field("Nbr Véhicules Réservés";"Nbr Véhicules Réservés")
                {
                    Image = "None";
                }
                field("Nbr Véhicules sur arrivage";"Nbr Véhicules sur arrivage")
                {
                    Image = "None";
                }
            }
            cuegroup("For Release")
            {
                CaptionML = ENU='For Release',
                            FRA='Achat';
                field("Commande achat ouvert VN";"Commande achat ouvert VN")
                {
                    DrillDownPageID = "Purchase Order List VN";
                    Lookup = true;
                    LookupPageID = "Purchase Order List VN";
                }
                field("Commande achat lancer VN";"Commande achat lancer VN")
                {
                    DrillDownPageID = "Purchase Order List VN";
                    Lookup = true;
                    LookupPageID = "Purchase Order List VN";
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
        Year := DATE2DWY(WORKDATE, 3);
        Month := DATE2DMY(WORKDATE,2);

        //SETRANGE("Date Filter VN",CALCDATE ('<-CM>', DMY2DATE(1, Month, Year)),CALCDATE ('<+CM>', DMY2DATE(1, Month, Year)));

        SETRANGE("Date Filter",0D,WORKDATE - 1);
    end;

    var
        Month : Integer;
        Year : Integer;
}

