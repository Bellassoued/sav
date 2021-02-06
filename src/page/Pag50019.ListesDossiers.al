page 50019 "Listes Dossiers"
{
    // version ETRANGER

    CardPageID = "Transit Folder";
    Editable = false;
    PageType = List;
    Permissions = TableData 38 = rimd,
                  TableData 39 = rimd;
    SourceTable = 50000;
    SourceTableView = SORTING("No Dossier")
                      ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No Dossier"; "No Dossier")
                {
                }
                field("Nbre Commandes"; "Nbre Commandes")
                {
                }
                field("Date d'ouverture"; "Date d'ouverture")
                {
                }
                field("Date de clôture"; "Date de clôture")
                {
                }
                field("N° Fournisseur"; "N° Fournisseur")
                {
                }
                field("Nom fournisseur"; "Nom fournisseur")
                {
                }
                field("N° dern Commande"; "N° dern Commande")
                {
                }
                field("Total Qté."; "Total Qté.")
                {
                }
                field(statut; statut)
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Dossier)
            {
                Caption = 'Dossier';
                action("&Fiche")
                {
                    Caption = '&Fiche';
                    RunObject = Page 50018;
                    RunPageLink = N° Dossier=FIELD(N° Dossier);
                    ShortCutKey = 'Shift+F5';
                }
            }
        }
    }

    var
        Doss : Page "50018";
                   SelectionFilterManagement : Codeunit "46";

    procedure GetSelectionFiltersDossierImport(): Text;
    var
        DossiersTransit: Record "50000";
    begin
        CurrPage.SETSELECTIONFILTER(DossiersTransit);
        EXIT(SelectionFilterManagement.GetSelectionFilterForDossierImport(DossiersTransit));
    end;
}

