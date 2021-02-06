page 69027 "VN - RESPONSABLE SHOWROOM ACT"
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
            cuegroup()
            {
                field("Commandes VN sans justificatif";"Commandes VN sans justificatif")
                {
                }
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
                field("Dossier Accepter Facturation";"Dossier Accepter Facturation")
                {
                }
                field("Dossier accepter Réglement";"Dossier accepter Réglement")
                {
                    CaptionML = ENU='Dossier Réglement Réçu',
                                FRA='Dossier Réglement Réçu';
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
        //KT 010817
        //SETFILTER("Filtre approbateur",USERID);
        //END KT
        //<< TRIUM RAD 30/04/2014 - commenté sur demande de Ramzi Arous
        //SETRANGE("Date Filter VN",CALCDATE ('<-CM>', DMY2DATE(1, Month, Year)),CALCDATE ('<+CM>', DMY2DATE(1, Month, Year)));
        //>> End TRIUM RAD addin

        SETRANGE("Date Filter",0D,WORKDATE - 1);
    end;

    var
        Month : Integer;
        Year : Integer;
}

