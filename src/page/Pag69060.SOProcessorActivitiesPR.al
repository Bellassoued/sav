page 69060 "SO Processor Activities PR"
{
    // version NAVW17.10

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9053;

    layout
    {
        area(content)
        {
            cuegroup("For Release")
            {
                Caption = 'For Release';
                Visible = false;
                field("Sales Orders PR- Open";"Sales Orders PR- Open")
                {
                    DrillDownPageID = "Sales Order List PR";
                }

                actions
                {
                    action("New Sales Quote")
                    {
                        CaptionML = ENU='New Sales Quote',
                                    FRA='Nouveau devis';
                        Image = Quote;
                        RunObject = Page 60023;
                        RunPageMode = Create;
                    }
                    action("New Sales Order")
                    {
                        CaptionML = ENU='New Sales Order',
                                    FRA='Nouvelle commande vente';
                        RunObject = Page 60026;
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("Liste Devis")
            {
                field("Sales Quotes PR- Open";"Sales Quotes PR- Open")
                {
                    CaptionML = ENU='<Sales Quotes PR -Open>',
                                FRA='Devis PR - Ouverts';
                    DrillDownPageID = "Sales Quotes PR";
                }
                field("Devis PR Lancés";"Devis PR Lancés")
                {
                }
                field("List Piece Sur Cmd Recpt PR";"List Piece Sur Cmd Recpt PR")
                {
                    DrillDownPageID = "List Art Sur Cmd Récept. PR";
                    LookupPageID = "List Art Sur Cmd Récept. PR";
                }
            }
            cuegroup("Liste Commande PR/Bon Livraison")
            {
                CaptionML = ENU='Sales Orders Released Not Shipped',
                            FRA='Commandes vente lancées et non livrées';
                field("Commande Ouverte";"Sales Orders PR- Open")
                {
                    DrillDownPageID = "Sales Order List PR";
                }
                field("Commande Lancée";"PR Ready to Ship")
                {
                }
                field("Commande Partiellement Livrées Non Facturées";"Partially Shipped PR")
                {
                }
                field("Commande Entièrement Livrée Non Facturée";"Cmd PR Entr livré non Fact")
                {
                }
                field("Nbre d'Expédition Vente PR Enreg";"Expédition Vente Enreg2" )
                {
                    Caption = 'Nbre d''Expédition Vente PR Enreg';
                }

                actions
                {
                    action(Navigate)
                    {
                        CaptionML = ENU='Navigate',
                                    FRA='Naviguer';
                        Image = Navigate;
                        RunObject = Page 344;
                    }
                }
            }
            cuegroup("Liste Facture PR")
            {
                field("Facture Vente PR  Ouverte";"Facture PR Ouverte")
                {
                    DrillDownPageID = "Sales Invoice List PR";
                }
                field("Facture Lancée";"Facture PR Lancée")
                {
                    DrillDownPageID = "Sales Invoice List PR";
                }
                field("Facture Vente PR Enreg";"Facture Vente Enreg2")
                {
                    DrillDownPageID = "Posted Sales Invoices PR";
                }
            }
            cuegroup("Liste Avoirs PR")
            {
                Caption = 'Les Avoirs';
                field("Avoirs PR En Cours";"Avoirs En Cours")
                {
                    DrillDownPageID = "Sales Credit Memos PR";
                }
                field("Avoirs Vente PR Enreg";"Avoirs Vente Enreg")
                {
                    DrillDownPageID = "Posted Sales Credit Memos PR";
                }
                field("Delayed PR";"Delayed PR")
                {
                    Visible = false;
                }
                field("Avoirs Récep Non Facturée";"Avoirs Récep Non Facturée")
                {
                    Visible = false;
                }
                field("Avoirs Récep et Facturée";"Avoirs Récep et Facturée")
                {
                    Visible = false;
                }
            }
            cuegroup("Ordres De Transfert PR")
            {
                Caption = 'Ordres De Transfert';
                field("Ordre de Transfert";"Ordre de Transfert")
                {
                }
                field("Retour Ordre de Transfer";"Retour Ordre de Transfert")
                {
                }
            }
            cuegroup("Mes Listes")
            {
                CaptionML = ENU='Returns',
                            FRA='Mes Listes';
                Visible = false;
                field("Liste des Article2";"Liste des Article2")
                {
                }
                field("Liste des Clients";"Liste des Clients")
                {
                }
                field("Sales Return Orders PR - Open";"Sales Return Orders PR - Open")
                {
                    DrillDownPageID = "Sales Return Order List PR";
                    Visible = false;
                }

                actions
                {
                    action("New Sales Return Order")
                    {
                        CaptionML = ENU='New Sales Return Order',
                                    FRA='Nouveau retour vente';
                        RunObject = Page 60032;
                        RunPageMode = Create;
                    }
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
        IF NOT GET THEN BEGIN
          INIT;
          INSERT;
        END;

        SetRespCenterFilter;
        SETRANGE("Date Filter",0D,WORKDATE - 1);
        SETFILTER("Date Filter2",'>=%1',WORKDATE);
    end;
}

