page 60312 "VCC NAVISION RoleCenter"
{
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            systempart(;Notes)
            {
            }
            systempart(;Links)
            {
            }
            part(;9150)
            {
                Visible = true;
            }
            systempart(;MyNotes)
            {
            }
        }
    }

    actions
    {
        area(reporting)
        {
            group(Etat)
            {
                Caption = 'Etat';
                action("Facture SAV & Chrono")
                {
                    CaptionML = ENU='Facture SAV & Chrono',
                                FRA='Facture SAV & Chrono';
                    Image = "Report";
                    RunObject = Report 60092;
                }
                action("Liste VN Vendu")
                {
                    CaptionML = ENU='Liste VN Vendu',
                                FRA='Liste VN Vendu';
                    Image = "Report";
                    RunObject = Report 70090;
                }
            }
        }
    }
}

