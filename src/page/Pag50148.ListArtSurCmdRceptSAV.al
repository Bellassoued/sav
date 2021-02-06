page 50148 "List Art Sur Cmd Récept. SAV"
{
    PageType = List;
    SourceTable = Table60094;
    SourceTableView = WHERE(Type Commande=FILTER(Service),
                            Date Arrivage magasin=FILTER(<>''),
                            Cmd Vente SAV Livree non Fact=FILTER(No));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Type Commande";"Type Commande")
                {
                }
                field("No. Document";"No. Document")
                {
                }
                field(Client;Client)
                {
                }
                field("Nom Client";"Nom Client")
                {
                }
                field("Article No.";"Article No.")
                {
                }
                field(Qté;Qté)
                {
                }
                field(Description;Description)
                {
                }
                field("No Ligne Cmd Vente";"No Ligne Cmd Vente")
                {
                }
                field("Processed Item No";"Processed Item No")
                {
                }
                field("Centre de gestion Vente";"Centre de gestion Vente")
                {
                }
                field("Sur Commande";"Sur Commande")
                {
                }
                field("Date Arrivage magasin";"Date Arrivage magasin")
                {
                }
                field("Cmd Vente PR Livree non Fact";"Cmd Vente PR Livree non Fact")
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
        RecGUserSetup.GET(USERID);
        IF NOT RecGUserSetup."Service Compta." THEN
         BEGIN
              IF UserMgt.GetServiceFilter <> '' THEN BEGIN
                FILTERGROUP(2);
                SETRANGE("Centre de gestion Vente",UserMgt.GetServiceFilter);
                FILTERGROUP(0);
              END;
        END;
    end;

    var
        RecGUserSetup : Record "91";
        UserMgt : Codeunit "5700";
}

