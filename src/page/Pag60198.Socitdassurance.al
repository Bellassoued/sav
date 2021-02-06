page 60198 "Société d'assurance"
{
    Editable = true;
    PageType = List;
    SourceTable = Table60072;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = Editable;
                field(Code;Code)
                {
                }
                field(Description;Description)
                {
                }
                field(Blocked;Blocked)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        UserSetup.GET(USERID);
        Editable:=UserSetup."Responsable SAV";
    end;

    var
        Editable : Boolean;
        UserSetup : Record "91";
}

