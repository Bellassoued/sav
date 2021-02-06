table 50013 "Expédition par Titre"
{
    // version ETRANGER

    DrillDownPageID = 50062;
    LookupPageID = 50062;

    fields
    {
        field(1;"Type Document";Option)
        {
            OptionCaption = '" ,Expédition,Assurance,Obligation"';
            OptionMembers = " ","Expédition",Assurance,Obligation;
        }
        field(2;"No. Document";Code[10])
        {
        }
        field(3;"No. Titre D'importation";Code[20])
        {
            Editable = false;
            TableRelation = "Arrivage VN";
        }
        field(4;"Date Titre D'importation";Date)
        {
            Editable = false;
        }
        field(5;"No. Domiciliation";Code[30])
        {
            Editable = false;
        }
        field(6;"Date Domiciliation";Date)
        {
            Editable = false;
        }
        field(7;"No. Dossier D'import";Code[20])
        {
            TableRelation = "Dossiers Transit";
        }
        field(8;"No. Expédition";Option)
        {
            OptionMembers = " ","1ère Expédition","2ème Expédition","3ème Expédition","4ème Expédition","5ème Expédition","6ème Expédition","7ème Expédition","8ème Expédition","9ème Expédition","10ème Expédition";
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
            DecimalPlaces = 4:4;
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
        field(15;"Total en Dinar Calc";Decimal)
        {
            CalcFormula = Sum("Ligne Dossier D'import"."Montant TND" WHERE (Type Document=FIELD(Type Document),
                                                                            No. Document=FIELD(No. Document)));
            DecimalPlaces = 3:3;
            FieldClass = FlowField;
        }
        field(16;"Total en Devise Calc";Decimal)
        {
            CalcFormula = Sum("Ligne Dossier D'import"."Montant Devise" WHERE (Type Document=FIELD(Type Document),
                                                                               No. Document=FIELD(No. Document)));
            FieldClass = FlowField;
        }
        field(30;Statut;Option)
        {
            Editable = false;
            OptionCaption = 'en Attente,Lancé,Valider,Refusé,Annulé';
            OptionMembers = "en Attente","Lancé",Valider,"Refusé","Annulé";
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
        field(47;"No Bordereau LC";Code[20])
        {
            Description = 'SM LC';
            TableRelation = "Payment Header" WHERE (Type Règlement=CONST(LETTREC));
        }
        field(48;"Montant LC";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (No.=FIELD(No Bordereau LC)));
            Description = 'SM LC';
            FieldClass = FlowField;
        }
        field(49;"Total en Dinar";Decimal)
        {
            DecimalPlaces = 3:3;
        }
        field(50;"Total en Devise";Decimal)
        {

            trigger OnValidate();
            begin
                TESTFIELD("Cours de douanement");
                "Total en Dinar" := ROUND(("Total en Devise"*"Cours de douanement")/1000,0.001);
            end;
        }
        field(51;"Date Réception Confirmée";Date)
        {
            Description = 'SM LC';

            trigger OnValidate();
            var
                RecTitreDimportation : Record "50011";
                PaymentTerms : Record "3";
                Calendar : Record "2000000007";
            begin
                RecTitreDimportation.GET("No. Titre D'importation");
                PaymentTerms.GET(RecTitreDimportation."Delai Reglement");
                "Date Echéance" :=  CALCDATE(PaymentTerms."Due Date Calculation","Date Réception Confirmée");

                Calendar."Period Type":= Calendar."Period Type"::Date;
                Calendar."Period Start" := "Date Echéance";
                Calendar.FIND;
                IF (Calendar."Period No." = 6) THEN
                 "Date Echéance" := CALCDATE('+2J',"Date Echéance");

                IF (Calendar."Period No." = 7) THEN
                 "Date Echéance" := CALCDATE('+1J',"Date Echéance");
            end;
        }
        field(52;"Mode Reglement";Code[10])
        {
            CalcFormula = Lookup("Arrivage VN"."Mode Reglement" WHERE (No. Titre D'importation=FIELD(No. Titre D'importation)));
            Description = 'RA';
            FieldClass = FlowField;
            TableRelation = "Payment Method".Code;
        }
        field(53;"No Facture Fournisseur";Code[20])
        {
        }
        field(54;Banque;Code[10])
        {
            CalcFormula = Lookup("Arrivage VN".Banque WHERE (No. Titre D'importation=FIELD(No. Titre D'importation)));
            FieldClass = FlowField;
        }
        field(55;"No. SWIFT";Code[20])
        {
            CalcFormula = Lookup("Arrivage VN"."No. SWIFT" WHERE (No. Titre D'importation=FIELD(No. Titre D'importation)));
            FieldClass = FlowField;
        }
        field(56;"No Bordereau Oblig";Code[20])
        {
            Description = 'SM OBLIG';
            TableRelation = "Payment Header" WHERE (Type Règlement=CONST(LETTREC));
        }
        field(57;"Banque Oblig";Code[20])
        {
            Description = 'SM OBLIG';
            TableRelation = "Bank Account";
        }
        field(58;"Montant Oblig";Decimal)
        {
            Description = 'SM OBLIG';
        }
        field(59;"Date échéance Oblig";Date)
        {
            Description = 'SM OBLIG';
        }
        field(60;"No Bordereau Blocage";Code[20])
        {
            Description = 'SM BLOCAG';
            TableRelation = "Payment Header" WHERE (Type Règlement=CONST(LETTREC));
        }
        field(61;"Banque Blocage";Code[20])
        {
            Description = 'SM BLOCAG';
            TableRelation = "Bank Account";
        }
        field(62;"Montant Blocage";Decimal)
        {
            Description = 'SM BLOCAG';
        }
        field(63;"Date échéance Blocage";Date)
        {
            Description = 'SM BLOCAG';
        }
    }

    keys
    {
        key(Key1;"No. Document")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
         //TESTFIELD(Statut,0);
        CLEAR(LigneDossierDimport);
        LigneDossierDimport.SETFILTER("Type Document",'%1',1);
        //LigneDossierDimport.SETFILTER("No. Titre d'importation",'%1',"No. Titre D'importation");
        //LigneDossierDimport.SETFILTER("No. Domicilaition",'%1',"No. Domiciliation");
        LigneDossierDimport.SETFILTER("No. Document",'%1',"No. Document");
        IF LigneDossierDimport.FIND('-') THEN
         LigneDossierDimport.DELETEALL;
    end;

    trigger OnInsert();
    begin
        "Date Document" := WORKDATE;
        PurchasesPayablesSetup.GET;
        //SM PurchasesPayablesSetup.TESTFIELD(PurchasesPayablesSetup."No. Expédition par Titre");
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
        LigneDossierDimport : Record "50064";

    local procedure GetNoSeriesCode() : Code[10];
    begin
        EXIT(PurchasesPayablesSetup."No. Expédition par Titre");
    end;
}

