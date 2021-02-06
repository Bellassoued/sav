table 50014 "Entête Assurance"
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
            TableRelation = "Sou-Famille frais."."Code Famille";

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
            TableRelation = "Sou-Famille frais."."Code Famille";
        }
        field(6;"Date Domiciliation";Date)
        {
            Editable = false;
        }
        field(7;"No. Dossier D'import";Code[20])
        {
            Editable = false;
        }
        field(8;"Code Expédition";Code[30])
        {
            TableRelation = "Expédition par Titre"."No. Document" WHERE (No. Domiciliation=FIELD(No. Domiciliation),
                                                                         Type Document=FILTER(Expédition));

            trigger OnValidate();
            begin
                CLEAR(ExpéditionparTitre);
                ExpéditionparTitre.SETRANGE(ExpéditionparTitre."No. Document","Code Expédition");
                IF ExpéditionparTitre.FIND('-') THEN
                BEGIN
                    "No. Expédition"       := ExpéditionparTitre."No. Expédition";
                    "Date Echéance"        := ExpéditionparTitre."Date Echéance";
                    IF CONFIRM('Ëtes vous sûre de vouloir insérer les Lignes d''expéditions ',TRUE,FALSE) THEN
                    BEGIN
                        LigneDossierDimport.INIT;
                        LigneDossierDimport.SETFILTER(LigneDossierDimport."Type Document",'%1',1);
                        LigneDossierDimport.SETFILTER(LigneDossierDimport."No. Document",'%1',ExpéditionparTitre."No. Document");
                        LigneDossierDimport.FIND('-');
                          REPEAT
                            LigneDossierDimportAss.TRANSFERFIELDS(LigneDossierDimport);
                            LigneDossierDimportAss."Type Document" := 2;
                            LigneDossierDimportAss."No. Document" := "No. Document";
                            LigneDossierDimportAss.INSERT;
                          UNTIL LigneDossierDimport.NEXT = 0;
                       //MESSAGE('Insertion des Lignes Exp. Terminée');
                    END;
                END;
            end;
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
        field(13;"No. Series";Code[30])
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
        field(17;"N° Ordre Facture";Option)
        {
            OptionCaption = '1ère Facture,2 ème Facture,3 ème Facture,4 ème Facture,5 ème Facture,6 ème Facture,7 ème Facture,8 ème Facture,9 ème Facture,10 ème Facture';
            OptionMembers = "1ère Facture","2 ème Facture","3 ème Facture","4 ème Facture","5 ème Facture","6 ème Facture","7 ème Facture","8 ème Facture","9 ème Facture","10 ème Facture";
        }
        field(18;"No.Fournisseur Assurance";Code[30])
        {

            trigger OnValidate();
            begin
                Vendor.GET("No.Fournisseur Assurance");
                "Nom Fournisseur":=Vendor.Name;
            end;
        }
        field(19;"Nom Fournisseur";Code[150])
        {
        }
        field(20;"Montant TTC";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(21;Remarque;Code[100])
        {
        }
        field(22;"Mode Relement";Code[10])
        {
            TableRelation = "Payment Method".Code;
        }
        field(23;"No. Expédition";Option)
        {
            OptionMembers = " ","1ère Expédition","2ème Expédition","3ème Expédition","4ème Expédition","5ème Expédition","6ème Expédition","7ème Expédition","8ème Expédition","9ème Expédition","10ème Expédition";
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
        field(35;"N° facture /Ass";Code[20])
        {
            Editable = true;
        }
        field(36;"Date facture Ass";Date)
        {
        }
    }

    keys
    {
        key(Key1;"Type Document","No. Document","No. Titre D'importation","No. Domiciliation","No. Dossier D'import")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        TESTFIELD(Statut,0);
        CLEAR(LigneDossierDimport);
        LigneDossierDimport.SETFILTER("Type Document",'%1',2);
        LigneDossierDimport.SETFILTER("No. Titre d'importation",'%1',"No. Titre D'importation");
        LigneDossierDimport.SETFILTER("No. Domicilaition",'%1',"No. Domiciliation");
        LigneDossierDimport.SETFILTER("No. Document",'%1',"No. Document");
        IF LigneDossierDimport.FIND('-') THEN
         LigneDossierDimport.DELETEALL;
    end;

    trigger OnInsert();
    begin
        "Type Document" := 2;
        "Date Document" := WORKDATE;
        PurchasesPayablesSetup.GET;
        PurchasesPayablesSetup.TESTFIELD(PurchasesPayablesSetup."No. Demande d'assurance");
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

    local procedure GetNoSeriesCode() : Code[10];
    begin
        EXIT(PurchasesPayablesSetup."No. Demande d'assurance");
    end;
}

