page 60310 "List Article Ignorer Arrivage"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Table70023;
    SourceTableView = WHERE(Traiter=FILTER(Yes),
                            Statut=FILTER(Ignorer Écart));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Traiter;Traiter)
                {
                }
                field("No. Arrivage PR";"No. Arrivage PR")
                {
                }
                field("No. Dossier Import";"No. Dossier Import")
                {
                }
                field("Item No";"Item No")
                {
                }
                field("Qty Théorique";"Qty Théorique")
                {
                }
                field("Qty Physique";"Qty Physique")
                {
                }
                field("Qty Ecrat";"Qty Ecrat")
                {
                }
                field(Statut;Statut)
                {
                    Editable = true;
                }
            }
        }
    }

    actions
    {
    }

    var
        RecTransferHeader : Record "5740";
        RecTransferLine : Record "5741";
        RecPurchasesPayablesSetup : Record "312";
        LineNo : Integer;
        RecItem : Record "27";
        RecPurchaseHeader : Record "38";
        RecPurchaseLine : Record "39";
        ProgressWindow : Dialog;
        RecPurchaseHeaderCreated : Record "38";
        RecTransferHeaderCreated : Record "5740";
        RecEcartArrivagePR : Record "70023";
        RecPostedWhseReceiptHeader : Record "7318";
}

