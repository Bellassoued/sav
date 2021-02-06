page 69053 "DG SAV - Activities"
{
    // version Company Statistics

    PageType = CardPart;
    SourceTable = Table9052;

    layout
    {
        area(content)
        {
            cuegroup("For Release")
            {
                CaptionML = ENU='For Release',
                            FRA='SERVICE RAPIDE';
                field("NB OT RAP J";"NB OT RAP J")
                {
                }
                field("NB OT RAP CLOT J";"NB OT RAP CLOT J")
                {
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
            cuegroup("GRAND SERVICE")
            {
                Caption = 'GRAND SERVICE';
                field("NB OT GS J";"NB OT GS J")
                {
                }
                field("NB OT GS CLOT J";"NB OT GS CLOT J")
                {
                }
            }
            cuegroup(GARANTIE)
            {
                Caption = 'GARANTIE';
                field("NB DOSS GAR";"NB DOSS GAR")
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
        RecCompanyStatistics.GET;
        SETRANGE("Date Filter",WORKDATE)
    end;

    var
        RecCompanyStatistics : Record "60046";
}

