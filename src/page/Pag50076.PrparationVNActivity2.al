page 50076 "Préparation VN Activity.2"
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
            cuegroup("Préparation VN")
            {
                Caption = 'Préparation VN';
                field("Véhicule Non Préparé";"Véhicule Non Préparé")
                {
                    DrillDownPageID = "Liste Véh Facturer non Livrer";
                    LookupPageID = "Liste Véh Facturer non Livrer";
                }
                field("Véhicules Encours de Préparation";"Préparation - Commande Créer")
                {
                    DrillDownPageID = "Liste des Preparation VN";
                    Lookup = true;
                    LookupPageID = "Liste des Preparation VN";
                }
                field("Véhicules Accessoires Montés";"Véhicules Accessoires Montés")
                {
                    DrillDownPageID = "Liste des Preparation VN";
                    Lookup = true;
                    LookupPageID = "Liste des Preparation VN";
                }
                field("Véhicules Préparés.";"Véhicules Préparés.")
                {
                }
                field("Véhicule Disponible Livraison";"Véhicule Disponible Livraison")
                {
                }
                field("Véhicule Demandé Livraison";"Véhicule Demandé Livraison")
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

