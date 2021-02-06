page 60305 "DG. activity"
{
    // 
    // réservation sur stock
    // {
    // Item.SETFILTER("Reserved Qty. on Inventory",'<>%1',0);
    // IF PAGE.RUNMODAL(31,Item) = ACTION::LookupOK THEN
    // }

    PageType = CardPart;
    PopulateAllFields = true;
    RefreshOnActivate = true;
    SourceTable = Table60075;

    layout
    {
        area(content)
        {
            cuegroup("Demande Achat")
            {
                field("Demande achat à approuver";"Demande achat à approuver")
                {
                }
                field("Demande achat refusé D.G";"Demande achat refusé D.G")
                {
                }
                field("VN Réservée sur arrivage";"VN Réservée sur arrivage")
                {
                }
            }
            cuegroup("Service Rapide")
            {
                field("Service Rapide : Marsa";"Service Rapide : Marsa")
                {
                    CaptionML = ENU='Service Rapide : Marsa',
                                FRA='Service Rapide : Marsa';
                }
                field("Service Rapide : Charguia";"Service Rapide : Charguia")
                {
                    Caption = 'Service Rapide : Charguia';
                }
                field("Service Rapide : Akouda";"Service Rapide : Akouda")
                {
                }
                field("Service Rapide : S. Abdelhamid";"Service Rapide : S. Abdelhamid")
                {
                }
                field("Service Rapide : Sfax";"Service Rapide : Sfax")
                {
                }
            }
            cuegroup()
            {
                field("S.A.V : Marsa";"S.A.V : Marsa")
                {
                    CaptionML = ENU='Rapid Service - in Process',
                                FRA='S.A.V  : Marsa';
                    DrillDownPageID = "Liste Reception Grande Réparat";
                }
                field("S.A.V : Charguia";"S.A.V : Charguia")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                }
                field("S.A.V : Akouda";"S.A.V : Akouda")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                }
                field("S.A.V : S. Abdelhamid";"S.A.V : S. Abdelhamid")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                }
                field("S.A.V : Sfax";"S.A.V : Sfax")
                {
                    DrillDownPageID = "Liste Reception Grande Réparat";
                }
            }
            cuegroup()
            {
                field("Total Service Rapide";"Total Service Rapide")
                {
                }
                field("Total S.A.V";"Total S.A.V")
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
        /*CLEAR(Item);
        Item.FINDFIRST;
        REPEAT
          Item.CALCFIELDS("Reserved Qty. on Inventory");
          ReservationSurStock += Item."Reserved Qty. on Inventory";
        UNTIL Item.NEXT = 0;
        */
        CLEAR(DirGenCue);
        DirGenCue.GET(1);
        DirGenCue."Date du Jours" := TODAY;
        DirGenCue.MODIFY;
        COMMIT;

    end;

    var
        ReservationSurStock : Decimal;
        Item : Record "27";
        DirGenCue : Record "60075";
}

