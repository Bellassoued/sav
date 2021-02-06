page 60144 "Control Sub Page"
{
    // version Preparation VN

    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = Table60028;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No";"Line No")
                {
                }
                field(Description;Description)
                {
                }
                field("Titre Principale";"Titre Principale")
                {
                }
            }
        }
    }

    actions
    {
    }
}

