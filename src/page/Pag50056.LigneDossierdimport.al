page 50056 "Ligne Dossier d'import"
{
    // version ETRANGER

    PageType = ListPart;
    SaveValues = true;
    SourceTable = Table50064;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("N° Expédition";"N° Expédition")
                {
                }
                field("Type Document";"Type Document")
                {
                    Editable = false;
                    Visible = false;
                }
                field("No. Document";"No. Document")
                {
                    Editable = false;
                    Visible = false;
                }
                field("No. Ligne";"No. Ligne")
                {
                    Editable = false;
                }
                field("No. Titre d'importation";"No. Titre d'importation")
                {
                    Editable = false;
                }
                field("No. Domicilaition";"No. Domicilaition")
                {
                    Editable = false;
                }
                field("Ref. article";"Ref. article")
                {
                    Editable = false;
                }
                field("Désignation Article";"Désignation Article")
                {
                }
                field("Prix Unitaire";"Prix Unitaire")
                {
                }
                field("Prix Unitaire D.S";"Prix Unitaire D.S")
                {
                }
                field(Quantité;Quantité)
                {
                    Editable = false;
                }
                field("Montant Devise";"Montant Devise")
                {
                }
                field("Montant TND";"Montant TND")
                {
                }
            }
        }
    }

    actions
    {
    }
}

