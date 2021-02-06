page 70020 "List To do Master Item"
{
    Editable = false;
    PageType = List;
    SourceTable = Table70016;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Enty No.";"Enty No.")
                {
                }
                field("Date Creation";"Date Creation")
                {
                }
                field(Description;Description)
                {
                }
                field("Staut Step";"Staut Step")
                {
                }
                field("Wizard Step";"Wizard Step")
                {
                    Visible = false;
                }
                field("DirectoryPath ADDIN";"DirectoryPath ADDIN")
                {
                }
                field("DirectoryPath CDR";"DirectoryPath CDR")
                {
                }
                field("Import Article Master";"Import Article Master")
                {
                }
                field("Update Item Sales Price";"Update Item Sales Price")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action("&Item Master")
                {
                    CaptionML = ENU='&Item Master',
                                FRA='&Article Master';
                    Image = NewItem;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        RecToDoMasterItem : Record "70016" temporary;
                    begin
                        RecToDoMasterItem.StartWizard;
                    end;
                }
            }
        }
    }
}

