page 50185 "List Art Cmd Urg Suuprimer Rea"
{
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Table60094;
    SourceTableView = WHERE(Status Ligne=CONST(Annuler par reppro));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Document";"No. Document")
                {
                }
                field("Type Commande";"Type Commande")
                {
                }
                field(Client;Client)
                {
                }
                field("Article No.";"Article No.")
                {
                }
                field(Qté;Qté)
                {
                }
                field("Date Comptabilisation";"Date Comptabilisation")
                {
                }
                field("No. Cmd Achat";"No. Cmd Achat")
                {
                }
                field("EPM Non Reorder Code";"EPM Non Reorder Code")
                {
                }
                field("Substitution code";"Substitution code")
                {
                }
                field("Unit pack code";"Unit pack code")
                {
                }
                field("Not used anymore";"Not used anymore")
                {
                }
                field("Source Code";"Source Code")
                {
                }
                field("Sub Supplier Code";"Sub Supplier Code")
                {
                }
                field("Origin Code";"Origin Code")
                {
                }
                field("Non Stock Code";"Non Stock Code")
                {
                }
                field("No Ligne Cmd Vente";"No Ligne Cmd Vente")
                {
                }
                field("Centre de gestion Vente";"Centre de gestion Vente")
                {
                }
                field("Nom Client";"Nom Client")
                {
                }
                field("Sur Commande";"Sur Commande")
                {
                }
                field("Type Avance";"Type Avance")
                {
                }
                field("Montant Avance";"Montant Avance")
                {
                }
                field("Modele Vehicule";"Modele Vehicule")
                {
                }
                field(VIN;VIN)
                {
                }
                field("Stock Actual";"Stock Actual")
                {
                }
                field("Date Demmande";"Date Demmande")
                {
                }
                field("Type de garantie";"Type de garantie")
                {
                }
                field("Status Ligne";"Status Ligne")
                {
                }
                field(Motif;Motif)
                {
                }
            }
        }
    }

    actions
    {
    }
}

