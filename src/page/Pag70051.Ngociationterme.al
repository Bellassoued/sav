page 70051 "Négociation à terme"
{
    PageType = List;
    SourceTable = Table70042;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(;'')
                {
                    Style = Favorable;
                }
                field("1er Négociation";"1er Négociation")
                {
                    Editable = false;
                }
                field("No. L.Crédit";"No. L.Crédit")
                {
                    Editable = false;
                }
                field("No. Dossier Vn";"No. Dossier Vn")
                {
                    Editable = false;
                }
                field(banque;banque)
                {
                }
                field("No. Domiciliation";"No. Domiciliation")
                {
                    Editable = false;
                }
                field("No. Projet Expédition";"No. Projet Expédition")
                {
                    Editable = false;
                }
                field("Currency Code";"Currency Code")
                {
                    Editable = false;
                }
                field("Taux du Jour";"Taux du Jour")
                {
                    Editable = false;
                }
                field("Mnt Arrivage /Ct.Jour";"Mnt Arrivage /Ct.Jour")
                {
                }
                field("Montant Arrivage Devise";"Montant Arrivage Devise")
                {
                }
                field("Cour déclaration";"Cour déclaration")
                {
                }
                field("Montant Arrivage TND";"Montant Arrivage TND")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Qté Achat à Terme";"Qté Achat à Terme")
                {
                }
                field("Date de négociation";"Date de négociation")
                {
                }
                field("Taux de change Négocié";"Taux de change Négocié")
                {
                }
                field("Date Echéance";"Date Echéance")
                {
                }
                field("Achat Confirmer";"Achat Confirmer")
                {
                }
                field("Mnt Arrivage / Ct-Négcocié";"Mnt Arrivage / Ct-Négcocié")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Ecart Mnt (Ct-Négos % Ct-Décl)";"Ecart Mnt (Ct-Négos % Ct-Décl)")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Date création";"Date création")
                {
                    Editable = false;
                }
                field("Créer par";"Créer par")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    var
        bo : Boolean;
}

