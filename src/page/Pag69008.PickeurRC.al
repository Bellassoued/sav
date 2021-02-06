page 69008 "Pickeur RC"
{
    // version NAVW17.10

    CaptionML = ENU='Role Center',
                FRA='Tableau de bord';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;69007)
                {
                }
            }
            group()
            {
                part(;760)
                {
                    Visible = false;
                }
                part(;675)
                {
                    Visible = false;
                }
                part(;9150)
                {
                }
                systempart(;MyNotes)
                {
                }
            }
        }
    }

    actions
    {
        area(embedding)
        {
            action("Ordres de transfert à envoyer")
            {
                RunObject = Page 60149;
            }
            action("Ordres de transfert à recevoir")
            {
                RunObject = Page 50024;
            }
            action("Inventory Picks")
            {
                CaptionML = ENU='Inventory Picks',
                            FRA='Prélèvements stock';
                RunObject = Page 9316;
            }
            action("Inventory Put-aways")
            {
                CaptionML = ENU='Inventory Put-aways',
                            FRA='Rangements stock';
                RunObject = Page 9315;
            }
            action("Inventory Movements")
            {
                CaptionML = ENU='Inventory Movements',
                            FRA='Mouvements de stock';
                RunObject = Page 9330;
            }
            action("Internal Movements")
            {
                CaptionML = ENU='Internal Movements',
                            FRA='Mouvements internes';
                RunObject = Page 7400;
            }
            action("Bin Contents")
            {
                CaptionML = ENU='Bin Contents',
                            FRA='Contenu emplacement';
                Image = BinContent;
                RunObject = Page 7305;
            }
            action(Items)
            {
                CaptionML = ENU='Items',
                            FRA='Articles';
                Image = Item;
                RunObject = Page 31;
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                CaptionML = ENU='Posted Documents',
                            FRA='Documents validés';
                Image = FiledPosted;
                action("Expéditions transfer de ")
                {
                    CaptionML = ENU='Posted Transfer Shipments from',
                                FRA='Expéditions transfer de';
                    RunObject = Page 50025;
                }
                action("Expéditions transfer vers")
                {
                    RunObject = Page 50039;
                }
                action("Réceptions transfer de")
                {
                    Caption = 'Réceptions transfer de';
                    RunObject = Page 50040;
                }
                action("Réceptions transfer vers")
                {
                    Caption = 'Réceptions transfer vers';
                    RunObject = Page 50041;
                }
                action("Posted Purchase Receipts")
                {
                    CaptionML = ENU='Posted Purchase Receipts',
                                FRA='Réceptions achat enregistrées';
                    RunObject = Page 145;
                }
            }
        }
        area(creation)
        {
            action("T&ransfer Order")
            {
                CaptionML = ENU='T&ransfer Order',
                            FRA='O&rdre de transfert';
                Image = Document;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                RunObject = Page 5740;
                RunPageMode = Create;
            }
        }
    }
}

