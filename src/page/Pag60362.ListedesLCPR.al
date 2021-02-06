page 60362 "Liste des LC PR."
{
    CardPageID = "Fiche LC PR.";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table70036;
    SourceTableView = WHERE(Type Import L.C=FILTER(PR));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code L.C";"Code L.C")
                {
                }
                field(Désignation;Désignation)
                {
                }
                field(Banque;Banque)
                {
                }
                field("Nom de la banque";"Nom de la banque")
                {
                }
                field("Code devise";"Code devise")
                {
                }
                field("No. Dossier d'import";"No. Dossier d'import")
                {
                }
                field("Date Echéance L.C";"Date Echéance L.C")
                {
                }
                field("Date Validité";"Date Validité")
                {
                }
                field("Taux estimatif";"Taux estimatif")
                {
                }
                field("Date Création";"Date Création")
                {
                }
                field("Crée par";"Crée par")
                {
                }
                field("No. domiciliation";"No. domiciliation")
                {
                }
                field("Montant L.C Dev";"Montant L.C Dev")
                {
                }
                field("Montant L.C Tnd";"Montant L.C Tnd")
                {
                }
                field("Mnt Tot. Arrivahe Tnd";"Mnt Tot. Arrivahe Tnd")
                {
                }
                field("Mnt Tot. Arrivahe Devise";"Mnt Tot. Arrivahe Devise")
                {
                }
                field("No. LC / Banque";"No. LC / Banque")
                {
                }
                field("No. titre d'import";"No. titre d'import")
                {
                }
                field("Date titre d'import";"Date titre d'import")
                {
                }
                field(Statut;Statut)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    begin
        //CurrPage.UPDATE;
    end;

    trigger OnAfterGetRecord();
    begin
        //CurrPage.UPDATE;
    end;

    trigger OnOpenPage();
    begin
        //CurrPage.UPDATE;
    end;
}

