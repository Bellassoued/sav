page 50146 "Affectation Dossier/LC PR"
{
    PageType = List;
    SourceTable = Table50103;

    layout
    {
        area(content)
        {
            group("Total LC")
            {
                Caption = 'Total LC';
                field("Total volume";TotalVolume)
                {
                    Editable = false;
                }
                field("Total poids brut";TotalPoid)
                {
                    Editable = false;
                }
                field("Nbre Facture";NbrFact)
                {
                    Editable = false;
                }
                field("Nbre Colis";NbrColis)
                {
                    Editable = false;
                }
                field("Total en devise";TotalDevise)
                {
                    Caption = 'Total en devise';
                    Editable = false;
                }
                field("Total DS";TotalTND)
                {
                    Editable = false;
                }
            }
            repeater("Détails")
            {
                field("No. LC PR";"No. LC PR")
                {
                    Editable = false;
                }
                field("No. Dossier";"No. Dossier")
                {
                }
                field("Total Volume";"Total Volume")
                {
                    Editable = false;
                }
                field("Total Poid Brut";"Total Poid Brut")
                {
                    Editable = false;
                }
                field("Nbr. Facture";"Nbr. Facture")
                {
                    Editable = false;
                }
                field("Total Nbr. Colis";"Total Nbr. Colis")
                {
                    Editable = false;
                }
                field("Montant Total Devis";"Montant Total Devis")
                {
                    Editable = false;
                }
                field("Montant Total TND";"Montant Total TND")
                {
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    begin
        CalcTotalLC("No. LC PR");
    end;

    trigger OnAfterGetRecord();
    begin
        CalcTotalLC("No. LC PR");
    end;

    trigger OnOpenPage();
    begin
        CalcTotalLC("No. LC PR");
    end;

    var
        TotalVolume : Decimal;
        TotalPoid : Decimal;
        NbrFact : Integer;
        NbrColis : Integer;
        TotalDevise : Decimal;
        TotalTND : Decimal;

    local procedure CalcTotalLC(NoLC : Code[20]);
    var
        AffectationLCDossierPR : Record "50103";
    begin
        AffectationLCDossierPR.RESET;
        AffectationLCDossierPR.SETRANGE("No. LC PR",NoLC);
        IF AffectationLCDossierPR.FINDSET THEN
          BEGIN
            TotalVolume := 0;
            TotalPoid   := 0;
            NbrFact     := 0;
            NbrColis    := 0;
            TotalDevise := 0;
            TotalTND    := 0;
            REPEAT
              AffectationLCDossierPR.CALCFIELDS("Total Volume","Total Poid Brut","Nbr. Facture","Total Nbr. Colis","Montant Total Devis","Montant Total TND");
              TotalVolume += AffectationLCDossierPR."Total Volume";
              TotalPoid   += AffectationLCDossierPR."Total Poid Brut";
              NbrFact     += AffectationLCDossierPR."Nbr. Facture";
              NbrColis    += AffectationLCDossierPR."Total Nbr. Colis";
              TotalDevise += AffectationLCDossierPR."Montant Total Devis";
              TotalTND    += AffectationLCDossierPR."Montant Total TND";
            UNTIL AffectationLCDossierPR.NEXT=0;
            CurrPage.UPDATE(FALSE);
          END;
    end;
}

