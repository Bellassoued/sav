page 60319 "Cartes Carburant Non Livrées"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table5940;
    SourceTableView = SORTING(Item No.,Serial No.)
                      WHERE(Carte Carburant=FILTER(<>''));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Serial No.";"Serial No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Carte Carburant";"Carte Carburant")
                {
                }
                field("Phone No.";"Phone No.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

