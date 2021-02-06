page 50121 "Demande Achat Activities"
{
    // version VN TRANSIT

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9055;

    layout
    {
        area(content)
        {
            cuegroup("Statistique VN arrivage")
            {
                field("Nbre demande achat ouvert";"Nbre demande achat ouvert")
                {
                    Visible = false;
                }
                field("Nbre demande achat lancé";"Nbre demande achat lancé")
                {
                    Visible = false;
                }
                field("Nbre Cmde achat ouvert";"Nbre Cmde achat ouvert")
                {
                    Caption = 'Nbre Cmde achat ouverte';
                    Visible = false;
                }
                field("Nbre Cmde achat reglé";"Nbre Cmde achat reglé")
                {
                    Caption = 'Nbre Cmde achat reglée';
                    Visible = false;
                }
                field(DemandeAchatOuvert;DemandeAchatOuvert)
                {
                    Caption = 'Demande d''achat ouverte';
                    DrillDown = true;
                    Image = Diagnostic;
                    Importance = Promoted;
                    Style = Favorable;
                    StyleExpr = TRUE;

                    trigger OnDrillDown();
                    begin

                        CLEAR(PurchaseRequestHeader);

                        PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader.Status,'%1',PurchaseRequestHeader.Status::Open);

                        IF NOT UserSetup."Admin Finance NAV"   THEN PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Request User ID",'%1',USERID);
                        IF PAGE.RUNMODAL(50006,PurchaseRequestHeader) = ACTION::LookupOK THEN

                    end;
                }
                field(DemandeAchatLance;DemandeAchatLance)
                {
                    Caption = 'Demande Achat Lancée';

                    trigger OnDrillDown();
                    begin

                        CLEAR(PurchaseRequestHeader);

                        PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader.Status,'%1',PurchaseRequestHeader.Status::Released);

                        IF NOT UserSetup."Admin Finance NAV"   THEN PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Request User ID",'%1',USERID);
                        IF PAGE.RUNMODAL(50006,PurchaseRequestHeader) = ACTION::LookupOK THEN
                    end;
                }
                field(DemandeAchatenDepassement;DemandeAchatenDepassement)
                {
                    Caption = 'Demande Achat en Depassement  Budget';

                    trigger OnDrillDown();
                    begin

                        CLEAR(PurchaseRequestHeader);

                        PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Dépassement Budget",'<>%1','');

                        IF NOT UserSetup."Admin Finance NAV"   THEN PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Request User ID",'%1',USERID);
                        IF PAGE.RUNMODAL(50006,PurchaseRequestHeader) = ACTION::LookupOK THEN

                    end;
                }
                field("DemandeAchatVisé";DemandeAchatVisé)
                {
                    Caption = 'Demande Achat Approuvée';
                    Image = Checklist;

                    trigger OnDrillDown();
                    begin
                        CLEAR(PurchaseRequestHeader);

                        PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Approvée par la D.F",'%1',TRUE);
                        IF NOT UserSetup."Admin Finance NAV"   THEN PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Request User ID",'%1',USERID);
                        IF PAGE.RUNMODAL(50006,PurchaseRequestHeader) = ACTION::LookupOK THEN
                    end;
                }
                field(DemandeAchaatRefusee;DemandeAchaatRefusee)
                {
                    Caption = 'Demande Achat Refusée';
                    Style = Attention;
                    StyleExpr = TRUE;

                    trigger OnDrillDown();
                    begin
                        CLEAR(PurchaseRequestHeader);

                        PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader.Status,'%1',PurchaseRequestHeader.Status::Refused);
                        IF NOT UserSetup."Admin Finance NAV"   THEN PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Request User ID",'%1',USERID);
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
    var
        GRecUserSetup : Record "91";
    begin
        GRecUserSetup.GET(USERID);
        RESET;
        //SETFILTER("Filtre approbateur",USERID);
        IF NOT GET THEN BEGIN
          INIT;
          INSERT;
        END;
        FILTERGROUP(2);


        CLEAR(UserSetup);
        UserSetup.GET(USERID);
        IF NOT UserSetup."Admin Finance NAV" THEN
        BEGIN
          CLEAR(PurchaseRequestHeader);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Request User ID",'%1',USERID);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader.Status,'%1',PurchaseRequestHeader.Status::Open);
          DemandeAchatOuvert := PurchaseRequestHeader.COUNT;
          COMMIT;
          CLEAR(PurchaseRequestHeader);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Request User ID",'%1',USERID);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader.Status,'%1',PurchaseRequestHeader.Status::Released);
          DemandeAchatLance := PurchaseRequestHeader.COUNT;
          COMMIT;
          CLEAR(PurchaseRequestHeader);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Request User ID",'%1',USERID);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader.Status,'%1',PurchaseRequestHeader.Status::Refused);
          DemandeAchaatRefusee := PurchaseRequestHeader.COUNT;
          COMMIT;
          CLEAR(PurchaseRequestHeader);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Request User ID",'%1',USERID);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Dépassement Budget",'<>%1','');
          DemandeAchatenDepassement := PurchaseRequestHeader.COUNT;
          COMMIT;
          CLEAR(PurchaseRequestHeader);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Request User ID",'%1',USERID);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Approvée par la D.F",'%1',TRUE);
          DemandeAchatVisé := PurchaseRequestHeader.COUNT;
          COMMIT;
        END
        ELSE
        BEGIN
          CLEAR(PurchaseRequestHeader);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader.Status,'%1',PurchaseRequestHeader.Status::Open);
          DemandeAchatOuvert := PurchaseRequestHeader.COUNT;
          COMMIT;
          CLEAR(PurchaseRequestHeader);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader.Status,'%1',PurchaseRequestHeader.Status::Released);
          DemandeAchatLance := PurchaseRequestHeader.COUNT;
          COMMIT;
          CLEAR(PurchaseRequestHeader);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader.Status,'%1',PurchaseRequestHeader.Status::Refused);
          DemandeAchaatRefusee := PurchaseRequestHeader.COUNT;
          COMMIT;
          CLEAR(PurchaseRequestHeader);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Dépassement Budget",'<>%1','');
          DemandeAchatenDepassement := PurchaseRequestHeader.COUNT;
          COMMIT;
          CLEAR(PurchaseRequestHeader);
          PurchaseRequestHeader.SETFILTER(PurchaseRequestHeader."Approvée par la D.F",'%1',TRUE);
          DemandeAchatVisé := PurchaseRequestHeader.COUNT;
          COMMIT;


        END;
    end;

    var
        DemandeAchatOuvert : Integer;
        PurchaseRequestHeader : Record "50005";
        UserSetup : Record "91";
        PurchaseRequestList : Page "50006";
        DemandeAchatLance : Integer;
        DemandeAchatenDepassement : Integer;
        DemandeAchaatRefusee : Integer;
        "DemandeAchatVisé" : Integer;
}

