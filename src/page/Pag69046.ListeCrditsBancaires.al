page 69046 "Liste Crédits Bancaires"
{
    CardPageID = "Fiche crédit bancaire";
    PageType = List;
    SourceTable = Table60063;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field(Type;Type)
                {
                }
                field("Bank Account";"Bank Account")
                {
                }
                field("Montant Crédit";"Montant Crédit")
                {
                }
                field("Total Principal ligne Paiement";"Total Principal ligne Paiement")
                {
                }
                field("Total Interêt ligne Paiement";"Total Interêt ligne Paiement")
                {
                }
                field("Total Commission ligne Pai.";"Total Commission ligne Pai.")
                {
                }
                field("Total TVA comm. ligne Paiement";"Total TVA comm. ligne Paiement")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }
}

