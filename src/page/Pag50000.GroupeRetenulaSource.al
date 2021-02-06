page 50000 "Groupe Retenu à la Source"
{
    // version CT16V001

    PageType = List;
    SourceTable = 50006;
    SourceTableView = SORTING(Code);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code;Code)
                {
                }
                field(Designation;Designation)
                {
                }
                field("% Retenue";"% Retenue")
                {
                }
                field("Compte Retenue";"Compte Retenue")
                {
                }
                field("Type Retenue";"Type Retenue")
                {
                }
                field(Proposition;Proposition)
                {
                }
                field(annexe;annexe)
                {
                }
                field("Pos. mnt Brut dans Annexe";"Pos. mnt Brut dans Annexe")
                {
                }
                field("Sous Pos. mnt Brut ds  Annexe";"Sous Pos. mnt Brut ds  Annexe")
                {
                }
                field(Activé;Activé)
                {
                }
                field(Ristourne;Ristourne)
                {
                }
                field("Activé R.S";"Activé R.S")
                {
                }
                field("Date Début Activation";"Date Début Activation")
                {
                }
                field(Priorité;Priorité)
                {
                }
            }
        }
    }

    actions
    {
    }
}

