page 50105 "Campagne VIN"
{
    // version SAVCompagne

    CardPageID = "Campagne Carte";
    PageType = List;
    SourceTable = Table50082;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field(Code;Code)
                {
                }
                field(Description;Description)
                {
                }
                field("Date de lancement";"Date de lancement")
                {
                }
                field("Date de création";"Date de création")
                {
                }
                field("Créée par";"Créée par")
                {
                }
                field("Code marque";"Code marque")
                {
                }
                field("Type Compagne";"Type Compagne")
                {
                }
                field(Bloquant;Bloquant)
                {
                }
                field("Nbre total VIN comapgne";"Nbre total VIN comapgne")
                {
                }
                field("Nbre VIN non traité";"Nbre VIN non traité")
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
        IF NOT UserSetup."Accès campagnes rappel" THEN
          ERROR('Utilisateur non autorisé');
    end;

    var
        UserSetup : Record "91";
}

