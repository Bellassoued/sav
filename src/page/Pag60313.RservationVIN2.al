page 60313 "Réservation VIN 2"
{
    Editable = false;
    PageType = List;
    SourceTable = Table337;
    SourceTableView = WHERE(Reservation Status=CONST(Reservation),
                            Source ID=CONST(CMD-VN-*));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No.";"Item No.")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Reservation Status";"Reservation Status")
                {
                }
                field(Description;Description)
                {
                }
                field("Creation Date";"Creation Date")
                {
                }
                field("Source ID";"Source ID")
                {
                }
                field("Serial No.";"Serial No.")
                {
                }
                field("Created By";"Created By")
                {
                }
                field("Changed By";"Changed By")
                {
                }
                field("Nombre du jours";NbreJrs)
                {
                }
                field("Dossier Complet";DossierComplet)
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
        IF "Creation Date" <> 0D THEN
          NbreJrs := TODAY - "Creation Date"
        ELSE
          NbreJrs := 0;

        IF SalesHeader.GET(SalesHeader."Document Type"::Order,Rec."Source ID") THEN
          DossierComplet := SalesHeader."Dossier complet";
    end;

    trigger OnAfterGetRecord();
    begin
        IF "Creation Date" <> 0D THEN
          NbreJrs := TODAY - "Creation Date"
        ELSE
          NbreJrs := 0;

        IF SalesHeader.GET(SalesHeader."Document Type"::Order,Rec."Source ID") THEN
          DossierComplet := SalesHeader."Dossier complet";
    end;

    var
        NbreJrs : Integer;
        DossierComplet : Boolean;
        SalesHeader : Record "36";
}

