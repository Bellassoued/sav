page 50166 "Piece Non Vendu"
{
    PageType = List;
    SourceTable = Table50107;
    SourceTableView = SORTING(Entry No);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No";"Entry No")
                {
                }
                field("Centre De gestion";"Centre De gestion")
                {
                }
                field(Description;Description)
                {
                }
                field("Stock Magasin";"Stock Magasin")
                {
                }
                field("Article mvt 0/ 6M";"Article mvt 0/ 6M")
                {
                }
                field("Article non Mvt 6M";"Article non Mvt 6M")
                {
                }
                field("Article non Mvt 1A";"Article non Mvt 1A")
                {
                }
                field("Article non Mvt 2A";"Article non Mvt 2A")
                {
                }
                field("Article non Mvt 3A";"Article non Mvt 3A")
                {
                }
                field("Article non Mvt plus 5A";"Article non Mvt plus 5A")
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
        UserSetup.GET(USERID);
        IF NOT UserSetup."Cost Responsable" THEN BEGIN
        Location.GET(UserSetup."Mag Reservation/Defaut");
        FILTERGROUP(2);
        SETRANGE("Centre De gestion",Location."Centre de Gestion");
        FILTERGROUP(0);
        END;
    end;

    var
        UserSetup : Record "91";
        Location : Record "14";
}

