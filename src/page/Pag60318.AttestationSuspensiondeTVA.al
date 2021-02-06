page 60318 "Attestation Suspension de TVA"
{
    // version ATTESTATION

    PageType = List;
    SourceTable = Table50027;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Client";"Code Client")
                {
                    Editable = false;
                }
                field("Date Début";"Date Début")
                {
                }
                field("Date Fin";"Date Fin")
                {
                }
                field("No Attestation";"No Attestation")
                {
                }
            }
        }
    }

    actions
    {
    }
}

