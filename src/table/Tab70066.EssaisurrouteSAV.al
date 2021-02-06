table 70066 "Essai sur route SAV"
{

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"Date de Creation";Date)
        {
        }
        field(3;"Cree par";Code[40])
        {
        }
        field(4;Trajet1;Boolean)
        {
            Caption = 'Trajet1(15 minutes)';

            trigger OnValidate();
            begin
                IF Trajet1 THEN BEGIN
                  Trajet2:=FALSE;
                  Trajet3:=FALSE;
                  Durée:=0.25;
                END;
            end;
        }
        field(5;Trajet2;Boolean)
        {
            Caption = 'Trajet2( 30 minutes)';

            trigger OnValidate();
            begin
                IF Trajet2 THEN BEGIN
                  Trajet1:=FALSE;
                  Trajet3:=FALSE;
                  Durée:=0.5;
                END;
            end;
        }
        field(6;Trajet3;Boolean)
        {
            Caption = '"Trajet3( 1h30 mn) "';

            trigger OnValidate();
            begin
                IF Trajet3 THEN BEGIN
                  Trajet2:=FALSE;
                  Trajet1:=FALSE;
                  Durée:=1;
                END;
            end;
        }
        field(7;"Nature travaux";Text[250])
        {
        }
        field(8;"Heure départ";Time)
        {
        }
        field(9;"Heure retour";Time)
        {

            trigger OnValidate();
            begin
                //--->----NM--261016-------Calcul durée au niveau ESSAI ROUTE-------

                TESTFIELD("Heure départ");
                IF "Heure retour"<"Heure départ" THEN
                  ERROR(TEXTHeure);
                //Durée:= "Heure départ" - "Heure retour"
                VALIDATE("Duree Reelle",("Heure retour"-"Heure départ")/3600000);
                //<-------NM--261016-------Calcul durée au niveau ESSAI ROUTE-------
            end;
        }
        field(10;KM;Decimal)
        {
            Caption = 'Kilométrage parcouru';
        }
        field(11;Essayeur;Code[20])
        {
            TableRelation = Resource.No. WHERE (Type=CONST(Person),
                                                Resource Group No.=FILTER(ESSAI*));

            trigger OnValidate();
            begin
                Recressource.GET(Essayeur);
                "Nom Essayeur":=Recressource.Name;
            end;
        }
        field(12;"No. réparation";Code[20])
        {
            TableRelation = "Reception SAV"."Reception No";
        }
        field(13;"No. séries";Code[20])
        {
        }
        field(14;"Durée";Decimal)
        {
            Caption = 'Durée trajet';
        }
        field(15;"Nom Essayeur";Text[50])
        {
            Editable = false;
        }
        field(16;"Nbre Impressions";Integer)
        {
        }
        field(17;"Printed By";Code[50])
        {
        }
        field(18;"Printing Date";Date)
        {
        }
        field(19;Carburant;Boolean)
        {
            Description = 'KT15052017';

            trigger OnValidate();
            begin
                IF NOT Carburant THEN BEGIN
                  VALIDATE("Type bon pour carburant",0);
                END;
            end;
        }
        field(20;"Quantité carburant";Decimal)
        {
            Description = 'KT15052017';
        }
        field(21;"Numéro bon pour carburant";Code[20])
        {
            Description = 'KT15052017';

            trigger OnValidate();
            begin
                EssaisurrouteSAV.RESET;
                EssaisurrouteSAV.SETRANGE("Numéro bon pour carburant","Numéro bon pour carburant");
                IF NOT EssaisurrouteSAV.ISEMPTY THEN
                  ERROR('Numéro déjà utilisé: %1',"Numéro bon pour carburant");
            end;
        }
        field(22;"Type bon pour carburant";Option)
        {
            Description = 'KT15052017';
            OptionCaptionML = ENU=' ,10,20,30',
                              FRA=' ,10,20,30';
            OptionMembers = " ","10","20","30";

            trigger OnValidate();
            begin
                CASE "Type bon pour carburant" OF
                  0:"Quantité carburant":=0;
                  1:"Quantité carburant":=10;
                  2:"Quantité carburant":=20;
                  3:"Quantité carburant":=30;
                  END;
            end;
        }
        field(23;"Observation essayeur";Text[250])
        {
            Description = 'KT17052017';
        }
        field(24;"Kilométrage avant essai";Integer)
        {
            CalcFormula = Lookup(Controle.Kilometrage WHERE (Id=FIELD(No.)));
            Description = 'KT17052017';
            Editable = false;
            FieldClass = FlowField;
        }
        field(25;"Type de carburant";Option)
        {
            Caption = '<Type de carburant>';
            Description = 'KT17052017';
            OptionMembers = Diesel,Essence;
        }
        field(26;"Obseravation avant essai";Text[250])
        {
            CalcFormula = Lookup(Controle.Remarques WHERE (Id=FIELD(No.)));
            Description = 'KT18052017';
            FieldClass = FlowField;
        }
        field(27;"Confirmer carburant";Boolean)
        {
            Caption = 'Confirmer carburant';
            Description = 'KT18052017';
        }
        field(28;"Duree Reelle";Decimal)
        {
            Caption = '"Durée "';
            Description = 'KT24052017';
        }
        field(29;"Kilométrage après essai";Integer)
        {
            Description = 'KT17052017';
            Editable = true;

            trigger OnValidate();
            begin
                //KT 070917
                KM:="Kilométrage après essai"-"Kilométrage avant essai";
                MODIFY;
            end;
        }
    }

    keys
    {
        key(Key1;"No.","No. réparation")
        {
        }
        key(Key2;Carburant,"No.","No. réparation")
        {
            SumIndexFields = "Quantité carburant";
        }
        key(Key3;"Durée","No.","No. réparation")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        //--> NM---241016------
        IF "Heure départ" <> 0T THEN
          ERROR(text001);
        //--> NM---241016------
        IF "Nbre Impressions">0 THEN
          ERROR(Txt_DeleteError);
    end;

    trigger OnInsert();
    begin

        //--> NM---241016------
        ServiceMgtSetup.GET;
         IF "No. réparation" ='' THEN
          NoSeriesMgt.InitSeries(ServiceMgtSetup."Souche No. Essais-Route",xRec."No. séries",WORKDATE,"No. réparation","No. séries");
          "Date de Creation" := WORKDATE;
          "Cree par" := USERID;
        //<-- NM---241016-------
    end;

    var
        RECREPARATION : Record "60008";
        NoSeriesMgt : Codeunit "396";
        ServiceMgtSetup : Record "5911";
        text001 : Label 'Vous ne pouvez pas supprimer le document Suivi Essai sur Route';
        Recressource : Record "156";
        Txt_DeleteError : Label 'Vous ne pouvez pas supprimer un essai déjà imprimé';
        EssaisurrouteSAV : Record "70066";
        TEXTHeure : Label 'L''heure départ doit être antérieure à l''heure retour';
}

