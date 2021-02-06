page 70079 "Liste Client"
{
    PageType = StandardDialog;

    layout
    {
        area(content)
        {
            field("N° Client";NumClient)
            {
                TableRelation = Customer;

                trigger OnValidate();
                begin
                    //RecClient.RESET;
                    RecClient.GET(NumClient);
                    NomClient:= RecClient.Name;
                end;
            }
            field("Nom Client";NomClient)
            {
                TableRelation = Customer;
            }
        }
    }

    actions
    {
    }

    var
        NumClient : Code[20];
        NomClient : Text[100];
        RecClient : Record "18";

    procedure FctGetNumClient() : Code[20];
    begin
        EXIT(NumClient);
    end;
}

