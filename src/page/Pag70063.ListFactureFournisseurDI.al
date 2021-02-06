page 70063 "List Facture Fournisseur DI"
{
    AutoSplitKey = true;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = Table70025;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No";"Line No")
                {
                }
                field("No. Dossier Import";"No. Dossier Import")
                {
                }
                field("No. Facture Fournisseur";"No. Facture Fournisseur")
                {
                }
                field("No. Arrivage PR";"No. Arrivage PR")
                {
                }
                field("Nbre. Colis Par Facture";"Nbre. Colis Par Facture")
                {
                }
                field("Date Facture";"Date Facture")
                {
                }
                field("Montant Facture";"Montant Facture")
                {
                }
                field("Shipment date";"Shipment date")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        //>>HR 23/10/16
        IF CloseAction IN [ACTION::OK,ACTION::LookupOK] THEN
         CreateDetailFactPrFinance;
    end;

    var
        RecLigneFacturesPRClois : Record "70061";
        RecEnteteFacturePRColis : Record "70060";

    local procedure CreateDetailFactPrFinance();
    begin
        //HR 23/10/16

        CurrPage.SETSELECTIONFILTER(Rec);
        RecLigneFacturesPRClois.SetFactPrFinance(RecEnteteFacturePRColis);
        RecLigneFacturesPRClois.FctCreateInvLinesFinance(Rec);
    end;

    procedure SetDossFin(EnteteFacturePRColis : Record "70060");
    begin
        RecEnteteFacturePRColis.GET(EnteteFacturePRColis."No.");
    end;
}

