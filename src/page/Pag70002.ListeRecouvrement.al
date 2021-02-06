page 70002 "Liste Recouvrement"
{
    // version CT16V002

    CardPageID = Recouvrement;
    PageType = List;
    Permissions = TableData 112=rim;
    SourceTable = Table70000;
    SourceTableView = WHERE(Code coursier=CONST(''));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Bord. Recouvrement";"No. Bord. Recouvrement")
                {
                }
                field("Date Creation";"Date Creation")
                {
                }
                field("Crée par";"Crée par")
                {
                }
                field("Date Modification";"Date Modification")
                {
                }
                field("Modifier par";"Modifier par")
                {
                }
                field("Date impression";"Date impression")
                {
                    CaptionML = ENU='Printed Date',
                                FRA='Date Impression';
                }
                field("Nbre impression";"Nbre impression")
                {
                }
                field(Etape;Etape)
                {
                }
                field("Code client";"Code client")
                {
                }
                field("Nom client";"Nom client")
                {
                }
                field(Status;Status)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Afficher Br/User")
            {
                Enabled = false;
                Image = ShowMatrix;
                Visible = false;

                trigger OnAction();
                begin

                    FILTERGROUP(2);
                    SETFILTER("Crée par",USERID);
                    FILTERGROUP(0);
                end;
            }
            action("Afficer Tous")
            {
                Image = ShowSelected;

                trigger OnAction();
                begin

                    FILTERGROUP(2);
                    SETFILTER("Crée par",'<>%1','');
                    FILTERGROUP(0);
                end;
            }
        }
    }

    trigger OnInit();
    var
        RecouvrementEntete : Record "70000";
    begin
    end;

    trigger OnOpenPage();
    begin
        UserSetup.GET(USERID);
        IF NOT UserSetup."Accès bordereau Recouvrement" THEN
          ERROR('Vous n''avez pas accès à ce module');



        FILTERGROUP(2);
        RecouvrementEntete.RESET;
        IF UserSetup."Recouvrement PR/SAV" THEN
            SETFILTER("Code client",'<>%1','BOF*')
          ELSE
           SETFILTER("Code client",'%1','BOF*');
         FILTERGROUP(0);
    end;

    var
        UserSetup : Record "91";
        RecouvrementEntete : Record "70000";
}

