table 60049 "Reservation Vue"
{

    fields
    {
        field(1;"Primary Key";Integer)
        {
        }
        field(2;VIN;Code[20])
        {
        }
        field(3;"No. Article";Code[20])
        {
        }
        field(4;"Code Magasin";Code[20])
        {
            TableRelation = Location.Code;
        }
        field(5;Emplacement;Code[20])
        {
            TableRelation = Bin.Code WHERE (Location Code=CONST(PARC_VN));
        }
        field(6;"Quantité";Decimal)
        {
        }
        field(7;Production;Text[100])
        {
        }
        field(8;"Nom Vendeur";Text[100])
        {
        }
        field(9;"Nom Client";Text[100])
        {
        }
        field(10;"Délai Expiration";Integer)
        {
        }
        field(11;"Expiration Dans";Integer)
        {
        }
        field(12;Commentaire;Text[250])
        {
        }
        field(13;"Code Variante";Code[20])
        {
        }
        field(14;"Date Création";Date)
        {
        }
        field(15;"Date préparation";Date)
        {
        }
        field(16;"No. Série";Code[20])
        {
        }
        field(17;"Réservé à partir de";Text[100])
        {
        }
        field(18;"Réservé pour";Text[100])
        {
        }
        field(19;"No. Séquence";Integer)
        {
        }
        field(20;"Type Commerciale";Text[80])
        {
        }
        field(21;"Document type";Text[80])
        {
        }
        field(22;"Document No.";Text[80])
        {
        }
        field(23;"Quantité Réservée";Decimal)
        {
        }
        field(24;"Quantité Non Réservée";Decimal)
        {
        }
        field(25;"Date Comptabilisation";Date)
        {
        }
        field(26;"Quantité Restante";Decimal)
        {
        }
        field(27;"Réservé";Boolean)
        {
        }
        field(28;"Stock\Commande Achat";Option)
        {
            OptionMembers = "Commande Achat",Stock;
        }
        field(29;"Date Arrivage";Date)
        {
        }
        field(30;"Modèle";Text[100])
        {
            CalcFormula = Lookup(Item.Description WHERE (No.=FIELD(No. Article)));
            FieldClass = FlowField;
        }
        field(31;"Description perse";Text[100])
        {
            CalcFormula = Lookup(Item."Description Perse" WHERE (No.=FIELD(No. Article)));
            FieldClass = FlowField;
        }
        field(32;"Couleur/Garnissage";Text[100])
        {
            CalcFormula = Lookup("Item Variant".Description WHERE (Code=FIELD(Code Variante),
                                                                   Item No.=FIELD(No. Article)));
            FieldClass = FlowField;
        }
        field(50021;"Date Embarquement Calc";Date)
        {
            CalcFormula = Lookup("Service Item"."Date Embarquement" WHERE (Serial No.=FIELD(VIN)));
            Description = 'SM290617';
            FieldClass = FlowField;
        }
        field(50022;AI;Boolean)
        {
            CalcFormula = Lookup("Service Item".AI WHERE (Serial No.=FIELD(VIN)));
            Description = 'SM290617';
            FieldClass = FlowField;
        }
        field(50023;"Date Embarquement";Date)
        {
            Description = 'SM290617';
        }
        field(50024;"Status Carte Grise";Option)
        {
            Description = 'SM 270717';
            OptionCaption = 'Encours,Envoyé,CHQ Préparé,Déposé,Reçue';
            OptionMembers = Encours,"Envoyé","CHQ Préparé","Déposé","Reçue";
        }
        field(50025;"Date Livraison Prévue";Date)
        {
            Description = 'SM 270717';
        }
        field(50026;"Date Livraison Confirmé";Date)
        {
            Description = 'SM 270717';
        }
        field(50027;Vendeur;Code[20])
        {
            Description = 'SM 020817';
        }
        field(50028;"Responsibility Center";Code[20])
        {
            Description = 'SM 020817';
        }
        field(50029;"Dossier Complet";Boolean)
        {
            CalcFormula = Lookup("Service Item"."Reception Dossier" WHERE (Serial No.=FIELD(VIN)));
            FieldClass = FlowField;
        }
        field(50030;"No. Expédition";Code[20])
        {
        }
        field(70250;"Date Confirmation VIN + CAF";Date)
        {
            CalcFormula = Lookup("Détail VN Arrivage."."Date Emb. confirmée" WHERE (VIN=FIELD(VIN)));
            Description = 'SM 300817';
            FieldClass = FlowField;
        }
        field(70251;"Date Bateau Visé VIN + CAF";Date)
        {
            CalcFormula = Lookup("Détail VN Arrivage."."Date bâteau visé" WHERE (VIN=FIELD(VIN)));
            Description = 'SM 300817';
            FieldClass = FlowField;
        }
        field(70252;"HT/TTC";Option)
        {
            CalcFormula = Lookup("Détail VN Arrivage."."Répartiton HT\TTC" WHERE (VIN=FIELD(VIN)));
            Description = 'KT 25012019';
            FieldClass = FlowField;
            OptionMembers = " ",HT,TTC;
        }
        field(70253;"Exclu du disponible";Boolean)
        {
            CalcFormula = Lookup(Bin."Not available" WHERE (Code=FIELD(Emplacement)));
            Description = 'KT 30012019';
            FieldClass = FlowField;
        }
        field(70254;"Hors taxe";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 27022019';
        }
        field(80060;"Dossier Validé";Boolean)
        {
            CalcFormula = Lookup("Service Item"."Dossier Validé" WHERE (Serial No.=FIELD(VIN)));
            Description = 'SM 060917';
            FieldClass = FlowField;
        }
        field(80061;Justificatif;Boolean)
        {
            CalcFormula = Lookup("Service Item".Justificatif WHERE (Serial No.=FIELD(VIN)));
            Description = 'SM 060917';
            FieldClass = FlowField;
        }
        field(80062;"Date Création Commande";DateTime)
        {
            Description = 'SM 060917';
        }
        field(80063;"Code Couleur";Code[10])
        {
        }
        field(80064;"Code Garissage";Code[10])
        {
        }
        field(80065;Couleur;Text[100])
        {
            CalcFormula = Lookup("Item Variant"."Désignation couleur" WHERE (Code=FIELD(Code Variante),
                                                                             Item No.=FIELD(No. Article)));
            FieldClass = FlowField;
        }
        field(80066;Garnissage;Text[100])
        {
            CalcFormula = Lookup("Item Variant"."Désignation garnissage" WHERE (Code=FIELD(Code Variante),
                                                                                Item No.=FIELD(No. Article)));
            FieldClass = FlowField;
        }
        field(80067;"Date Entree";Date)
        {
            CaptionML = ENU='Date d''entrée',
                        FRA='Date d''entrée';
            DataClassification = ToBeClassified;
        }
        field(80069;"Réservation DC";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'SM 070119';

            trigger OnValidate();
            begin
                //SM 05012019
                RecGUserSetup.GET(USERID);
                IF NOT RecGUserSetup."Direction Commercial"  THEN
                  ERROR('Vous n''avez pas le droit de modifier');
                //END SM
            end;
        }
        field(80070;"Commentaire DC";Text[30])
        {
            DataClassification = ToBeClassified;
            Description = 'SM 110119';

            trigger OnValidate();
            begin
                //SM 05012019
                RecGUserSetup.GET(USERID);
                IF NOT RecGUserSetup."Direction Commercial"  THEN
                  ERROR('Vous n''avez pas le droit de modifier');
                //END SM
            end;
        }
        field(80071;"Réservation marché";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'KT 02072019';
        }
        field(80072;"Commentaire appro";Text[250])
        {
            CalcFormula = Lookup("Détail VN Arrivage."."Commentaire Kais" WHERE (VIN=FIELD(VIN)));
            Description = 'KT 02072019';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
        }
        key(Key2;"Réservé","Stock\Commande Achat","Date Embarquement")
        {
        }
        key(Key3;"Date Embarquement")
        {
        }
        key(Key4;"Réservé","Stock\Commande Achat","Date Entree")
        {
        }
    }

    fieldgroups
    {
    }

    var
        RecGUserSetup : Record "91";
}

