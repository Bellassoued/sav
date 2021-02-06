page 70031 "Détail Profil Réglement"
{
    DeleteAllowed = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = ListPart;
    SaveValues = true;
    SourceTable = Table70032;
    SourceTableView = SORTING(Type de réglement,Code profil réglement,No. ligne);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code profil réglement";"Code profil réglement")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = Att;
                }
                field("Type de réglement";"Type de réglement")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = Att;
                }
                field("Etape de réglement";"Etape de réglement")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = Att;
                }
                field("No. ligne";"No. ligne")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = Att;
                }
                field("Compte Débit";"Compte Débit")
                {
                }
                field("Compte Crédit";"Compte Crédit")
                {
                }
                field(Autoriser;Autoriser)
                {

                    trigger OnValidate();
                    begin
                        Att := Autoriser = FALSE;
                    end;
                }
                field(Coffre;Coffre)
                {
                    Visible = false;
                }
                field("Nom compte";"Nom compte")
                {
                }
                field("No. statut précédent";"No. statut précédent")
                {
                    Editable = false;
                }
                field("No. statut suivant";"No. statut suivant")
                {
                    Editable = false;
                }
                field("Type action";"Type action")
                {
                    Editable = false;
                }
                field("Code journale";"Code journale")
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
        Att := Autoriser = FALSE;
    end;

    trigger OnModifyRecord() : Boolean;
    begin
        //IF USERID <> 'BSB\ADMINISTRATEUR' THEN
        //ERROR('modification interdite');
    end;

    var
        Att : Boolean;
}

