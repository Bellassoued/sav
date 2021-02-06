table 70027 "Ligne Expéd. VN /Provenance"
{
    // version new


    fields
    {
        field(1;"No. Expédition";Code[20])
        {
            TableRelation = "Entêt Expédition VN";
        }
        field(2;"No. Ligne";Integer)
        {
        }
        field(3;"Désignation version";Code[200])
        {
        }
        field(4;Modele;Code[30])
        {
        }
        field(5;"Quantité";Decimal)
        {
        }
        field(7;"No. proforma";Code[20])
        {
        }
        field(10;MARSEILLE;Boolean)
        {
        }
        field(11;BORUSAN;Boolean)
        {
        }
        field(12;BARCELONE;Boolean)
        {
        }
        field(13;BOUZAS;Boolean)
        {
        }
        field(14;Statut;Option)
        {
            OptionCaption = '" ,Proforma Crée,Commande Crée,Dossier Arrivage Crée,L.C crée"';
            OptionMembers = " ","Proforma Crée","Commande Crée","Dossier Arrivage Crée","L.C crée";
        }
        field(19;Banque;Code[20])
        {
            TableRelation = "Bank Account".No.;

            trigger OnValidate();
            begin
                
                
                
                CLEAR(BankAccount);
                IF BankAccount.GET(Banque) THEN
                Nom := BankAccount.Name;
                
                IF Banque = '' THEN
                  Nom := '';
                /*
                CLEAR(LigneExpeditionVN);
                LigneExpeditionVN.SETFILTER("No. Expédition","No. Expédition");
                LigneExpeditionVN.SETFILTER("No. proforma","No. proforma");
                LigneExpeditionVN.FIND('-');
                REPEAT
                   LigneExpeditionVN.Banque := Banque;
                  LigneExpeditionVN.MODIFY;
                  UNTIL LigneExpeditionVN.NEXT = 0;
                */

            end;
        }
        field(20;Nom;Text[50])
        {
        }
        field(21;"No. L.C";Code[20])
        {
            TableRelation = "Lettre de crédit L.C"."Code L.C" WHERE (No. Expédition=FIELD(No. Expédition),
                                                                     Banque=FIELD(Banque),
                                                                     Provenance=FIELD(Port de Provenance));

            trigger OnValidate();
            begin

                CLEAR(LigneExpeditionVN);
                LigneExpeditionVN.SETFILTER("No. Expédition","No. Expédition");
                LigneExpeditionVN.SETFILTER("No. proforma","No. proforma");
                IF LigneExpeditionVN.FIND('-') THEN
                REPEAT
                   LigneExpeditionVN."No. L.C" := "No. L.C";
                  LigneExpeditionVN.MODIFY;
                  UNTIL LigneExpeditionVN.NEXT = 0;
            end;
        }
        field(22;"Code Article";Code[50])
        {
            TableRelation = Item.No.;
        }
        field(23;"Designation Article";Code[50])
        {
        }
        field(25;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            TableRelation = Currency;
        }
        field(31;"Port de Provenance";Code[20])
        {
        }
        field(32;"Taux de change";Decimal)
        {
            DecimalPlaces = 3:8;

            trigger OnValidate();
            begin
                "Tot. en TND (avec Mino)" := "Tot. En Devise (avec Mino)"*"Taux de change";
            end;
        }
        field(100;"Qté produite";Integer)
        {
            CalcFormula = Count("Détail VN Arrivage." WHERE (No. Expédition=FIELD(No. Expédition),
                                                             No. proforma=FIELD(No. proforma),
                                                             No. moteur=FILTER(<>'')));
            FieldClass = FlowField;
        }
        field(101;"Tot. En Devise (sans Mino)";Decimal)
        {
            Description = 'Total Val en devise sans mino';

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
        field(102;"Montant Total minoration";Decimal)
        {

            trigger OnValidate();
            begin
                "Mino / VN" := "Montant Total minoration"/Quantité;
            end;
        }
        field(103;"Tot. En Devise (avec Mino)";Decimal)
        {
            Description = 'Total Val en devise avec  mino';

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
        field(104;"Mino / VN";Decimal)
        {
        }
        field(105;"Tot. en TND (avec Mino)";Decimal)
        {
            Description = 'Total TND (prix fob+option+couleur+garnissage) - Total Minoraio(unitaire+animation)';
        }
        field(106;Commentaire;Text[100])
        {
        }
        field(107;"Total Obligation/Mino";Decimal)
        {
            CalcFormula = Sum("Ligne Simulation D.Douanes"."Total Obligation/Mino" WHERE (No. Expédition=FIELD(No. Expédition),
                                                                                          No. Proforma=FIELD(No. proforma)));
            FieldClass = FlowField;
        }
        field(115;"No. L.C Banque";Code[20])
        {
        }
        field(116;"Tot. en TND (Sans Mino)";Decimal)
        {
        }
        field(117;"Purch. Order No.";Code[20])
        {
            CalcFormula = Lookup("Purchase Header".No. WHERE (No. Expédition=FIELD(No. Expédition),
                                                              Currency Code=FIELD(Currency Code),
                                                              Pays de provenance=FIELD(Port de Provenance)));
            CaptionML = ENU='Purch. Order No.',
                        FRA='N° Commande achat';
            FieldClass = FlowField;
        }
        field(118;"Tot Qté Commande";Integer)
        {
            CalcFormula = Count("Purchase Line" WHERE (Document Type=FILTER(Order),
                                                       Document No.=FIELD(Purch. Order No.),
                                                       No. L.C=FIELD(No. L.C)));
            FieldClass = FlowField;
        }
        field(119;"Qte vn arrivage";Integer)
        {
            CalcFormula = Count("Détail VN Arrivage." WHERE (Date production=FIELD(No. Expédition),
                                                             Item No.=FIELD(Code Article)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No. Expédition","No. Ligne")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //ERROR('Vous ne pouvez pas supprimer des lignes expéditions');
    end;

    var
        Currency : Record "4";
        CurrencyExchangeRate : Record "330";
        "RecEntêtExpéditionVN" : Record "70033";
        BankAccount : Record "270";
        LigneExpeditionVN : Record "70034";

    local procedure "GetEntêtExpéditionVN"();
    begin
        RecEntêtExpéditionVN.RESET;
        RecEntêtExpéditionVN.GET("No. Expédition");
          IF RecEntêtExpéditionVN."Currency Code" = '' THEN
            Currency.InitRoundingPrecision
          ELSE BEGIN
            RecEntêtExpéditionVN.TESTFIELD("Currency Factor");
            Currency.GET(RecEntêtExpéditionVN."Currency Code");
            Currency.TESTFIELD("Amount Rounding Precision");
          END;
        "Currency Code" := RecEntêtExpéditionVN."Currency Code";
    end;
}

