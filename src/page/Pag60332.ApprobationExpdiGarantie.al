page 60332 "Approbation Expédié/Garantie"
{
    // version garantie pc

    DeleteAllowed = false;
    InsertAllowed = false;
    SourceTable = Table5740;

    layout
    {
        area(content)
        {
            Caption = 'Approbation garantie piéces';
            repeater(Group)
            {
                field("No.";"No.")
                {
                    Editable = false;
                }
                field("Posting Date";"Posting Date")
                {
                    Editable = false;
                }
                field("Reception No";"Reception No")
                {
                    Editable = false;
                }
                field("Type Reception";"Type Reception")
                {
                    Editable = false;
                }
                field("No Service Order";"No Service Order")
                {
                    Editable = false;
                }
                field("Source Type";"Source Type")
                {
                    Editable = false;
                }
                field("Source No";"Source No")
                {
                    Editable = false;
                }
                field(VIN;VIN)
                {
                    Editable = false;
                }
                field("OR Garantie";"OR Garantie")
                {
                    Editable = false;
                }
                field("Créer par";"Créer par")
                {
                    Editable = false;
                }
                field("Approbation Magasinier/gar";"Approbation Magasinier/gar")
                {

                    trigger OnValidate();
                    begin
                        UserSetup.GET(USERID);
                        UserSetup.TESTFIELD("Ancien Article Réçu/garantie",TRUE);
                    end;
                }
                field(Remarques;Remarques)
                {

                    trigger OnValidate();
                    begin
                        UserSetup.GET(USERID);
                        IF NOT UserSetup."Ancien Article Réçu/garantie" THEN
                          ERROR('Utilisateur non autorisé');
                    end;
                }
            }
        }
        area(factboxes)
        {
            part("Détails Véhicule";9088)
            {
                Caption = 'Détails Véhicule';
                Provider = "46";
                SubPageLink = Serial No.=CONST(VIN);
                Visible = true;
            }
        }
    }

    actions
    {
    }

    var
        UserSetup : Record "91";
}

