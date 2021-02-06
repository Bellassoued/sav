page 50061 "Liste Titres Importations"
{
    // version ETRANGER

    CardPageID = "Titre d'importation";
    PageType = List;
    SourceTable = Table50011;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Titre D'importation";"No. Titre D'importation")
                {
                    Editable = false;
                }
                field("Date Titre D'importation";"Date Titre D'importation")
                {
                    Editable = false;
                }
                field("No. Fournisseur";"No. Fournisseur")
                {
                    Editable = false;
                }
                field("Nom Fournisseur";"Nom Fournisseur")
                {
                    Editable = false;
                }
                field("Date réception Prévisionnelle";"Date réception Prévisionnelle")
                {
                }
            }
        }
    }

    actions
    {
    }
}

