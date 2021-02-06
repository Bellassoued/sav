page 70038 "Ligne Expédition V.N"
{
    // version new

    PageType = ListPart;
    SourceTable = Table70034;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Expédition";"No. Expédition")
                {
                    Visible = false;
                }
                field("No. Ligne";"No. Ligne")
                {
                    Visible = false;
                }
                field("Code Article";"Code Article")
                {
                }
                field("Code NGP";"Code NGP")
                {
                }
                field("Désignation version";"Désignation version")
                {
                    Caption = 'Désignation Version';
                }
                field("Designation Article";"Designation Article")
                {
                }
                field(Modele;Modele)
                {
                    Visible = false;
                }
                field(Quantité;Quantité)
                {
                }
                field("Qté produite";"Qté produite")
                {
                }
                field("Prix Unitaire (Fob)";"Prix Unitaire (Fob)")
                {
                }
                field("Tot. En Devise (sans Mino)";"Tot. En Devise (sans Mino)")
                {
                    Caption = 'Tot. En Devise (sans Mino)';
                }
                field("Tot. En Devise (avec Mino)";"Tot. En Devise (avec Mino)")
                {
                }
                field("Montant Total minoration";"Montant Total minoration")
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
                field("Taux de change";"Taux de change")
                {
                }
                field("Port de Provenance";"Port de Provenance")
                {
                }
                field("Prix unitaire en TND";"Prix unitaire en TND")
                {
                }
                field("Tot. en TND (Sans Mino)";"Tot. en TND (Sans Mino)")
                {
                }
                field("Tot. en TND (avec Mino)";"Tot. en TND (avec Mino)")
                {
                }
                field("No. proforma";"No. proforma")
                {
                }
                field("No. L.C";"No. L.C")
                {
                }
                field("Mino / VN";"Mino / VN")
                {
                }
                field(Banque;Banque)
                {
                }
                field(Nom;Nom)
                {
                }
                field(Statut;Statut)
                {
                    Visible = false;
                }
                field("No. Commande";"No. Commande")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

