page 69085 "Listes Dossiers VN"
{
    // version ETRANGER

    CardPageID = "Transit d'import VN";
    Editable = false;
    PageType = List;
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
                field("No. Réception Achat VN";"No. Réception Achat VN")
                {
                }
                field("No.L.C";"No.L.C")
                {
                }
                field("No. LC Banque";"No. LC Banque")
                {
                }
                field("Banque LC";"Banque LC")
                {
                }
                field("Total Qté.";"Total Qté.")
                {
                }
                field("Dernier cours négocié";"Dernier cours négocié")
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

    procedure GetSelectionFiltersDossierImport() : Text;
    var
        DossiersTransit : Record "50000";
    begin
        CurrPage.SETSELECTIONFILTER(DossiersTransit);
        EXIT(SelectionFilterManagement.GetSelectionFilterForDossierImport(DossiersTransit));
    end;
}

