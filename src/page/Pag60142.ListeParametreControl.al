page 60142 "Liste Parametre Control"
{
    // version Preparation VN

    CardPageID = "Fiche Parametre Control";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60027;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Group No";"Group No")
                {
                }
                field(Description;Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

