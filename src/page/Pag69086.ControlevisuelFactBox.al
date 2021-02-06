page 69086 "Controle visuel FactBox"
{
    Caption = 'Controle visuel';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = Table60009;

    layout
    {
        area(content)
        {
            group()
            {
                field(Kilometrage;Kilometrage)
                {
                }
                field("Compagne de rappel 1";"Compagne de rappel 1")
                {
                    Caption = 'Compagne 1';
                }
                field("Compagne de rappel 2";"Compagne de rappel 2")
                {
                    Caption = 'Compagne 2';
                }
                field("Compagne de rappel 3";"Compagne de rappel 3")
                {
                    Caption = 'Compagne 3';
                }
                field(Remarques;Remarques)
                {
                }
                field(VIN;VIN)
                {
                    DrillDown = false;
                    Lookup = false;
                }
            }
        }
    }

    actions
    {
    }
}

