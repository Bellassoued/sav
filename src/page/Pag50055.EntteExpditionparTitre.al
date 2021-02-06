page 50055 "Entête Expédition par Titre"
{
    // version ETRANGER

    PageType = Card;
    SourceTable = Table50013;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("Type Document";"Type Document")
                {
                    Editable = false;
                }
                field("No. Document";"No. Document")
                {
                    Editable = false;
                }
                field("No. Titre D'importation";"No. Titre D'importation")
                {
                }
                field(Banque;Banque)
                {
                }
                field("No. SWIFT";"No. SWIFT")
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
                field("No. Facture";"No. Facture")
                {
                    Caption = 'Facture Proformat';
                }
                field("No Facture Fournisseur";"No Facture Fournisseur")
                {
                    Caption = 'No Facture';
                }
                field("No. Expédition";"No. Expédition")
                {
                    Editable = false;
                }
                field("Date Document";"Date Document")
                {
                }
                group()
                {
                    field("No. Dossier D'import";"No. Dossier D'import")
                    {
                    }
                    field("Date Réception Confirmée";"Date Réception Confirmée")
                    {
                    }
                    field("Date Echéance";"Date Echéance")
                    {
                        Caption = 'Date Echéance Confirmé';
                    }
                    field("Cours de douanement";"Cours de douanement")
                    {
                    }
                    field("Total en Devise";"Total en Devise")
                    {
                    }
                    field("Total en Dinar";"Total en Dinar")
                    {
                    }
                }
                field("Total en Dinar Calc";"Total en Dinar Calc")
                {
                }
                field("Total en Devise Calc";"Total en Devise Calc")
                {
                }
                field(Statut;Statut)
                {
                }
                field("No Bordereau LC";"No Bordereau LC")
                {
                }
                field("Montant LC";"Montant LC")
                {
                }
                group(Obligation)
                {
                    Caption = 'Obligation';
                    field("Banque Oblig";"Banque Oblig")
                    {
                    }
                    field("Montant Oblig";"Montant Oblig")
                    {
                    }
                    field("Date échéance Oblig";"Date échéance Oblig")
                    {
                    }
                    field("No Bordereau Oblig";"No Bordereau Oblig")
                    {
                    }
                }
                group(Blocage)
                {
                    Caption = 'Blocage';
                    field("Banque Blocage";"Banque Blocage")
                    {
                    }
                    field("Montant Blocage";"Montant Blocage")
                    {
                    }
                    field("Date échéance Blocage";"Date échéance Blocage")
                    {
                    }
                    field("No Bordereau Blocage";"No Bordereau Blocage")
                    {
                    }
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
            part(;50056)
            {
                SubPageLink = Type Document=FIELD(Type Document),
                              No. Document=FIELD(No. Document),
                              No. Titre d'importation=FIELD(No. Titre D'importation),
                              No. Domicilaition=FIELD(No. Domiciliation);
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Fonction)
            {
                Caption = 'Fonction';
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
                action("Imprimer Expédition")
                {
                    Image = TestReport;
                }
                action("Réouvrir")
                {
                    Image = ReOpen;

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
                separator()
                {
                }
                action("Extraire Ligne Expédition")
                {
                    Image = Receipt;

                    trigger OnAction();
                    var
                        RecPurchRcptHeader : Record "120";
                        RecPurchRcptLine : Record "121";
                        RecTitreDImportation : Record "50011";
                        NoLigne : Integer;
                        RecTitreDimportationToClose : Record "50011";
                    begin
                        /*
                        IF CONFIRM('Etes vous sûre de vouloir Extraire les Lignes Commande ',TRUE,FALSE) THEN
                        BEGIN
                         CLEAR(TitreDimportation);
                         TitreDimportation.SETRANGE("No. Titre D'importation","No. Titre D'importation");
                         TitreDimportation.SETRANGE("N° Domiciliation","No. Domiciliation");
                         IF TitreDimportation.FIND('-') THEN
                          BEGIN
                          CLEAR(LigneTitredimportation) ;
                          LigneTitredimportation.SETFILTER("No. Titre d'importation",'%1',"No. Titre D'importation");
                          IF LigneTitredimportation.FIND('-') THEN
                            REPEAT
                             LigneexpéditionparTitre."Type Document" := 1; //expédition
                             LigneexpéditionparTitre."No. Document"             := "No. Document";
                             LigneexpéditionparTitre."No. Titre d'importation"  := "No. Titre D'importation";
                             LigneexpéditionparTitre."No. Domicilaition"        := "No. Domiciliation";
                             LigneexpéditionparTitre."No. Ligne"                :=  LigneTitredimportation."No. Ligne" ;
                             LigneexpéditionparTitre."Ref. article"              := LigneTitredimportation."Ref. article";
                             LigneexpéditionparTitre."Ref. article Fournisseur" := LigneTitredimportation."Ref. article Fournisseur";
                             LigneexpéditionparTitre."Désignation Article"     := LigneTitredimportation."Désignation Article";
                             LigneexpéditionparTitre."Prix Unitaire"             := LigneTitredimportation."Prix Unitaire";
                             LigneexpéditionparTitre."Prix Unitaire D.S"        := LigneTitredimportation."Prix Unitaire D.S";
                             //--------Calc Reliquet Qunatity
                             ShipedQuantity := 0;
                             CLEAR(LigneexpéditionparTitreTmp);
                             LigneexpéditionparTitreTmp.SETFILTER("No. Titre d'importation",'%1',TitreDimportation."No. Titre D'importation");
                             LigneexpéditionparTitreTmp.SETFILTER("Type Document",'%1',1);
                             LigneexpéditionparTitreTmp.SETFILTER("Ref. article",'%1',LigneTitredimportation."Ref. article");
                        
                             IF LigneexpéditionparTitreTmp.FIND('-') THEN
                              REPEAT
                                ShipedQuantity := ShipedQuantity + LigneexpéditionparTitreTmp.Quantité;  //total des anciens exped. / Item
                              UNTIL LigneexpéditionparTitreTmp.NEXT = 0;
                             LigneexpéditionparTitre.Quantité                     := LigneTitredimportation.Quantité - ShipedQuantity;
                             //MESSAGE('article %1 Quantité %2 ShipedQuantity %3',LigneTitredimportation."Ref. article",LigneTitredimportation.Quantité,ShipedQuantity);
                             LigneexpéditionparTitre."Quantité Origine"           := LigneTitredimportation.Quantité;
                             LigneexpéditionparTitre."Montant Devise"             := LigneTitredimportation."Montant Devise";
                             LigneexpéditionparTitre."Montant TND"                := LigneTitredimportation."Montant TND";
                             IF LigneexpéditionparTitre.Quantité <> 0 THEN
                             LigneexpéditionparTitre.INSERT;
                            UNTIL LigneTitredimportation.NEXT = 0;
                        END;
                        END
                        ELSE
                        MESSAGE('Extraction annulée');
                        */
                        
                        IF CONFIRM('Etes vous sûre de vouloir Extraire les Lignes Commande ',TRUE,FALSE) THEN BEGIN
                          RecTitreDImportation.GET("No. Titre D'importation");
                          RecPurchRcptHeader.RESET;
                          RecPurchRcptHeader.SETRANGE("N° dossier","No. Dossier D'import");
                          IF NOT RecTitreDImportation.Relicat THEN
                            RecPurchRcptHeader.SETRANGE("Order No.",RecTitreDImportation."No. Bon de Commande");
                          NoLigne := 0;
                          IF RecPurchRcptHeader.FINDSET THEN BEGIN
                            REPEAT
                        
                              RecPurchRcptLine.RESET;
                              RecPurchRcptLine.SETRANGE("Document No.",RecPurchRcptHeader."No.");
                              IF RecPurchRcptLine.FINDSET THEN BEGIN
                                REPEAT
                                  LigneexpéditionparTitre."Type Document"            := 1;
                                  LigneexpéditionparTitre."No. Document"             := "No. Document";
                                  LigneexpéditionparTitre."No. Titre d'importation"  := "No. Titre D'importation";
                                  LigneexpéditionparTitre."No. Domicilaition"        := "No. Domiciliation";
                                  LigneexpéditionparTitre."No. Ligne"                := NoLigne + RecPurchRcptLine."Line No.";
                                  LigneexpéditionparTitre."Ref. article"             := RecPurchRcptLine."No.";
                                  LigneexpéditionparTitre."Désignation Article"      := RecPurchRcptLine.Description;
                                  LigneexpéditionparTitre."Prix Unitaire"            := RecPurchRcptLine."Direct Unit Cost";
                                  LigneexpéditionparTitre."Prix Unitaire D.S"        := RecPurchRcptLine."Unit Cost (LCY)";
                                  LigneexpéditionparTitre."N° Expédition"            := RecPurchRcptHeader."No.";
                                  LigneexpéditionparTitre.Quantité                   := RecPurchRcptLine.Quantity;
                                  LigneexpéditionparTitre."Quantité Origine"         := RecPurchRcptLine.Quantity;
                                  LigneexpéditionparTitre."Montant Devise"           := RecPurchRcptLine.Quantity * RecPurchRcptLine."Direct Unit Cost";
                                  LigneexpéditionparTitre."Montant TND"              := RecPurchRcptLine.Quantity * RecPurchRcptLine."Unit Cost (LCY)";
                                  LigneexpéditionparTitre.INSERT;
                                UNTIL RecPurchRcptLine.NEXT = 0;
                              END;
                              NoLigne += 10000000;
                            UNTIL RecPurchRcptHeader.NEXT = 0;
                          END;
                          CALCFIELDS("Total en Dinar Calc","Total en Devise Calc");
                          "Total en Dinar"  := "Total en Dinar Calc";
                          "Total en Devise" := "Total en Devise Calc";
                          MODIFY;
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
                action("Créer Bordereau LC")
                {
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecTitreDimportation : Record "50011";
                        CurrencyExchangeRate : Record "330";
                    begin
                         TESTFIELD("Cours de douanement");
                         TESTFIELD("No Bordereau LC",'');

                         RecTitreDimportation.GET("No. Titre D'importation");

                         RecPaymentClass.GET('DEC-LC2');

                         RecPaymentHeader.INIT;
                         RecPaymentClass.TESTFIELD("Header No. Series");
                         NoSeriesMgt.InitSeries(RecPaymentClass."Header No. Series",'',0D,RecPaymentHeader."No.",RecPaymentHeader."No. Series");
                         RecPaymentHeader.VALIDATE("Payment Class",RecPaymentClass.Code);
                         RecPaymentHeader.VALIDATE("Account Type",RecPaymentClass."Header Account Type");
                         RecPaymentHeader.Suggestions:=RecPaymentClass.Suggestions;
                         RecPaymentHeader."Type Règlement" := FORMAT(RecPaymentClass.Type_Reg);
                         RecPaymentHeader.VALIDATE("Currency Code",RecTitreDimportation.Devise);

                         CurrencyExchangeRate.RESET;
                         CurrencyExchangeRate.SETRANGE("Currency Code",RecTitreDimportation.Devise);
                         CurrencyExchangeRate.FINDLAST;

                         RecPaymentHeader.VALIDATE("Currency Factor",(1/"Cours de douanement")*CurrencyExchangeRate."Exchange Rate Amount");
                         RecPaymentHeader.INSERT(TRUE);

                         RecPaymentLine.INIT;
                         RecPaymentLine.VALIDATE("No.",RecPaymentHeader."No.");
                         RecPaymentLine."Line No." := 10000;
                         RecPaymentLine.VALIDATE(Amount,"Total en Devise");
                         RecPaymentLine.VALIDATE("Account Type",RecPaymentLine."Account Type"::Vendor);
                         RecPaymentLine.VALIDATE("Account No.",RecTitreDimportation."No. Fournisseur");
                         RecPaymentLine.INSERT(TRUE);

                         RecPaymentHeader.VALIDATE("Account Type",RecPaymentHeader."Account Type"::"Bank Account");
                         RecPaymentHeader.VALIDATE("Account No.",RecTitreDimportation.Banque);
                         RecPaymentHeader.VALIDATE("No Titre d'importation","No. Titre D'importation");
                         RecPaymentHeader.VALIDATE("No Expédition","No. Document");
                         RecPaymentHeader.MODIFY(TRUE);

                         VALIDATE("No Bordereau LC",RecPaymentHeader."No.");
                         MODIFY(TRUE);
                    end;
                }
                action("Créer Bordereau OBLIGATION")
                {
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecTitreDimportation : Record "50011";
                        CurrencyExchangeRate : Record "330";
                        PurchasesPayablesSetup : Record "312";
                    begin
                         PurchasesPayablesSetup.GET;
                         TESTFIELD("No Bordereau Oblig",'');
                         TESTFIELD("Banque Oblig");
                         PurchasesPayablesSetup.TESTFIELD("Fournisseur Obligation");
                         TESTFIELD("Montant Oblig");
                         TESTFIELD("Date échéance Oblig");

                         RecTitreDimportation.GET("No. Titre D'importation");

                         RecPaymentClass.GET('OBLIG-CAUT');

                         RecPaymentHeader.INIT;
                         RecPaymentClass.TESTFIELD("Header No. Series");
                         NoSeriesMgt.InitSeries(RecPaymentClass."Header No. Series",'',0D,RecPaymentHeader."No.",RecPaymentHeader."No. Series");
                         RecPaymentHeader.VALIDATE("Payment Class",RecPaymentClass.Code);
                         RecPaymentHeader.VALIDATE("Account Type",RecPaymentClass."Header Account Type");
                         RecPaymentHeader.Suggestions:=RecPaymentClass.Suggestions;
                         RecPaymentHeader."Type Règlement" := FORMAT(RecPaymentClass.Type_Reg);
                         RecPaymentHeader.INSERT(TRUE);

                         RecPaymentLine.INIT;
                         RecPaymentLine.VALIDATE("No.",RecPaymentHeader."No.");
                         RecPaymentLine."Line No." := 10000;
                         RecPaymentLine.VALIDATE(Amount,"Montant Oblig");
                         RecPaymentLine.VALIDATE("Account Type",RecPaymentLine."Account Type"::Vendor);
                         RecPaymentLine.VALIDATE("Account No.",PurchasesPayablesSetup."Fournisseur Obligation");
                         RecPaymentLine.VALIDATE("Due Date","Date échéance Oblig");
                         RecPaymentLine.INSERT(TRUE);

                         RecPaymentHeader.VALIDATE("Account Type",RecPaymentHeader."Account Type"::"Bank Account");
                         RecPaymentHeader.VALIDATE("Account No.","Banque Oblig");
                         RecPaymentHeader.VALIDATE("No Titre d'importation","No. Titre D'importation");
                         RecPaymentHeader.VALIDATE("No Expédition","No. Document");
                         RecPaymentHeader.MODIFY(TRUE);

                         VALIDATE("No Bordereau Oblig",RecPaymentHeader."No.");
                         MODIFY(TRUE);
                    end;
                }
                action("Créer Bordereau BLOCAGE")
                {
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction();
                    var
                        RecTitreDimportation : Record "50011";
                        CurrencyExchangeRate : Record "330";
                        PurchasesPayablesSetup : Record "312";
                        RecBank : Record "270";
                    begin
                         PurchasesPayablesSetup.GET;
                         TESTFIELD("No Bordereau Blocage",'');
                         TESTFIELD("Banque Blocage");
                         PurchasesPayablesSetup.TESTFIELD("Fournisseur Obligation");
                         TESTFIELD("Montant Blocage");
                         TESTFIELD("Date échéance Blocage");

                         RecTitreDimportation.GET("No. Titre D'importation");

                         RecPaymentClass.GET('BLOCAGE');

                         RecPaymentHeader.INIT;
                         RecPaymentClass.TESTFIELD("Header No. Series");
                         NoSeriesMgt.InitSeries(RecPaymentClass."Header No. Series",'',0D,RecPaymentHeader."No.",RecPaymentHeader."No. Series");
                         RecPaymentHeader.VALIDATE("Payment Class",RecPaymentClass.Code);
                         RecPaymentHeader.VALIDATE("Account Type",RecPaymentClass."Header Account Type");
                         RecPaymentHeader.Suggestions:=RecPaymentClass.Suggestions;
                         RecPaymentHeader."Type Règlement" := FORMAT(RecPaymentClass.Type_Reg);
                         RecPaymentHeader.INSERT(TRUE);

                         RecPaymentLine.INIT;
                         RecPaymentLine.VALIDATE("No.",RecPaymentHeader."No.");
                         RecPaymentLine."Line No." := 10000;
                         RecPaymentLine.VALIDATE(Amount,"Montant Blocage");
                         RecPaymentLine.VALIDATE("Account Type",RecPaymentLine."Account Type"::Vendor);
                         RecBank.GET("Banque Blocage");
                         RecPaymentLine.VALIDATE("Account No.",RecBank."Compte Blocage");
                         RecPaymentLine.VALIDATE("Due Date","Date échéance Blocage");
                         RecPaymentLine.INSERT(TRUE);

                         RecPaymentHeader.VALIDATE("Account Type",RecPaymentHeader."Account Type"::"Bank Account");
                         RecPaymentHeader.VALIDATE("Account No.","Banque Blocage");
                         RecPaymentHeader.VALIDATE("No Titre d'importation","No. Titre D'importation");
                         RecPaymentHeader.VALIDATE("No Expédition","No. Document");
                         RecPaymentHeader.MODIFY(TRUE);

                         VALIDATE("No Bordereau Oblig",RecPaymentHeader."No.");
                         MODIFY(TRUE);
                    end;
                }
            }
        }
    }

    var
        TitreDimportation : Record "50011";
        LigneTitredimportation : Record "50012";
        "LigneexpéditionparTitre" : Record "50064";
        "LigneexpéditionparTitreTmp" : Record "50064";
        ShipedQuantity : Decimal;
        RecPaymentClass : Record "10860";
        RecPaymentLine : Record "10866";
        RecPaymentHeader : Record "10865";
        NoSeriesMgt : Codeunit "396";
}

