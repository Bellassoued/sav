table 70036 "Lettre de crédit L.C"
{
    DrillDownPageID = 70043;
    LookupPageID = 70043;

    fields
    {
        field(1;"Code L.C";Code[20])
        {
        }
        field(2;"Désignation";Text[100])
        {
        }
        field(3;"Date Création";Date)
        {
        }
        field(4;"No. Dossier d'import";Code[20])
        {
            TableRelation = IF (Type Import L.C=CONST(VN)) "Dossiers Transit"."N° Dossier" WHERE (No.L.C=FIELD(Code L.C))
                            ELSE IF (Type Import L.C=CONST(PR)) "Entête Facture P.R / Colis".No.;

            trigger OnValidate();
            begin
                DossiersTransit.RESET;
                DossiersTransit.GET("No. Dossier d'import");
                "Date Dossier" := DossiersTransit."Date d'ouverture";
            end;
        }
        field(5;"Date Dossier";Date)
        {
        }
        field(7;"Quantité";Decimal)
        {
            CalcFormula = Sum("Détail L.C".Quantité WHERE (No. L.C=FIELD(Code L.C)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"Total proforma en Dev";Decimal)
        {
            Description = 'Total proforma en devise';
        }
        field(9;"Total proforma en TND";Decimal)
        {
            Description = 'Total proforma converti en TND';
        }
        field(10;"Taux d'ouverture";Decimal)
        {
            DecimalPlaces = 3:8;

            trigger OnValidate();
            begin
                //KK_240619
                IF "Type Import L.C" = "Type Import L.C"::VN THEN
                  BEGIN
                //END_KK_240619
                    CLEAR(DétailLC);
                    DétailLC.SETFILTER(DétailLC."No. L.C",'%1',Rec."Code L.C");
                    DétailLC.FINDSET;
                    REPEAT
                      DétailLC."Montant Tnd" := DétailLC."Montant Devise" * Rec."Taux d'ouverture";
                      DétailLC.MODIFY;
                    UNTIL DétailLC.NEXT = 0;
                  END;
            end;
        }
        field(11;"Montant L.C Dev";Decimal)
        {
            CalcFormula = Sum("Détail L.C"."Montant Devise" WHERE (No. L.C=FIELD(Code L.C)));
            Description = 'Montant LC ouvert en devise';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12;"Montant L.C Tnd";Decimal)
        {
            CalcFormula = Sum("Détail L.C"."Montant Tnd" WHERE (No. L.C=FIELD(Code L.C),
                                                                Date creation=FIELD(Date Filter)));
            Description = 'Montant LC ouvert en TND selon le cour de jour';
            FieldClass = FlowField;
        }
        field(13;"Date Ultime d'envoi";Date)
        {
        }
        field(14;"Date Validité";Date)
        {

            trigger OnValidate();
            begin

                MoisDateCreationLC := DATE2DMY("Date Création",2);
                MoisDateValiditeLC := DATE2DMY("Date Validité",2);
                "Nbr. mois indivisible Ouv." :=  MoisDateValiditeLC  +(DATE2DMY("Date Validité",3)-DATE2DMY("Date Création",3))*12  - MoisDateCreationLC  +1;


                date2 := "Date Validité"+1;


                MoisEcheanceLC := DATE2DMY("Date Echéance L.C",2);
                MoisDateValiditeLC := DATE2DMY(date2,2);
                "Nbr. mois indivisible Accep." :=  MoisEcheanceLC +(DATE2DMY("Date Echéance L.C",3)-DATE2DMY(date2,3))*12 - MoisDateValiditeLC    +1;
            end;
        }
        field(15;"Type d'import";Option)
        {
            OptionCaption = '" ,P.R,V.N"';
            OptionMembers = " ","P.R","V.N";
        }
        field(16;"Date Echéance L.C";Date)
        {
            Description = 'Date de négociation cour à terme apres 180 jour = date LC + 180 j';
        }
        field(17;"Date Arrivée";Date)
        {
        }
        field(18;Banque;Code[20])
        {
            TableRelation = "Bank Account".No.;

            trigger OnValidate();
            begin
                CLEAR(BankAccount);
                BankAccount.GET(Banque);
                "Nom de la banque" := BankAccount.Name;
            end;
        }
        field(19;"Taux estimatif";Decimal)
        {
            DecimalPlaces = 3:8;
            Description = 'selon la simulation qui sera àvant la création même de la L.C';

            trigger OnValidate();
            begin

                CLEAR(SuiviChargeVIN);
                SuiviChargeVIN.SETFILTER("No. Lettre crédit",'%1',"Code L.C");
                IF SuiviChargeVIN.FIND('-') THEN
                 REPEAT
                    SuiviChargeVIN.VALIDATE("Taux de change estimatif","Taux estimatif");
                    SuiviChargeVIN.MODIFY;
                 UNTIL SuiviChargeVIN.NEXT = 0;
            end;
        }
        field(20;"Mnt simulation douane";Decimal)
        {
            Description = 'selon la simulation qui sera àvant la création même de la L.C';
        }
        field(21;"No. domiciliation";Code[20])
        {
        }
        field(22;"No. Series";Code[10])
        {
        }
        field(23;"Crée par";Code[50])
        {
        }
        field(24;"No. Expédition";Code[20])
        {
        }
        field(25;"Taux de déclaration";Decimal)
        {
            Description = 'Taux de a déclaration';

            trigger OnValidate();
            begin
                "Montant LC-C.D" := "Montant L.C Dev" * "Taux de déclaration";
                "Ecart Mnt LC / Mnt LC-CD" := "Montant LC-C.D" - "Montant LC-C.T";
            end;
        }
        field(26;"Montant LC-C.D";Decimal)
        {
            Description = 'C.D = Cour de douane';
        }
        field(27;"Ecart Mnt LC / Mnt LC-CD";Decimal)
        {
        }
        field(28;"Court à Terme (de simuation)";Decimal)
        {
            DecimalPlaces = 3:8;
            Description = 'apres 180 j';

            trigger OnValidate();
            begin
                "Montant LC-C.T"              := "Montant L.C Dev" * "Court à Terme (de simuation)";
                "Ecart Mnt LC / Mnt LC-CT"    := "Montant L.C Tnd" - "Montant LC-C.T";
                "Ecart Mnt LC-CD / Mnt LC-CT" := "Montant LC-C.D" - "Montant LC-C.T";
            end;
        }
        field(29;"Montant LC-C.T";Decimal)
        {
            Description = 'C.T : Court à terme';
        }
        field(30;"Ecart Mnt LC / Mnt LC-CT";Decimal)
        {
        }
        field(31;"Ecart Mnt LC-CD / Mnt LC-CT";Decimal)
        {
        }
        field(32;"Négociation Court à Terme";Boolean)
        {
        }
        field(33;"Financement devise";Boolean)
        {
        }
        field(34;"Montant ouvert";Decimal)
        {
        }
        field(35;"Date BL";Date)
        {

            trigger OnValidate();
            begin
                 "Date Echéance L.C" := "Date BL"+ 180;
            end;
        }
        field(36;"No. LC / Banque";Code[20])
        {

            trigger OnValidate();
            begin
                //KK_240619
                IF "Type Import L.C" = "Type Import L.C"::VN THEN
                  BEGIN
                //END_KK_240619
                    CLEAR(LigneExpeditionVN);
                    CLEAR(LigneExpedVNGroupeProfor);
                    LigneExpeditionVN.SETFILTER(LigneExpeditionVN."No. L.C",'%1',"Code L.C");
                    LigneExpeditionVN.FIND('-');
                    REPEAT
                      LigneExpeditionVN."No. L.C Banque" := "No. LC / Banque";
                      LigneExpeditionVN.MODIFY;
                    UNTIL LigneExpeditionVN.NEXT = 0;


                    LigneExpedVNGroupeProfor.SETFILTER("No. L.C" ,'%1',"Code L.C");
                    LigneExpedVNGroupeProfor.FIND('-');
                    REPEAT
                      LigneExpedVNGroupeProfor."No. L.C Banque" := "No. LC / Banque";
                      LigneExpedVNGroupeProfor.MODIFY;
                    UNTIL LigneExpedVNGroupeProfor.NEXT = 0;
                END;
            end;
        }
        field(37;Statut;Option)
        {
            OptionCaption = 'Ouvert,Lancer,Clôturer';
            OptionMembers = Ouvert,Lancer,"Clôturer";
        }
        field(38;"Date Filter";Date)
        {
            CaptionML = ENU='Date Filter',
                        FRA='Filtre date';
            FieldClass = FlowFilter;
        }
        field(39;"Nom de la banque";Code[50])
        {
        }
        field(40;"Nbr. mois indivisible Ouv.";Decimal)
        {
        }
        field(41;"Vendor No.";Code[20])
        {
        }
        field(42;"Mnt Tot. Arrivahe Tnd";Decimal)
        {
            CalcFormula = Sum("Détail L.C"."Montant arrivage Tnd" WHERE (No. L.C=FIELD(Code L.C)));
            FieldClass = FlowField;
        }
        field(43;"Mnt Tot. Arrivahe Devise";Decimal)
        {
            CalcFormula = Sum("Détail L.C"."Montant arrivage Devise" WHERE (No. L.C=FIELD(Code L.C)));
            FieldClass = FlowField;
        }
        field(44;"Taux simulation L.C";Decimal)
        {
            DecimalPlaces = 3:8;

            trigger OnValidate();
            begin
                //KK_240619
                IF "Type Import L.C" = "Type Import L.C"::VN THEN
                  BEGIN
                //END_KK_240619
                    CLEAR(DétailLC);
                    DétailLC.SETFILTER(DétailLC."No. L.C",'%1',Rec."Code L.C");
                    DétailLC.FINDSET;
                    REPEAT
                    DétailLC."Montant Tnd" := DétailLC."Montant Devise" * Rec."Taux d'ouverture";
                    DétailLC.CALCFIELDS("Qty Reçu");
                    DétailLC."Montant arrivage Devise" := (DétailLC."Montant Devise"/DétailLC.Quantité)*DétailLC."Qty Reçu";
                    CLEAR(PurchRcptHeader);
                    PurchRcptHeader.SETRANGE("No. L.C","Code L.C");
                    IF PurchRcptHeader.FIND('-') THEN
                      CLEAR(DossiersTransit2);
                    IF DossiersTransit2.GET(PurchRcptHeader."No dossier VN") THEN;
                    DétailLC."Montant arrivage Tnd" := DétailLC."Montant arrivage Devise"*DossiersTransit2."Taux de change déclaration";
                    DétailLC."Qty restante" := DétailLC.Quantité - DétailLC."Qty Reçu";
                    DétailLC.MODIFY;
                    UNTIL DétailLC.NEXT = 0;
                  END;
            end;
        }
        field(45;"Total Charge L.c";Decimal)
        {
            CalcFormula = Sum("Charges LC Vn".Montant WHERE (No. L.C=FIELD(Code L.C)));
            FieldClass = FlowField;
        }
        field(46;Garantie;Boolean)
        {
        }
        field(47;"Payé";Boolean)
        {
        }
        field(48;"Type L.C";Code[20])
        {
            TableRelation = "Type Achat".Code;
        }
        field(49;"Nbr. mois indivisible Accep.";Decimal)
        {
        }
        field(50;Provenance;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(51;"Code devise";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency.Code;
        }
        field(52;"Type Import L.C";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU=' ,VN,PR',
                              FRA=' ,VN,PR';
            OptionMembers = " ",VN,PR;
        }
        field(53;"Montant LC";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'KK_LC_PR';
        }
        field(54;"Montant LC DS";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'KK_LC_PR';
        }
        field(55;"No. titre d'import";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(56;"Date titre d'import";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code L.C")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        CLEAR(DetailLC);
        DetailLC.SETFILTER("No. L.C","Code L.C");
        DetailLC.DELETEALL;
    end;

    trigger OnInsert();
    begin
         PurchasesPayablesSetup.GET;
        IF "Code L.C" = '' THEN
          NoSeriesManagement.InitSeries(PurchasesPayablesSetup."No. L.C",xRec."No. Series","Date Création","Code L.C","No. Series");
        "Date Création" := WORKDATE;
        "Crée par" := USERID;

    end;

    var
        PurchasesPayablesSetup : Record "312";
        NoSeriesManagement : Codeunit "396";
        DossiersTransit : Record "50000";
        "DétailLC" : Record "70037";
        BankAccount : Record "270";
        MoisDateCreationLC : Integer;
        MoisDateValiditeLC : Integer;
        PurchRcptHeader : Record "120";
        DossiersTransit2 : Record "50000";
        LigneExpedVNGroupeProfor : Record "70027";
        LigneExpeditionVN : Record "70034";
        MoisEcheanceLC : Integer;
        date2 : Date;
        SuiviChargeVIN : Record "60092";
        DetailLC : Record "70037";
}

