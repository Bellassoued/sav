table 70033 "Entêt Expédition VN"
{
    // version new

    LookupPageID = 70039;

    fields
    {
        field(1;"No. Expédition";Code[20])
        {
        }
        field(2;"Désignation";Code[200])
        {
        }
        field(3;"Date Création";Date)
        {
            Editable = false;
        }
        field(4;"crée par";Code[50])
        {
            Editable = false;
        }
        field(8;"Total minoration";Decimal)
        {
            CalcFormula = Sum("Ligne Expéd. VN /Provenance"."Montant Total minoration" WHERE (No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(9;"Total Mino / VN";Decimal)
        {
            CalcFormula = Sum("Ligne Expéd. VN /Provenance"."Mino / VN" WHERE (No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(10;MARSEILLE;Integer)
        {
            CalcFormula = Count("Ligne Expéd. VN détaillée" WHERE (MARSEILLE=FILTER(Yes),
                                                                   No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(11;BORUSAN;Integer)
        {
            CalcFormula = Count("Ligne Expéd. VN détaillée" WHERE (BORUSAN=FILTER(Yes),
                                                                   No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(12;BARCELONE;Integer)
        {
            CalcFormula = Count("Ligne Expéd. VN détaillée" WHERE (BARCELONE=FILTER(Yes),
                                                                   No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(13;BOUZAS;Integer)
        {
            CalcFormula = Count("Ligne Expéd. VN détaillée" WHERE (BOUZAS=FILTER(Yes),
                                                                   No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(14;"Pourcentage Mino / VN";Decimal)
        {
        }
        field(15;"No. Series";Code[10])
        {
        }
        field(16;Statut;Option)
        {
            OptionCaptionML = ENU=' ,Lancer,Ouvert,valider',
                              FRA='Ouvert ,Lancer,valider';
            OptionMembers = "Ouvert ",Lancer,valider;
        }
        field(17;"No. Fournisseur";Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate();
            begin
                RecVendor.GET("No. Fournisseur");
                "Nom Fournisseur" := RecVendor.Name;
                "Currency Code" := RecVendor."Currency Code";
                //KT 30122018 VALIDATE("Currency Factor");
            end;
        }
        field(18;"Nom Fournisseur";Text[80])
        {
        }
        field(19;"No. Commande Achat";Code[20])
        {
            TableRelation = "Purchase Header".No. WHERE (Document Type=CONST(Order),
                                                         No. Expédition=FIELD(No. Expédition));
        }
        field(20;"No. Arrivage";Code[20])
        {
            TableRelation = "Arrivage VN" WHERE (No. Expedition=FIELD(No. Expédition));
        }
        field(21;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            TableRelation = Currency;
        }
        field(22;"Currency Factor";Decimal)
        {
            CaptionML = ENU='Currency Factor',
                        FRA='Facteur devise';
            DecimalPlaces = 3:8;

            trigger OnValidate();
            begin
                IF "Currency Code" <> '' THEN BEGIN
                  IF "Date Création" <> 0D THEN
                    CurrencyDate := "Date Création"
                  ELSE
                    CurrencyDate := WORKDATE;

                  "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate,"Currency Code");
                END ELSE
                  "Currency Factor" := 0;

                "Taux de change" := 1/"Currency Factor";
                "Taux Simulation" := 1/"Currency Factor";
            end;
        }
        field(23;"No. Dossier";Code[20])
        {
            TableRelation = "Dossiers Transit";
        }
        field(24;"No. L.C";Code[20])
        {
        }
        field(25;"Taux Simulation";Decimal)
        {
        }
        field(26;"Taux de change";Decimal)
        {
        }
        field(27;"No. Simulation";Code[20])
        {
        }
        field(28;"Expéd Finale";Boolean)
        {
        }
        field(29;"Total Qté Expéd.";Decimal)
        {
            CalcFormula = Sum("Ligne Expéd. VN /Provenance".Quantité WHERE (No. Expédition=FIELD(No. Expédition)));
            FieldClass = FlowField;
        }
        field(30;"Tot. En Devise (sans Mino)";Decimal)
        {
            CalcFormula = Sum("Ligne Expéd. VN /Provenance"."Tot. En Devise (sans Mino)" WHERE (No. Expédition=FIELD(No. Expédition)));
            Description = 'Total Val en devise sans mino';
            FieldClass = FlowField;

            trigger OnValidate();
            begin
                /*GetEntêtExpéditionVN;
                Currency.InitRoundingPrecision;
                IF RecEntêtExpéditionVN."Currency Code" <> '' THEN
                  "Tot. en TND (Sans Mino)" := RecEntêtExpéditionVN."Taux de change"*"Tot. En Devise (sans Mino)"
                   { ROUND(
                      CurrencyExchangeRate.ExchangeAmtFCYToLCY(
                        WORKDATE,"Currency Code",
                        "Valeur  En Devise",RecEntêtExpéditionVN."Currency Factor"),
                      Currency."Amount Rounding Precision")}
                ELSE
                  "Tot. en TND (Sans Mino)" :=
                    ROUND("Tot. En Devise (sans Mino)",Currency."Amount Rounding Precision");
                */

            end;
        }
        field(31;"Tot. en TND (Sans Mino)";Decimal)
        {
            CalcFormula = Sum("Ligne Expéd. VN /Provenance"."Tot. en TND (avec Mino)" WHERE (No. Expédition=FIELD(No. Expédition)));
            Description = 'Total TND sans mino';
            Enabled = false;
            FieldClass = FlowField;
        }
        field(32;"Tot. en TND (avec Mino)";Decimal)
        {
            CalcFormula = Sum("Ligne Expéd. VN /Provenance"."Tot. en TND (avec Mino)" WHERE (No. Expédition=FIELD(No. Expédition)));
            Description = 'Total TND (prix fob+option+couleur+garnissage) - Total Minoraio(unitaire+animation)';
            FieldClass = FlowField;
        }
        field(33;"Tot. En Devise (avec Mino)";Decimal)
        {
            CalcFormula = Sum("Ligne Expéd. VN /Provenance"."Tot. En Devise (avec Mino)" WHERE (No. Expédition=FIELD(No. Expédition)));
            Description = 'Total Val en devise avec  mino';
            FieldClass = FlowField;

            trigger OnValidate();
            begin
                /*GetEntêtExpéditionVN;
                Currency.InitRoundingPrecision;
                IF RecEntêtExpéditionVN."Currency Code" <> '' THEN
                  "Tot. en TND (avec Mino)" := RecEntêtExpéditionVN."Taux de change"*"Tot. En Devise (avec Mino)"
                    {ROUND(
                      CurrencyExchangeRate.ExchangeAmtFCYToLCY(
                        WORKDATE,"Currency Code",
                        "Valeur Net En Devise",RecEntêtExpéditionVN."Currency Factor"),
                      Currency."Amount Rounding Precision")}
                ELSE
                  "Tot. en TND (avec Mino)" :=
                    ROUND("Tot. En Devise (sans Mino)",Currency."Amount Rounding Precision");
                */

            end;
        }
        field(34;"Vendor Invoice No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'KT 22112018';
        }
    }

    keys
    {
        key(Key1;"No. Expédition")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        "LigneExpédVNGroupéProfor" : Record "70027";
        PurchaseHeader : Record "38";
        DetailVNArrivageSuppExp : Record "70015";
    begin
        //SM 260817
        IF Statut = Statut::valider THEN
          ERROR('Vous ne pouvez pas supprimer une expédition Validée');
        IF ("No. Commande Achat" <> '') AND  PurchaseHeader.GET(PurchaseHeader."Document Type"::Order, "No. Commande Achat") THEN
          ERROR('Il faut supprimer la commande achat %1',"No. Commande Achat");

        CLEAR(LigneExpéditionVN);
        LigneExpéditionVN.SETFILTER(LigneExpéditionVN."No. Expédition",'%1',"No. Expédition");
        IF LigneExpéditionVN.FINDFIRST THEN
          REPEAT
            LigneExpéditionVN.TESTFIELD("No. L.C",'');
          UNTIL LigneExpéditionVN.NEXT = 0;

        CLEAR(LigneExpéditionVN);
        LigneExpéditionVN.SETFILTER(LigneExpéditionVN."No. Expédition",'%1',"No. Expédition");
        IF NOT LigneExpéditionVN.ISEMPTY THEN
          LigneExpéditionVN.DELETEALL;
        //SM 260817
        LigneExpédVNGroupéProfor.RESET;
        LigneExpédVNGroupéProfor.SETRANGE("No. Expédition","No. Expédition");
        IF NOT LigneExpédVNGroupéProfor.ISEMPTY THEN
          LigneExpédVNGroupéProfor.DELETEALL;
        //END SM
        //KT AND SM 01/08/19
        DetailVNArrivageSuppExp.RESET;
        DetailVNArrivageSuppExp.SETRANGE("No. Expédition","No. Expédition");
        IF DetailVNArrivageSuppExp.FINDSET THEN BEGIN
          DetailVNArrivageSuppExp.MODIFYALL("No. Line Expédition",0);
        END;
        //END KT
    end;

    trigger OnInsert();
    begin
        PurchasesPayablesSetup.GET;
        IF "No. Expédition" = '' THEN
          NoSeriesMgt.InitSeries(PurchasesPayablesSetup."No. Expédition VN",xRec."No. Series","Date Création","No. Expédition","No. Series");

        Désignation := 'EXPEDITION No. :'+ "No. Expédition" +' ' + ConvertMounth(DATE2DMY(WORKDATE,2)) +'-' +ConvertMounth(DATE2DMY(WORKDATE,2)+1);

        VALIDATE("No. Fournisseur",PurchasesPayablesSetup."Default VN Vendor");
        "Date Création" := WORKDATE;
        "crée par" := USERID;
    end;

    var
        NoSeriesMgt : Codeunit "396";
        PurchasesPayablesSetup : Record "312";
        RecVendor : Record "23";
        CurrencyDate : Date;
        CurrExchRate : Record "330";
        "LigneExpéditionVN" : Record "70034";

    local procedure ConvertMounth(Mois : Integer) LibMois : Text[20];
    begin
        CASE Mois OF
            1 : LibMois := 'JANVIER';
            2 : LibMois := 'FEVRIER';
            3 : LibMois := 'MARS';
            4 : LibMois := 'AVRIL';
            5 : LibMois := 'MAI';
            6 : LibMois := 'JUIN';
            7 : LibMois := 'JUILLET';
            8 : LibMois := 'AOUT';
            9 : LibMois := 'SEPTEMBRE';
            10 : LibMois := 'OCTOBRE';
            11 : LibMois := 'NOVEMBRE';
            12 : LibMois := 'DECEMBRE';
          END;
    end;
}

