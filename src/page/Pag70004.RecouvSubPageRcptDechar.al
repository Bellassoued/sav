page 70004 "Recouv. Sub Page Rcpt. Dechar."
{
    // version CT16V002

    AutoSplitKey = true;
    Caption = 'Recouvrement Reception Décharge';
    PageType = ListPart;
    SourceTable = Table70001;
    SourceTableView = WHERE(Etape=FILTER(Reception décharge));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Bord. Recouvrement";"No. Bord. Recouvrement")
                {
                }
                field("No. Ligne";"No. Ligne")
                {
                }
                field("No. Facture";"No. Facture")
                {
                }
                field("No. Contrat Leasing";"No. Contrat Leasing")
                {
                }
                field("Date Facture";"Date Facture")
                {
                }
                field("Mnt TTC Facture";"Mnt TTC Facture")
                {
                }
                field("Date Echéance";"Date Echéance")
                {
                    Style = Strong;
                    StyleExpr = true;
                }
                field("Code Client";"Code Client")
                {
                }
                field("Nom Client";"Nom Client")
                {
                }
                field("Address Client";"Address Client")
                {
                }
                field("Déposé par le client";"Déposé par le client")
                {
                }
                field("Code coursier";"Code coursier")
                {
                }
                field("Nom coursier";"Nom coursier")
                {
                }
                field("Réception Décharge";"Réception Décharge")
                {
                }
                field("Date Recep. Decharge";"Date Recep. Decharge")
                {
                }
                field(Reglé;Reglé)
                {
                }
                field(Etape;Etape)
                {
                }
                field("Date reglement";"Date reglement")
                {
                }
                field("Mnt Reglement";"Mnt Reglement")
                {
                }
                field("Ecart date Ech. Regl.";"Ecart date Ech. Regl.")
                {
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Mnt Ouvert";"Mnt Ouvert")
                {
                }
                field(Commentaire;Commentaire)
                {
                }
                field("Pour le compte de";"Pour le compte de")
                {
                }
            }
        }
    }

    actions
    {
    }
}

