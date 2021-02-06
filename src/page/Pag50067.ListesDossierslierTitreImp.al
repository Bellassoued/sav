page 50067 "Listes Dossiers lier Titre Imp"
{
    // version ETRANGER

    CardPageID = "Transit Folder";
    Editable = false;
    PageType = ListPart;
    Permissions = TableData 38=rimd,
                  TableData 39=rimd;
    SourceTable = Table50000;
    SourceTableView = SORTING(N° Dossier)
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater()
            {
                field("N° Dossier";"N° Dossier")
                {
                }
                field("Nbre Commandes";"Nbre Commandes")
                {
                }
                field("Date d'ouverture";"Date d'ouverture")
                {
                }
                field("Date de clôture";"Date de clôture")
                {
                }
                field("N° Fournisseur";"N° Fournisseur")
                {
                }
                field("Nom fournisseur";"Nom fournisseur")
                {
                }
                field("N° dern Commande";"N° dern Commande")
                {
                }
                field(statut;statut)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        Doss : Page "50018";
}

