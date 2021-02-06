page 50068 "Liste Transfert VN"
{
    // version MAZDA456

    CardPageID = "Sou-Famille frais";
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60025;
    SourceTableView = WHERE(Service Type=CONST(Transfert));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Preparation No";"Preparation No")
                {
                }
                field("Statut Transfert";"Statut Transfert")
                {
                }
            }
        }
    }

    actions
    {
    }
}

