page 50008 "Motif Refus"
{
    // version DEM ACHAT,CT16V001

    CaptionML = ENU = 'Refusal Reason',
                FRA = 'Motif Refus';
    PageType = List;
    SourceTable = 50002;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Code Motif"; "Code Motif")
                {
                }
                field(Description; Description)
                {
                }
            }
        }
    }

    actions
    {
    }
}

