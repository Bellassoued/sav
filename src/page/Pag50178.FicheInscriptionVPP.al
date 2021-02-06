page 50178 "Fiche Inscription VPP"
{
    // version W H VPP

    // confirmsaisie := FALSE;
    // IF Statut = 0 THEN
    //   BEGIN
    //      confirmsaisie:= CONFIRM('voulez-vous lancer confirmer votre saisie');
    //     IF confirmsaisie = TRUE THEN
    //      Statut := 1 ;
    //      "Lancer par"    := USERID;
    //      "Date de Lancement" := CURRENTDATETIME;
    // 
    //   END

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = Table50112;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("N° Séquence";"N° Séquence")
                {
                    Editable = false;
                }
                field(Statut;Statut)
                {
                    Editable = false;
                }
                field("N° de Reservation";"N° de Reservation")
                {
                    Caption = 'N° d''inscription';
                    Editable = false;
                }
                field("Date d'inscription";"Date d'inscription")
                {
                    Editable = false;
                }
                field("Code vendeur";"Code vendeur")
                {
                }
                field("Nom Prénom Vendeur";"Nom Prénom Vendeur")
                {
                    Editable = false;
                }
                field(Nom;Nom)
                {
                }
                field(Prénom;Prénom)
                {
                }
                field("N° CIN";"N° CIN")
                {
                }
                field(Profission;Profission)
                {
                    Caption = 'Profession';
                }
                field("Etat Civil";"Etat Civil")
                {
                }
                field(Adresse;Adresse)
                {
                }
                field("Code Postal";"Code Postal")
                {
                }
                field("N° Téléphone";"N° Téléphone")
                {
                }
                field("N° Téléphone 2";"N° Téléphone 2")
                {
                }
                field("N° de Fax";"N° de Fax")
                {
                }
                field("Adresse Mail";"Adresse Mail")
                {
                }
                field(Recommandation;Recommandation)
                {
                }
                field("Date confirmation";"Date confirmation")
                {
                    Editable = false;
                }
            }
            group("Imformation Conjoint")
            {
                field("Nom Conjoint";"Nom Conjoint")
                {
                }
                field("Prénon Conjoint";"Prénon Conjoint")
                {
                }
                field("N° CIN Conjoint";"N° CIN Conjoint")
                {
                }
                field("Profission du conjoint";"Profission du conjoint")
                {
                    Caption = 'Profession du conjoint';
                }
            }
            group("Document demandés")
            {
                field("Attestation de travail";"Attestation de travail")
                {
                }
                field("Attestation de travail conjoin";"Attestation de travail conjoin")
                {
                    Caption = 'Attestation de travail conjoint';
                }
                field("Photocopie C.I.N";"Photocopie C.I.N")
                {
                }
                field("Photocopie C.I.N Conjoint";"Photocopie C.I.N Conjoint")
                {
                }
                field("Quittance des Impôts";"Quittance des Impôts")
                {
                }
                field("Quittance des Impôts Conjoint";"Quittance des Impôts Conjoint")
                {
                }
                field("Extrait de naissance(célib.)";"Extrait de naissance(célib.)")
                {
                    Caption = 'Extrait de naissance';
                }
                field("Extrait de naissance conjoint";"Extrait de naissance conjoint")
                {
                }
                field("Retenu à la source";"Retenu à la source")
                {
                }
                field("Retenu à la source conjoit";"Retenu à la source conjoit")
                {
                    Caption = 'Retenu à la source conjoint';
                }
                field(Patente;Patente)
                {
                }
                field("Patente conjoint";"Patente conjoint")
                {
                }
                field("Déclaration d'impôt";"Déclaration d'impôt")
                {
                }
                field("Déclaration d'impôt conjoint";"Déclaration d'impôt conjoint")
                {
                }
                field("Décl d'honneur pas travailler";"Décl d'honneur pas travailler")
                {
                    Caption = 'Décl d''honneur de ne pas travailler';
                }
                field("Décl d'honneur pas trav conjoi";"Décl d'honneur pas trav conjoi")
                {
                    Caption = 'Décl d''honneur de ne pas travailler conjoint';
                }
            }
            group("Détails GL")
            {
                field("Dossier Complet";"Dossier Complet")
                {
                }
                field("Vente Confirmée";"Vente Confirmée")
                {
                }
                field("Date Démission de Bordereau";"Date Démission de Bordereau")
                {
                    Caption = 'Date du Bordereau';
                }
                field("N° d'Autorisation";"N° d'Autorisation")
                {
                }
                field("Date d'Autorisation";"Date d'Autorisation")
                {
                }
                field("Motif Rejet";"Motif Rejet")
                {
                    Caption = 'Rejet';
                }
                field("Déscription Rejet";"Déscription Rejet")
                {
                }
                field("Créer par";"Créer par")
                {
                    Editable = false;
                }
                field("Date Création";"Date Création")
                {
                    Editable = false;
                }
                field("Confirmation Reser.par";"Confirmation Reser.par")
                {
                    Enabled = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(;Outlook)
            {
            }
            systempart(;Notes)
            {
            }
            systempart(;MyNotes)
            {
            }
            systempart(;Links)
            {
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group()
            {
                action("Confirmation de reservation")
                {

                    trigger OnAction();
                    begin
                        confirmsaisie := FALSE;
                        //IF Statut = 0 THEN
                        //  BEGIN
                             confirmsaisie:= CONFIRM('voulez-vous confirmer la reservation votre saisie');
                            IF confirmsaisie = TRUE THEN
                              BEGIN
                                 IF "N° de Reservation" = '' THEN
                                    BEGIN
                                       UserSetup.GET(USERID);
                                       ProfilReglement.SETRANGE("Code Profil",UserSetup."Profil Réglement");
                                       ProfilReglement.SETRANGE(Coffre,UserSetup."Filtre coffre");
                                       ProfilReglement.SETRANGE("Centre de Gestion",UserSetup."Tréso Resp. Ctr. Filter");
                                       ProfilReglement.FINDFIRST;

                                      SalesSetup.GET;
                                      SalesSetup.TESTFIELD("Souche N° Réservation VPP");
                                      NoSeriesMgt.InitSeries(SalesSetup."Souche N° Réservation VPP",xRec."No. Reservation",0D,"N° de Reservation","No. Reservation");

                                      //Création Bord. Encai frais dossier
                                      PaymentClass.GET('ENC-INSCP');
                                      PaymentClass.TESTFIELD("Header No. Series");
                                      RecPaymentHeader.INIT;

                                      NoSeriesMgt.InitSeries(PaymentClass."Header No. Series",'',0D,RecPaymentHeader."No.",RecPaymentHeader."No. Series");
                                      RecPaymentHeader.VALIDATE("Payment Class",PaymentClass.Code);

                                      RecPaymentHeader.Suggestions:=PaymentClass.Suggestions;
                                      RecPaymentHeader.VALIDATE("Posting Date",WORKDATE);
                                      RecPaymentHeader.VALIDATE("Status No.",10000);
                                      RecPaymentHeader."Account Type" := RecPaymentHeader."Account Type"::"Bank Account";
                                      RecPaymentHeader.VALIDATE("Account No.",ProfilReglement."CaisseRecette par défaut");
                                      RecPaymentHeader.INSERT(TRUE);

                                      MESSAGE('%1',RecPaymentHeader."No.");

                                      PaymentLine."No."           :=  RecPaymentHeader."No.";
                                      PaymentLine."Line No."      := 10000;
                                      PaymentLine."Account Type"  := PaymentLine."Account Type"::Customer;
                                      PaymentLine.VALIDATE("Account No.",'CL012939');
                                      PaymentLine.VALIDATE("Payment Class",PaymentClass.Code);
                                      PaymentLine.VALIDATE("Status No.",10000);
                                      PaymentLine.VALIDATE(Amount,5);
                                      PaymentLine."External Document No." := "N° de Reservation";
                                      PaymentLine.Libellé := Nom + ' ' + Prénom + ' '+ "N° CIN";
                                      PaymentLine.INSERT(TRUE);

                                      Statut := 1;
                                      "Confirmation Reser.par" := USERID;
                                      "Date confirmation":= CURRENTDATETIME;
                                      "Date d'inscription" := WORKDATE;
                                      "No. Bord Lié" := RecPaymentHeader."No.";

                                      CurrPage.EDITABLE := FALSE;
                                      CurrPage.UPDATE;
                                    END
                                  ELSE
                                    ERROR(' Veuillez contacter votre administrateur sytème: Fiche déja confirmée !');
                              END

                         // END
                    end;
                }
                action("Annuler Reservation")
                {

                    trigger OnAction();
                    begin
                        confirmsaisie := FALSE;

                        IF Statut = 1 THEN
                          BEGIN
                             confirmsaisie:= CONFIRM('voulez-vous annuler la confirmation de votre saisie');
                            IF confirmsaisie = TRUE THEN
                              BEGIN
                                Statut := 0;
                                CurrPage.EDITABLE := FALSE;
                                CurrPage.UPDATE;
                              END
                          END
                         ELSE
                         ERROR('Le champ Statut doit etre vide');
                    end;
                }
                action(Print)
                {
                    Caption = '&Imprimer';
                    Ellipsis = true;
                    Image = Print;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;

                    trigger OnAction();
                    begin
                        TESTFIELD("N° de Reservation");
                        CLEAR(FicheSignaletiqueVPP);
                        //VoiturePopulaireP := Rec;
                        VoiturePopulaireP.RESET;
                        VoiturePopulaireP.SETRANGE("N° Séquence","N° Séquence");
                        VoiturePopulaireP.FINDFIRST;
                        FicheSignaletiqueVPP.SETTABLEVIEW(VoiturePopulaireP);
                        FicheSignaletiqueVPP.RUN;
                        //CurrPage.SETSELECTIONFILTER(VoiturePopulaireP);
                        //OLD SalesCrMemoHeader.PrintRecords(TRUE);
                        //REPORT.RUN(50123,TRUE,TRUE,VoiturePopulaireP);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        IF Statut = 1 THEN
           BEGIN
           CurrPage.EDITABLE := FALSE;
           END
        ELSE
           BEGIN
           CurrPage.EDITABLE := TRUE;
           END
        //CurrPage.UPDATE;
    end;

    var
        confirmsaisie : Boolean;
        SalesSetup : Record "311";
        NoSeriesMgt : Codeunit "396";
        VoiturePopulaireP : Record "50112";
        FicheSignaletiqueVPP : Report "50123";
        PaymentClass : Record "10860";
        RecPaymentHeader : Record "10865";
        PaymentLine : Record "10866";
        UserSetup : Record "91";
        ProfilReglement : Record "70031";
}

