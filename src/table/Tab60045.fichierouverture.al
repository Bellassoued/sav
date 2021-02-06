table 60045 "fichier ouverture"
{

    fields
    {
        field(1;"N° séquence";Integer)
        {
        }
        field(2;"Type de compte";Option)
        {
            OptionCaption = 'Général,Client,Fournisseur,Banque,Immobilisation,Partenaire IC';
            OptionMembers = "Général",Client,Fournisseur,Banque,Immobilisation,"Partenaire IC";
        }
        field(3;"N° de compte";Code[20])
        {
        }
        field(4;"N° Documetnt";Code[20])
        {
        }
        field(5;"N° Doc Externe";Text[60])
        {
        }
        field(6;"Date CPT";Date)
        {
        }
        field(7;"Date Document";Date)
        {
        }
        field(8;"Groupe de comptabilisation";Code[20])
        {
        }
        field(9;"Désignation";Text[100])
        {
        }
        field(10;"code Devise";Code[20])
        {
        }
        field(11;"Facteur Devise";Decimal)
        {
            DecimalPlaces = 3:15;
        }
        field(12;"Débit";Decimal)
        {
            DecimalPlaces = 3:5;
        }
        field(13;"Crédit";Decimal)
        {
            DecimalPlaces = 3:5;
        }
        field(14;"Montant Débit Devise";Decimal)
        {
        }
        field(15;"Montant Crédit Devise";Decimal)
        {
        }
        field(16;"Date D'écheance";Date)
        {
        }
        field(17;"N° client sage";Code[20])
        {
        }
        field(18;traiter;Boolean)
        {
        }
        field(19;"Fournisseur Not exis";Boolean)
        {
        }
        field(20;"Client Not exist";Boolean)
        {
        }
        field(21;"Banque Not exist";Boolean)
        {
        }
        field(22;"compte GN Not exist";Boolean)
        {
        }
        field(23;"N° de  Compte Comptable ax";Code[20])
        {
        }
        field(24;"Client Bloqué";Boolean)
        {
        }
        field(25;"Ancien Model No";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Update service cost 280419';
        }
        field(26;"New Model No";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Update service cost 280419';
        }
        field(27;Chassi;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(28;Dossier;Code[30])
        {
        }
        field(29;"Devise douane";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3:8;
        }
        field(30;"Devise acheté";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3:8;
        }
        field(31;"No. déclaration";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Prix fob";Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3:8;
        }
        field(33;devise;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34;frais;Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 3:8;
        }
        field(35;lc;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(36;"date declaration";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(37;"Line No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Ancien Code Immo";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(39;"Groupe compta. Immo";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(40;"Valeur Aquisition";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(41;"Classe Immo.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(42;"Sous Classe Immo.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(43;"Cumul Amortissement";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(44;"Date fin amortissement";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(45;Site;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(46;"Ancien site";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(47;Qte;Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"N° séquence")
        {
        }
    }

    fieldgroups
    {
    }
}

