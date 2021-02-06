page 50194 "Détail Stock VN à Date"
{
    PageType = List;
    SourceTable = Table50118;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Chassi";"No. Chassi")
                {
                }
                field("No. Article";"No. Article")
                {
                }
                field(Famille;Famille)
                {
                }
                field("Sous-Famille";"Sous-Famille")
                {
                }
                field(Quantité;Quantité)
                {
                }
                field("No. Réception achat";"No. Réception achat")
                {
                }
                field("Date Réception achat";"Date Réception achat")
                {
                }
                field("No. Facture achat";"No. Facture achat")
                {
                }
                field("Date Facture achat";"Date Facture achat")
                {
                }
                field("Code devise facture achat";"Code devise facture achat")
                {
                }
                field("Cout unitaire en devise";"Cout unitaire en devise")
                {
                }
                field("Taux devise facture achat";"Taux devise facture achat")
                {
                }
                field("Coût Unitaire TND Hors Frais";"Coût Unitaire TND Hors Frais")
                {
                }
                field("Total Frais";"Total Frais")
                {
                }
                field("Cout Chassi / Devise Fact. Ach";"Cout Chassi / Devise Fact. Ach")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Taux devise A.T Doss. Import";"Taux devise A.T Doss. Import")
                {
                }
                field("Cout Chassi / Devise A.T";"Cout Chassi / Devise A.T")
                {
                }
                field("No. Dossier d'import";"No. Dossier d'import")
                {
                }
                field("DAte Achat à Terme";"DAte Achat à Terme")
                {
                }
                field("Mois de valoristion";"Mois de valoristion")
                {
                }
                field("Année de valorisation";"Année de valorisation")
                {
                }
                field("Date Début";"Date Début")
                {
                }
                field("Date Fin";"Date Fin")
                {
                }
                field("Entry No.";"Entry No.")
                {
                }
                field(Emplacement;Emplacement)
                {
                    CaptionML = ENU='Bin',
                                FRA='Emplacement';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        Emplacement:='';
        WarehouseEntryG.RESET;
        WarehouseEntryG.SETRANGE("Serial No.","No. Chassi");
        WarehouseEntryG.SETFILTER("Registering Date",'..%1',"Date Fin");
        IF WarehouseEntryG.FINDLAST THEN
          Emplacement:=WarehouseEntryG."Bin Code";
    end;

    var
        WarehouseEntryG : Record "7312";
        Emplacement : Code[20];
}

