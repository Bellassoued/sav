page 70040 "Ligne expéd. par provenance"
{
    PageType = ListPart;
    SourceTable = Table70027;

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
                field("Designation Article";"Designation Article")
                {
                }
                field(Quantité;Quantité)
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                }
                field("Qté produite";"Qté produite")
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                }
                field("Tot. En Devise (sans Mino)";"Tot. En Devise (sans Mino)")
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                }
                field("Montant Total minoration";"Montant Total minoration")
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                    Visible = false;
                }
                field("Tot. En Devise (avec Mino)";"Tot. En Devise (avec Mino)")
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                }
                field("Mino / VN";"Mino / VN")
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                    Visible = false;
                }
                field("Port de Provenance";"Port de Provenance")
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                }
                field("Currency Code";"Currency Code")
                {
                }
                field("Taux de change";"Taux de change")
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                }
                field("Tot. en TND (avec Mino)";"Tot. en TND (avec Mino)")
                {
                    Caption = 'Total en TND';
                    Style = Favorable;
                    StyleExpr = LCBanque;
                }
                field("No. proforma";"No. proforma")
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                }
                field(Statut;Statut)
                {
                    Visible = false;
                }
                field(Banque;Banque)
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                }
                field(Nom;Nom)
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                }
                field("No. L.C Banque";"No. L.C Banque")
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                }
                field("No. L.C";"No. L.C")
                {
                    Caption = 'No. L.C Nav';
                    Style = Favorable;
                    StyleExpr = LCBanque;
                }
                field(Commentaire;Commentaire)
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Total Obligation/Mino";"Total Obligation/Mino")
                {
                    Style = Favorable;
                    StyleExpr = LCBanque;
                    Visible = false;
                }
                field("Purch. Order No.";"Purch. Order No.")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        LCBanque := FALSE;
        IF "No. L.C" <> '' THEN LCBanque := TRUE;
    end;

    var
        LCBanque : Boolean;
}

