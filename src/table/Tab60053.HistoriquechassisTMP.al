table 60053 "Historique chassisTMP"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            Caption = 'N° séquence';
        }
        field(2;"Modèle Vehicule";Code[20])
        {
        }
        field(3;"Code Variante";Code[20])
        {
        }
        field(4;"Numéro de chassis";Code[20])
        {
        }
        field(6;"Date operation";Date)
        {
        }
        field(7;"Numero document";Code[20])
        {
        }
        field(8;"statut service";Code[30])
        {
        }
        field(9;Montant;Decimal)
        {
        }
        field(10;Provenance;Code[20])
        {
        }
        field(11;Destination;Code[20])
        {
        }
        field(12;"Kilométrage";Integer)
        {
        }
        field(13;"Entry Type";Option)
        {
            CaptionML = ENU='Entry Type',
                        FRA='Type écriture';
            OptionCaptionML = ENU='Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer,Consumption,Output, ,Assembly Consumption,Assembly Output,Service',
                              FRA='Achat,Vente,Positif (ajust.),Négatif (ajust.),Transfert,Consommation,Production, ,Consommation d''assemblage,Résultat d''assemblage,Service';
            OptionMembers = Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output," ","Assembly Consumption","Assembly Output",Service;
        }
        field(14;"Order Type";Option)
        {
            CaptionML = ENU='Order Type',
                        FRA='Type de commande';
            Editable = false;
            OptionCaptionML = ENU=' ,Production,Transfer,Service,Assembly',
                              FRA=' ,Production,Transfert,Service,Assemblage';
            OptionMembers = " ",Production,Transfer,Service,Assembly;
        }
        field(15;"Document Type";Option)
        {
            CaptionML = ENU='Document Type',
                        FRA='Type document';
            OptionCaptionML = ENU=' ,Sales Shipment,Sales Invoice,Sales Return Receipt,Sales Credit Memo,Purchase Receipt,Purchase Invoice,Purchase Return Shipment,Purchase Credit Memo,Transfer Shipment,Transfer Receipt,Service Shipment,Service Invoice,Service Credit Memo,Posted Assembly,Service Rapide,Grand service,Reparation Interne,Preparation VN,Livraison VN',
                              FRA=' ,Expédition vente,Facture vente,Réception retour vente,Avoir vente,Réception achat,Facture achat,Expédition retour achat,Avoir achat,Expédition transfert,Réception transfert,Expédition service,Facture service,Avoir service,Assemblage validé,Service Rapide,Grand service,Reparation Interne,Preparation VN,Livraison VN';
            OptionMembers = " ","Sales Shipment","Sales Invoice","Sales Return Receipt","Sales Credit Memo","Purchase Receipt","Purchase Invoice","Purchase Return Shipment","Purchase Credit Memo","Transfer Shipment","Transfer Receipt","Service Shipment","Service Invoice","Service Credit Memo","Posted Assembly","Service Rapide","Grand service","Reparation Interne","Preparation VN","Livraison VN";
        }
        field(16;"Table source";Text[30])
        {
        }
        field(17;"Code Emplacement";Code[20])
        {
        }
        field(18;"Statut PVN";Option)
        {
            OptionCaption = 'Véhicule à Préparer,Encours de Préparation,Véhicule Acceessoires Montés,Véhicule Préparé,Véhicule Disponible Livraison,Véhicule Demandé livraison,PVN Accepté,Livraison Fiche Crée,Livré';
            OptionMembers = "Véhicule à Préparer","Encours de Préparation","Véhicule Acceessoires Montés","Véhicule Préparé","Véhicule Disponible Livraison","Véhicule Demandé livraison","PVN Accepté","Livraison Fiche Crée","Livré";
        }
        field(19;"No BL";Code[20])
        {
        }
        field(20;"No Facture";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
    }

    fieldgroups
    {
    }
}

