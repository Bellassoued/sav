page 50116 "Simuation P.Revient VN"
{
    PageType = List;
    SourceTable = Table60018;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Article";"No. Article")
                {
                }
                field(Désignation;Désignation)
                {
                }
                field(Modèle;Modèle)
                {
                }
                field(Devise;Devise)
                {
                }
                field("Prix C & F";"Prix C & F")
                {
                }
                field("Cours de change Dédouanement";"Cours de change Dédouanement")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Cours de change paiement";"Cours de change paiement")
                {
                }
                field(Contreval;Contreval)
                {
                    Editable = false;
                }
                field(Assurance;Assurance)
                {
                    Editable = false;
                }
                field("Valeur C I F";"Valeur C I F")
                {
                    Editable = false;
                }
                field("Droit Douane";"Droit Douane")
                {
                    Editable = false;
                }
                field(Fodec;Fodec)
                {
                    Editable = false;
                }
                field("T.V.A indic";"T.V.A indic")
                {
                    Editable = false;
                }
                field("R.P.D";"R.P.D")
                {
                    Editable = false;
                }
                field("Frais Généreaux";"Frais Généreaux")
                {
                    Editable = false;
                }
                field("Fraix Fixes";"Fraix Fixes")
                {
                }
                field("Prix de Revient en Douane";"Prix de Revient en Douane")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Prix de Revient de paiement";"Prix de Revient de paiement")
                {
                }
                field("F.Immatriculation";"F.Immatriculation")
                {
                }
                field("Px vente TTC proposé";"Px vente TTC proposé")
                {
                }
                field("Px vente H.T";"Px vente H.T")
                {
                    Editable = false;
                }
                field("T.V.A";"T.V.A")
                {
                    Editable = false;
                }
                field("Montant Marge";"Montant Marge")
                {
                    Editable = false;
                }
                field("Txt Taux Marge";"Txt Taux Marge")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

