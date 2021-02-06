page 50142 "Liste Article & Devis"
{
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
        }
    }

    actions
    {
        area(embedding)
        {
            action("Liste Article Consultation")
            {
                RunObject = Page 50139;
            }
            action("Devis PR Consult")
            {
                RunObject = Page 50140;
            }
        }
    }
}

