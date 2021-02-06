table 70070 "Contrôle Qualité"
{

    fields
    {
        field(1;"No.";Code[20])
        {
        }
        field(2;Nom;Text[80])
        {
        }
        field(3;"Prénom";Text[80])
        {
        }
        field(4;Immatriculation;Code[20])
        {
        }
        field(5;"N° Commande de travaux";Code[20])
        {
        }
        field(6;Km;Decimal)
        {
            Caption = 'Kilométrage';
        }
        field(7;"Entretien périodique";Boolean)
        {
        }
        field(8;DS;Boolean)
        {
        }
        field(9;"Retour Atelier";Boolean)
        {
        }
        field(10;Equipe;Code[10])
        {
            TableRelation = "Resource Group".No.;
        }
        field(11;"Date signature";Date)
        {
        }
        field(12;"Date de contrôle";Date)
        {
        }
        field(13;"Dés que Possible";Text[250])
        {
        }
        field(14;"Ultérieurement";Text[250])
        {
        }
        field(15;"code Client";Code[20])
        {
        }
        field(16;"Nom Client";Text[80])
        {
        }
        field(17;"Prenom client";Text[80])
        {
        }
        field(18;"Téléphone";Text[30])
        {
        }
        field(19;"Date prochaine entretien";Date)
        {
        }
        field(20;"KM prochaine entretien";Decimal)
        {
        }
        field(21;"Date limite";Date)
        {
        }
        field(22;"CDP Présence Fiches";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(23;"CDP Rubriques Renseignées";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(25;"CDP Vérification Compagnes";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(26;"CDP Impression Ecran synthèse";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(27;"CDP Commande Signée Client CCS";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(28;"CDP CommandeSgnée Compagnon";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(29;"CDP Montant Estimation Reporté";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(30;"CDP Résultats Essai Mentionnés";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(31;"CDP Facture STPrésente";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(32;"CDP TR. Supp. Notés CT Accepté";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(33;"CDP Présence Relevés Mesures";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(34;"CSV Tr. Conformes à la Command";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(35;"CSV Eléments Réparés OK";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(36;"CSV Niveaux contrôlés";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(37;"CSV Eclairages Contrôlés";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(38;"CSV Témoins Alerte Eteints";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(39;"CSV Réinitialisation Effectuée";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(40;"CSV Eléments Protection OK";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(41;"CSV Pression Vérifiée Conforme";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(42;"CSV Etat Balais Essuie Glace";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(43;"CSV Klaxon Fonctionne";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(45;"ED Eléments Réparés Fonctionne";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(46;"ED Condition Apparition Reprou";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(47;"CC Remise En Etat Correcte";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(48;"CC Ajustements Corrects";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(49;"CC Equipements Fonctionnels";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(50;"CP Absence Reyures";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(51;"CP Absence Coulures";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(52;"CP Absence Débordement";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(53;"CP Absence Poussière";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(54;"CP Teinte Conforme";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(55;"CP Absence Brouillard";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(56;"CF Date Heure A Jour";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(57;"CF Stations Radio Programmées";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(58;"CPV Pas Salissures";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(59;"CPV Nettoyage Int. Fait";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(60;"CPV Nettoyage Ext. Fait";Option)
        {
            OptionMembers = " ",Oui,Non,"Rectifié";
        }
        field(61;Commentaire;Text[250])
        {
        }
        field(62;"Conformité";Boolean)
        {
        }
        field(63;"Bon Pour Facture";Boolean)
        {
            Enabled = true;
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
}

