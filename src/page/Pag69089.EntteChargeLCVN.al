page 69089 "Entête Charge  L.C VN"
{
    PageType = Card;
    SourceTable = Table70036;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("Code L.C";"Code L.C")
                {
                }
                field(Désignation;Désignation)
                {
                }
                field("Type d'import";"Type d'import")
                {
                }
                field("Taux d'ouverture";"Taux d'ouverture")
                {
                    Caption = 'Cours d''ouverture';
                    ShowMandatory = TauxOuverture;
                }
                field(Banque;Banque)
                {
                }
                field("Nom de la banque";"Nom de la banque")
                {
                }
                field("No. LC / Banque";"No. LC / Banque")
                {
                }
                field("No. Dossier d'import";"No. Dossier d'import")
                {
                }
                field("No. Expédition";"No. Expédition")
                {
                }
                field("No. domiciliation";"No. domiciliation")
                {
                }
                field(Quantité;Quantité)
                {
                    DecimalPlaces = 0:0;
                }
                field("Montant L.C Dev";"Montant L.C Dev")
                {
                }
                field("Montant L.C Tnd";"Montant L.C Tnd")
                {
                    DecimalPlaces = 3:3;
                }
                field("Date Création";"Date Création")
                {
                }
                field("Date BL";"Date BL")
                {
                }
                field("Date Echéance L.C";"Date Echéance L.C")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Mnt Tot. Arrivahe Devise";"Mnt Tot. Arrivahe Devise")
                {
                }
                field("Mnt Tot. Arrivahe Tnd";"Mnt Tot. Arrivahe Tnd")
                {
                }
                field("Total Charge L.c";"Total Charge L.c")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field(Statut;Statut)
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
            }
            part(;69088)
            {
                SubPageLink = No. L.C=FIELD(Code L.C);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Actualiser Charge L.C")
            {

                trigger OnAction();
                begin
                    CLEAR(MgtAuresFinance);
                    MgtAuresFinance.ActualiserFraisDossier(Rec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        TauxOuverture := TRUE;
    end;

    trigger OnInit();
    begin
        TauxOuverture := TRUE;
    end;

    var
        MgtAures : Codeunit "70003";
        TauxOuverture : Boolean;
        "LettredecréditLC" : Record "70036";
        RecPaymentClass : Record "10860";
        RecPaymentHeader : Record "10865";
        NoSeriesMgt : Codeunit "396";
        CurrencyExchangeRate : Record "330";
        RecPaymentLine : Record "10866";
        DecMonantOuvert : Decimal;
        "DétailLC" : Record "70037";
        PageCommissionparbanque : Page "70034";
        RecCommisionparbanque : Record "70005";
        DossVN : Code[20];
        MgtAuresFinance : Codeunit "70006";

    local procedure FctMantantArrivage(PCdeNoExpedition : Code[20]) : Decimal;
    var
        LRecTitreDimportation : Record "50011";
    begin
        LRecTitreDimportation.SETRANGE("No. Expedition" ,PCdeNoExpedition) ;
        IF LRecTitreDimportation.FINDFIRST THEN
          BEGIN
            LRecTitreDimportation.CALCFIELDS("Total en Dinar");
            //message(FORMAT(LRecTitreDimportation."Total en Dinar"));
            EXIT(LRecTitreDimportation."Cours douane");
          END;
    end;
}

