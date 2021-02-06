page 60188 "Liste Options"
{
    // version CT16V002

    PageType = ListPart;
    SourceTable = Table50038;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code;Code)
                {
                    Editable = false;
                }
                field("Option Type";"Option Type")
                {
                    Editable = false;
                }
                field("Internal Code";"Internal Code")
                {
                }
                field(Description;Description)
                {
                }
                field(Description1;Description1)
                {
                }
                field("Prix Achat";"Prix Achat")
                {
                }
                field("Prix achat By Version";"Prix achat By Version")
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        LigneOption : Record "50038";
        RecOption : Record "50041";
}

