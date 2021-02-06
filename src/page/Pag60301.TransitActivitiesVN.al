page 60301 "Transit Activities VN"
{
    // version VN TRANSIT

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9052;

    layout
    {
        area(content)
        {
            cuegroup("Statistique VN arrivage")
            {
                field("VIN AI Erroné";"VIN AI Erroné")
                {
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
    end;
}

