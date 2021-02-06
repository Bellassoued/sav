table 70034 "Ligne Expéd. VN détaillée"
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
        field(4;Modele;Code[100])
        {
        }
        field(5;"Quantité";Decimal)
        {
        }
        field(6;"Tot. En Devise (sans Mino)";Decimal)
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
        field(7;"No. proforma";Code[20])
        {
            TableRelation = "Purchase Header" WHERE (Document Type=CONST(Quote),
                                                     No. Expédition=FIELD(No. Expédition));
        }
        field(8;"Montant Total minoration";Decimal)
        {

            trigger OnValidate();
            begin
                "Mino / VN" := "Montant Total minoration"/Quantité;
            end;
        }
        field(9;"Mino / VN";Decimal)
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
        field(15;"Date Création";Date)
        {
        }
        field(16;"crée par";Code[50])
        {
        }
        field(17;CAF;Code[20])
        {
        }
        field(18;VIN;Code[20])
        {
        }
        field(19;Banque;Code[20])
        {
            TableRelation = "Bank Account".No.;

            trigger OnValidate();
            begin
                CLEAR(BankAccount);
                IF BankAccount.GET(Banque) THEN
                Nom := BankAccount.Name;
            end;
        }
        field(20;Nom;Text[50])
        {
        }
        field(21;"No. L.C";Code[20])
        {
            TableRelation = "Lettre de crédit L.C"."Code L.C" WHERE (No. Expédition=FIELD(No. Expédition),
                                                                     Banque=FIELD(Banque));
        }
        field(22;"Code Article";Code[50])
        {
            TableRelation = Item.No.;
        }
        field(23;"Designation Article";Code[100])
        {
        }
        field(24;"Tot. en TND (Sans Mino)";Decimal)
        {
            Description = 'Total TND sans mino';
        }
        field(25;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            TableRelation = Currency;
        }
        field(30;"Tot. en TND (avec Mino)";Decimal)
        {
            Description = 'Total TND (prix fob+option+couleur+garnissage) - Total Minoraio(unitaire+animation)';
        }
        field(31;"Port de Provenance";Code[20])
        {
        }
        field(32;"Code NGP";Code[20])
        {
        }
        field(105;"Sales Type";Option)
        {
            Caption = 'Type vente';
            OptionCaption = 'Client,Groupe tarifs client,Tous les clients,Campagne';
            OptionMembers = Customer,"Customer Price Group","All Customers",Campaign;
        }
        field(106;"Sales Code";Code[10])
        {
            Caption = 'Code vente';
            TableRelation = IF (Sales Type=CONST(Customer Price Group)) "Customer Price Group"
                            ELSE IF (Sales Type=CONST(Customer)) Customer
                            ELSE IF (Sales Type=CONST(Campaign)) Campaign;
        }
        field(107;"Tot. En Devise (avec Mino)";Decimal)
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
        field(108;"Prix de vente";Decimal)
        {
        }
        field(109;"No. Commande";Code[20])
        {
        }
        field(110;"Qté produite";Integer)
        {
            CalcFormula = Count("Détail VN Arrivage." WHERE (No. Expédition=FIELD(No. Expédition),
                                                             Date production=FILTER(<>''),
                                                             No. proforma=FIELD(No. proforma)));
            FieldClass = FlowField;
        }
        field(111;"Prix Unitaire (Fob)";Decimal)
        {

            trigger OnValidate();
            begin
                GetEntêtExpéditionVN;
                Currency.InitRoundingPrecision;
                IF RecEntêtExpéditionVN."Currency Code" <> '' THEN
                  "Prix unitaire en TND" := RecEntêtExpéditionVN."Taux de change"*"Prix Unitaire (Fob)"
                    /*ROUND(
                      CurrencyExchangeRate.ExchangeAmtFCYToLCY(
                        WORKDATE,"Currency Code",
                        "Prix Unitaire en devise",RecEntêtExpéditionVN."Currency Factor"),
                      Currency."Amount Rounding Precision")*/
                ELSE
                  "Prix unitaire en TND" :=
                    ROUND("Prix Unitaire (Fob)",Currency."Amount Rounding Precision");

            end;
        }
        field(112;"Prix unitaire en TND";Decimal)
        {
        }
        field(113;"Code Variante";Code[20])
        {
            Description = 'SM VNF001';
        }
        field(114;"Taux de change";Decimal)
        {
        }
        field(115;"No. L.C Banque";Code[20])
        {
        }
        field(116;"Qte vn arrivage";Integer)
        {
            CalcFormula = Count("Détail VN Arrivage." WHERE (Date production=FIELD(No. Expédition),
                                                             Item No.=FIELD(Code Article)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No. Expédition","No. proforma","Code Article","No. Ligne",CAF)
        {
        }
    }

    fieldgroups
    {
    }

    var
        Currency : Record "4";
        CurrencyExchangeRate : Record "330";
        "RecEntêtExpéditionVN" : Record "70033";
        BankAccount : Record "270";

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

