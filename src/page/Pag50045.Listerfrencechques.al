page 50045 "Liste référence chèques"
{
    // version Chéque @ DATASOFT 2013

    PageType = List;
    SourceTable = Table50016;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Groupe Compta. Client";"Groupe Compta. Client")
                {
                }
                field(Description;Description)
                {
                }
                field("N° fin";"N° fin")
                {
                }
                field("Date création";"Date création")
                {
                }
                field("Date début utilisation";"Date début utilisation")
                {
                }
                field("Date fin utilisation";"Date fin utilisation")
                {
                }
                field(Commentaire;Commentaire)
                {
                }
            }
        }
    }

    actions
    {
    }
}

