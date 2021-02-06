page 69034 "Annexe"
{
    // version KK&RS DEC EMP V2015

    PageType = List;
    SourceTable = Table60066;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Type Ligne Decl. Emp.";"Type Ligne Decl. Emp.")
                {
                }
                field("Code Retenue";"Code Retenue")
                {
                }
                field("Source Type Annxes";"Source Type Annxes")
                {
                }
                field("Code Ligne Recap";"Code Ligne Recap")
                {
                }
                field("Source No.";"Source No.")
                {
                }
                field("Source Name";"Source Name")
                {
                }
                field("Source Type ID";"Source Type ID")
                {
                }
                field("Source ID";"Source ID")
                {
                }
                field("Source Activité";"Source Activité")
                {
                }
                field("Source Adresse";"Source Adresse")
                {
                }
                field("Source Sous Type";"Source Sous Type")
                {
                }
                field("Montant Base Retenue";"Montant Base Retenue")
                {
                }
                field("Montant Retenue";"Montant Retenue")
                {
                }
                field("Montant Net Servis";"Montant Net Servis")
                {
                }
                field("Montant Ristournes";"Montant Ristournes")
                {
                }
                field("Montants ventes PP reg forf";"Montants ventes PP reg forf")
                {
                }
                field("avances sur ventes PP reg forf";"avances sur ventes PP reg forf")
                {
                }
                field("Revenu Imposable";"Revenu Imposable")
                {
                }
                field("Avantages en nature";"Avantages en nature")
                {
                }
                field("Revenu Réinvesti";"Revenu Réinvesti")
                {
                }
                field("Montant Retenue Régime commun";"Montant Retenue Régime commun")
                {
                }
                field("Total retenue 20%";"Total retenue 20%")
                {
                }
                field("Total redevances caisse compen";"Total redevances caisse compen")
                {
                }
                field("Total Contribution Conjoncture";"Total Contribution Conjoncture")
                {
                }
                field("Montant Recouvers en Especes";"Montant Recouvers en Especes")
                {
                }
                field("Date Quittance";"Date Quittance")
                {
                }
                field("Num Quittance";"Num Quittance")
                {
                }
                field("Admin Fiscale";"Admin Fiscale")
                {
                }
                field("% Retenue";"% Retenue")
                {
                }
                field("Pos. mnt Brut dans Annexe";"Pos. mnt Brut dans Annexe")
                {
                }
                field("Sous Pos. mnt Brut ds  Annexe";"Sous Pos. mnt Brut ds  Annexe")
                {
                }
                field("Situation familiale";"Situation familiale")
                {
                }
                field("Nb enfants à charge";"Nb enfants à charge")
                {
                }
                field("Date Début Travail";"Date Début Travail")
                {
                }
                field("Date Fin Travail";"Date Fin Travail")
                {
                }
                field("Durée période travail J";"Durée période travail J")
                {
                }
                field(Année;Année)
                {
                }
                field(Archivé;Archivé)
                {
                }
                field("Type montants payés";"Type montants payés")
                {
                }
                field("montants payés";"montants payés")
                {
                }
                field("Retenue à la source";"Retenue à la source")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Calcul Declaration")
            {
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    CalculDecEmp : Report "50015";
                begin
                    CalculDecEmp.RUN;
                    CurrPage.UPDATE;
                end;
            }
        }
    }
}

