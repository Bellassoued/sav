page 60353 "Directeur Ventes Fin."
{
    PageType = CardPart;
    SourceTable = Table50085;

    layout
    {
        area(content)
        {
            cuegroup("Traitement Commande Vente")
            {
                field("Devis En Cours";"Devis En Cours")
                {
                }
                field("Commande Vente En Cours";"Commande Vente En Cours")
                {
                    DrillDownPageID = "Sales Order List PR";
                    LookupPageID = "Sales Order List PR";
                }
                field("Comd Vente Livrée Non Facturée";"Comd Vente Livrée Non Facturée")
                {
                    DrillDownPageID = "Sales Order List PR";
                    LookupPageID = "Sales Order List PR";
                }
                field("Facture En Cours";"Facture Vente En Cours")
                {
                }
            }
            cuegroup("Documents Enregistrés")
            {
                field("Facture Vente Enreg";"Facture Vente Enreg")
                {
                    DrillDownPageID = "Posted Sales Invoices PR";
                    LookupPageID = "Posted Sales Invoices PR";
                }
                field("Avoirs Vente Enreg";"Avoirs Vente Enreg")
                {
                    DrillDownPageID = "Posted Sales Credit Memos PR";
                    LookupPageID = "Posted Sales Credit Memos PR";
                }

                actions
                {
                    action("Update Item Price Gros")
                    {
                        RunObject = XMLport 70007;
                    }
                    action("Update Item Price Auto")
                    {
                        RunObject = XMLport 70008;
                    }
                }
            }
        }
    }

    actions
    {
    }
}

