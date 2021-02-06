page 50118 "Purchase Request List régler"
{
    // version DEM ACHAT,CT16V001

    Caption = 'Liste Demande Achat';
    CardPageID = "Purchase Request";
    DataCaptionFields = "No.","Request Date","Vendor No.";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = true;
    LinksAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = Table50005;
    SourceTableView = WHERE(D.A réglé=FILTER(Yes));

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Status;Status)
                {
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("No.";"No.")
                {
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field(Description;Description)
                {
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("Purchase Type";"Purchase Type")
                {
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("Request Date";"Request Date")
                {
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("Requested Receipt Date";"Requested Receipt Date")
                {
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("Date Approbation";"Date Approbation")
                {
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("Date Approb. 2";"Date Approb. 2")
                {
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("Purchaseperson Code";"Purchaseperson Code")
                {
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("Montant HT";"Montant HT")
                {
                    Caption = 'Montant HT';
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("Currency Code";"Currency Code")
                {
                    Style = Standard;
                    StyleExpr = LineColor;
                }
                field("N° Commande Achat";"N° Commande Achat")
                {
                }
                field("Request User ID";"Request User ID")
                {
                }
                field("D.A réglé";"D.A réglé")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    begin
        //KK_04012018
        LineColor := '';
        IF "Approvée par la D.C.G" THEN
          LineColor :='Ambiguous';

        IF  "Approvée par la D.F" THEN
          LineColor := 'favorable';

        IF Status = Status::Refused THEN
          LineColor := 'Unfavorable';
    end;

    trigger OnAfterGetRecord();
    begin
        MontantHT:= 0;
        //MontantHT:= GetTotal;

        //KK_04012018
        LineColor := '';
        IF "Approvée par la D.C.G" THEN
          LineColor :='Ambiguous';

        IF  "Approvée par la D.F" THEN
          LineColor := 'favorable';

        IF Status = Status::Refused THEN
          LineColor := 'Unfavorable';
    end;

    trigger OnOpenPage();
    begin
        RecGUserSetup.GET(USERID);
        IF NOT RecGUserSetup."Admin Finance NAV" THEN
          BEGIN
            FILTERGROUP(2);
            SETRANGE("Request User ID",USERID);
            FILTERGROUP(0);
          END;
        
        
        /*
        IF NOT RecGUserSetup."Approuver Demande Achat" THEN
          BEGIN
              CLEAR(ProfilReglement);
              ProfilReglement.SETRANGE("Centre de Gestion",RecGUserSetup."Tréso Resp. Ctr. Filter");
              ProfilReglement.SETRANGE(Coffre,RecGUserSetup."Filtre coffre");
              ProfilReglement.SETRANGE("Code Profil",RecGUserSetup."Profil Réglement");
              IF ProfilReglement.FIND('-') THEN
                BEGIN
                  IF NOT ProfilReglement."Admin Encai-Décaiss." THEN
                  BEGIN
                    FILTERGROUP(2);
                    SETRANGE("Responsibility Center",ProfilReglement."Centre de Gestion");
                    FILTERGROUP(0);
                  END;
                END
              ELSE
              IF NOT RecGUserSetup."Service Compta." THEN
                BEGIN
                    FILTERGROUP(2);
                    SETRANGE("Responsibility Center",RecGUserSetup."Purchase Resp. Ctr. Filter");
                    FILTERGROUP(0);
                END;
           END;
        */

    end;

    var
        MontantHT : Decimal;
        RecGUserSetup : Record "91";
        ProfilReglement : Record "70031";
        LineColor : Text;
}

