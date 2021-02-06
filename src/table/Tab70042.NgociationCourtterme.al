table 70042 "Négociation Court à terme"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
        }
        field(2;"No. Document";Code[20])
        {
            TableRelation = "Lettre de crédit L.C";
        }
        field(3;"Date de négociation";Date)
        {
        }
        field(4;"Taux de change Négocié";Decimal)
        {
            DecimalPlaces = 3:10;

            trigger OnValidate();
            begin



                "Mnt Arrivage / Ct-Négcocié" := "Montant Arrivage Devise" * "Taux de change Négocié";
                "Montant Arrivage TND" := "Montant Arrivage Devise"*"Cour déclaration";
                "Ecart Mnt (Ct-Négos % Ct-Décl)" := "Mnt Arrivage / Ct-Négcocié" - "Montant Arrivage TND";


                UpdateArrivageVN.GET("No. Document");
                UpdateArrivageVN."Dernier cours négocié" := "Taux de change Négocié";
                UpdateArrivageVN.MODIFY;

                 ArrivageVN.GET("No. Dossier Vn");
                 ArrivageVN.TESTFIELD("Date B.L");
                "Date Echéance"  := ArrivageVN."Date B.L" + 180;
            end;
        }
        field(5;"Date création";Date)
        {
        }
        field(6;"Créer par";Code[50])
        {
        }
        field(7;banque;Code[10])
        {
            TableRelation = "Bank Account";
        }
        field(8;"No. Projet Expédition";Code[20])
        {
            TableRelation = "Entêt Expédition VN";
        }
        field(9;"No. Dossier Vn";Code[20])
        {
            TableRelation = "Dossiers Transit";
        }
        field(10;"No. Domiciliation";Code[20])
        {
        }
        field(12;"Montant Arrivage Devise";Decimal)
        {

            trigger OnValidate();
            begin
                "Montant Arrivage TND" := "Montant Arrivage Devise"*"Cour déclaration";
                "Ecart Mnt (Ct-Négos % Ct-Décl)" := "Mnt Arrivage / Ct-Négcocié" - "Montant Arrivage TND";
            end;
        }
        field(13;"Taux du Jour";Decimal)
        {
        }
        field(14;"Mnt Arrivage /Ct.Jour";Decimal)
        {
            Description = 'montant arrivage avec court du jour';
        }
        field(15;"Mnt Arrivage / Ct-Négcocié";Decimal)
        {
            Description = 'montant arrivage avec court du jour';
        }
        field(16;"Ecart Mnt (Ct-Négos % Ct-Décl)";Decimal)
        {
        }
        field(17;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            TableRelation = Currency;

            trigger OnValidate();
            begin
                VALIDATE("Currency Factor");
            end;
        }
        field(18;"Currency Factor";Decimal)
        {
            CaptionML = ENU='Currency Factor',
                        FRA='Facteur devise';
            DecimalPlaces = 0:15;
            Editable = false;
            MinValue = 0;

            trigger OnValidate();
            begin
                IF "Currency Code" <> '' THEN BEGIN
                  IF "Date création" <> 0D THEN
                    CurrencyDate := "Date création"
                  ELSE
                    CurrencyDate := WORKDATE;

                  "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate,"Currency Code");
                END ELSE
                  "Currency Factor" := 0;
            end;
        }
        field(19;"1er Négociation";Boolean)
        {
        }
        field(20;"No. L.Crédit";Code[20])
        {
        }
        field(21;"Cour déclaration";Decimal)
        {

            trigger OnValidate();
            begin
                "Montant Arrivage TND" := "Montant Arrivage Devise"*"Cour déclaration";
                "Ecart Mnt (Ct-Négos % Ct-Décl)" := "Mnt Arrivage / Ct-Négcocié" - "Montant Arrivage TND";
            end;
        }
        field(22;"Montant Arrivage TND";Decimal)
        {
        }
        field(23;"Date Echéance";Date)
        {
        }
        field(24;"Qté Achat à Terme";Integer)
        {
        }
        field(25;"Achat Confirmer";Boolean)
        {

            trigger OnValidate();
            begin
                CLEAR(DossiersTransit);
                DossiersTransit.GET("No. Dossier Vn");
                IF "Achat Confirmer" THEN
                  BEGIN
                    DossiersTransit."Dernier cours négocié" := "Taux de change Négocié";
                    DossiersTransit."Date Achat à Terme"     := "Date de négociation";
                    DossiersTransit.MODIFY;
                  END;

                IF NOT "Achat Confirmer" THEN
                  BEGIN
                     DossiersTransit."Dernier cours négocié" := 0;
                    DossiersTransit."Date Achat à Terme"     := 0D;
                    DossiersTransit.MODIFY;
                    END;
            end;
        }
    }

    keys
    {
        key(Key1;"No. Document","Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        ArrivageVN : Record "50000";
        RecVendor : Record "23";
        CurrencyDate : Date;
        CurrExchRate : Record "330";
        UpdateArrivageVN : Record "50000";
        "NégociationCourtàterme" : Record "70042";
        DossiersTransit : Record "50000";
}

