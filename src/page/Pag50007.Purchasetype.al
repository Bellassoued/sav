page 50007 "Purchase type"
{
    // version DEM ACHAT,CT16V001

    CaptionML = ENU = 'Purchase type',
                FRA = 'Type achat';
    PageType = List;
    SourceTable = 50004;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Code; Code)
                {
                }
                field(Designation; Designation)
                {
                }
            }
        }
    }

    actions
    {
    }
}

