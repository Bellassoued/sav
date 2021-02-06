page 60394 "Gestion RDV RC"
{
    // version Gestion RDV

    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group()
            {
                part("Gestion RDV Activity";60397)
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
            action("Liste des Rendez-Vous")
            {
                RunObject = Page 60365;
            }
            action("Liste des Réclamations")
            {
                RunObject = Page 60395;
                Visible = false;
            }
            action("Liste des RDVs Crées")
            {
                RunObject = Page 70300;
            }
            action("Liste des RDVs Confirmés/OR")
            {
                RunObject = Page 60389;
            }
            action("Liste des RDVs à Plannifier")
            {
                RunObject = Page 60390;
                Visible = false;
            }
            action("Liste Planning d'intervention")
            {
                RunObject = Page 60396;
                Visible = false;
            }
            action("Liste des Clients")
            {
                RunObject = Page 22;
            }
            action("Liste des Véhicules")
            {
                RunObject = Page 60066;
            }
            action("Liste des Articles")
            {
                RunObject = Page 31;
            }
        }
        area(processing)
        {
            group(Report)
            {
                Caption = 'Report';
                action("Liste des RDV")
                {
                    RunObject = Report 50101;
                }
            }
        }
        area(sections)
        {
            group("Acceuil CHR-CS")
            {
                Image = ResourcePlanning;
                action("Liste des fiches CHRONO")
                {
                    CaptionML = ENU='<List des Ordres de Réparation CHR>',
                                FRA='List des Ordres de Réparation CHR';
                    RunObject = Page 60015;
                }
            }
            group("Acceuil SAV-CS")
            {
                Image = ResourcePlanning;
                action("Liste des fiches SAV")
                {
                    CaptionML = ENU='<Liste des Ordres de Réparation SAV>',
                                FRA='Liste des Ordres de Réparation SAV';
                    RunObject = Page 60019;
                    RunPageView = WHERE(Service Type=CONST(Big Service));
                }
            }
        }
    }
}

