table 60089 "Suivi Charge VIN"
{

    fields
    {
        field(1; "No. Réception"; Code[20])
        {
            TableRelation = "Purch. Rcpt. Header";
        }
        field(2; "No. Ligne Réception"; Integer)
        {
        }
        field(3; "No. Article"; Code[50])
        {
        }
        field(4; "No. Dossier"; Code[20])
        {
            TableRelation = "Dossiers Transit";
        }
        field(5; "Description Article"; Code[100])
        {
        }
        field(6; Marque; Code[50])
        {
        }
        field(7; Gamme; Code[20])
        {
        }
        field(8; Genre; Code[20])
        {
        }
        field(9; Empattement; Code[50])
        {
        }
        field(10; "No. Serie"; Code[100])
        {
        }
        field(13; "Code Client Vente"; Code[20])
        {
        }
        field(14; "Nom Client Vente"; Code[100])
        {
        }
        field(15; "Code Vendeur"; Code[50])
        {
        }
        field(16; "No. Commande Vente"; Code[20])
        {
        }
        field(17; "No. Commande Achat"; Code[20])
        {
            TableRelation = "Purchase Header"."No." WHERE(Document Type=FILTER(Order));
        }
        field(18;"Date Réception";Date)
        {
        }
        field(19;"No. BL";Code[20])
        {
        }
        field(20;"Date commande Vente";Date)
        {
        }
        field(21;"No. Facture Vente";Code[20])
        {
            TableRelation = "Sales Invoice Header".No.;
        }
        field(22;"Montant Facture Vente HT";Decimal)
        {
            Description = 'x';
        }
        field(23;"Date Facture Vente";Date)
        {
        }
        field(24;"No. Facture Achat Navision";Code[50])
        {
            TableRelation = "Purch. Inv. Header".No.;
        }
        field(25;"Date Facture Achat";Date)
        {
        }
        field(26;"Montant Facture Achat HT";Decimal)
        {
            Description = 'x';
        }
        field(27;"Devise Vente";Code[20])
        {
        }
        field(29;"Devise Achat";Code[10])
        {
        }
        field(31;"Date Commande Achat";Date)
        {
        }
        field(32;"Année Commande Achat";Integer)
        {
        }
        field(33;Fournisseur;Code[50])
        {
        }
        field(34;"Taux de change Déclaration";Decimal)
        {
            DecimalPlaces = 3:5;
            Description = 'x';

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
        field(35;"No. Facture Achat Fournisseur";Code[50])
        {
        }
        field(38;"Taux change Devise Paiement";Decimal)
        {
            DecimalPlaces = 5:5;

            trigger OnValidate();
            begin

                // VALIDATE("Prix de vente");
            end;
        }
        field(40;"Taux de change théorique";Decimal)
        {
            DecimalPlaces = 5:5;

            trigger OnValidate();
            begin



                IF "Devise Achat" = 'TND' THEN
                 "Prix de revient théorique" :=  "Montant Achat Unitaire"  + "Frais d'approche Théorique"
                ELSE
                 "Prix de revient théorique" := ("Taux de change théorique"*"Montant Achat Unitaire") + "Frais d'approche Théorique";

                IF "Frais d'approches Réelles" <> 0 THEN
                BEGIN
                IF "Devise Achat" = 'TND' THEN
                 "Prix de revient théorique" :=  "Montant Achat Unitaire"  + "Frais d'approches Réelles"
                ELSE
                 "Prix de revient théorique" := ("Taux de change théorique"*"Montant Achat Unitaire") + "Frais d'approches Réelles";
                END;

                IF "Prix de vente" <> 0 THEN
                BEGIN
                "Marge vente théorique"  :=("Prix de vente" -"Prix de revient théorique")/
                                                        "Prix de vente";
                "Marge vente théorique" :=  "Marge vente théorique"*100;
                "Marge vente théorique" := ROUND("Marge vente théorique",0.1);
                "TxTMarge vente théorique" := FORMAT("Marge vente théorique") + ' ' + '%';
                END;



                // VALIDATE("Prix de vente");   04-11-17
            end;
        }
        field(42;"Réservation sur stock";Code[80])
        {
        }
        field(43;"Code Magasin";Code[20])
        {
        }
        field(44;"Mois Cmd Achat";Integer)
        {
        }
        field(45;"Jours Rcpt-Achat";Integer)
        {
        }
        field(46;"Mois Rcpt-Achat";Integer)
        {
        }
        field(47;"Année Rcpt-Achat";Integer)
        {
        }
        field(48;"Mois Fact. Vte";Integer)
        {
        }
        field(49;"Année Fact. Vte";Integer)
        {
        }
        field(50;"Fact. Vte Payé";Option)
        {
            Description = 'Facture  client payé ou non ou partiellement';
            OptionCaption = 'Non,Totalement,Partiellement';
            OptionMembers = Non,Totalement,Partiellement;
        }
        field(51;"Reste à payé F.Vte";Decimal)
        {
            Description = 'reste à payer facture vente client';
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
        field(55;"Prix de revient Taux Déclarati";Decimal)
        {
        }
        field(56;"Marge vente Réel";Decimal)
        {
        }
        field(57;"No. Réglement Frs";Code[30])
        {
            Description = 'bordereau de paiement frs';
            TableRelation = "Payment Header".No.;
        }
        field(58;"Date récept. Prévu(Arrivage)";Date)
        {
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
        field(80003;"Réservation sur commande";Text[100])
        {
            Description = 'SBS';

            trigger OnValidate();
            begin

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
        field(80007;"Echéance de paiement";Date)
        {
        }
        field(80009;"Qté Commande Achat";Integer)
        {
        }
        field(80010;"Qté à Réservéé";Integer)
        {

            trigger OnValidate();
            begin
                //27-01
                CLEAR(PurchaseLine);
                IF "Type Document" = "Type Document"::Commande THEN
                BEGIN
                PurchaseLine.SETRANGE(PurchaseLine."Document Type",PurchaseLine."Document Type"::Order);
                PurchaseLine.SETRANGE("Document No.","No. Commande Achat");
                PurchaseLine.SETRANGE("Line No.","No. Ligne commande achat");
                PurchaseLine.FIND('-');
                 BEGIN
                 // PurchaseLine."Qté Réservée sur InetrfaceT" := "Qté à Réservéé";
                  PurchaseLine.MODIFY;
                 END;
                END
            end;
        }
        field(80012;"Marge vente théorique";Decimal)
        {
        }
        field(80013;"Prix de revient théorique";Decimal)
        {
        }
        field(80014;"Frais d'approche Théorique";Decimal)
        {

            trigger OnValidate();
            begin

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

                 VALIDATE("Prix de vente");
            end;
        }
        field(80015;"Prix de vente";Decimal)
        {

            trigger OnValidate();
            begin

                IF ("Prix de vente" <> 0) THEN
                 BEGIN
                   "Marge vente théorique"  :=("Prix de vente" -"Prix de revient théorique")/
                                                           "Prix de vente";
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
            end;
        }
        field(80016;"Frais d'approches Réelles";Decimal)
        {

            trigger OnValidate();
            begin



                 //"Prix de revient théorique" := ("Taux de change théorique"*"Montant Achat Unitaire") + "Frais d'approche Théorique";
                // VALIDATE("Prix de vente Saisie");
            end;
        }
        field(80017;"Qté Réception";Decimal)
        {
        }
        field(80018;"Montant Achat Unitaire";Decimal)
        {
            Description = 'x';
        }
        field(80019;"Taux de change réel";Decimal)
        {
        }
        field(80020;"Txt Marge vente Réel";Code[50])
        {
        }
        field(80021;"TxTMarge vente théorique";Code[50])
        {
        }
        field(80022;"Prix de revient réel";Decimal)
        {
        }
        field(80023;"Prix Unitaire en devise";Decimal)
        {
        }
        field(80024;"Date BL Vente";Date)
        {
        }
        field(80025;"Mois Liv";Integer)
        {
        }
        field(80026;"Année Liv";Integer)
        {
        }
        field(80027;"Client Leasing";Code[100])
        {
        }
        field(80028;"Nom Leasing";Code[70])
        {
        }
        field(80029;Type;Code[10])
        {
        }
        field(80030;"Item leadger Entry No.";Integer)
        {
        }
        field(80031;"Centre de gestion";Code[20])
        {
        }
        field(80032;PVN;Decimal)
        {
            CalcFormula = Sum("Service Ledger Entry"."Amount (LCY)" WHERE (Entry Type=FILTER(Sale),
                                                                           Serial No. (Serviced)=FIELD(No. Serie),
                                                                           Document Type=FILTER(Invoice)));
            FieldClass = FlowField;
        }
        field(80033;"Depôt C.G";Date)
        {
        }
        field(80034;"Réception C.G";Date)
        {
        }
    }

    keys
    {
        key(Key1;"No. Réception","No. Ligne Réception")
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

