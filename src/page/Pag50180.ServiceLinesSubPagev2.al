page 50180 "Service Lines SubPage v2"
{
    PageType = ListPart;
    PopulateAllFields = true;
    SaveValues = true;
    SourceTable = Table5950;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resource No.";"Resource No.")
                {
                }
                field("Nom ressource";"Nom ressource")
                {
                }
                field("Date Début";"Date Début")
                {
                }
                field("Starting Time";"Starting Time")
                {
                }
                field("Date Fin";"Date Fin")
                {
                }
                field("Finishing Time";"Finishing Time")
                {
                }
                field("Allocated Hours";"Allocated Hours")
                {
                    Editable = false;
                }
                field(Description;Description)
                {
                }
                field("Code Instruction";"Code Instruction")
                {
                }
                field("Description Instruction";"Description Instruction")
                {
                }
                field("Temps Estimé";"Temps Estimé")
                {
                    Visible = false;
                }
                field("Code Zone Panne";"Code Zone Panne")
                {
                }
                field("Description symptome";"Description symptome")
                {
                }
                field("Code Symptome";"Code Symptome")
                {
                }
                field("Description Zone";"Description Zone")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec : Boolean);
    var
        ServiceLineL : Record "5902";
    begin
        "Date Début":=TODAY;
        IF NOT ServiceLineL.GET("Document Type","Document No.","Line No.") THEN
          EXIT;
        IF ServiceLineL.Type=ServiceLineL.Type::Cost THEN
          INSERT(TRUE);
    end;
}

