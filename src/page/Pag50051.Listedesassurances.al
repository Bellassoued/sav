page 50051 "Liste des assurances"
{
    // version ETRANGER

    CardPageID = "Entête assurance";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Table50014;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Type Document";"Type Document")
                {
                }
                field("No. Document";"No. Document")
                {
                }
                field("No. Titre D'importation";"No. Titre D'importation")
                {
                }
                field("Date Titre D'importation";"Date Titre D'importation")
                {
                }
                field("No. Domiciliation";"No. Domiciliation")
                {
                }
                field("Date Domiciliation";"Date Domiciliation")
                {
                }
                field("Code Expédition";"Code Expédition")
                {
                }
                field("N° Ordre Facture";"N° Ordre Facture")
                {
                }
                field("Total en Dinar";"Total en Dinar")
                {
                }
                field("Total en Devise";"Total en Devise")
                {
                }
                field("N° facture /Ass";"N° facture /Ass")
                {
                }
                field("Date facture Ass";"Date facture Ass")
                {
                }
                field(Statut;Statut)
                {
                }
                field("No.Fournisseur Assurance";"No.Fournisseur Assurance")
                {
                }
                field("Nom Fournisseur";"Nom Fournisseur")
                {
                }
                field("Montant TTC";"Montant TTC")
                {
                }
                field(Remarque;Remarque)
                {
                }
                field("Mode Relement";"Mode Relement")
                {
                }
                field("No. Dossier D'import";"No. Dossier D'import")
                {
                }
                field("Date Document";"Date Document")
                {
                }
                field("No. Facture";"No. Facture")
                {
                }
                field("Date Echéance";"Date Echéance")
                {
                }
                field("Cours de douanement";"Cours de douanement")
                {
                }
                field("Crée par";"Crée par")
                {
                }
                field("Crée le";"Crée le")
                {
                }
                field("Modifier par";"Modifier par")
                {
                }
                field("Modifier le";"Modifier le")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Fonction)
            {
                action(Lancer)
                {

                    trigger OnAction();
                    begin
                         TESTFIELD(Statut,0);
                        IF CONFIRM('Ëtes vous sûre de vouloir Lancer ce Document ?',TRUE,FALSE) THEN
                        BEGIN
                        Statut := 1;
                        MODIFY;
                         END;
                    end;
                }
                action("Réouvrir")
                {

                    trigger OnAction();
                    begin
                         TESTFIELD(Statut,1);

                        IF CONFIRM('Ëtes vous sûre de vouloir Réouvrir ce Document ?',TRUE,FALSE) THEN
                        BEGIN
                        Statut := 0;
                        MODIFY
                        END;
                    end;
                }
                action(Valider)
                {

                    trigger OnAction();
                    begin
                         TESTFIELD(Statut,1);


                        IF CONFIRM('Ëtes vous sûre de vouloir Valider ce Document ?',TRUE,FALSE) THEN
                        BEGIN
                        Statut := 2;
                        MODIFY
                        END;
                    end;
                }
                action("Dévalider")
                {

                    trigger OnAction();
                    begin
                         TESTFIELD(Statut,2);


                        IF CONFIRM('Ëtes vous sûre de vouloir Déalider ce Document ?',TRUE,FALSE) THEN
                        BEGIN
                        Statut := 1;
                        MODIFY
                        END;
                    end;
                }
                action("Refusé")
                {

                    trigger OnAction();
                    begin
                        //TESTFIELD(Statut,2);


                        IF CONFIRM('Attention ce document une fois refusé ne peut pas être utilisé une autre fois : Ëtes vous sûre de vouloir Déalider ce Document ?',TRUE,FALSE) THEN
                        BEGIN
                        Statut := 3;
                        MODIFY
                        END;
                    end;
                }
            }
        }
    }
}

