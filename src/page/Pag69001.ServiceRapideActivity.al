page 69001 "Service Rapide Activity."
{
    // version NAVW17.10

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9052;

    layout
    {
        area(content)
        {
            cuegroup("Statut OR CHRONO")
            {
                field("List Piece Sur Cmd Recpt SAV";"List Piece Sur Cmd Recpt SAV")
                {
                }
                field("Rapid Service - in Process";"Rapid Service - in Process")
                {
                    CaptionML = ENU='Rapid Service - in Process',
                                FRA='OR Chrono  - En cours';
                }
                field("Rapid Service - Finished";"Rapid Service - Finished")
                {
                    CaptionML = ENU='Rapid Service - Finished',
                                FRA='OR Chrono - Terminé';
                }
                field("Rapid Service - Jour";"Rapid Service - Jour")
                {
                    CaptionML = ENU='Rapid Service - in Process',
                                FRA='OR Chrono  - Journalier';
                }
                field("Rapid Service - Solder";"Rapid Service - Solder")
                {
                    CaptionML = ENU='Rapid Service - in Process',
                                FRA='OR Chrono- Soldé';
                }
                field("Rapid Service - Cancelled";"Rapid Service - Cancelled")
                {
                    CaptionML = ENU='Rapid Service - Cancelled',
                                FRA='OR Chrono - Annulé';
                }
                field("Rapid Service - Launched";"Rapid Service - Launched")
                {
                    CaptionML = ENU='Rapid Service - Launched',
                                FRA='OR Chrono - Lancé';
                }
                field("Rapid Service - Shipped";"Rapid Service - Shipped")
                {
                    CaptionML = ENU='Rapid Service - Shipped',
                                FRA='OR Chrono - Livré';
                }
                field("Rapid Service - Invoiced";"Rapid Service - Invoiced")
                {
                    CaptionML = ENU='Rapid Service - Invoiced',
                                FRA='OR Chrono- Facturé';
                }
                field("Rapid Service - Piece dem";"Rapid Service - Piece dem")
                {
                    CaptionML = ENU='Rapid Service - Pieces Demandees',
                                FRA='OR Chrono - Pièces demandées';
                }
                field("Avance sur devise";AvanceDevis)
                {

                    trigger OnDrillDown();
                    begin

                        CLEAR(PaymentHeader);
                        PaymentHeader.SETFILTER(PaymentHeader."Applies-to Doc. Type",'%1',PaymentHeader."Applies-to Doc. Type"::"Devis SAV");
                        PaymentHeader.SETFILTER(PaymentHeader."Applies-to Doc. No.",'<>%1','');
                        IF PaymentHeader.FINDFIRST THEN
                         REPEAT
                           CLEAR(SalesHeaderQuote);
                           SalesHeaderQuote.SETRANGE("Document Type",SalesHeaderQuote."Document Type"::Quote);
                           SalesHeaderQuote.SETRANGE("No.",PaymentHeader."Applies-to Doc. No.");
                           IF SalesHeaderQuote.FINDSET THEN
                             BEGIN
                                CLEAR(SalesHeaderOrder);
                                SalesHeaderOrder.SETRANGE("Document Type",SalesHeaderOrder."Document Type"::Order);
                                SalesHeaderOrder.SETRANGE("No.",PaymentHeader."Applies-to Doc. No.");
                                IF SalesHeaderOrder.FINDSET THEN;
                                  //BEGIN
                                  //  AvanceDevis += 1;
                                  //END;
                             END;
                          UNTIL PaymentHeader.NEXT = 0;

                        IF PAGE.RUNMODAL(9317,SalesHeaderOrder) = ACTION::LookupOK THEN
                    end;
                }

                actions
                {
                    action("New Rapid Service")
                    {
                        CaptionML = ENU='New Rapid Service',
                                    FRA='Créer  OR CHRONO';
                        Image = Document;
                        Promoted = true;
                        PromotedIsBig = true;
                        RunObject = Page 60014;
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


        CLEAR(PaymentHeader);
        PaymentHeader.SETFILTER(PaymentHeader."Applies-to Doc. Type",'%1',PaymentHeader."Applies-to Doc. Type"::"Devis SAV");
        PaymentHeader.SETFILTER(PaymentHeader."Applies-to Doc. No.",'<>%1','');
        IF PaymentHeader.FINDFIRST THEN
         REPEAT
           CLEAR(SalesHeaderQuote);
           SalesHeaderQuote.SETRANGE("Document Type",SalesHeaderQuote."Document Type"::Quote);
           SalesHeaderQuote.SETRANGE("No.",PaymentHeader."Applies-to Doc. No.");
           IF SalesHeaderQuote.FINDSET THEN
             BEGIN
                CLEAR(SalesHeaderOrder);
                SalesHeaderOrder.SETRANGE("Document Type",SalesHeaderOrder."Document Type"::Order);
                SalesHeaderOrder.SETRANGE("No.",PaymentHeader."Applies-to Doc. No.");
                IF SalesHeaderOrder.FINDSET THEN
                  BEGIN
                    AvanceDevis += 1;
                  END;
             END;

         UNTIL PaymentHeader.NEXT = 0;;
        //AvanceDevis := PaymentHeader.COUNT;
    end;

    var
        AvanceDevis : Integer;
        PaymentHeader : Record "10865";
        TotDevis : Integer;
        SalesHeaderQuote : Record "36";
        SalesHeaderOrder : Record "36";
}

