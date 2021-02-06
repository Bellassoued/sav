page 69023 "VN - Directeur commercial ACT"
{
    // version NAVW17.10,MAZDA15

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9053;

    layout
    {
        area(content)
        {
            cuegroup("Dossiers validés")
            {
                field("Commandes vente VN validées";"Commandes vente VN validées")
                {
                }
            }
            cuegroup("For Release")
            {
                CaptionML = ENU='For Release',
                            FRA='Devis';
                field("Devis ouvert VN";"Devis ouvert VN")
                {
                    Caption = 'VN - Devis ouvert';
                    DrillDownPageID = "Sales Quotes VN";
                    Lookup = true;
                    LookupPageID = "Sales Quotes VN";
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
                    DrillDownPageID = "Sales Quotes VN";
                    Lookup = true;
                    LookupPageID = "Sales Quotes VN";
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
                }
            }
            cuegroup(Commande)
            {
                Caption = 'Commande';
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
                field("Demandes approbation en cours";"Demandes approbation en cours")
                {
                    Visible = false;
                }
                field("Commandes Attente Approbation";"Commandes Attente Approbation")
                {
                    DrillDownPageID = "Sales approval list";
                    LookupPageID = "Sales approval list";
                }

                actions
                {
                    action("New Sales Order")
                    {
                        CaptionML = ENU='New Sales Order',
                                    FRA='Nouvelle commande vente';
                        RunObject = Page 60084;
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("Exonération")
            {
                field("Demande exonération";"Demande exonération")
                {
                }
                field("Demande exonération validées";"Demande exonération validées")
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
        //KT 0108
        SETFILTER("Filtre approbateur",USERID);
        //END KT
        //<< TRIUM RAD 25/04/2014 - Ajout filtre par utilisateur
        SetSalesPersonFilter ;
        //>> End TRIUM RAD Addin

        Year := DATE2DWY(WORKDATE, 3);
        Month := DATE2DMY(WORKDATE,2);

        SETRANGE("Date Filter VN",CALCDATE ('<-CM>', DMY2DATE(1, Month, Year)),CALCDATE ('<+CM>', DMY2DATE(1, Month, Year)));

        SETRANGE("Date Filter",0D,WORKDATE - 1);
    end;

    var
        Month : Integer;
        Year : Integer;
}

