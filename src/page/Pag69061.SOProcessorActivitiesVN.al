page 69061 "SO Processor Activities VN"
{
    // version NAVW17.10

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9053;

    layout
    {
        area(content)
        {
            cuegroup("Statistique VN arrivage")
            {
                field("Nbr Véhicules";"Nbr Véhicules")
                {
                    Image = "None";
                }
                field("Nbr Véhicules produites";"Nbr Véhicules produites")
                {
                    Image = "None";
                }
                field("Nbr Véhicules sur arrivage";"Nbr Véhicules sur arrivage")
                {
                    Caption = 'Nbr Véhicules En Expédition';
                    Image = "None";
                }
                field("Nbr Véhicules Réservés";"Nbr Véhicules Réservés")
                {
                    Caption = 'Nbr Véhicules Réservés sur Arrivage';
                    Image = "None";
                }
            }
            cuegroup()
            {
                field("Embarquement Confirmé";"Embarquement Confirmé")
                {
                }
                field("VIN avec LC";"VIN avec LC")
                {
                }
                field("VIN avec LC NAV";"VIN avec LC NAV")
                {
                }
            }
            cuegroup("For Release")
            {
                CaptionML = ENU='For Release',
                            FRA='Devis';
                Visible = false;
                field("Sales Quotes VN- Open";"Sales Quotes VN- Open")
                {
                    DrillDownPageID = "Sales Quotes VN";
                }
                field("Devis Attente Approbation VN";"Devis Attente Approbation VN")
                {
                    DrillDownPageID = "Sales Quotes VN";
                    LookupPageID = "Sales Quotes VN";
                    Visible = false;
                }
                field("Devis lancer VN";"Devis lancer VN")
                {
                    Caption = 'VN - Devis lancer';
                    DrillDownPageID = "Sales Quotes";
                    Lookup = true;
                    LookupPageID = "Sales Quotes";
                }

                actions
                {
                    action("New Sales Quote")
                    {
                        CaptionML = ENU='New Sales Quote',
                                    FRA='Nouveau devis';
                        Image = Quote;
                        RunObject = Page 60081;
                        RunPageMode = Create;
                    }
                    action("New Sales Order")
                    {
                        CaptionML = ENU='New Sales Order',
                                    FRA='Nouvelle commande vente';
                        RunObject = Page 60084;
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup(Commande)
            {
                CaptionML = ENU='Commande',
                            FRA='Commande';
                Visible = false;
                field("Commande ouvert VN";"Commande ouvert VN")
                {
                    Caption = 'VN - Commande ouverte';
                    DrillDownPageID = "Sales Order List VN";
                    Lookup = true;
                    LookupPageID = "Sales Order List VN";
                }
                field("Commande lancer VN";"Commande lancer VN")
                {
                    Caption = 'VN - Commande Lancer';
                    DrillDownPageID = "Sales Order List VN";
                    Lookup = true;
                    LookupPageID = "Sales Order List VN";
                }
                field("Nbre Vehicule reservé";"Nbre Vehicule reservé")
                {
                    DrillDownPageID = "Reservation Entries VN";
                    LookupPageID = "Reservation Entries VN";
                }
                field("VIN Dossier Validés Sans PVN";"VIN Dossier Validés Sans PVN")
                {
                }
            }
            cuegroup()
            {
                Visible = false;
                field("Sales Return Orders VN - Open";"Sales Return Orders VN - Open")
                {
                }
                field("Demandes approbation en cours";"Demandes approbation en cours")
                {
                    Visible = false;
                }
                field("Commandes Attente Approbation";"Commandes Attente Approbation")
                {
                }
                field("Commandes VN sans justificatif";"Commandes VN sans justificatif")
                {
                }

                actions
                {
                    action("New Sales Return Order")
                    {
                        CaptionML = ENU='New Sales Return Order',
                                    FRA='Nouveau retour vente';
                        RunObject = Page 60087;
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup()
            {
                Visible = false;
                field("Commandes vente VN validées";"Commandes vente VN validées")
                {
                }
                field("Demande exonération";"Demande exonération")
                {
                }
                field("Demande exonération validées";"Demande exonération validées")
                {
                }
            }
            cuegroup()
            {
                Visible = false;
                field("Dossier Accepter Facturation";"Dossier Accepter Facturation")
                {
                }
                field("Dossier accepter Réglement";"Dossier accepter Réglement")
                {
                    CaptionML = ENU='Dossier Réglement Réçu',
                                FRA='Dossier Réglement Réçu';
                }

                actions
                {
                    action("New Sales Return Order")
                    {
                        CaptionML = ENU='New Sales Return Order',
                                    FRA='Nouveau retour vente';
                        RunObject = Page 60087;
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
    var
        GRecUserSetup : Record "91";
    begin
        GRecUserSetup.GET(USERID);
        RESET;
        //SETFILTER("Filtre approbateur",USERID);
        IF NOT GET THEN BEGIN
          INIT;
          INSERT;
        END;
        FILTERGROUP(2);
        SetRespCenterFilter;
        SETRANGE("Date Filter",0D,WORKDATE - 1);
        SETFILTER("Date Filter2",'>=%1',WORKDATE);
        IF NOT (GRecUserSetup."Responsable agence VN" OR GRecUserSetup.Admin_Vente_VN ) THEN
          SetSalesPersonFilter;
        CALCFIELDS("Nbr Véhicules sur arrivage")
    end;
}

