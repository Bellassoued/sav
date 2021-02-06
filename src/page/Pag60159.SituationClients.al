page 60159 "Situation Clients"
{
    // version MAZDA31

    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table18;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("No.";"No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Chèques en coffre";"Chèques en coffre")
                {
                    Editable = false;
                }
                field("Chèques versés à l'enaci";"Chèques versés à l'enaci")
                {
                    Editable = false;
                }
                field("Chèques retournés impayés";"Chèques retournés impayés")
                {
                    Editable = false;
                }
                field("Chèques de garantie";"Chèques de garantie")
                {
                    Editable = false;
                }
                field("Effets en coffre";"Effets en coffre")
                {
                    Editable = false;
                }
                field("Effets remis à l'encaissement";"Effets remis à l'encaissement")
                {
                    Editable = false;
                }
                field("Effets remis à l'escompte";"Effets remis à l'escompte")
                {
                    Editable = false;
                }
                field("Effets impayés";"Effets impayés")
                {
                    Editable = false;
                }
                field(Caution;Caution)
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

