page 50069 "Liste Expéditions Titres Imp."
{
    // version ETRANGER

    CardPageID = "Entête Expédition par Titre";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table50013;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Mode Reglement";"Mode Reglement")
                {
                }
                field("No. Titre D'importation";"No. Titre D'importation")
                {
                }
                field("Date Titre D'importation";"Date Titre D'importation")
                {
                }
                field(Banque;Banque)
                {
                }
                field("No. SWIFT";"No. SWIFT")
                {
                }
                field("No. Domiciliation";"No. Domiciliation")
                {
                }
                field("Date Domiciliation";"Date Domiciliation")
                {
                }
                field("No. Dossier D'import";"No. Dossier D'import")
                {
                }
                field("No. Expédition";"No. Expédition")
                {
                }
                field("Date Echéance";"Date Echéance")
                {
                }
                field("Cours de douanement";"Cours de douanement")
                {
                }
                field("Total en Dinar Calc";"Total en Dinar Calc")
                {
                }
                field(Statut;Statut)
                {
                }
                field("Date Réception Confirmée";"Date Réception Confirmée")
                {
                }
                field("Total en Devise";"Total en Devise")
                {
                }
                field("No Bordereau LC";"No Bordereau LC")
                {
                }
                field("Montant LC";"Montant LC")
                {
                }
            }
        }
    }

    actions
    {
    }
}

