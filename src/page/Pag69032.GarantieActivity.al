page 69032 "Garantie Activity"
{
    // version SAV Automobile

    CaptionML = ENU='Activities',
                FRA='Activités';
    InsertAllowed = false;
    PageType = CardPart;
    SourceTable = Table9052;

    layout
    {
        area(content)
        {
            group()
            {
                cuegroup()
                {
                    field("Big Service - With Warranty";"Big Service - With Warranty")
                    {
                        CaptionML = ENU='Big Service - in Process',
                                    FRA='Fiche de garantie crée';
                        DrillDownPageID = "Liste Reception Grande Réparat";
                        Lookup = true;
                        LookupPageID = "Liste Reception Grande Réparat";
                    }

                    actions
                    {
                        action("Nouveau bon de garantie")
                        {
                            CaptionML = ENU='Nouveau bon de garantie',
                                        FRA='Nouveau bon de garantie';
                            Image = Document;
                            Promoted = true;
                            PromotedIsBig = true;
                            RunObject = Page 60156;
                            RunPageMode = Create;
                        }
                    }
                }
                cuegroup()
                {
                    field("Big Service - Open Pick Ap";"Big Service - Open Pick Ap")
                    {
                        DrillDownPageID = "Liste Reception Grande Réparat";
                        LookupPageID = "Liste Reception Grande Réparat";
                    }
                    field("Big Service - Open Post";"Big Service - Open Post")
                    {
                        DrillDownPageID = "Liste Reception Grande Réparat";
                        LookupPageID = "Liste Reception Grande Réparat";
                    }
                }
                cuegroup()
                {
                    field("Big Service - Waitting Pick Ap";"Big Service - Waitting Pick Ap")
                    {
                        CaptionML = ENU='Big Service - in Process',
                                    FRA='En attente d''aprobation (demande de pièces)';
                        DrillDownPageID = "Liste Reception Grande Réparat";
                        Lookup = true;
                        LookupPageID = "Liste Reception Grande Réparat";
                    }
                    field("Big Service - Waitting Post";"Big Service - Waitting Post")
                    {
                        DrillDownPageID = "Liste Reception Grande Réparat";
                        LookupPageID = "Liste Reception Grande Réparat";
                    }
                }
                cuegroup()
                {
                    field("Big Service - Posted";"Big Service - Posted")
                    {
                        DrillDownPageID = "Liste Reception Grande Réparat";
                        LookupPageID = "Liste Reception Grande Réparat";
                    }
                    field("Warranty Invoice";"Warranty Invoice")
                    {
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
}

