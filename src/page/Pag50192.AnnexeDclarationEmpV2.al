page 50192 "Annexe Déclaration Emp V2"
{
    PageType = List;
    SourceTable = Table50120;

    layout
    {
        area(content)
        {
            group()
            {
                field(Annee;Annee)
                {
                    CaptionML = ENU='Année',
                                FRA='Année';
                }
                field(Timestre;Timestre)
                {
                }
            }
            group()
            {
            }
            repeater(Group)
            {
                field("Code Retenue";"Code Retenue")
                {
                }
                field("Source Type";"Source Type")
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
                field("Revenu imposable";"Revenu imposable")
                {
                }
                field("Avantages en nature";"Avantages en nature")
                {
                }
                field("Revenu réinvesti";"Revenu réinvesti")
                {
                }
                field(Année;Année)
                {
                }
                field("% Retenue";"% Retenue")
                {
                }
                field(Annexe;Annexe)
                {
                }
                field("Pos. mnt Brut dans Annexe";"Pos. mnt Brut dans Annexe")
                {
                }
                field("Sous Pos. mnt Brut ds  Annexe";"Sous Pos. mnt Brut ds  Annexe")
                {
                }
                field("Source Situation familiale";"Source Situation familiale")
                {
                }
                field("Source Nb enfants à charge";"Source Nb enfants à charge")
                {
                }
                field("Source Date Début Travail";"Source Date Début Travail")
                {
                }
                field("Source Date Fin Travail";"Source Date Fin Travail")
                {
                }
                field("Source Durée période travail J";"Source Durée période travail J")
                {
                }
                field("Fournisseur Non Payé";"Fournisseur Non Payé")
                {
                }
                field("Montant RCGC";"Montant RCGC")
                {
                }
                field("Montant Contribution conj.";"Montant Contribution conj.")
                {
                }
                field("Mont. Enc. Client Sup";"Mont. Enc. Client Sup")
                {
                }
                field("Montant Base Retenue Autre";"Montant Base Retenue Autre")
                {
                }
                field("Montant Retenue Autre";"Montant Retenue Autre")
                {
                }
                field("No. autorisation";"No. autorisation")
                {
                }
                field("Date autorisation";"Date autorisation")
                {
                }
                field("Taux Fodec";"Taux Fodec")
                {
                }
                field("Montant Fodec";"Montant Fodec")
                {
                }
                field("taux droit Consoommation";"taux droit Consoommation")
                {
                }
                field("Mnt Droit Consommation";"Mnt Droit Consommation")
                {
                }
                field("Type Ligne fichier";"Type Ligne fichier")
                {
                }
                field("N° Séqence";"N° Séqence")
                {
                }
                field("Type Enregistrement";"Type Enregistrement")
                {
                }
                field("Trimestre Dec-Emp";"Trimestre Dec-Emp")
                {
                }
                field("Raison sociale";"Raison sociale")
                {
                }
                field(Activité;Activité)
                {
                }
                field("Matricule Fiscal Entreprise";"Matricule Fiscal Entreprise")
                {
                }
                field("No. Ordre";"No. Ordre")
                {
                }
                field("No. facture";"No. facture")
                {
                }
                field("Date Facture";"Date Facture")
                {
                }
                field("Taux TVA";"Taux TVA")
                {
                }
                field("Mnt TVA";"Mnt TVA")
                {
                }
                field("Nbr Tot Fact";"Nbr Tot Fact")
                {
                }
                field("Tot prix vente";"Tot prix vente")
                {
                }
                field("Total Fodec";"Total Fodec")
                {
                }
                field("Tot Droit Conso";"Tot Droit Conso")
                {
                }
                field("Tot TVA";"Tot TVA")
                {
                }
                field("Date FactureTxt";"Date FactureTxt")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Remplire Annexes")
            {
                Image = Insert;

                trigger OnAction();
                begin
                    IF CONFIRM('ëtes vous sûre de vouloir calculer les annexes',TRUE,FALSE) THEN
                    BEGIN
                    RemplirAnnexesDecEmployeur.ProposerAnnexes(Annee,Timestre);
                    MESSAGE('Traittement terminer');
                    END
                    ELSE
                    MESSAGE('Treittement annulé');
                end;
            }
        }
    }

    var
        Annee : Integer;
        Timestre : Option " ","Trimestre 1","Trimestre 2","Trimestre 3","Trimestre 4",ALL;
        RemplirAnnexesDecEmployeur : Codeunit "50021";
}

