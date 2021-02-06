table 60018 "Simulation P. Revient VN"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"No. Article";Code[20])
        {
            CaptionML = ENU='No.',
                        FRA='N°';
            TableRelation = Item WHERE (Base Unit of Measure=FILTER(VEH));

            trigger OnValidate();
            begin
                CLEAR(Item);
                Item.GET("No. Article");
                BEGIN
                Désignation := Item.Description;
                CLEAR(FicheTechnique);
                FicheTechnique.GET("No. Article");
                CLEAR(SalesReceivablesSetup);
                SalesReceivablesSetup.GET;

                "F.Immatriculation" := FicheTechnique."Frais energie" + FicheTechnique."Frais immatriculation" + SalesReceivablesSetup."Montant Plaque";

                END;
            end;
        }
        field(3;"Désignation";Code[10])
        {
            CaptionML = ENU='Name',
                        FRA='Nom';
        }
        field(4;"Modèle";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Devise;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(6;"Prix C & F";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                UpdateLine;
            end;
        }
        field(7;"Cours de change Dédouanement";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3:8;

            trigger OnValidate();
            begin
                UpdateLine;
            end;
        }
        field(8;Contreval;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Assurance;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Valeur C I F";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Droit Douane";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;Fodec;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"T.V.A indic";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"R.P.D";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Frais Généreaux";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Fraix Fixes";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                UpdateLine;
            end;
        }
        field(17;"Prix de Revient en Douane";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Taux Marge";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"T.V.A";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"F.Immatriculation";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Px vente TTC proposé";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                CalcMarge;
            end;
        }
        field(22;"Px vente H.T";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Montant Marge";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Txt Taux Marge";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Cours de change paiement";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3:8;

            trigger OnValidate();
            begin
                UpdateLine;
            end;
        }
        field(26;"Prix de Revient de paiement";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.","No. Article")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Item : Record "27";
        FicheTechnique : Record "50032";
        SalesReceivablesSetup : Record "311";

    local procedure UpdateLine();
    var
        ParametreSimulationNGP : Record "70046";
    begin
        IF "Cours de change Dédouanement" <> 0 THEN
          BEGIN
        ParametreSimulationNGP.SETRANGE(ParametreSimulationNGP."Code article","No. Article");
        ParametreSimulationNGP.FIND('-');
        Contreval := "Prix C & F" * "Cours de change Dédouanement";
        Assurance:=(Contreval*ParametreSimulationNGP.Assurance)/100;
        "Valeur C I F" := Contreval + Assurance;
        Fodec:=("Valeur C I F" *ParametreSimulationNGP."Taux Fodec")/100;
        "Droit Douane" := ("Valeur C I F" *ParametreSimulationNGP."Taux Droit Douane")/100;
        "T.V.A indic" := (("Valeur C I F" + Fodec+"Droit Douane" )*ParametreSimulationNGP."Taux TVA")/100;
        "R.P.D" := ((Fodec + "Droit Douane" + "T.V.A indic")*ParametreSimulationNGP."Taux RDP" )/100;
        "Frais Généreaux" :=  ("Valeur C I F" + Fodec + "Droit Douane")*(ParametreSimulationNGP."Taux Frais Fixe"/100);
        "Prix de Revient en Douane" := "Valeur C I F" + Fodec+"Droit Douane"+"R.P.D"+"Frais Généreaux"+"Fraix Fixes";
          END;
        
        IF "Cours de change paiement" <> 0 THEN
          BEGIN
        
        
            "Prix de Revient de paiement" := "Prix C & F" *"Cours de change paiement"+   Assurance + Fodec+"Droit Douane"+"R.P.D"+"Frais Généreaux"+ParametreSimulationNGP."Mnt Frais de transit";
          END;
        
        /*
        "Mnt Assurance":=("Montant Achat Unitaire"*ParametreSimulationNGP.Assurance*"Taux de change estimatif")/100;
        "Mnt Fodec":=((("Montant Achat Unitaire"*"Taux de change estimatif")+"Mnt Assurance")*ParametreSimulationNGP."Taux Fodec")/100;
        "Mnt Droit Douane" := ((("Montant Achat Unitaire"*"Taux de change estimatif")+ "Mnt Assurance")*ParametreSimulationNGP."Taux Droit Douane")/100;
        
        "Mnt TVA":= (((("Montant Achat Unitaire"*"Taux de change estimatif")+ "Mnt Assurance" + "Mnt Fodec"+
        "Mnt Droit Douane"))*ParametreSimulationNGP."Taux TVA")/100;
        "Mnt RDP":=(("Mnt Fodec"+ "Mnt Droit Douane" +"Mnt TVA")*ParametreSimulationNGP."Taux RDP" )/100;
        
        "Frais Généraux":= (((("Montant Achat Unitaire"*"Taux de change estimatif") + "Mnt Assurance")+
        "Mnt Fodec" +"Mnt Droit Douane" )*ParametreSimulationNGP."Frais Fixe")/100;
        END;
        "Frais d'approche estimatif" := "Mnt Droit Douane" + "Mnt Fodec"+ "Mnt RDP"+
        "Mnt Assurance"+"Frais Généraux";
        "Prix de revien estimatif" := (ABS("Montant Achat Unitaire")*"Taux de change estimatif") +
        ABS("Frais d'approche estimatif")  ;
        "Montant marge Brut Estimatif" := "Prix de vente catalogue."-"Prix de revien estimatif";
        */

    end;

    local procedure CalcMarge();
    var
        TauxMarge : Decimal;
    begin

        TauxMarge := ("Px vente TTC proposé" - "F.Immatriculation" - (1.19*"Prix de Revient en Douane"))/(1.19*"Prix de Revient en Douane");
         "Txt Taux Marge" := FORMAT(ROUND(TauxMarge*100,0.1)) + ' %';
         //MESSAGE('TauxMarge %1',TauxMarge);
        "Montant Marge" := "Prix de Revient en Douane"*(TauxMarge);
        "Px vente H.T" := "Prix de Revient en Douane" + "Montant Marge";
        "T.V.A" := "Px vente H.T"*0.19;
        //"Taux Marge" := ("Px vente TTC proposé" - "F.Immatriculation" - (1.19*"Prix de Revient"))/(1.19*"Prix de Revient")*100;

        IF "Cours de change paiement" <> 0 THEN
          BEGIN
            TauxMarge := ("Px vente TTC proposé" - "F.Immatriculation" - (1.19*"Prix de Revient de paiement"))/(1.19*"Prix de Revient de paiement");
            "Txt Taux Marge" := FORMAT(ROUND(TauxMarge*100,0.1)) + ' %';
            "Montant Marge" := "Prix de Revient de paiement"*(TauxMarge);
            "Px vente H.T" := "Prix de Revient de paiement" + "Montant Marge";
            "T.V.A" := "Px vente H.T"*0.19;
            END;
    end;
}

