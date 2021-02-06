page 70054 "Ligne financement"
{
    PageType = List;
    SourceTable = Table70044;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Ligne";"No. Ligne")
                {
                    Editable = false;
                }
                field("No. Financement";"No. Financement")
                {
                    Editable = false;
                }
                field("No. Arrivage";"No. Arrivage")
                {
                    Editable = false;
                }
                field("No. L.C";"No. L.C")
                {
                    Editable = false;
                }
                field(Banque;Banque)
                {
                    Editable = false;
                }
                field("Date Création";"Date Création")
                {
                }
                field("Montant Arrivage (Devise)";"Montant Arrivage (Devise)")
                {
                }
                field("Date Echéance";"Date Echéance")
                {
                }
                field("Nb. jours";"Nb. jours")
                {
                }
                field("Cour de financement";"Cour de financement")
                {
                }
                field("Montant Financement";"Montant Financement")
                {
                }
                field("Cour arrivage";"Cour arrivage")
                {
                    Editable = false;
                }
                field("Montant Arrivage (Tnd)";"Montant Arrivage (Tnd)")
                {
                    Editable = false;
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Ecart Arrivage/Financement";"Ecart Arrivage/Financement")
                {
                }
            }
        }
    }

    actions
    {
    }
}

