page 60300 "VN - Transit RC"
{
    // version VN TRANSIT

    CaptionML = ENU='Role Center',
                FRA='Tableau de bord';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part(;60301)
                {
                }
            }
            group()
            {
                systempart(MyNotes;MyNotes)
                {
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Inventaire Entrepôt S/D")
            {
                RunObject = Report 60179;
            }
            action("Inventaire ES Entrepot SD")
            {
                RunObject = Report 60185;
            }
            action("Inventaire VIN LIV Entrepot SD")
            {
                RunObject = Report 60186;
            }
            action("Récap du mouvement annuel")
            {
                RunObject = Report 60182;
            }
        }
        area(embedding)
        {
            action("Liste des vehicules")
            {
                RunObject = Page 5981;
            }
            action("VN Arrivage ADV2")
            {
                RunObject = Page 70280;
            }
            action("Saisie demande d'achats")
            {
                RunObject = Page 50006;
            }
            action("Demandes d'achats réglées")
            {
                RunObject = Page 50118;
            }
            action("Comandes vente VN")
            {
                RunObject = Page 60083;
            }
        }
        area(sections)
        {
            group("Posted Documents")
            {
                CaptionML = ENU='Posted Documents',
                            FRA='Documents validés';
                Image = FiledPosted;
                action("Réceptions Achat Enregistrées")
                {
                    RunObject = Page 7333;
                }
            }
        }
        area(creation)
        {
        }
        area(processing)
        {
        }
    }
}

