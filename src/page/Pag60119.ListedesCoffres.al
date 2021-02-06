page 60119 "Liste des Coffres"
{
    PageType = List;
    SourceTable = Table60021;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code;Code)
                {
                }
                field(Désignation;Désignation)
                {
                }
                field("Centre de Gestion";"Centre de Gestion")
                {
                }
                field(Activité;Activité)
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
        // Commented Code pour le besoin de Transfer de Chéque
        
        //Add Bill 09/07/2014 Gestion de Coffre par User
        /* //commentaire rh 09/08/16
        IF UserMgt.GetCoffreFilter(USERID) <> '' THEN BEGIN
          FILTERGROUP(2);
          SETFILTER(Code,UserMgt.GetCoffreFilter(USERID));
          FILTERGROUP(0);
        END;
        */
        //END Bill 09/07/2014 Gestion de Coffre par User

    end;

    var
        UserMgt : Codeunit "5700";
}

