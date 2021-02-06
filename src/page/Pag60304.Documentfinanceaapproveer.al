page 60304 "Document finance a approveer"
{
    PageType = CardPart;
    SourceTable = Table9054;

    layout
    {
        area(content)
        {
            cuegroup("Demandes exonération")
            {
                field("D.A Ouvert";"D.A Ouvert")
                {
                }
                field("DA en dépassement";"DA en dépassement")
                {
                }
                field("Demandes d'exonération";"Demandes d'exonération")
                {
                }
                field("D.A En attente d'approb. DCG";"D.A En attente d'approb. DCG")
                {
                }
                field("D.A En attente d'approb. Fin";"D.A En attente d'approb. Fin")
                {
                }
                field(DAEnAttenteAPPDCG;DAEnAttenteAPPDCG)
                {
                    CaptionML = ENU='DA En Attente APP DG',
                                FRA='DA En Attente APP DG';
                    Visible = DFDG;

                    trigger OnDrillDown();
                    begin
                        //Count("Purchase Request Header" WHERE (Approvée par la D.C.G=CONST(Yes),Approvée par la D.F=CONST(No),Status=FILTER(Released)))
                        CLEAR(PurchaseRequestHeader);
                        PurchaseRequestHeader.SETFILTER("Approvée par la D.F",'%1',TRUE);
                        PurchaseRequestHeader.SETFILTER("En Attente d'approbation D.G",'%1',TRUE);
                        PurchaseRequestHeader.SETFILTER(Status,'%1',PurchaseRequestHeader.Status::Released);
                        IF PAGE.RUNMODAL(50006,PurchaseRequestHeader) = ACTION::LookupOK THEN
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        CLEAR(PurchaseRequestHeader);
        PurchaseRequestHeader.SETFILTER("Approvée par la D.F",'%1',TRUE);
        PurchaseRequestHeader.SETFILTER("En Attente d'approbation D.G",'%1',TRUE);
        PurchaseRequestHeader.SETFILTER(Status,'%1',PurchaseRequestHeader.Status::Released);
        DAEnAttenteAPPDCG := PurchaseRequestHeader.COUNT;
        CLEAR(UserSetup);
        UserSetup.GET(USERID);
        DFDG := FALSE;
        IF UserSetup.DAF OR UserSetup."Profil Directeur Général" THEN
        DFDG := TRUE;

    end;

    var
        DAEnAttenteAPPDCG : Integer;
        PurchaseRequestHeader : Record "50005";
        DFDG : Boolean;
        UserSetup : Record "91";
}

