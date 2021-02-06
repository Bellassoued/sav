page 69081 "Chef Réception APV Activity"
{
    PageType = CardPart;
    SourceTable = Table9052;

    layout
    {
        area(content)
        {
            group()
            {
                cuegroup(Orders)
                {
                    CaptionML = ENU='Orders',
                                FRA='Commandes';
                    field("Service Orders - in Process";"Service Orders - in Process")
                    {
                    }
                    field("Service Orders - Finished";"Service Orders - Finished")
                    {
                    }
                    field("Service Orders - Inactive";"Service Orders - Inactive")
                    {
                    }
                    field("Service Orders - Today";"Service Orders - Today")
                    {
                    }
                    field("Service Orders - to Follow-up";"Service Orders - to Follow-up")
                    {
                    }
                }
                cuegroup(Devis)
                {
                    Caption = 'Devis';
                    field("Open Service Quotes";"Open Service Quotes")
                    {
                    }
                    field("Open Service Contract Quotes";"Open Service Contract Quotes")
                    {
                    }
                    field("Service Contracts to Expire";"Service Contracts to Expire")
                    {
                    }
                }
                cuegroup(Chrono)
                {
                    Caption = 'Chrono';
                    field("Rapid Service - in Process";"Rapid Service - in Process")
                    {
                    }
                    field("Rapid Service - Finished";"Rapid Service - Finished")
                    {
                    }
                    field("Rapid Service - Cancelled";"Rapid Service - Cancelled")
                    {
                    }
                    field("Rapid Service - Launched";"Rapid Service - Launched")
                    {
                    }
                    field("Rapid Service - in Process RS";"Rapid Service - in Process RS")
                    {
                    }
                    field("Rapid Service - Finished RS";"Rapid Service - Finished RS")
                    {
                    }
                    field("Rapid Service - Jour";"Rapid Service - Jour")
                    {
                    }
                    field("Rapid Service - Solder";"Rapid Service - Solder")
                    {
                    }
                    field("Rapid Service - Invoiced";"Rapid Service - Invoiced")
                    {
                    }
                }
                cuegroup(Atelier)
                {
                    Caption = 'Atelier';
                    field("Big Service - in Process";"Big Service - in Process")
                    {
                    }
                    field("Big Service - Finished";"Big Service - Finished")
                    {
                    }
                    field("Big Service - in Process RS";"Big Service - in Process RS")
                    {
                    }
                    field("Big Service - Finished RS";"Big Service - Finished RS")
                    {
                    }
                    field("Big Service - With Warranty";"Big Service - With Warranty")
                    {
                    }
                    field("Big Service - With Return";"Big Service - With Return")
                    {
                    }
                    field("Big Service - With Suspendu";"Big Service - With Suspendu")
                    {
                    }
                }
                cuegroup("Réparation")
                {
                    Caption = 'Réparation';
                    field("Préparation - Fiche créer";"Préparation - Fiche créer")
                    {
                    }
                    field("Préparation - Commande Créer";"Préparation - Commande Créer")
                    {
                    }
                    field("Véhicules Accessoires Montés";"Véhicules Accessoires Montés")
                    {
                    }
                }
                cuegroup(Livraisons)
                {
                    Caption = 'Livraisons';
                    field("Livraison - Encours";"Livraison - Encours")
                    {
                    }
                    field("Livraison - Commande Créer";"Livraison - Commande Créer")
                    {
                    }
                    field("Livraison - Commande Facturer";"Livraison - Commande Facturer")
                    {
                    }
                    field("Livraison - Rendez-vous créer";"Livraison - Rendez-vous créer")
                    {
                    }
                    field("Livraison - Véhicule Livrer";"Livraison - Véhicule Livrer")
                    {
                    }
                }
                cuegroup()
                {
                    field("Big Service - Waitting Pick Ap";"Big Service - Waitting Pick Ap")
                    {
                    }
                    field("Big Service - Waitting Post";"Big Service - Waitting Post")
                    {
                    }
                    field("Big Service - Open Pick Ap";"Big Service - Open Pick Ap")
                    {
                    }
                    field("Big Service - Open Post";"Big Service - Open Post")
                    {
                    }
                    field("Big Service - Posted";"Big Service - Posted")
                    {
                    }
                }
                cuegroup()
                {
                    field("Warranty Invoice";"Warranty Invoice")
                    {
                    }
                    field("NB OT RAP J";"NB OT RAP J")
                    {
                    }
                    field("NB OT RAP CLOT J";"NB OT RAP CLOT J")
                    {
                    }
                    field("NB OT GS J";"NB OT GS J")
                    {
                    }
                }
                cuegroup()
                {
                    field("NB DOSS GAR";"NB DOSS GAR")
                    {
                    }
                    field("PVN Acceptées";"PVN Acceptées")
                    {
                    }
                    field("Véhicules Préparés.";"Véhicules Préparés.")
                    {
                    }
                }
                cuegroup()
                {
                    field("Véhicule Non Préparé";"Véhicule Non Préparé")
                    {
                    }
                    field("Véhicule disponible sous rése.";"Véhicule disponible sous rése.")
                    {
                    }
                    field("Demande ouvert";"Demande ouvert")
                    {
                    }
                    field("En attende d'pprobation";"En attende d'pprobation")
                    {
                    }
                    field("Demande apprové";"Demande apprové")
                    {
                    }
                }
                cuegroup()
                {
                    field("Préparation lancée";"Préparation lancée")
                    {
                    }
                    field("Ordre de préparation";"Ordre de préparation")
                    {
                    }
                    field("Encours de préparation";"Encours de préparation")
                    {
                    }
                    field("Véhicules préparés";"Véhicules préparés")
                    {
                    }
                    field("Carte grise encours";"Carte grise encours")
                    {
                    }
                }
                cuegroup()
                {
                    field("CG Envoyés";"CG Envoyés")
                    {
                    }
                    field("CG CHQ préparé";"CG CHQ préparé")
                    {
                    }
                    field("CG Reçus";"CG Reçus")
                    {
                    }
                    field("Fiche crée";"Fiche crée")
                    {
                    }
                    field("Rendez-vous crée";"Rendez-vous crée")
                    {
                    }
                }
                cuegroup()
                {
                    field("Véhicules livrés";"Véhicules livrés")
                    {
                    }
                }
                cuegroup()
                {
                    field("Devis service - Urgent";"Devis service - Urgent")
                    {
                    }
                    field("Devis service - Medium";"Devis service - Medium")
                    {
                    }
                    field("Devis service - Low";"Devis service - Low")
                    {
                    }
                    field("OR- High";"OR- High")
                    {
                    }
                    field("OR- Medium";"OR- Medium")
                    {
                    }
                }
                cuegroup()
                {
                    field("OR- Low";"OR- Low")
                    {
                    }
                    field("Devis service - Suspendu";"Devis service - Suspendu")
                    {
                    }
                    field("Commande Achat ST-Ouvert";"Commande Achat ST-Ouvert")
                    {
                    }
                    field("Commande Achat ST-Lancé";"Commande Achat ST-Lancé")
                    {
                    }
                    field("Commande Achat ST- App. susp.";"Commande Achat ST- App. susp.")
                    {
                    }
                    field("Commande Achat ST- Acc. susp.";"Commande Achat ST- Acc. susp.")
                    {
                    }
                }
                cuegroup()
                {
                    field("Reception Service-ST";"Reception Service-ST")
                    {
                    }
                    field("Atelier - Cancelled";"Atelier - Cancelled")
                    {
                    }
                    field("Atelier  - Launched";"Atelier  - Launched")
                    {
                    }
                    field("Atelier - Shipped";"Atelier - Shipped")
                    {
                    }
                    field("Atelier - Invoiced";"Atelier - Invoiced")
                    {
                    }
                    field("Atelier - Garantie";"Atelier - Garantie")
                    {
                    }
                    field("Rapid Service - Piece dem";"Rapid Service - Piece dem")
                    {
                    }
                    field("Atelier - Piece dem";"Atelier - Piece dem")
                    {
                    }
                }
            }
        }
    }

    actions
    {
    }
}

