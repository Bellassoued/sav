table 70060 "Entête Facture P.R / Colis"
{
    // version Finance Achat PR

    DrillDownPageID = 70087;
    LookupPageID = 70087;

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;"No. Remorque";Code[20])
        {
        }
        field(3;"Désignation";Text[100])
        {
        }
        field(4;"Date Document";Date)
        {
        }
        field(5;"Nbr. Facture";Integer)
        {
            CalcFormula = Count("Ligne Factures P.R /Clois" WHERE (No. Document=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(6;"Total Nbr. Colis";Integer)
        {
            CalcFormula = Count("Récup. Colis/Fact" WHERE (No. Dossier Arrivage=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(7;"Montant Total Devis";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois"."Montant Devise" WHERE (No. Document=FIELD(No.)));
            FieldClass = FlowField;

            trigger OnValidate();
            begin
                "Montant Total TND" := "Cous du jour" * "Montant Total Devis";
            end;
        }
        field(8;"Cous du jour";Decimal)
        {
            DecimalPlaces = 3:6;

            trigger OnValidate();
            begin


                CLEAR(LigneFacturesPRClois);
                LigneFacturesPRClois.SETFILTER(LigneFacturesPRClois."No. Document","No.");
                LigneFacturesPRClois.FIND('-');
                REPEAT
                LigneFacturesPRClois."Montant Tnd" := "Cous du jour" * LigneFacturesPRClois."Montant Devise";
                LigneFacturesPRClois.MODIFY;
                UNTIL LigneFacturesPRClois.NEXT = 0;
            end;
        }
        field(9;"Montant Total TND";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois"."Montant Tnd" WHERE (No. Document=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(10;"No. Série";Code[20])
        {
        }
        field(11;"Date Saisie";Date)
        {
        }
        field(12;"Total Volume";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois".Volume WHERE (No. Document=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(13;"Total Poid Brut";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois"."Poid Brut" WHERE (No. Document=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(14;Statut;Option)
        {
            OptionCaption = '" ,en cour,lancer,Clôturer"';
            OptionMembers = " ","En cour",lancer,"Clôturer";
        }
        field(15;"Date Départ Marseille";Date)
        {

            trigger OnValidate();
            begin
                TESTFIELD("Date Document");
                TESTFIELD("Date Arrivée GEFCO",0D);
                TESTFIELD("Date de Douanement",0D);
                TESTFIELD("Date Arrivage Magasin",0D);
                //IF "Date Départ Marseille" < "Date Document" THEN
                //  ERROR('date non valide!');
            end;
        }
        field(16;"Date Arrivée GEFCO";Date)
        {

            trigger OnValidate();
            begin
                TESTFIELD("Date Document");
                TESTFIELD("Date Départ Marseille");
                TESTFIELD("Date de Douanement",0D);
                TESTFIELD("Date Arrivage Magasin",0D);
                IF ("Date Arrivée GEFCO" < "Date Départ Marseille") AND NOT ("Date Arrivée GEFCO" = 0D) THEN
                  ERROR('date non valide!');
            end;
        }
        field(17;Type;Option)
        {
            OptionCaption = '" ,Remorque,Groupage"';
            OptionMembers = " ",Remorque,Groupage;
        }
        field(18;"Créer par";Code[50])
        {
        }
        field(19;"No. Arrivage PR";Code[20])
        {
            TableRelation = "Entete Arrivage PR"."No. Arrivage";
        }
        field(20;Observation;Text[250])
        {
        }
        field(21;"Date Arrivage Magasin";Date)
        {

            trigger OnValidate();
            begin
                /*
                TESTFIELD("Date Document");
                TESTFIELD("Date Départ Marseille");
                TESTFIELD("Date Arrivée GEFCO");
                TESTFIELD("Date de Douanement");
                IF ("Date Arrivage Magasin" < "Date de Douanement") AND NOT ("Date Arrivage Magasin" = 0D) THEN
                  ERROR('date non valide!');
                */

            end;
        }
        field(22;"Date de Douanement";Date)
        {

            trigger OnValidate();
            begin
                TESTFIELD("Date Document");
                TESTFIELD("Date Départ Marseille");
                TESTFIELD("Date Arrivée GEFCO");
                TESTFIELD("Date Arrivage Magasin",0D);
                IF ("Date de Douanement" < "Date Arrivée GEFCO") AND NOT ("Date de Douanement" = 0D)  THEN
                  ERROR('date non valide!');
            end;
        }
        field(23;"Total Poid Net";Decimal)
        {
            CalcFormula = Sum("Ligne Factures P.R /Clois"."Poid Net" WHERE (No. Document=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(24;Staut;Option)
        {
            OptionCaptionML = ENU=' ,Lancer,Reouvrir',
                              FRA=' ,Lancer,Reouvrir';
            OptionMembers = " ",Lancer,Reouvrir;
        }
        field(25;"Nbre. Colis Scanner";Integer)
        {
            CalcFormula = Count("CAB Mouvement" WHERE (No. Dossier Import=FIELD(No.),
                                                       Type Mouvement=FILTER(PColis),
                                                       Remarque=CONST(Valid)));
            Caption = 'Nbre. Colis Scanner Valide';
            FieldClass = FlowField;
        }
        field(26;"Nbre. Colis Scanner Invalid";Integer)
        {
            CalcFormula = Count("CAB Mouvement" WHERE (No. Dossier Import=FIELD(No.),
                                                       Type Mouvement=FILTER(PColis),
                                                       Remarque=CONST(Invalid)));
            FieldClass = FlowField;
        }
        field(27;"Date d'ouverture";Date)
        {
            CaptionML = ENU='Opening Date',
                        FRA='Date d''ouverture';
            Editable = false;
        }
        field(28;"Date de clôture";Date)
        {
            CaptionML = ENU='Closing Date',
                        FRA='Date de clôture';
            Editable = true;
        }
        field(29;"N° Fournisseur";Code[20])
        {
            CaptionML = ENU='Vendor No.',
                        FRA='N° Fournisseur';
            Editable = true;
            TableRelation = Vendor.No.;

            trigger OnValidate();
            begin

                IF Frs.GET("N° Fournisseur") THEN BEGIN
                   "Nom fournisseur":=Frs.Name;
                   "Adresse Fournisseur":=Frs.Address;
                   "Adresse Fournisseur 2":=Frs."Address 2";
                   "Code Post Fournisseur":=Frs."Post Code";
                   "Ville Fournisseur":=Frs.City;
                   "Code Pays Fournisseur":=Frs."Country/Region Code"
                END;
            end;
        }
        field(30;"Souches de N°";Code[10])
        {
            CaptionML = ENU='Series No.',
                        FRA='Souches de N°';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(31;"Nom fournisseur";Text[60])
        {
            CaptionML = ENU='Vendor Name',
                        FRA='Nom fournisseur';
        }
        field(32;"statut Dossier";Option)
        {
            CaptionML = ENU='Status',
                        FRA='Statut';
            Editable = true;
            OptionMembers = " ","En attente de facturation","Facturé","Clôturé";

            trigger OnValidate();
            var
                Br : Record "120";
            begin
            end;
        }
        field(33;"Mnt total lig doss (dev soc)";Decimal)
        {
            AutoFormatType = 2;
            Editable = false;
        }
        field(34;Volume;Decimal)
        {
        }
        field(35;"Code condition livraison";Code[10])
        {
            Editable = false;
            TableRelation = Table0;
        }
        field(36;"Date Déclaration";Date)
        {
        }
        field(37;"N° dern Commande";Code[20])
        {
            TableRelation = "Purchase Header".No.;
            ValidateTableRelation = false;
        }
        field(38;"N° Transitaire";Code[20])
        {
            TableRelation = Vendor.No.;

            trigger OnValidate();
            begin
                IF Frs.GET("N° Transitaire") THEN BEGIN
                   "Nom Transitaire":=Frs.Name;
                   "Adresse Transitaire":=Frs.Address;
                   "Adresse Transitaire 2":=Frs."Address 2";
                   "Code Post Transitaire":=Frs."Post Code";
                   "Ville Transitaire":=Frs.City;;
                END;
            end;
        }
        field(39;"Nom Transitaire";Text[60])
        {
        }
        field(40;"Adresse Transitaire";Text[50])
        {
        }
        field(41;"Adresse Transitaire 2";Text[50])
        {
        }
        field(42;"Code Post Transitaire";Code[20])
        {
            CaptionML = ENU='Post Code',
                        FRA='Code postal';
            TableRelation = "Post Code";
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
        }
        field(43;"Ville Transitaire";Text[30])
        {
        }
        field(44;"Adresse Fournisseur";Text[50])
        {
            CaptionML = ENU='Adresse',
                        FRA='Adress';
        }
        field(45;"Adresse Fournisseur 2";Text[50])
        {
            CaptionML = ENU='Adresse 2',
                        FRA='Adress 2';
        }
        field(46;"Code Post Fournisseur";Code[20])
        {
            CaptionML = ENU='Post Code',
                        FRA='Code Postal';
        }
        field(47;"Ville Fournisseur";Text[30])
        {
            CaptionML = ENU='City',
                        FRA='Ville';
        }
        field(48;"Code Pays Fournisseur";Code[10])
        {
            CaptionML = ENU='Country/Region Code',
                        FRA='Code pays/région';
            TableRelation = Country/Region;
        }
        field(49;"Filter Fournisseur";Code[20])
        {
            CaptionML = ENU='Vendor Filter',
                        FRA='Filtre Fournisseur';
            FieldClass = FlowFilter;
        }
        field(50;"N° Transit Externe";Code[20])
        {
            CaptionML = ENU='External Document No.',
                        FRA='N° Transit Externe';
        }
        field(51;"N° Titre d'importation";Code[20])
        {
            Description = 'SM LC';
            TableRelation = "Arrivage VN";
        }
        field(52;"Totalement Colturer";Boolean)
        {
            CalcFormula = Min("Posted Whse. Receipt Header".Cloturer WHERE (No. Dossier Imprort=FIELD(No.)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(53;"No L.C";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Lettre de crédit L.C"."Code L.C" WHERE (Type Import L.C=CONST(PR));
        }
        field(54;"Nbre Colis Receptionner";Integer)
        {
            CalcFormula = Count("Warehouse Receipt Header" WHERE (No. Dossier Imprort=FIELD(No.)));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert();
    begin
        SetupAutomobile.GET;
        IF "No."= '' THEN
          NoSeriesManagement.InitSeries(SetupAutomobile."No. DossirFact. Pr",xRec."No. Série","Date Saisie","No.","No. Série");

        "Cous du jour" := 1/CurrExchRate.ExchangeRate(WORKDATE,'EURO');
        "Date Document" := WORKDATE;
        "Créer par" := USERID;
    end;

    var
        CurrExchRate : Record "330";
        SetupAutomobile : Record "70029";
        NoSeriesManagement : Codeunit "396";
        Frs : Record "23";
        LigneFacturesPRClois : Record "70061";
}

