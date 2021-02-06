table 60092 "Suivi Charge VIN."
{

    fields
    {
        field(1;"No. Réception";Code[20])
        {
            TableRelation = "Purch. Rcpt. Header".No.;
        }
        field(2;"No. Ligne Réception";Integer)
        {
        }
        field(3;"No. Article";Code[50])
        {
            TableRelation = Item.No.;
        }
        field(4;"No. Dossier";Code[20])
        {
            TableRelation = "Dossiers Transit";
        }
        field(5;"Description Article";Code[100])
        {
        }
        field(6;Marque;Code[50])
        {
        }
        field(7;Gamme;Code[30])
        {
        }
        field(8;"Code variante";Code[30])
        {
        }
        field(9;Empattement;Code[50])
        {
        }
        field(10;"No. Serie";Code[100])
        {
        }
        field(17;"No. Commande Achat";Code[20])
        {
            TableRelation = "Purchase Header".No. WHERE (Document Type=FILTER(Order));
        }
        field(18;"Date Commande Achat";Date)
        {
        }
        field(19;"-------------------------";Code[20])
        {
        }
        field(20;"Date Réception";Date)
        {
        }
        field(21;"Date récept. Prévu(Arrivage)";Date)
        {
            Description = 'a supprimer';
        }
        field(24;"No. Facture Achat Navision";Code[50])
        {
            TableRelation = "Purch. Inv. Header".No.;
        }
        field(25;"Date Facture Achat";Date)
        {
        }
        field(26;"Montant Achat Unitaire";Decimal)
        {
            Description = 'x';
        }
        field(29;"Devise Achat";Code[10])
        {
        }
        field(33;Fournisseur;Code[50])
        {
        }
        field(35;"No. Facture Achat Fournisseur";Code[50])
        {
        }
        field(42;"Réservation sur stock (Non)";Code[80])
        {
        }
        field(43;"Code Magasin";Code[20])
        {
        }
        field(44;"Taux de change facture achat";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(52;"Statut Dossier";Code[15])
        {
        }
        field(53;"Fact. Ach Payé";Option)
        {
            Description = 'Facture Frs payé ou non ou partiellement';
            OptionCaption = 'Non,Totalement,Partiellement';
            OptionMembers = Non,Totalement,Partiellement;
        }
        field(54;"Reste à payé F.Ach";Decimal)
        {
            Description = 'reste à payer facture fournisseur';
        }
        field(57;"No. Réglement Frs";Code[30])
        {
            Description = 'bordereau de paiement frs';
            TableRelation = "Payment Header".No.;
        }
        field(59;"Entry No.";Integer)
        {
        }
        field(60;Anomalie;Text[50])
        {
        }
        field(61;"Type Document";Option)
        {
            OptionMembers = Commande,"Réception";
        }
        field(62;Observation;Text[100])
        {
        }
        field(100;"Code Client Vente";Code[20])
        {
        }
        field(101;"Nom Client Vente";Code[100])
        {
        }
        field(102;"Code Vendeur";Code[50])
        {
        }
        field(103;"No. Commande Vente";Code[20])
        {
        }
        field(104;"Date commande Vente";Date)
        {
        }
        field(105;"No. BL";Code[20])
        {
        }
        field(106;"No. Facture Vente";Code[20])
        {
            TableRelation = "Sales Invoice Header".No.;
        }
        field(107;"Date Facture Vente";Date)
        {
        }
        field(108;"Montant Facture Vente HT";Decimal)
        {
            Description = 'x';
        }
        field(109;"Devise Vente";Code[20])
        {
        }
        field(110;"Taux de change Facture vente";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(111;"Fact. Vte Payé";Option)
        {
            Description = 'Facture  client payé ou non ou partiellement';
            OptionCaption = 'Non,Totalement,Partiellement';
            OptionMembers = Non,Totalement,Partiellement;
        }
        field(112;"Prix de revient théorxxxxxxxxx";Decimal)
        {
        }
        field(113;"Reste à payé F.Vte";Decimal)
        {
            Description = 'reste à payer facture vente client';
        }
        field(126;"Date BL Vente";Date)
        {
        }
        field(130;"Client Leasing";Code[100])
        {
        }
        field(131;"Nom Leasing";Code[70])
        {
        }
        field(140;PVN;Decimal)
        {
            Description = 'Sum("Service Ledger Entry"."Amount (LCY)" WHERE (Entry Type=FILTER(Sale),Serial No. (Serviced)=FIELD(No. Serie),Document Type=FILTER(Invoice)))';
        }
        field(150;"Txt Marge vente Réel";Code[50])
        {
        }
        field(151;"TxTMarge vente théorique";Code[50])
        {
        }
        field(152;"Taux change Devise Paiement";Decimal)
        {
            DecimalPlaces = 5:5;

            trigger OnValidate();
            begin

                // VALIDATE("Prix de vente");
            end;
        }
        field(153;"Montant Marge Brut";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(170;"Frais d'approches Réelles";Decimal)
        {

            trigger OnValidate();
            begin



                 //"Prix de revient théorique" := ("Taux de change théorique"*"Montant Achat Unitaire") + "Frais d'approche Théorique";
                // VALIDATE("Prix de vente Saisie");
            end;
        }
        field(172;"Prix de revient réel";Decimal)
        {
        }
        field(173;"Taux de Marge actuel";Decimal)
        {
            Description = '4 niveau de marge';
        }
        field(174;"Prix de revient Avec PVN";Decimal)
        {
            Description = 'a supprimer';
        }
        field(175;"Marge vente avec PVN";Decimal)
        {
            Description = 'a supprimer';
        }
        field(200;"Taux de change estimatif";Decimal)
        {
            DecimalPlaces = 3:8;
            Description = 'Estimatif';

            trigger OnValidate();
            begin
                
                IF "Devise Achat" = 'TND' THEN
                 "Prix de revien estimatif" :=  "Montant Achat Unitaire"  + "Frais d'approche estimatif"
                ELSE
                 "Prix de revien estimatif" := ("Taux de change estimatif"*"Montant Achat Unitaire") + "Frais d'approche estimatif";
                
                "Taux Marge estimative" := ("Prix de revien estimatif" -"Prix de vente catalogue.")/
                                                        "Prix de revien estimatif";
                /*
                IF "Frais d'approches Réelles" <> 0 THEN
                BEGIN
                IF "Devise Achat" = 'TND' THEN
                 "Prix de revient théorique" :=  "Montant Achat Unitaire"  + "Frais d'approches Réelles"
                ELSE
                 "Prix de revient théorique" := ("Taux de change théorique"*"Montant Achat Unitaire") + "Frais d'approches Réelles";
                END;
                IF "Prix de vente théorique" <> 0 THEN
                BEGIN
                "Marge vente théorique"  :=("Prix de vente théorique" -"Prix de revient théorique")/
                                                        "Prix de vente théorique";
                "Marge vente théorique" :=  "Marge vente théorique"*100;
                "Marge vente théorique" := ROUND("Marge vente théorique",0.1);
                "TxTMarge vente théorique" := FORMAT("Marge vente théorique") + ' ' + '%';
                END;
                */
                
                
                // VALIDATE("Prix de vente");   04-11-17

            end;
        }
        field(201;"Frais d'approche estimatif";Decimal)
        {
            Description = 'Estimatif';

            trigger OnValidate();
            begin
                /*
                IF "Frais d'approches Réelles" = 0 THEN
                 BEGIN
                    IF ("Taux de change théorique" <> 0)   THEN
                     "Prix de revient théorique" := ("Taux de change théorique"*"Montant Achat Unitaire") + "Frais d'approche Théorique"
                     ELSE
                       "Prix de revient théorique" := "Montant Achat Unitaire" + "Frais d'approche Théorique";
                END
                ELSE
                BEGIN
                  IF ("Taux de change théorique" <> 0)  THEN
                   "Prix de revient théorique" := ("Taux de change théorique"*"Montant Achat Unitaire") + "Frais d'approches Réelles"
                   ELSE
                    "Prix de revient théorique" :="Montant Achat Unitaire" + "Frais d'approches Réelles";
                END;
                
                 VALIDATE("Prix de vente théorique");
                 */

            end;
        }
        field(202;"Prix de revien estimatif";Decimal)
        {
            Description = 'Estimatif';
        }
        field(203;"Prix de vente catalogue.";Decimal)
        {
            Description = 'Estimatif';

            trigger OnValidate();
            begin
                /*
                IF ("Prix de vente théorique" <> 0) THEN
                 BEGIN
                   "Marge vente théorique"  :=("Prix de vente théorique" -"Prix de revient théorique")/
                                                           "Prix de vente théorique";
                   "Marge vente théorique" :=  "Marge vente théorique"*100;
                   "Marge vente théorique" := ROUND("Marge vente théorique",0.1);
                   "TxTMarge vente théorique" := FORMAT("Marge vente théorique") + ' ' + '%';
                 END
                ELSE
                 BEGIN
                   "Marge vente théorique"  :=0;
                   "Marge vente théorique" :=  0;
                   "Marge vente théorique" := 0;
                   "TxTMarge vente théorique" :='';
                 END;
                 */

            end;
        }
        field(204;"Taux Marge estimative";Decimal)
        {
            DecimalPlaces = 3:8;
            Description = 'Estimatif';
        }
        field(205;"Taux de change Déclaration";Decimal)
        {
            DecimalPlaces = 3:5;

            trigger OnValidate();
            begin
                /*
                 "Prix de revient Taux Déclarati" :=  "Taux de change Déclaration"* "Montant Achat Unitaire"+
                                                                 "Frais d'approche Théorique";
                 IF "Frais d'approches Réelles" <> 0 THEN
                 "Prix de revient Taux Déclarati" :=  "Taux de change Déclaration"* "Montant Achat Unitaire"+
                                                                 "Frais d'approches Réelles" ;
                */

            end;
        }
        field(206;"Prix de revient Taux Déclarati";Decimal)
        {
            Description = 'a supprimer :';
        }
        field(207;"Marge vente % Taux Declaration";Decimal)
        {
        }
        field(208;"Ecart Prix de vente : Cata/Fac";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(209;"Montant marge Brut Estimatif";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80003;"Réservation sur commande (Non)";Text[100])
        {
            Description = 'SBS';

            trigger OnValidate();
            begin
                /*
                //27-01
                CLEAR(PurchaseLine);
                IF "Type Document" = "Type Document"::Commande THEN
                BEGIN
                PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type"::Order);
                PurchaseLine.SETRANGE("Document No.","No. Commande Achat");
                PurchaseLine.SETRANGE("Line No.","No. Ligne commande achat");
                PurchaseLine.FIND('-');
                 BEGIN
                  //PurchaseLine."Réservation avant réception" := "Réservation sur commande";
                  PurchaseLine.MODIFY;
                 END;
                END
                ELSE
                
                ERROR('Sur cette interface la réservation ne se fait que pour les commandes');
                
                VALIDATE("Qté à Réservéé",1);
                */

            end;
        }
        field(80004;"No. Ligne commande achat";Integer)
        {
        }
        field(80005;"Réservation /commande";Boolean)
        {
        }
        field(80006;"Date dernier Transfert";Date)
        {
        }
        field(80007;"Echéance de paiement Frs";Date)
        {
        }
        field(80029;Type;Code[20])
        {
        }
        field(80030;"Item leadger Entry No.";Integer)
        {
        }
        field(80031;"Centre de gestion";Code[20])
        {
        }
        field(80033;"Depôt C.G";Date)
        {
        }
        field(80034;"Réception C.G";Date)
        {
        }
        field(80035;"No. CAF";Code[30])
        {
        }
        field(80036;"Ligne clôturer";Boolean)
        {
        }
        field(80037;"Taux Négocié";Decimal)
        {
        }
        field(80038;"Financement devise";Boolean)
        {
        }
        field(80039;"Taux finncement";Decimal)
        {
        }
        field(80040;"No. Lettre crédit";Code[20])
        {
        }
        field(80041;"Code condition de paiement";Code[20])
        {
        }
        field(80042;"Frais de Change";Decimal)
        {
        }
        field(80043;"VIN en stock";Boolean)
        {
        }
        field(80044;"Gratuité (Hors PVN)";Decimal)
        {
        }
        field(80045;"No. Projet Expédition";Code[20])
        {
        }
        field(80046;"Banque L.C";Code[20])
        {
        }
        field(80047;"Garantie Fournisseur";Decimal)
        {
        }
        field(80048;SAV;Decimal)
        {
        }
        field(80049;"Garantie BSB";Decimal)
        {
            Caption = 'Garantie BSB';
        }
        field(80050;"Nom vendeur";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(80051;"Type paiement";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(80052;"Code client Leasing";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(80053;"Type vendeur";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(80054;"Type vente";Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(80055;"No. Lettre crédit Banque";Code[30])
        {
            CalcFormula = Lookup("Lettre de crédit L.C"."No. LC / Banque" WHERE (Code L.C=FIELD(No. Lettre crédit)));
            FieldClass = FlowField;
        }
        field(80056;"Taux de change Prévisonel";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3:8;
            Description = 'Estimatif';

            trigger OnValidate();
            begin
                
                IF "Devise Achat" = 'TND' THEN
                 "Prix de revien estimatif" :=  "Montant Achat Unitaire"  + "Frais d'approche estimatif"
                ELSE
                 "Prix de revien estimatif" := ("Taux de change estimatif"*"Montant Achat Unitaire") + "Frais d'approche estimatif";
                
                "Taux Marge estimative" := ("Prix de revien estimatif" -"Prix de vente catalogue.")/
                                                        "Prix de revien estimatif";
                /*
                IF "Frais d'approches Réelles" <> 0 THEN
                BEGIN
                IF "Devise Achat" = 'TND' THEN
                 "Prix de revient théorique" :=  "Montant Achat Unitaire"  + "Frais d'approches Réelles"
                ELSE
                 "Prix de revient théorique" := ("Taux de change théorique"*"Montant Achat Unitaire") + "Frais d'approches Réelles";
                END;
                IF "Prix de vente théorique" <> 0 THEN
                BEGIN
                "Marge vente théorique"  :=("Prix de vente théorique" -"Prix de revient théorique")/
                                                        "Prix de vente théorique";
                "Marge vente théorique" :=  "Marge vente théorique"*100;
                "Marge vente théorique" := ROUND("Marge vente théorique",0.1);
                "TxTMarge vente théorique" := FORMAT("Marge vente théorique") + ' ' + '%';
                END;
                */
                
                
                // VALIDATE("Prix de vente");   04-11-17

            end;
        }
        field(80057;"Prix de revien Prévisonel";Decimal)
        {
            DataClassification = ToBeClassified;
            Description = 'Estimatif';
        }
        field(80058;"Taux Marge Prévisonel";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3:8;
            Description = 'Estimatif';
        }
        field(80059;"Montant Marge vente Prévisonel";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(80060;"Mnt Droit Douane";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80061;"Mnt Fodec";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80062;"Mnt TVA";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80063;"Mnt RDP";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80064;"Mnt Assurance";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80065;"Frais Généraux";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80066;"Code Magasin stock";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(80067;"Achat a terme";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80068;"Date achat a terme";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(80069;"Mnt Fact  complémentaire";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80070;"Mnt Avoir Ristourne";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80071;"Répartiton HT\TTC";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'SM 040119';
            OptionMembers = " ",HT,TTC;
        }
        field(80072;"Sejour en stock";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(80073;"Vitesse de vente";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(80074;Couleur;Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(80075;Garnissage;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(80076;"Commentaire arrivage";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(80077;"Port de provenance";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(80078;"Sur arrivage";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80079;"Commandé";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80080;"Réceptionné";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80081;"Mois de réception";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(80082;"Entrée en Stock";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(80083;"Existe VIN";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80084;"Mois Vente";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(80085;"Echéance de Réglement client";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(80086;"Bordereau de réglement client";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(80087;"Réservation sur arrivage";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80088;"Réservation sur stock.";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80089;"Coût Prévu / réception";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80090;"Valeur de Stock  en cours";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80091;"Mnt facture vente aff/cahssie";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80092;"Montant avoir";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80093;Emplacement;Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'KT 16062020';
        }
        field(80094;"Date réception prévue";Date)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 16062020';
        }
    }

    keys
    {
        key(Key1;"No. Serie")
        {
        }
        key(Key2;"No. Réception","No. Ligne Réception")
        {
        }
    }

    fieldgroups
    {
    }

    var
        PurchaseLine : Record "39";
        GDossier : Record "50014";
        UserSetup : Record "91";
        PurchaseReceiptLine : Record "121";
}

