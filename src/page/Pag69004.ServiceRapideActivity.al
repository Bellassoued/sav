page 69004 "Service Rapide Activity"
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
            cuegroup("For Release")
            {
                CaptionML = ENU='For Release',
                            FRA='----------Dossiers OR CHRONO------------';
                field("Rapid Service - in Process";"Rapid Service - in Process")
                {
                    CaptionML = ENU='Rapid Service - in Process',
                                FRA='OR CHRONO- En cours';
                }
                field("Rapid Service - Finished";"Rapid Service - Finished")
                {
                    CaptionML = ENU='Rapid Service - Finished',
                                FRA='OR CHRONO  - Terminé';
                }

                actions
                {
                    action("Créer OR CHRONO")
                    {
                        Caption = 'Créer OR CHRONO';
                        RunObject = Page 60014;
                    }
                }
            }
            cuegroup("--------------------OR CHRONO/Statut--------------------")
            {
                Caption = '--------------------OR CHRONO/Statut--------------------';
                field("Rapid Service - Shipped";"Rapid Service - Shipped")
                {
                    CaptionML = ENU='Rapid Service - Shipped',
                                FRA='OR CHRONO- - Livré';
                }
                field("Rapid Service - Invoiced";"Rapid Service - Invoiced")
                {
                    CaptionML = ENU='Rapid Service - Invoiced',
                                FRA='OR CHRONO- Facturé';
                }
                field("Rapid Service - Piece dem";"Rapid Service - Piece dem")
                {
                    CaptionML = ENU='Rapid Service - Pieces Demandees',
                                FRA='OR CHRONO- Pièces demandées';
                }
            }
            cuegroup("--------------------OR CHRONO/Priorité--------------------")
            {
                Caption = '--------------------OR CHRONO/Priorité--------------------';
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                field("OR- High";"OR- High")
                {
                    CaptionML = ENU='High priority',
                                FRA='OR CHRONO-Haute priorité';
                }
                field("OR- Medium";"OR- Medium")
                {
                    CaptionML = ENU='Medium priority',
                                FRA='OR CHRONO-Priorité moyenne';
                }
                field("OR- Low";"OR- Low")
                {
                    CaptionML = ENU='Low priority',
                                FRA='OR CHRONO-Priorité faible';
                }
            }
            cuegroup("----------------------------------Statistiques---------------------------------------------")
            {
                Caption = '----------------------------------Statistiques---------------------------------------------';
                field("Rapid Service - Jour";"Rapid Service - Jour")
                {
                    CaptionML = ENU='Rapid Service - in Process',
                                FRA='OR CHRONO- - Aujourd''hui';
                }
                field("Service Orders - Today";"Service Orders - Today")
                {
                    CaptionML = ENU='Service Orders - Today',
                                FRA='Nbre des Commandes CHRONO- Aujourd''hui';
                }
                field("Nbre Factures validés";"Nbre Factures validés")
                {
                    Caption = 'Nbre Factures CHRONO validées';
                }
                field("Nbre avoirs validés";"Nbre avoirs validés")
                {
                    Caption = 'Nbre Avoirs CRONO validés';
                }
            }
            cuegroup("---------BC Travaux Extérieurs--------")
            {
                Caption = '---------BC Travaux Extérieurs--------';
                field("Commande Achat ST-Ouvert";"Commande Achat ST-Ouvert")
                {
                }
                field("Commande Achat ST-Lancé";"Commande Achat ST-Lancé")
                {
                    Caption = 'Commande  ST-Lancées';
                }
            }
            cuegroup("----------Réceptions/Factures Travaux Extérieurs----------")
            {
                Caption = '----------Réceptions/Factures Travaux Extérieurs----------';
                field("Reception Service-ST";"Reception Service-ST")
                {
                    Caption = 'Nbre de réceptions sous-traitance';
                }
                field("Nbres factures ST-CHRONO";"Nbres factures ST-CHRONO")
                {
                    Caption = 'Nbre Factures ST-CHRONO';
                }
            }
            cuegroup()
            {
                field("Avance sur devis";"Avance sur devis")
                {
                }
                field("Avance sur Commande";"Avance sur Commande")
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
        IF NOT GET THEN BEGIN
          INIT;
          INSERT;
        END;

        SetRespCenterFilter;
        //SETRANGE("Date Filter",0D,WORKDATE - 1);
        SETFILTER("Date Filter",'=t');


        //add SBS
        CLEAR(PaymentHeader);
        PaymentHeader.SETFILTER("Applies-to Doc. Type",'%1|%2|%3',PaymentHeader."Applies-to Doc. Type"::"Devis SAV",PaymentHeader."Applies-to Doc. Type"::"Commande SAV GP",
                                                          PaymentHeader."Applies-to Doc. Type"::"Commande SAV SR");
        PaymentHeader.SETFILTER("Applies-to Doc. No.",'<>%1','');
        PaymentHeader.SETFILTER("Devis en cours",'%1',TRUE);
        AvanceSurDevis := PaymentHeader.COUNT;
        COMMIT;
    end;

    var
        PaymentHeader : Record "10865";
        SalesHeader : Record "36";
        AvanceSurDevis : Integer;
}

