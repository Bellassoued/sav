page 50133 "Subform magasin d'affectation"
{
    // version AK290419

    PageType = ListPart;
    SourceTable = Table7301;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User ID";"User ID")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field(Default;Default)
                {
                }
                field("ADCS User";"ADCS User")
                {
                }
                field("Prev. rang Sugg.";"Prev. rang Sugg.")
                {
                }
            }
        }
    }

    actions
    {
    }
}

