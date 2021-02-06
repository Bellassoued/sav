page 50043 "Mes demandes d'achat"
{
    // version DEM ACHAT

    CaptionML = ENU='My Purchase Requests',
                FRA='Mes demandes d''achat';
    Editable = false;
    PageType = List;
    SourceTable = Table50005;
    SourceTableView = WHERE(Visible=FILTER(Yes));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field("Purchase Type";"Purchase Type")
                {
                }
                field("Request Date";"Request Date")
                {
                }
                field("Requested Receipt Date";"Requested Receipt Date")
                {
                }
                field("Montant HT";"Montant HT")
                {
                }
                field("Montant HT DS";"Montant HT DS")
                {
                }
                field("Currency Code";"Currency Code")
                {
                }
                field(Status;Status)
                {
                }
                field("Vendor No.";"Vendor No.")
                {
                }
                field("Nom Fournisseur";"Nom Fournisseur")
                {
                }
                field("Date Refus";"Date Refus")
                {
                }
                field("Refused by";"Refused by")
                {
                }
                field("Code Motif Refus";"Code Motif Refus")
                {
                }
                field("Purchaseperson Code";"Purchaseperson Code")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                action(Card)
                {
                    CaptionML = ENU='Card',
                                FRA='Fiche';
                    Image = EditLines;
                    RunObject = Page 50004;
                    RunPageLink = No.=FIELD(No.);
                    ShortCutKey = 'Shift+F5';
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin

        IF Status = 3 THEN
              IntGcolor := 255
         ELSE IntGcolor := 0 ;
    end;

    trigger OnInit();
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;

    trigger OnOpenPage();
    begin
        // RAD ADDINS -
        //- Restriction des acces aux demande selon droit utilisateur
        RecGUserSetup.GET(USERID);
        /*IF NOT RecGUser."Show all Request" THEN
        BEGIN
         FILTERGROUP(2);
         SETFILTER("Request User ID",USERID);
         FILTERGROUP(0);
        END;
        */

    end;

    var
        IntGcolor : Integer;
        RecGUserSetup : Record "91";
}

