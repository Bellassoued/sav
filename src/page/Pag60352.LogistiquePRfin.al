page 60352 "Logistique PR fin."
{
    PageType = CardPart;
    SourceTable = Table50085;

    layout
    {
        area(content)
        {
            cuegroup()
            {
                field("Commande Achat";"Commande Achat")
                {
                    DrillDownPageID = "Purchase Order List PR";
                }
                field("Facture Achat";"Facture Achat")
                {
                    DrillDownPageID = "Purchase Invoices PR";
                }
            }
            cuegroup()
            {
                field("Avoir Achat";"Avoir Achat")
                {
                    DrillDownPageID = "Purchase Credit Memos PR";
                }
                field("Retour Achat";"Retour Achat")
                {
                    DrillDownPageID = "Purchase Return Orders PR";
                }
                field("Dossier Import";"Dossier Import")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        RESET;
        IF GET THEN;
        IF NOT GET THEN BEGIN
          INIT;
        //  SETFILTER("Date Filter",'<=t');
          INSERT;
          END;
    end;
}

