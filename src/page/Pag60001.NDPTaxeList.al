page 60001 "NDP Taxe List"
{
    // version Automobile @Discovery 2013

    CaptionML = ENU='NDP Taxes List',
                FRA='Liste NDP Taxes';
    PageType = List;
    SourceTable = Table60001;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No. Compagne";"No. Compagne")
                {
                }
                field("Line No.";"Line No.")
                {
                }
                field("Code Coût service";"Code Coût service")
                {
                }
                field(Description;Description)
                {
                }
                field(Assiette;Assiette)
                {
                }
                field("Désignation Taxe";"Désignation Taxe")
                {
                }
                field("Calcul Assiette";"Calcul Assiette")
                {
                }
                field(Totalisation;Totalisation)
                {
                }
                field("No. ligne";"No. ligne")
                {
                }
                field(Seuil;Seuil)
                {
                }
            }
        }
    }

    actions
    {
    }
}

