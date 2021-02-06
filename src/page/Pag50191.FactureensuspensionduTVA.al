page 50191 "Facture en suspension du TVA."
{
    // version DEC_FAC_SUS_TVA

    DeleteAllowed = true;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Table50114;

    layout
    {
        area(content)
        {
            group("Filtre période")
            {
                field("Année";Annee)
                {
                    Caption = 'Année';
                }
                field(Trimestre;Trimestre)
                {
                    Caption = 'Trimestre';
                    Editable = true;
                }
            }
            repeater(Group)
            {
                field("N° Facture";"N° Facture")
                {
                    Editable = false;
                }
                field("Code client";"Code client")
                {
                    Editable = false;
                }
                field("Nom client";"Nom client")
                {
                    Editable = false;
                }
                field(Adresse;Adresse)
                {
                }
                field("Date Facture";"Date Facture")
                {
                    Editable = false;
                }
                field(DF10;DF10)
                {
                    Caption = 'Type identifiant du client';
                    Editable = true;
                }
                field(DF11;DF11)
                {
                    Caption = 'Identifiant';
                }
                field(Montant;Montant)
                {
                    Editable = false;
                }
                field("Taux TVA";"Taux TVA")
                {
                    Editable = false;
                }
                field("Montant TVA";"Montant TVA")
                {
                    Editable = false;
                }
                field(DF06;DF06)
                {
                    Caption = 'Trimestre';
                    Editable = false;
                }
                field(Valider;Valider)
                {
                    Editable = false;
                }
                field(Exporté;Exporté)
                {
                    Editable = false;
                }
                field(DF14;DF14)
                {
                    Caption = 'No. Autorisation';
                }
                field(DF15;DF15)
                {
                    Caption = 'Date autorisation';
                }
                field("No. Bon de Commande";"No. Bon de Commande")
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            Caption = 'Générale';
            action("Fiche facture")
            {
                Caption = 'Fiche facture';
                RunObject = Page 60105;
                RunPageLink = No.=FIELD(N° Facture);
            }
            action(UpdateLine)
            {
                Caption = 'Mise à jour';
                Image = RefreshLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Report 50130;
            }
            action(Export)
            {
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    ExportFactureensuspension : XMLport "50033";
                begin
                    /*
                    IF Année = 0 THEN
                      ERROR('Merci de choisir l''année');
                    IF STRLEN(FORMAT(Année)) <> 4 THEN
                      ERROR('Merci de choisir une année valide');
                    
                    IF Trimestre = 0 THEN
                      ERROR('Merci de choisir un trimestre');
                    */
                    //-->HB LE 24/09/2018 : tester le N° d'autorisation  et sa date, doivent être non vides --------------
                    TESTFIELD(DF14);
                    TESTFIELD(DF15);
                    //-->HB LE 24/09/2018 : FIN --------------------------------------------------------------------------
                    
                    CLEAR(ExportFactureensuspension);
                    ExportFactureensuspension.SetPeriodeFiltre(Trimestre,Année);
                    ExportFactureensuspension.RUN;

                end;
            }
        }
    }

    var
        Trimestre : Option " ",T1,T2,T3,T4;
        Annee : Integer;
}

