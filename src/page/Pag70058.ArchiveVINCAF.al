page 70058 "Archive VIN+CAF"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table70015;
    SourceTableView = WHERE(Existe en Stock=CONST(Yes));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(VIN;VIN)
                {
                }
                field("No. Expédition";"No. Expédition")
                {
                }
                field(CAF;CAF)
                {
                }
                field(Famille;Famille)
                {
                }
                field("Code couleur";"Code couleur")
                {
                }
                field("Garnissage Int.";"Garnissage Int.")
                {
                }
                field("Date production";"Date production")
                {
                }
                field("Date Emb. prévu";"Date Emb. prévu")
                {
                }
                field("Date Emb. confirmée";"Date Emb. confirmée")
                {
                }
                field("Date Emb. Estimée";"Date Emb. Estimée")
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Customer Name";"Customer Name")
                {
                }
                field("Sales person code";"Sales person code")
                {
                }
                field("Sales person name";"Sales person name")
                {
                }
                field("Order date";"Order date")
                {
                }
                field("Document type";"Document type")
                {
                }
                field("Document status";"Document status")
                {
                }
                field(Observation;Observation)
                {
                }
                field("Reférence local";"Reférence local")
                {
                }
                field("Code version";"Code version")
                {
                }
                field("Libelé version";"Libelé version")
                {
                }
                field("No. moteur";"No. moteur")
                {
                }
                field("Code pers";"Code pers")
                {
                }
                field(Options;Options)
                {
                }
                field("No. proforma";"No. proforma")
                {
                }
                field("No. lettre de crédit";"No. lettre de crédit")
                {
                }
                field("Préfixe VIN";"Préfixe VIN")
                {
                }
                field("Radical VIN";"Radical VIN")
                {
                }
                field("Suffixe VIN";"Suffixe VIN")
                {
                }
                field("Dernière date MAJ";"Dernière date MAJ")
                {
                }
                field("Statut VIN";"Statut VIN")
                {
                }
                field("Sales Order No.";"Sales Order No.")
                {
                }
                field("Purchase Order No.";"Purchase Order No.")
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field("Code variante";"Code variante")
                {
                }
                field("VIN Reserved";"VIN Reserved")
                {
                }
                field("Purchase Line No.";"Purchase Line No.")
                {
                }
                field("No. Line Expédition";"No. Line Expédition")
                {
                }
                field(Usine;Usine)
                {
                }
                field("Port d'embarquament";"Port d'embarquament")
                {
                }
                field("Date bâteau visé";"Date bâteau visé")
                {
                }
                field("Nom du navire";"Nom du navire")
                {
                }
                field(Commentaire;Commentaire)
                {
                }
                field("Sales Order Line No";"Sales Order Line No")
                {
                }
                field("Réservé pour";"Réservé pour")
                {
                }
                field("E Com prévisionelle";"E Com prévisionelle")
                {
                }
                field("Article existe";"Article existe")
                {
                }
                field("A expédier";"A expédier")
                {
                }
                field("Commentaire..";"Commentaire..")
                {
                }
                field("Sales Type";"Sales Type")
                {
                }
                field("Sales Code";"Sales Code")
                {
                }
                field("Description Version";"Description Version")
                {
                }
                field("Description Couleur";"Description Couleur")
                {
                }
                field("Description Garnissage";"Description Garnissage")
                {
                }
                field("Prix achat Net Sans Mino";"Prix achat Net Sans Mino")
                {
                }
                field(Commentaire2;Commentaire2)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Réservation Véhicule sur stock ou commande achat")
            {
                Caption = 'Réservation Véhicule sur stock ou commande achat';
                Image = Reserve;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    ReservationVéhiculeStock(Rec);
                end;
            }
        }
    }
}

