page 50095 "Licence permission"
{
    PageType = List;
    SourceTable = Table2000000043;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Object Type";"Object Type")
                {
                }
                field("Object Number";"Object Number")
                {
                }
                field("Read Permission";"Read Permission")
                {
                }
                field("Insert Permission";"Insert Permission")
                {
                }
                field("Modify Permission";"Modify Permission")
                {
                }
                field("Delete Permission";"Delete Permission")
                {
                }
                field("Execute Permission";"Execute Permission")
                {
                }
                field("Limited Usage Permission";"Limited Usage Permission")
                {
                }
                field(Objet;ObjectID)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord();
    begin
        ObjectID:='';
        Object.RESET;
        Object.SETRANGE(Type,"Object Type");
        Object.SETRANGE(ID,"Object Number");
        IF Object.FINDFIRST THEN
          ObjectID:=FORMAT(Object.ID);
    end;

    var
        "Object" : Record "2000000001";
        ObjectID : Text;
}

