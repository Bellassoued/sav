page 60155 "Ligne Panne G. Service Garanti"
{
    // version SAV Automobile,MAZDA19

    Caption = 'Pannes Symptomes Réparations';
    Editable = false;
    PageType = ListPart;
    SourceTable = Table60012;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Num ligne";"Num ligne")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Code Symptome";"Code Symptome")
                {
                }
                field("Description symptome";"Description symptome")
                {
                }
                field("Instruction No.";"Instruction No.")
                {
                }
                field("Instruction Description";"Instruction Description")
                {
                }
                field(Complément;Complément)
                {
                }
                field("Date création";"Date création")
                {
                }
                field("Créé par";"Créé par")
                {
                }
                field("Chef d'équipe";"Chef d'équipe")
                {
                }
                field("Nbre Heures Affecté";"Nbre Heures Affecté")
                {
                }
                field(Clôturés;Clôturés)
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        //SM MAZDA19
        Garantie := WarrantyCard;
    end;

    var
        WarrantyCard : Boolean;

    procedure SetFromWarrantyCard();
    begin
        //SM MAZDA19
        WarrantyCard := TRUE;
    end;
}

