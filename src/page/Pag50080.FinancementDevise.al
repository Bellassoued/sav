page 50080 "Financement Devise"
{
    // version ETRANGER

    PageType = ListPart;
    SaveValues = true;
    SourceTable = Table50030;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code Banque";"Code Banque")
                {
                    Editable = false;
                }
                field("Q. Provisoires";"Q. Provisoires")
                {
                }
                field("Nom Banque";"Nom Banque")
                {
                }
                field("Escompte Commerciale";"Escompte Commerciale")
                {
                }
                field("Q. R. Garanties";"Q. R. Garanties")
                {
                    Editable = false;
                }
                field("Q.Définitives";"Q.Définitives")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

