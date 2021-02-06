page 70021 "Line Arrivage PR"
{
    AutoSplitKey = true;
    PageType = List;
    SourceTable = Table70017;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";"Entry No.")
                {
                }
                field("Numero UT";"Numero UT")
                {
                }
                field("Date UT";"Date UT")
                {
                }
                field(Mag;Mag)
                {
                }
                field("Numero Colis";"Numero Colis")
                {
                }
                field("Poids Brut Colis";"Poids Brut Colis")
                {
                }
                field("Poids Net Colis";"Poids Net Colis")
                {
                }
                field("Dimension Colis";"Dimension Colis")
                {
                }
                field("No. Client DPR";"No. Client DPR")
                {
                }
                field("No. Facture";"No. Facture")
                {
                }
                field("Date Facture";"Date Facture")
                {
                }
                field(CR;CR)
                {
                }
                field(Type;Type)
                {
                }
                field("No. Article";"No. Article")
                {
                }
                field(Designation;Designation)
                {
                }
                field("Poid Unitaire Piece";"Poid Unitaire Piece")
                {
                }
                field("No. Commande";"No. Commande")
                {
                }
                field("Date Commande";"Date Commande")
                {
                }
                field("Prix unitaire LCY";"Prix unitaire LCY")
                {
                }
                field("Qte Servie";"Qte Servie")
                {
                }
                field("Tp commande";"Tp commande")
                {
                }
                field("No. Piece servie";"No. Piece servie")
                {
                }
                field(Rp;Rp)
                {
                }
                field(Prix;Prix)
                {
                }
                field("Commande Devise";"Commande Devise")
                {
                }
                field(D;D)
                {
                }
                field(F;F)
                {
                }
                field("No. Arrivage";"No. Arrivage")
                {
                }
                field("No. Dossier Import";"No. Dossier Import")
                {
                }
                field("No. Facture Frs Associé";"No. Facture Frs Associé")
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
        IF (CloseAction = ACTION::LookupOK) THEN
         FctCreateDetailColis;
    end;

    var
        WhseReceiptLine : Record "7317";
        WhsePostReceipt : Codeunit "5760";
        Text000 : TextConst ENU='Do you want to post the receipt?',FRA='Souhaitez-vous valider cette réception ?';
        WarehouseReceiptHeader : Record "7316";
        StockFunctions : Codeunit "50000";
        CdeNoDocument : Code[20];
        RecArrivagePR : Record "70017";
        CdeDossierImport : Code[20];

    procedure FctSetDocArrivage(PCodNoArrivage : Code[20];PCdeNoDossierImport : Code[20]);
    begin
        RecArrivagePR.SETRANGE(RecArrivagePR."No. Arrivage",PCodNoArrivage);
        IF RecArrivagePR.FINDFIRST THEN;
        CdeDossierImport := PCdeNoDossierImport;
    end;

    local procedure FctCreateDetailColis();
    var
        REcDossierImportFactFour : Record "70025";
        LRecArrivagePR : Record "70017";
        intLineNo : Integer;
    begin
        CurrPage.SETSELECTIONFILTER(Rec);
        REcDossierImportFactFour.FctSetArrivagePR(Rec);
        REcDossierImportFactFour.FctCreateInvLinesFinance(Rec,CdeDossierImport);
    end;
}

