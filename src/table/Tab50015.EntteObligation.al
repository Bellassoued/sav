table 50015 "Entête Obligation"
{
    // version ETRANGER

    // 
    // IF "No." = '' THEN BEGIN
    //   TestNoSeries;
    //   NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series","Posting Date","No.","No. Series");
    // END;


    fields
    {
        field(1;"Type Document";Option)
        {
            Editable = false;
            OptionCaption = '" ,Expédition,Assurance,Obligation"';
            OptionMembers = " ","Expédition",Assurance,Obligation;
        }
        field(2;"No. Document";Code[10])
        {
            Editable = false;
        }
        field(3;"No. Titre D'importation";Code[20])
        {
            Editable = true;
            TableRelation = "Arrivage VN"."No. Titre D'importation";

            trigger OnValidate();
            begin
                //TitreDimportation.INIT;
                TitreDimportation.SETRANGE(TitreDimportation."No. Titre D'importation","No. Titre D'importation");
                IF TitreDimportation.FIND('-') THEN
                BEGIN
                 "No. Titre D'importation":= TitreDimportation."No. Titre D'importation";
                 "Date Titre D'importation" := TitreDimportation."Date Titre D'importation";
                 "No. Domiciliation":=TitreDimportation."N° Domiciliation";
                 "Date Domiciliation"  :=TitreDimportation."Date Domiciliation";
                 "No. Dossier D'import" :=TitreDimportation."No. Dossier d'import";
                 "No. Facture"          :=TitreDimportation."N° Facture Proforma";
                  "Cours de douanement":=TitreDimportation."Cours douane";
                CLEAR(EntêteObligation);
                EntêteObligation.SETFILTER(EntêteObligation."No. Titre D'importation",'%1',TitreDimportation."No. Titre D'importation");
                EntêteObligation.SETFILTER(EntêteObligation."No. Domiciliation",'%1',TitreDimportation."N° Domiciliation");
                IF EntêteObligation.FIND('-') THEN
                 REPEAT
                  IF EntêteObligation."1er Expédition"     THEN  "1er Expédition" := TRUE;
                  IF EntêteObligation."2ème Expédition"     THEN  "2ème Expédition" := TRUE;
                  IF EntêteObligation."3ème Expédition"     THEN  "3ème Expédition" := TRUE;
                  IF EntêteObligation."4ème Expédition"     THEN  "4ème Expédition" := TRUE;
                  IF EntêteObligation."5ème Expédition"     THEN  "5ème Expédition" := TRUE;
                  IF EntêteObligation."6ème Expédition"     THEN  "6ème Expédition" := TRUE;
                  IF EntêteObligation."7ème Expédition"     THEN  "7ème Expédition" := TRUE;
                  IF EntêteObligation."8ème Expédition"     THEN  "8ème Expédition" := TRUE;
                  IF EntêteObligation."9ème Expédition"     THEN  "9ème Expédition" := TRUE;
                  IF EntêteObligation."10ème Expédition"    THEN  "10ème Expédition" := TRUE;
                 UNTIL EntêteObligation.NEXT = 0;
                END;
            end;
        }
        field(4;"Date Titre D'importation";Date)
        {
            Editable = false;
        }
        field(5;"No. Domiciliation";Code[30])
        {
            Editable = false;
            TableRelation = "Arrivage VN"."No. Titre D'importation";
        }
        field(6;"Date Domiciliation";Date)
        {
            Editable = false;
        }
        field(7;"No. Dossier D'import";Code[30])
        {
            Editable = false;
        }
        field(8;"Code Obligation";Option)
        {
            OptionCaption = ',1ère Obligation,2ème Obligation,3ème Obligation,4ème Obligation,5ème Obligation,6ème Obligation,7ème Obligation,8ème Obligation,9ème Obligation,10ème Obligation';
            OptionMembers = ,"1ère Obligation","2ème Obligation","3ème Obligation","4ème Obligation","5ème Obligation","6ème Obligation","7ème Obligation","8ème Obligation","9ème Obligation","10ème Obligation";
        }
        field(9;"Date Document";Date)
        {
        }
        field(10;"No. Facture";Code[20])
        {
            Editable = false;
        }
        field(11;"Date Echéance";Date)
        {
        }
        field(12;"Cours de douanement";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(13;"No. Series";Code[10])
        {
            CaptionML = ENU='No. Series',
                        FRA='Souches de n°';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14;"Posting No. Series";Code[10])
        {
            CaptionML = ENU='Posting No. Series',
                        FRA='Souches de n° validation';
            TableRelation = "No. Series";
        }
        field(15;"Total en Dinar";Decimal)
        {
            CalcFormula = Sum("Ligne Dossier D'import"."Montant TND" WHERE (Type Document=FIELD(Type Document),
                                                                            No. Document=FIELD(No. Document)));
            DecimalPlaces = 3:3;
            FieldClass = FlowField;
        }
        field(16;"Total en Devise";Decimal)
        {
            CalcFormula = Sum("Ligne Dossier D'import"."Montant Devise" WHERE (Type Document=FIELD(Type Document),
                                                                               No. Document=FIELD(No. Document)));
            FieldClass = FlowField;
        }
        field(18;"No. Agence";Code[20])
        {

            trigger OnValidate();
            begin
                Vendor.GET("No. Agence");
                "Nom Agence":=Vendor.Name;
            end;
        }
        field(19;"Nom Agence";Code[150])
        {
        }
        field(20;"Bon pour ( en Chiffre)";Decimal)
        {
            DecimalPlaces = 3:3;
            Editable = false;
        }
        field(21;"Montant Principal";Decimal)
        {

            trigger OnValidate();
            begin
                "Bon pour ( en Chiffre)" := 0;
                "Bon pour ( en Chiffre)" := "Montant Principal" + "Montant intérêt";
            end;
        }
        field(22;"Montant intérêt";Decimal)
        {

            trigger OnValidate();
            begin
                "Bon pour ( en Chiffre)" := 0;
                "Bon pour ( en Chiffre)" := "Montant Principal" + "Montant intérêt";
            end;
        }
        field(23;"Mode de Réglement";Code[10])
        {
            TableRelation = "Payment Method".Code;

            trigger OnValidate();
            begin
                //PurchasesPayablesSetup.FIND('-');
                //PurchasesPayablesSetup.TESTFIELD(PurchasesPayablesSetup."Mode reg. Oblig. par défaut");
                //"Mode de Réglement" := PurchasesPayablesSetup."Mode reg. Oblig. par défaut"
            end;
        }
        field(24;"Délai de paiement";Code[10])
        {
            TableRelation = "Payment Terms".Code;

            trigger OnValidate();
            begin
                  IF  "Date dépôt Obligation" <> 0D THEN
                  PaymentTerms.GET("Délai de paiement");
                  "Date Echéance" := CALCDATE(PaymentTerms."Due Date Calculation","Date dépôt Obligation");
            end;
        }
        field(25;Banque;Code[10])
        {
            TableRelation = "Bank Account";

            trigger OnValidate();
            begin
                BankAccount.GET(Banque);
                "Nom Banque" := BankAccount.Name;
            end;
        }
        field(30;Statut;Option)
        {
            Editable = false;
            OptionCaption = 'en Attente,Lancé,Valider,Refusé';
            OptionMembers = "en Attente","Lancé",Valider,"Refusé";
        }
        field(31;"Crée par";Code[30])
        {
            Editable = false;
        }
        field(32;"Crée le";Date)
        {
            Editable = false;
        }
        field(33;"Modifier par";Code[30])
        {
            Editable = false;
        }
        field(34;"Modifier le";Date)
        {
            Editable = false;
        }
        field(35;"1er Expédition";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(EntêteObligation);
                EntêteObligation.SETFILTER(EntêteObligation."No. Document",'<>%1',"No. Document");
                EntêteObligation.SETRANGE(EntêteObligation."No. Titre D'importation","No. Titre D'importation");
                EntêteObligation.SETRANGE(EntêteObligation."No. Domiciliation","No. Domiciliation");
                EntêteObligation.SETRANGE(EntêteObligation."1er Expédition",TRUE);
                IF EntêteObligation.FIND('-') THEN
                 ERROR('Vous ne pouvez pas décocher cette Expédition, elle est déja utilisée');

                IF CONFIRM('Ëtes vous sûre de vouloir insérer les Lignes d''expéditions ',TRUE,FALSE) THEN
                    BEGIN
                        LigneDossierDimport.INIT;
                        ExpéditionparTitre.INIT;
                        ExpéditionparTitre.SETFILTER(ExpéditionparTitre."Type Document",'%1',1);
                        ExpéditionparTitre.SETFILTER(ExpéditionparTitre."No. Titre D'importation",'%1',"No. Titre D'importation");
                        ExpéditionparTitre.SETFILTER(ExpéditionparTitre."No. Domiciliation",'%1',"No. Domiciliation");
                        ExpéditionparTitre.SETFILTER(ExpéditionparTitre."No. Expédition",'%1',1);
                        IF ExpéditionparTitre.FIND('-') THEN
                        BEGIN
                            LigneDossierDimport.SETFILTER(LigneDossierDimport."Type Document",'%1',1);
                            LigneDossierDimport.SETFILTER(LigneDossierDimport."No. Document",'%1',ExpéditionparTitre."No. Document");
                            IF LigneDossierDimport.FIND('-') THEN
                              BEGIN
                              REPEAT
                                LigneDossierDimportAss.TRANSFERFIELDS(LigneDossierDimport);
                                LigneDossierDimportAss."Type Document" := 3;
                                LigneDossierDimportAss."No. Document" := "No. Document";
                                LigneDossierDimportAss."N° Expédition" := ExpéditionparTitre."No. Document";
                                LigneDossierDimportAss.INSERT;
                              UNTIL LigneDossierDimport.NEXT = 0;
                             END
                             ELSE
                             ERROR('Il n''y a pas des lignes d''expéditions');
                        END;
                END;
            end;
        }
        field(36;"2ème Expédition";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(EntêteObligation);
                EntêteObligation.SETFILTER(EntêteObligation."No. Document",'<>%1',"No. Document");
                EntêteObligation.SETRANGE(EntêteObligation."No. Titre D'importation","No. Titre D'importation");
                EntêteObligation.SETRANGE(EntêteObligation."No. Domiciliation","No. Domiciliation");
                EntêteObligation.SETRANGE(EntêteObligation."2ème Expédition",TRUE);
                IF EntêteObligation.FIND('-') THEN
                 ERROR('Vous ne pouvez pas décocher cette Expédition, elle est déja utilisée');

                IF CONFIRM('Ëtes vous sûre de vouloir insérer les Lignes d''expéditions ',TRUE,FALSE) THEN
                    BEGIN
                        LigneDossierDimport.INIT;
                        ExpéditionparTitre.INIT;
                        ExpéditionparTitre.SETFILTER(ExpéditionparTitre."Type Document",'%1',1);
                        ExpéditionparTitre.SETFILTER(ExpéditionparTitre."No. Titre D'importation",'%1',"No. Titre D'importation");
                        ExpéditionparTitre.SETFILTER(ExpéditionparTitre."No. Domiciliation",'%1',"No. Domiciliation");
                        ExpéditionparTitre.SETFILTER(ExpéditionparTitre."No. Expédition",'%1',2);
                        IF ExpéditionparTitre.FIND('-') THEN
                        BEGIN
                          LigneDossierDimportAss1.SETFILTER(LigneDossierDimportAss1."Type Document",'%1',3);
                          LigneDossierDimportAss1.SETFILTER(LigneDossierDimportAss1."No. Document",'%1',"No. Document");
                          IF LigneDossierDimportAss1.FIND('+') THEN
                           BEGIN
                            IF CONFIRM('Vous allez insérer plusieurs expéditions dans une seul obligation, voulez vous continuer ?',TRUE,FALSE) THEN
                            BEGIN
                                  //______________inserer si existe de ligne onligation
                                  LigneDossierDimport.SETFILTER(LigneDossierDimport."Type Document",'%1',1);
                                  LigneDossierDimport.SETFILTER(LigneDossierDimport."No. Document",'%1',ExpéditionparTitre."No. Document");
                                  IF LigneDossierDimport.FIND('-') THEN
                                  BEGIN
                                    REPEAT
                                      LigneDossierDimportAss.TRANSFERFIELDS(LigneDossierDimport);
                                      LigneDossierDimportAss."Type Document" := 3;
                                      LigneDossierDimportAss."No. Document" := "No. Document";
                          LigneDossierDimportTmp.SETFILTER(LigneDossierDimportTmp."Type Document",'%1',3);
                          LigneDossierDimportTmp.SETFILTER(LigneDossierDimportTmp."No. Document",'%1',"No. Document");
                          IF LigneDossierDimportTmp.FIND('+') THEN

                                      LigneDossierDimportAss."No. Ligne" := LigneDossierDimportTmp."No. Ligne" + 10000;
                                      LigneDossierDimportAss."N° Expédition" := ExpéditionparTitre."No. Document";
                                      LigneDossierDimportAss.INSERT;
                                    UNTIL LigneDossierDimport.NEXT = 0;
                                   END

                            END;
                           END
                           ELSE
                           BEGIN
                                  //______________inserer si pas de ligne onligation
                                  LigneDossierDimport.SETFILTER(LigneDossierDimport."Type Document",'%1',1);
                                  LigneDossierDimport.SETFILTER(LigneDossierDimport."No. Document",'%1',ExpéditionparTitre."No. Document");
                                  IF LigneDossierDimport.FIND('-') THEN
                                  BEGIN
                                    REPEAT
                                      LigneDossierDimportAss.TRANSFERFIELDS(LigneDossierDimport);
                                      LigneDossierDimportAss."Type Document" := 3;
                                      LigneDossierDimportAss."No. Document" := "No. Document";
                                      LigneDossierDimportAss."N° Expédition" := ExpéditionparTitre."No. Document";
                                      LigneDossierDimportAss.INSERT;
                                    UNTIL LigneDossierDimport.NEXT = 0;
                                   END
                                   ELSE
                                   ERROR('Il n''y a pas des lignes d''expéditions');
                                   //____________________________end insert
                         END;
                        END;
                END;
            end;
        }
        field(37;"3ème Expédition";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(EntêteObligation);
                EntêteObligation.SETFILTER(EntêteObligation."No. Document",'<>%1',"No. Document");

                EntêteObligation.SETRANGE(EntêteObligation."No. Titre D'importation","No. Titre D'importation");
                EntêteObligation.SETRANGE(EntêteObligation."No. Domiciliation","No. Domiciliation");
                EntêteObligation.SETRANGE(EntêteObligation."3ème Expédition",TRUE);
                IF EntêteObligation.FIND('-') THEN
                 ERROR('Vous ne pouvez pas décocher cette Exoédition, elle est déja utilisée');

                IF CONFIRM('Ëtes vous sûre de vouloir insérer les Lignes d''expéditions ',TRUE,FALSE) THEN
                    BEGIN
                        LigneDossierDimport.INIT;
                        ExpéditionparTitre.INIT;
                        ExpéditionparTitre.SETFILTER(ExpéditionparTitre."Type Document",'%1',1);
                        ExpéditionparTitre.SETFILTER(ExpéditionparTitre."No. Titre D'importation",'%1',"No. Titre D'importation");
                        ExpéditionparTitre.SETFILTER(ExpéditionparTitre."No. Domiciliation",'%1',"No. Domiciliation");
                        ExpéditionparTitre.SETFILTER(ExpéditionparTitre."No. Expédition",'%1',3);
                        IF ExpéditionparTitre.FIND('-') THEN
                        BEGIN
                            LigneDossierDimport.SETFILTER(LigneDossierDimport."Type Document",'%1',1);
                            LigneDossierDimport.SETFILTER(LigneDossierDimport."No. Document",'%1',ExpéditionparTitre."No. Document");
                            IF LigneDossierDimport.FIND('-') THEN
                            BEGIN
                              REPEAT
                                LigneDossierDimportAss.TRANSFERFIELDS(LigneDossierDimport);
                                LigneDossierDimportAss."Type Document" := 3;
                                LigneDossierDimportAss."No. Document" := "No. Document";
                                LigneDossierDimportAss.INSERT;
                              UNTIL LigneDossierDimport.NEXT = 0;
                             END
                             ELSE
                             ERROR('Il n''y a pas des lignes d''expéditions');

                        END;
                END;
            end;
        }
        field(38;"4ème Expédition";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(EntêteObligation);
                EntêteObligation.SETFILTER(EntêteObligation."No. Document",'<>%1',"No. Document");

                EntêteObligation.SETRANGE(EntêteObligation."No. Titre D'importation","No. Titre D'importation");
                EntêteObligation.SETRANGE(EntêteObligation."No. Domiciliation","No. Domiciliation");
                EntêteObligation.SETRANGE(EntêteObligation."4ème Expédition",TRUE);
                IF EntêteObligation.FIND('-') THEN
                 ERROR('Vous ne pouvez pas décocher cette Exoédition, elle est déja utilisée');
            end;
        }
        field(39;"5ème Expédition";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(EntêteObligation);
                EntêteObligation.SETFILTER(EntêteObligation."No. Document",'<>%1',"No. Document");

                EntêteObligation.SETRANGE(EntêteObligation."No. Titre D'importation","No. Titre D'importation");
                EntêteObligation.SETRANGE(EntêteObligation."No. Domiciliation","No. Domiciliation");
                EntêteObligation.SETRANGE(EntêteObligation."5ème Expédition",TRUE);
                IF EntêteObligation.FIND('-') THEN
                 ERROR('Vous ne pouvez pas décocher cette Exoédition, elle est déja utilisée');
            end;
        }
        field(40;"6ème Expédition";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(EntêteObligation);
                EntêteObligation.SETFILTER(EntêteObligation."No. Document",'<>%1',"No. Document");

                EntêteObligation.SETRANGE(EntêteObligation."No. Titre D'importation","No. Titre D'importation");
                EntêteObligation.SETRANGE(EntêteObligation."No. Domiciliation","No. Domiciliation");
                EntêteObligation.SETRANGE(EntêteObligation."6ème Expédition",TRUE);
                IF EntêteObligation.FIND('-') THEN
                 ERROR('Vous ne pouvez pas décocher cette Exoédition, elle est déja utilisée');
            end;
        }
        field(41;"7ème Expédition";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(EntêteObligation);
                EntêteObligation.SETFILTER(EntêteObligation."No. Document",'<>%1',"No. Document");

                EntêteObligation.SETRANGE(EntêteObligation."No. Titre D'importation","No. Titre D'importation");
                EntêteObligation.SETRANGE(EntêteObligation."No. Domiciliation","No. Domiciliation");
                EntêteObligation.SETRANGE(EntêteObligation."7ème Expédition",TRUE);
                IF EntêteObligation.FIND('-') THEN
                 ERROR('Vous ne pouvez pas décocher cette Exoédition, elle est déja utilisée');
            end;
        }
        field(42;"8ème Expédition";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(EntêteObligation);
                EntêteObligation.SETFILTER(EntêteObligation."No. Document",'<>%1',"No. Document");

                EntêteObligation.SETRANGE(EntêteObligation."No. Titre D'importation","No. Titre D'importation");
                EntêteObligation.SETRANGE(EntêteObligation."No. Domiciliation","No. Domiciliation");
                EntêteObligation.SETRANGE(EntêteObligation."8ème Expédition",TRUE);
                IF EntêteObligation.FIND('-') THEN
                 ERROR('Vous ne pouvez pas décocher cette Exoédition, elle est déja utilisée');
            end;
        }
        field(43;"9ème Expédition";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(EntêteObligation);
                EntêteObligation.SETFILTER(EntêteObligation."No. Document",'<>%1',"No. Document");

                EntêteObligation.SETRANGE(EntêteObligation."No. Titre D'importation","No. Titre D'importation");
                EntêteObligation.SETRANGE(EntêteObligation."No. Domiciliation","No. Domiciliation");
                EntêteObligation.SETRANGE(EntêteObligation."9ème Expédition",TRUE);
                IF EntêteObligation.FIND('-') THEN
                 ERROR('Vous ne pouvez pas décocher cette Exoédition, elle est déja utilisée');
            end;
        }
        field(44;"10ème Expédition";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(EntêteObligation);
                EntêteObligation.SETFILTER(EntêteObligation."No. Document",'<>%1',"No. Document");

                EntêteObligation.SETRANGE(EntêteObligation."No. Titre D'importation","No. Titre D'importation");
                EntêteObligation.SETRANGE(EntêteObligation."No. Domiciliation","No. Domiciliation");
                EntêteObligation.SETRANGE(EntêteObligation."10ème Expédition",TRUE);
                IF EntêteObligation.FIND('-') THEN
                 ERROR('Vous ne pouvez pas décocher cette Exoédition, elle est déja utilisée');
            end;
        }
        field(45;"Date dépôt Obligation";Date)
        {

            trigger OnValidate();
            begin
                  IF "Délai de paiement" <> '' THEN
                  PaymentTerms.GET("Délai de paiement");
                  "Date Echéance" := CALCDATE(PaymentTerms."Due Date Calculation","Date dépôt Obligation");
            end;
        }
        field(46;"Nom Banque";Code[100])
        {
        }
    }

    keys
    {
        key(Key1;"Type Document","No. Document")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"No. Document","Code Obligation","No. Dossier D'import","No. Titre D'importation","No. Domiciliation","No. Facture")
        {
        }
    }

    trigger OnDelete();
    begin
        TESTFIELD(Statut,0);
        CLEAR(LigneDossierDimport);
        LigneDossierDimport.SETFILTER("Type Document",'%1',3);
        LigneDossierDimport.SETFILTER("No. Titre d'importation",'%1',"No. Titre D'importation");
        LigneDossierDimport.SETFILTER("No. Domicilaition",'%1',"No. Domiciliation");
        LigneDossierDimport.SETFILTER("No. Document",'%1',"No. Document");
        IF LigneDossierDimport.FIND('-') THEN
         LigneDossierDimport.DELETEALL;
    end;

    trigger OnInsert();
    begin
        "Type Document" := 3;
        "Date Document" := WORKDATE;
        PurchasesPayablesSetup.GET;
        PurchasesPayablesSetup.TESTFIELD(PurchasesPayablesSetup."No. Demande d'obligation");
        IF "No. Document" = '' THEN
         NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series","Date Document","No. Document","No. Series");
        "Crée par" := USERID;
        "Crée le"  := WORKDATE;
    end;

    trigger OnModify();
    begin

        "Modifier par":= USERID;
        "Modifier le"   := WORKDATE;
    end;

    var
        PurchasesPayablesSetup : Record "312";
        NoSeriesMgt : Codeunit "396";
        PurchOrder : Record "38";
        "ExpéditionparTitre" : Record "50013";
        LigneDossierDimport : Record "50064";
        LigneDossierDimportAss : Record "50064";
        Vendor : Record "23";
        TitreDimportation : Record "50011";
        "EntêteObligation" : Record "50015";
        "EntêteAssurance" : Record "50014";
        PaymentTerms : Record "3";
        LigneDossierDimportAss1 : Record "50064";
        LigneDossierDimportTmp : Record "50064";
        BankAccount : Record "270";

    local procedure GetNoSeriesCode() : Code[10];
    begin
        EXIT(PurchasesPayablesSetup."No. Demande d'obligation");
    end;
}

