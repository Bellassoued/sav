page 50014 "FA Posting Groups List"
{
    // version DEM ACHAT,CT16V001

    CaptionML = ENU='FA Posting Groups',
                FRA='Groupes compta. immo.';
    PageType = List;
    SourceTable = 5606;

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Code;Code)
                {
                }
            }
        }
    }

    actions
    {
    }

    var
        GLAcc : Record "15";
}

