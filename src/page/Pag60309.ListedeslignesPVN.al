page 60309 "Liste des lignes PVN"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table70022;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("N° Bordereau";"N° Bordereau")
                {
                }
                field("N° Ligne";"N° Ligne")
                {
                }
                field(VIN;VIN)
                {
                }
                field(Statut;Statut)
                {
                }
                field("Modèle Véhicule";"Modèle Véhicule")
                {
                }
                field("Code Variant";"Code Variant")
                {
                }
                field("N° Matriculation";"N° Matriculation")
                {
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
                {
                }
                field("Date Reception";"Date Reception")
                {
                }
                field("Source Type";"Source Type")
                {
                }
                field("Source ID";"Source ID")
                {
                }
                field(Name;Name)
                {
                }
                field(Status;Status)
                {
                }
                field("Bill-to Name";"Bill-to Name")
                {
                }
                field("Type Paiement";"Type Paiement")
                {
                }
                field("Date borderea PVN";"Date borderea PVN")
                {
                }
                field("Date réception carte grise";"Date réception carte grise")
                {
                }
                field("Date préparation";"Date préparation")
                {
                }
                field("Date Livraison";"Date Livraison")
                {
                }
                field("Date RDV";"Date RDV")
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
        CALCFIELDS("Date borderea PVN","Date réception carte grise","Date préparation");
    end;

    trigger OnOpenPage();
    begin
        UserSetup.GET(USERID);

            FILTERGROUP(2);
        IF UserSetup."Sales Resp. Ctr. Filter"<>'' THEN
          SETRANGE("Responsibility Center",UserSetup."Sales Resp. Ctr. Filter");
          FILTERGROUP(0);
    end;

    var
        UserSetup : Record "91";
}

