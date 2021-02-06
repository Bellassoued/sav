page 70033 "Liste des profils"
{
    CardPageID = "Profil Réglement";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = Table70031;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Profil";"Code Profil")
                {
                    Style = Strong;
                    StyleExpr = FilterEcg;
                }
                field("Centre de Gestion";"Centre de Gestion")
                {
                    Style = Strong;
                    StyleExpr = FilterEcg;
                }
                field(Coffre;Coffre)
                {
                    Style = Strong;
                    StyleExpr = FilterEcg;
                }
                field("Description coffre";"Description coffre")
                {
                    Style = Strong;
                    StyleExpr = FilterEcg;
                }
                field("Filter par Coffre";"Filter par Coffre")
                {
                }
                field("Filter par Centre de gestion";"Filter par Centre de gestion")
                {
                }
                field("Admin Encai-Décaiss.";"Admin Encai-Décaiss.")
                {
                }
                field("Code Journal";"Code Journal")
                {
                }
                field("Nbr. User";"Nbr. User")
                {
                }
                field("Filter Autre Centre Gestion";"Filter Autre Centre Gestion")
                {
                }
                field("CaisseRecette par défaut";"CaisseRecette par défaut")
                {
                }
                field("Caisse dépense par défaut";"Caisse dépense par défaut")
                {
                }
                field("Garder Info. B.Reg.";"Garder Info. B.Reg.")
                {
                }
                field("Afficher D.A a régler Espèce";"Afficher D.A a régler Espèce")
                {
                }
                field("Afficher D.A a régler Chèque";"Afficher D.A a régler Chèque")
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
        FilterEcg := TRUE;
        IF "Filter par Coffre" THEN
          FilterEcg := FALSE;
    end;

    trigger OnAfterGetRecord();
    begin
        FilterEcg := TRUE;
        IF "Filter par Coffre" THEN
          FilterEcg := FALSE;
    end;

    trigger OnOpenPage();
    begin
         //RM 020817
        UserSetup.GET(USERID);
        IF NOT UserSetup.DAF THEN
          ERROR('Vous n avez pas le droit');
        //END RM


        FilterEcg := TRUE;
        IF "Filter par Coffre" THEN
          FilterEcg := FALSE;
    end;

    var
        FilterEcg : Boolean;
        UserSetup : Record "91";
}

