page 69003 "Grand Service Activity."
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
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("Big Service - Finished";"Big Service - Finished")
                {
                    CaptionML = ENU='Big Service - Finished',
                                FRA='OR ATELIER Payant-Clôturé';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("Big Service - With Suspendu";"Big Service - With Suspendu")
                {
                    CaptionML = ENU='Big Service - in Process',
                                FRA='OR ATELIER  Payant- Suspendu';
                    DrillDownPageID = "Liste Reception Grande Réparat";
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
            cuegroup("Approbation Travaux Atelier")
            {
                Caption = '-----------Approbation Travaux Atelier------------------';
                field("Demandes Approbation Client";"Demandes Approbation Client")
                {

                    trigger OnDrillDown();
                    begin
                        ReceptionsAChercher:='';
                        LigneReceptionGrandService.RESET;
                        LigneReceptionGrandService.SETRANGE(Statut,LigneReceptionGrandService.Statut::"Demande Approbation");
                        IF LigneReceptionGrandService.FINDSET THEN BEGIN
                          ReceptionsAChercher+=LigneReceptionGrandService."Reception No";
                          WHILE LigneReceptionGrandService.NEXT<>0 DO
                            ReceptionsAChercher+='|'+LigneReceptionGrandService."Reception No";
                        //MESSAGE(ReceptionsAChercher);
                        ReceptionSAV.RESET;
                        ReceptionSAV.SETFILTER("Reception No",ReceptionsAChercher);
                        CLEAR(ListeReceptionGrandeRéparat);
                        ListeReceptionGrandeRéparat.SETRECORD(ReceptionSAV);
                        ListeReceptionGrandeRéparat.SETTABLEVIEW(ReceptionSAV);
                        ListeReceptionGrandeRéparat.RUN;
                        END;
                    end;
                }
                field("Demandes Approbation Acceptées";"Demandes Approbation Acceptées")
                {

                    trigger OnDrillDown();
                    begin
                        ReceptionsAChercher:='';
                        LigneReceptionGrandService.RESET;
                        LigneReceptionGrandService.SETRANGE(Statut,LigneReceptionGrandService.Statut::Approuvée);
                        //LigneReceptionGrandService.SETRANGE("Date Décision",WORKDATE);
                        IF LigneReceptionGrandService.FINDSET THEN BEGIN
                          ReceptionsAChercher+=LigneReceptionGrandService."Reception No";
                          WHILE LigneReceptionGrandService.NEXT<>0 DO
                            ReceptionsAChercher+='|'+LigneReceptionGrandService."Reception No";
                        //MESSAGE(ReceptionsAChercher);
                        ReceptionSAV.RESET;
                        ReceptionSAV.SETFILTER("Reception No",ReceptionsAChercher);
                        CLEAR(ListeReceptionGrandeRéparat);
                        ListeReceptionGrandeRéparat.SETRECORD(ReceptionSAV);
                        ListeReceptionGrandeRéparat.SETTABLEVIEW(ReceptionSAV);
                        ListeReceptionGrandeRéparat.RUN;
                        END;
                    end;
                }
                field("Demandes Approbation Refusées";"Demandes Approbation Refusées")
                {
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
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("OR Retour-Facturé";"OR Retour-Facturé")
                {
                    CaptionML = ENU='Retour-Approuvé',
                                FRA='OR Retour-Clôturé';
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
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("OR Interne Avairie";"OR Interne Avairie")
                {
                    Caption = 'OR Interne-Avarie';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("OR Interne Voiture service";"OR Interne Voiture service")
                {
                    Caption = 'OR Interne-Voiture Service';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("OR-Interne Interne Commerciale";"OR-Interne-Interne commerciale")
                {
                    CaptionML = ENU='Rapid Service - Warranty',
                                FRA='OR-Interne Interne Commerciale';
                }
            }
            cuegroup("OR GARANTIE")
            {
                Caption = '---------------------------------------OR GARANTIE-----------------------------------';
                field("Garantie-Fiches créées";"Garantie-Fiches créées")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("Garantie-Dossiers approuvés";"Garantie-Dossiers approuvés")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("SAV-GARANTIE APPROUVE";"SAV-GARANTIE APPROUVE")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("Garantie-Bon pour facturation";"Garantie-Bon pour facturation")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("Chrono: Garantie-Fiches créées";"Chrono: Garantie-Fiches créées")
                {
                }
                field("CHRO:Garantie-Dossier approuvé";"CHRO:Garantie-Dossier approuvé")
                {
                }
                field("CHR: Garantie-facturation";"CHR: Garantie-facturation")
                {
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
            cuegroup("Suivi Approbation OR Garantie")
            {
                Caption = '-------------------Suivi Approbation OR Garantie---------------------';
                Visible = false;
                field("OR Garantie Prolongé-Approuvé PR";"OR Garantie Prolongé-Approuvé")
                {
                    CaptionML = ENU='Big Service - in Process',
                                FRA='OR Garantie Prolongé-Approuvé PR';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                    Visible = false;
                }
                field("OR Prolongé-Attente Approb PR";"OR Prolongé-Attente Approb")
                {
                    Caption = 'OR Prolongé-Attente Approb PR';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                    Visible = false;
                }
                field("OR Prolongé-Approbation/Fact";"OR Prolongé-Approb-fact")
                {
                    Caption = 'OR Prolongé-Approbation/fact';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                    Visible = false;
                }
                field("OR Prolongé-Attente Approb/Fact";"OR Prol-Attente Approb-fact")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                    Visible = false;
                }
                field("OR Constructeur-Approuvé";"OR Constructeur-Approuvé")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                    Visible = false;
                }
                field("OR Constructeur-Attente Approb";"OR Constructeur-Attente Approb")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                    Visible = false;
                }
                field("OR Constructeur-Approb-fact";"OR Constructeur-Approb-fact")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                    Visible = false;
                }
                field("OR Constr-Attente Approb-fact";"OR Constr-Attente Approb-fact")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                    LookupPageID = "Liste Reception Grande Réparat";
                    Visible = false;
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
            cuegroup("Commandes Travaux extérieurs")
            {
                Caption = '----------Commandes Travaux Extérieurs------';
                field("Commande Achat ST-Ouvert";"Commande Achat ST-Ouvert")
                {
                    Caption = 'Travaux Extérieurs-Ouvertes';
                }
                field("Commande Achat ST-Lancé";"Commande Achat ST-Lancé")
                {
                    Caption = 'Travaux Extérieurs -Clôturés';
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
                    LookupPageID = "Liste Reception Grande Réparat";
                }
                field("OR Assurances Convent factur";"OR Assurances Convent factur")
                {
                    Caption = 'OR Assurances Conventionnées facturé';
                    DrillDownPageID = "Liste Reception Grande Réparat";
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

