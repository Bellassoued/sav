page 50064 "Sou-Famille frais"
{
    CaptionML = ENU='sous famille',
                FRA='sous famille';
    PageType = List;
    SourceTable = Table50060;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Famille";"Code Famille")
                {
                }
                field("Sous-Famille";"Sous-Famille")
                {
                }
                field(Désignation;Désignation)
                {
                }
            }
        }
    }

    actions
    {
    }
}

