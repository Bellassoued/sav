page 69074 "Responsable RH RC"
{
    // version MAZDA1004

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;69075)
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
            action("Liste des fournisseurs")
            {
                RunObject = Page 69076;
            }
            action("Article de service")
            {
                RunObject = Page 5981;
            }
            action("Bordereau fournisseur")
            {
                RunObject = Page 69077;
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                CaptionML = ENU='Posted Documents',
                            FRA='Demande de réparation';
                Image = FiledPosted;
                action("Demande de réparation")
                {
                    CaptionML = ENU='Posted Sales Shipments',
                                FRA='Demande de réparation';
                    Image = PostedShipment;
                    RunObject = Page 69072;
                }
            }
        }
    }
}

