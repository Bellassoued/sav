page 60354 "Grand Service Activity. FIN."
{
    // version SAV Automobile

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9052;

    layout
    {
        area(content)
        {
            cuegroup("---------------------------OR PAYANT PAR CLIENT---------------------------")
            {
                Caption = '---------------------------OR PAYANT PAR CLIENT---------------------------';
                field("Big Service - in Process";"Big Service - in Process")
                {
                    CaptionML = ENU='Big Service - in Process',
                                FRA='OR ATELIER Payant- En Cours';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    Image = "None";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("Big Service - Finished";"Big Service - Finished")
                {
                    CaptionML = ENU='Big Service - Finished',
                                FRA='OR ATELIER Payant-Clôturé';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    Image = "None";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("Big Service - With Suspendu";"Big Service - With Suspendu")
                {
                    CaptionML = ENU='Big Service - in Process',
                                FRA='OR ATELIER  Payant- Suspendu';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    Image = "None";
                    LookupPageID = "Liste Reception Grande Réparat";
                }

                actions
                {
                    action("New BiG Service")
                    {
                        CaptionML = ENU='New BiG Service',
                                    FRA='Créer Nouveau OR';
                        Image = Document;
                        Promoted = true;
                        PromotedIsBig = true;
                        RunObject = Page 60018;
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("OR RETOUR")
            {
                Caption = '---------------------------OR RETOUR---------------------------';
                field("OR Retour";"OR Retour")
                {
                    Caption = 'OR Retour - Encours';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    Image = "None";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("OR Retour-Facturé";"OR Retour-Facturé")
                {
                    CaptionML = ENU='Retour-Approuvé',
                                FRA='OR Retour-Clôturé';
                    Image = "None";
                }
                field("List Piece Sur Cmd Recpt SAV";"List Piece Sur Cmd Recpt SAV")
                {
                    DrillDownPageID = "List Art Sur Cmd Récept. SAV";
                    LookupPageID = "List Art Sur Cmd Récept. SAV";
                }
            }
            cuegroup("OR INTERNE")
            {
                Caption = '------------------------------OR INTERNE------------------------------------------';
                field("OR Interne";"OR Interne")
                {
                    Caption = 'Total OR Interne';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    Image = "None";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("OR Interne Avairie";"OR Interne Avairie")
                {
                    Caption = 'OR Interne-Avarie';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    Image = "None";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("OR Interne Voiture service";"OR Interne Voiture service")
                {
                    Caption = 'OR Interne-Voiture Service';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    Image = "None";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("OR-Interne Interne Commerciale";"OR-Interne-Interne commerciale")
                {
                    CaptionML = ENU='Rapid Service - Warranty',
                                FRA='OR-Interne Interne Commerciale';
                    Image = "None";
                }
            }
            cuegroup("Commandes Travaux extérieurs")
            {
                Caption = '----------Commandes Travaux Extérieurs------';
                field("Commande Achat ST-Ouvert";"Commande Achat ST-Ouvert")
                {
                    Caption = 'Travaux Extérieurs-Ouvertes';
                    Image = "None";
                }
                field("Commande Achat ST-Lancé";"Commande Achat ST-Lancé")
                {
                    Caption = 'Travaux Extérieurs -Clôturés';
                    Image = "None";
                }

                actions
                {
                    action("New BiG Service")
                    {
                        CaptionML = ENU='New BiG Service',
                                    FRA='Créer Nouveau OR';
                        Image = Document;
                        Promoted = true;
                        PromotedIsBig = true;
                        RunObject = Page 60018;
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("Assurances Conventionnées")
            {
                Caption = '---------Assurances Conventionnées-------';
                field("OR Assurances Convent Encours";"OR Assurances Convent Encours")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    Image = "None";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("OR Assurances Convent factur";"OR Assurances Convent factur")
                {
                    Caption = 'OR Assurances Conventionnées facturé';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    Image = "None";
                    LookupPageID = "Liste Reception Grande Réparat";
                }

                actions
                {
                    action("New BiG Service")
                    {
                        CaptionML = ENU='New BiG Service',
                                    FRA='Créer Nouveau OR';
                        Image = Document;
                        Promoted = true;
                        PromotedIsBig = true;
                        RunObject = Page 60018;
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup(Commande)
            {
                field("Cmd Service";"Cmd Service")
                {
                    Image = "None";
                }
                field("Devis Service";"Devis Service")
                {
                    Image = "None";
                }
                field("Facture Service Enreg.";"Facture Service Enreg.")
                {
                    Image = "None";
                }
                field("Avoir Service Enreg.";"Avoir Service Enreg.")
                {
                    Image = "None";
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
        SETRANGE("Date Filter",WORKDATE,WORKDATE);
        //MESSAGE(FORMAT("Responsibility Center Filter"));
    end;

    var
        ReceptionSAV : Record "60008";
        ReceptionsAChercher : Text[1024];
        LigneReceptionGrandService : Record "60012";
        "ListeReceptionGrandeRéparat" : Page "60019";
}

