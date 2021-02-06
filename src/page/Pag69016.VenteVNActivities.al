page 69016 "Vente VN Activities"
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
            cuegroup("For Release")
            {
                CaptionML = ENU='For Release',
                            FRA='Carte grise';
                field("Carte Grise en cours";"Carte Grise en cours")
                {
                    DrillDownPageID = "Sales Quotes VN";
                }
                field("Carte Grise Envoyé";"Carte Grise Envoyé")
                {
                    Caption = 'Carte Grise Envoyer';
                    DrillDownPageID = "Sales Order List VN";
                }

                actions
                {
                    action("New Sales Quote")
                    {
                        CaptionML = ENU='New Sales Quote',
                                    FRA='Nouveau Bordereau de carte Grise';
                        Image = Quote;
                        RunObject = Page 60072;
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("Sales Orders Released Not Shipped")
            {
                CaptionML = ENU='Sales Orders Released Not Shipped',
                            FRA='Vente';
                field("Sales Quotes VN- Open";"Sales Quotes VN- Open")
                {
                    DrillDownPageID = "Sales Quotes VN";
                }
                field("Sales Orders VN- Open";"Sales Orders VN- Open")
                {
                    DrillDownPageID = "Sales Order List VN";
                }

                actions
                {
                    action("New Sales Quote")
                    {
                        CaptionML = ENU='New Sales Quote',
                                    FRA='Nouveau devis';
                        Image = Quote;
                        RunObject = Page 60023;
                        RunPageMode = Create;
                    }
                    action("New Sales Order")
                    {
                        CaptionML = ENU='New Sales Order',
                                    FRA='Nouvelle commande vente';
                        RunObject = Page 60026;
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
        SETRANGE("Date Filter",0D,WORKDATE - 1);
        SETFILTER("Date Filter2",'>=%1',WORKDATE);
    end;
}

