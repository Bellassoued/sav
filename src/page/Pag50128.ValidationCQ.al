page 50128 "Validation CQ"
{
    SourceTable = Table50094;

    layout
    {
        area(content)
        {
            group()
            {
                field("Confirmation SQ";"Confirmation SQ")
                {
                    Editable = false;
                }
                field(Observation;Observation)
                {
                    Editable = NOT "Confirmation SQ";
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Confirmer)
            {
                Image = Confirm;
                Promoted = true;

                trigger OnAction();
                begin
                    IF "Confirmation SQ" THEN
                      "Confirmation SQ":=FALSE
                    ELSE
                    "Confirmation SQ":=TRUE;
                end;
            }
        }
    }

    var
        RecReceptionSAV : Record "60008";
        Modifier : Boolean;
}

