page 69099 "Paramètre Utilisateurs"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Table91;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User ID";"User ID")
                {
                }
                field("Allow Posting From";"Allow Posting From")
                {
                }
                field("Allow Posting To";"Allow Posting To")
                {
                }
                field("Tréso Resp. Ctr. Filter";"Tréso Resp. Ctr. Filter")
                {
                }
                field("Profil Réglement";"Profil Réglement")
                {
                }
                field("Filtre coffre";"Filtre coffre")
                {
                }
                field("Ref. Changement Profil";"Ref. Changement Profil")
                {
                }
                field("Profil Secondaire";"Profil Secondaire")
                {
                }
                field("Garder Info. Br.Reglement";"Garder Info. Br.Reglement")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = TRUE;
                }
                field("Notification Reglement";"Notification Reglement")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        //HH 09112019
         UserSetup.GET(USERID);
         IF NOT UserSetup.DAF THEN
          ERROR('Vous n''avez pas le droit');
        //END HH
    end;

    var
        UserSetup : Record "91";
}

