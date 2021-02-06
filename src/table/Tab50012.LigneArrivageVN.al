table 50012 "Ligne Arrivage VN"
{
    // version ETRANGER


    fields
    {
        field(1; "No. Titre d'importation"; Code[20])
        {
        }
        field(2; "No. Ligne"; Integer)
        {
        }
        field(3; "Ref. article"; Code[20])
        {
            TableRelation = Item.No.;
        }
        field(4;"Désignation Article";Code[100])
        {
        }
        field(5;"Prix Unitaire Devise";Decimal)
        {

            trigger OnValidate();
            begin
                VALIDATE("Prix Unitaire TND");
            end;
        }
        field(6;"Prix Unitaire TND";Decimal)
        {
            DecimalPlaces = 3:3;

            trigger OnValidate();
            begin
                GetEnteteArrivage;
                Currency.InitRoundingPrecision;
                IF RecTitreDimportation.Devise <> '' THEN
                  "Prix Unitaire TND" :=
                    ROUND(
                      CurrencyExchangeRate.ExchangeAmtFCYToLCY(
                        WORKDATE,"Code Devise",
                        "Prix Unitaire Devise",RecTitreDimportation."Cours douane"),
                      Currency."Amount Rounding Precision")
                ELSE
                  "Prix Unitaire TND" :=
                    ROUND("Prix Unitaire Devise",Currency."Amount Rounding Precision");
            end;
        }
        field(7;"Quantité";Decimal)
        {
        }
        field(8;"Montant Devise";Decimal)
        {

            trigger OnValidate();
            begin
                VALIDATE("Montant TND");
            end;
        }
        field(9;"Ref. article Fournisseur";Code[30])
        {
        }
        field(10;"Montant TND";Decimal)
        {
            DecimalPlaces = 3:3;

            trigger OnValidate();
            begin
                GetEnteteArrivage;
                Currency.InitRoundingPrecision;
                IF RecTitreDimportation.Devise <> '' THEN
                  "Montant TND" :=
                    ROUND(
                      CurrencyExchangeRate.ExchangeAmtFCYToLCY(
                        WORKDATE,"Code Devise",
                        "Montant Devise",RecTitreDimportation."Cours douane"),
                      Currency."Amount Rounding Precision")
                ELSE
                  "Montant TND" :=
                    ROUND("Montant Devise",Currency."Amount Rounding Precision");
            end;
        }
        field(11;"Code Devise";Code[10])
        {
        }
        field(12;Banque;Code[20])
        {
        }
        field(13;CAF;Code[10])
        {
        }
        field(14;VIN;Code[20])
        {
        }
        field(15;"No. Expédition";Code[20])
        {
            Description = 'ZM';
        }
        field(16;"No. Line Expédition";Integer)
        {
            Description = 'ZM';
        }
        field(17;"No. commande achat";Code[20])
        {
        }
        field(18;"No. ligne achat";Integer)
        {
        }
        field(19;"No. LC";Code[20])
        {
        }
        field(20;"No. bon de réception achat";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"No. Titre d'importation","No. Ligne")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        ExpéditionparTitre.SETRANGE(ExpéditionparTitre."No. Titre D'importation","No. Titre d'importation");
          IF ExpéditionparTitre.FIND('-') THEN
              ERROR(Txt0001);
        EntêteAssurance.SETRANGE(EntêteAssurance."No. Titre D'importation","No. Titre d'importation");
          IF EntêteAssurance.FIND('-') THEN
            ERROR(Txt0002);
        EntêteObligation.SETRANGE(EntêteObligation."No. Titre D'importation","No. Titre d'importation");
          IF EntêteObligation.FIND('-') THEN
            ERROR(Txt0003);

        //MAG Qté recu L.C si ligne arrivage fin est supprimer
        CLEAR(DetailLC);
        DetailLC.SETRANGE("No. L.C","No. LC");
        DetailLC.SETRANGE("No. Expédition","No. Expédition");
        DetailLC.SETRANGE("No. Ligne Expédition","No. Line Expédition");
        IF DetailLC.FIND('-') THEN
        BEGIN
           DetailLC."Qty Reçu" := DetailLC."Qty Reçu" - 1;
          DetailLC."Qty restante" := DetailLC."Qty restante" + 1;
          DetailLC.MODIFY;
        END;
    end;

    trigger OnModify();
    begin
        CLEAR(TitreDimportation);
        TitreDimportation.GET("No. Titre d'importation");
        TitreDimportation.TESTFIELD(Statut,0);
    end;

    var
        TitreDimportation : Record "50011";
        "ExpéditionparTitre" : Record "50013";
        "EntêteAssurance" : Record "50014";
        "EntêteObligation" : Record "50015";
        Txt0001 : Label 'Suppression Impossible : il existe des expéditions rattachées a ce Titre';
        Txt0002 : Label 'Suppression Impossible : il existe des Assurances rattachées a ce Titre';
        Txt0003 : Label 'Suppression Impossible : il existe des Obligations rattachées a ce Titre';
        RecTitreDimportation : Record "50011";
        Currency : Record "4";
        CurrencyExchangeRate : Record "330";
        DetailLC : Record "70037";

    local procedure GetEnteteArrivage();
    begin
        RecTitreDimportation.RESET;
        IF RecTitreDimportation.GET("No. Titre d'importation") THEN;
          IF RecTitreDimportation.Devise = '' THEN
            Currency.InitRoundingPrecision
          ELSE BEGIN
            RecTitreDimportation.TESTFIELD("Cours douane");
            Currency.GET(RecTitreDimportation.Devise);
            Currency.TESTFIELD("Amount Rounding Precision");
          END;
        "Code Devise":= RecTitreDimportation.Devise;
    end;
}

