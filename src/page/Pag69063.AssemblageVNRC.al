page 69063 "Assemblage VN RC"
{
    // version SAV Automobile

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;69062)
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
        area(creation)
        {
            action("Nouveau ordre d'assemblage")
            {
                Caption = 'Nouveau ordre d''assemblage';
                Image = AssemblyOrder;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page 900;
                RunPageMode = Create;
            }
            action("Nouvelle commande achat")
            {
                Image = DepreciationBooks;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page 50;
                RunPageMode = Create;
                Visible = false;
            }
        }
        area(embedding)
        {
            action("Liste des article")
            {
                RunObject = Page 31;
            }
            action("Liste des véhicule")
            {
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 60017;
                RunPageMode = View;
                Visible = false;
            }
            action("Ordres de transfert à envoyer")
            {
                RunObject = Page 60149;
                Visible = false;
            }
            action("Ordres de transfert à recevoir")
            {
                RunObject = Page 50024;
                Visible = false;
            }
            action("Liste des écriture préparation")
            {
                RunObject = Page 60145;
                Visible = false;
            }
            action("Liste des préparation VN")
            {
                RunObject = Page 60137;
                Visible = false;
            }
            action("Liste des accesoirs")
            {
                Caption = 'Liste des accesoirs';
                RunObject = Page 60128;
                Visible = false;
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                CaptionML = ENU='Posted Documents',
                            FRA='Documents validés';
                Image = FiledPosted;
                action("Posted Assembly Order")
                {
                    CaptionML = ENU='Posted Assembly Order',
                                FRA='Ordre de transfert validés';
                    Image = PostedOrder;
                    RunObject = Page 922;
                }
                separator()
                {
                }
            }
        }
    }
}

