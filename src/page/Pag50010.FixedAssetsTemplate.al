page 50010 "Fixed Assets Template"
{
    // version DEM ACHAT,CT16V001

    CaptionML = ENU='Fixed Assets Template',
                FRA='Modèle Immobilisation';
    Editable = false;
    PageType = List;
    SourceTable = 50007;

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Code;Code)
                {
                }
                field(Designation;Designation)
                {
                }
            }
        }
    }

    actions
    {
    }
}

