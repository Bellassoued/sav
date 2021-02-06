page 50058 "Entête Obligation"
{
    // version ETRANGER

    PageType = Card;
    SourceTable = Table50015;

    layout
    {
        area(content)
        {
            group("Général")
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
                field("No. Dossier D'import";"No. Dossier D'import")
                {
                }
                field("Code Obligation";"Code Obligation")
                {
                }
                field("Total en Dinar";"Total en Dinar")
                {
                }
                field("Total en Devise";"Total en Devise")
                {
                }
                field("Date Echéance";"Date Echéance")
                {
                }
                field(Statut;Statut)
                {
                }
                field("1er Expédition";"1er Expédition")
                {
                }
                field("2ème Expédition";"2ème Expédition")
                {
                }
                field("3ème Expédition";"3ème Expédition")
                {
                }
                field("4ème Expédition";"4ème Expédition")
                {
                }
                field("5ème Expédition";"5ème Expédition")
                {
                }
                field("6ème Expédition";"6ème Expédition")
                {
                }
                field("7ème Expédition";"7ème Expédition")
                {
                }
                field("8ème Expédition";"8ème Expédition")
                {
                }
                field("9ème Expédition";"9ème Expédition")
                {
                }
                field("10ème Expédition";"10ème Expédition")
                {
                }
            }
            part(;50056)
            {
                SubPageLink = Type Document=FIELD(Type Document),
                              No. Document=FIELD(No. Document),
                              No. Domicilaition=FIELD(No. Domiciliation),
                              No. Titre d'importation=FIELD(No. Titre D'importation);
            }
            group(Paiement)
            {
                field("Bon pour ( en Chiffre)";"Bon pour ( en Chiffre)")
                {
                }
                field("Montant Principal";"Montant Principal")
                {
                }
                field("Montant intérêt";"Montant intérêt")
                {
                }
                field("Mode de Réglement";"Mode de Réglement")
                {
                }
                field("Délai de paiement";"Délai de paiement")
                {
                }
                field("Date dépôt Obligation";"Date dépôt Obligation")
                {
                }
                field(Banque;Banque)
                {
                }
                field("Nom Banque";"Nom Banque")
                {
                }
            }
            group("Traçabilité")
            {
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
                    Image = ReleaseDoc;

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
                    Image = reopen;

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
                    Image = PostOrder;

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
                        /*TESTFIELD(Statut,2);
                        
                        
                        IF CONFIRM('Ëtes vous sûre de vouloir Déalider ce Document ?',TRUE,FALSE) THEN
                        BEGIN
                        Statut := 1;
                        MODIFY
                        END;
                         */

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

