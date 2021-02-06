page 70048 "Liste des chassis-Chef Parc1"
{
    // version PARC

    DeleteAllowed = false;
    PageType = List;
    SourceTable = Table5940;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                    Visible = false;
                }
                field("Serial No.";"Serial No.")
                {
                    CaptionML = ENU='Serial No.',
                                FRA='Chassis';
                    Editable = false;
                }
                field(Matricule;Matricule)
                {
                    Editable = false;
                }
                field("Service Item Group Code";"Service Item Group Code")
                {
                    Editable = false;
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
                {
                    Editable = false;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field(VS;VS)
                {
                }
                field("Approbation Création OR";"Approbation Création OR")
                {
                }
                field(Commentaires;Commentaires)
                {
                }
            }
        }
    }

    actions
    {
    }
}

