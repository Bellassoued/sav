page 69007 "Pickeur Activity"
{
    // version NAVW17.00

    CaptionML = ENU='Activities',
                FRA='Activités';
    PageType = CardPart;
    SourceTable = Table9050;

    layout
    {
        area(content)
        {
            cuegroup("Outbound - Today")
            {
                CaptionML = ENU='Outbound - Today',
                            FRA='Sortant - Aujourd''hui';
                field("Transfer orders";"Transfer orders")
                {
                    Caption = 'Ordre de Transfert';
                }
                field("Transfert order shipped";"Transfert order shipped")
                {
                    Caption = 'Ordre de Transfert - Expédiés';
                }

                actions
                {
                    action("Nouveau Transfert")
                    {
                        Image = TransferOrder;
                        Promoted = true;
                        PromotedIsBig = true;
                        RunObject = Page 5740;
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

        SETRANGE("Date Filter",0D,WORKDATE);
        SETRANGE("Date Filter2",WORKDATE,WORKDATE);

        //LocationCode := WhseWMSCue.GetEmployeeLocation(USERID);
        SETFILTER("Location Filter",LocationCode);
    end;

    var
        WhseWMSCue : Record "9051";
        LocationCode : Text[1024];
}

