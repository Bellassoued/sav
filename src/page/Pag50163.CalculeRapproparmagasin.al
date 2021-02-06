page 50163 "Calcule Réappro par magasin"
{
    // version Reappro TYT V01

    PageType = List;
    SourceTable = Table50104;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Code Article";"Code Article")
                {
                }
                field("Qtée Vendue PR N + 1";"Qtée Vendue PR N + 1")
                {
                    Caption = 'Qtée Vendue PR N';
                }
                field("Qtée Vendue PR N";"Qtée Vendue PR N")
                {
                    Caption = 'Qtée Vendue PR N-1';
                }
                field("Qtée Vendue PR N-1";"Qtée Vendue PR N-1")
                {
                    Caption = 'Qtée Vendue PR N-2';
                }
                field("Qtée Vendue PR N-2";"Qtée Vendue PR N-2")
                {
                    Caption = 'Qtée Vendue PR N-3';
                }
                field("Qtée Vendue PR N-3";"Qtée Vendue PR N-3")
                {
                    Caption = 'Qtée Vendue PR N-4';
                }
                field("Qtée Vendue PR N-4";"Qtée Vendue PR N-4")
                {
                    Caption = 'Qtée Vendue PR N-5';
                }
                field("Qtée Vendue PR N-5";"Qtée Vendue PR N-5")
                {
                    Caption = 'Qtée Vendue PR N-6';
                }
                field("Qtée Vendue PR N-6";"Qtée Vendue PR N-6")
                {
                    Caption = 'Qtée Vendue PR N-7';
                }
                field("Date Insert";"Date Insert")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Reappro par centre de gestion")
            {
                Image = PlanningWorksheet;
                RunObject = Report 50116;
            }
            action("Calcule MAD  par Centre")
            {
                Image = Calculate;

                trigger OnAction();
                var
                    VenteArticleParMagasin : Record "50104";
                begin
                    UserSetup.GET(USERID);
                    Location.GET(UserSetup."Mag Reservation/Defaut");
                    MADparMagasin.RESET;
                    IF NOT UserSetup."Cost Responsable" THEN
                      MADparMagasin.SETRANGE("Centre de gestion",Location."Centre de Gestion");
                    IF MADparMagasin.FINDSET THEN
                      REPEAT
                        MADparMagasin.DELETE;
                      UNTIL MADparMagasin.NEXT = 0;

                    VenteArticleParMagasin.RESET;
                    IF NOT UserSetup."Cost Responsable" THEN
                     VenteArticleParMagasin.SETRANGE("Responsibility Center",Location."Centre de Gestion");
                    IF VenteArticleParMagasin.FINDSET THEN
                    REPEAT
                      SystemeReapproTYT.CalculeMADVparMagasin(VenteArticleParMagasin."Code Article",FALSE,VenteArticleParMagasin."Responsibility Center");
                    UNTIL VenteArticleParMagasin.NEXT = 0;

                    //SystemeReapproTYT.CalculeMADVparMagasin("Code Article",FALSE,"Responsibility Center");
                    MESSAGE('terminer');
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        UserSetup.GET(USERID);
        IF NOT UserSetup."Cost Responsable" THEN BEGIN
          IF UserSetup."Mag Reservation/Defaut" <> '' THEN
            BEGIN
              Location.GET(UserSetup."Mag Reservation/Defaut");
              FILTERGROUP(2);
              SETRANGE("Responsibility Center",Location."Centre de Gestion");
              FILTERGROUP(0);
            END;
        END;
    end;

    var
        SystemeReapproTYT : Codeunit "70009";
        UserSetup : Record "91";
        ResponsibilityCenter : Record "5714";
        Location : Record "14";
        MADparMagasin : Record "50105";
}

