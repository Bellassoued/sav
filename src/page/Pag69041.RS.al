page 69041 "RS"
{
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group("Activité VN")
            {
                part(;69021)
                {
                }
            }
            group()
            {
                part(;69023)
                {
                }
                part(;69025)
                {
                }
            }
        }
    }

    actions
    {
        area(embedding)
        {
            action("Liste véhicules à préparer")
            {
                RunObject = Page 60133;
            }
            action("Check VIN STATUS")
            {
            }
            action("Liste Carte Grise")
            {
                RunObject = Page 69054;
            }
        }
        area(reporting)
        {
            action("ETAT DE STOCK VN")
            {
                Image = Statistics;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 60114;
            }
            action("Report Stock sur arrivage")
            {
                Caption = 'Report Stock sur arrivage';
                Image = Statistics;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 60118;
            }
            action("Etat des ventes VN par Centre de gestion")
            {
                Caption = 'ventes VN par Centre de gestion';
                Image = WorkCenter;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60096;
            }
            action("Report VENTE VN par centre de gestion par mois")
            {
                Caption = 'VENTE VN par centre de gestion par mois';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60127;
            }
            action("Report VENTE VN par vendeur")
            {
                Caption = 'VENTE VN par vendeur';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60121;
            }
            action("Report VENTE VN par vendeur par mois")
            {
                Caption = 'VENTE VN par vendeur par mois';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report 60126;
            }
            action("Report VENTE VN par modele/date")
            {
                Caption = 'Report VENTE VN par modele/date';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 60139;
            }
            action("Report VENTE VN par centre gest/model")
            {
                Caption = 'Report VENTE VN par centre gest/model';
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report 60122;
            }
        }
    }
}

