page 69062 "Assemblage VN Activities"
{
    // version NAVW17.10

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9056;

    layout
    {
        area(content)
        {
            Caption = 'Assemblage VN';
            cuegroup("For Release")
            {
                CaptionML = ENU='For Release',
                            FRA='À lancer';
                field("Assemblage - En cours";"Assemblage - En cours")
                {
                    DrillDownPageID = "Assembly Orders";
                }
                field("Assemblage - Lancé";"Assemblage - Lancé")
                {
                    DrillDownPageID = "Assembly Orders";
                }

                actions
                {
                    action("Ordre Assemblage")
                    {
                        CaptionML = ENU='Nouveau Ordre d''assemblage',
                                    FRA='Nouveau Ordre d''assemblage';
                        Image = AssemblyOrder;
                        RunObject = Page 900;
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup(Terminer)
            {
                Caption = 'Terminer';
                field("Assemblage - Terminé";"Assemblage - Terminé")
                {
                    DrillDownPageID = "Posted Assembly Orders";
                }
            }
        }
    }

    actions
    {
    }
}

