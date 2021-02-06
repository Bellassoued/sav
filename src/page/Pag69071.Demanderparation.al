page 69071 "Demande réparation"
{
    // version MAZDA1004

    SourceTable = Table60067;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("No.";"No.")
                {
                }
                field("No Article Service";"No Article Service")
                {
                }
                field(VIN;VIN)
                {
                }
                field(Matricule;Matricule)
                {
                }
                field("Operation Type";"Operation Type")
                {
                }
                field("Model Code";"Model Code")
                {
                }
                field("Code Entretien";"Code Entretien")
                {
                }
                field(Commentaire;Commentaire)
                {
                }
                field("No Devis Client";"No Devis Client")
                {
                }
                field("Date Création";"Date Création")
                {
                }
                field("Crée Par";"Crée Par")
                {
                }
                field("Modifiée Par";"Modifiée Par")
                {
                }
                field("Description Achat";"Description Achat")
                {
                }
                field("Fiche Réception Liée";"Fiche Réception Liée")
                {
                }
                field("Commande Achat Liée";"Commande Achat Liée")
                {
                }
                field("Approbation RH";"Approbation RH")
                {
                }
                field("Date Envoie Demande";"Date Envoie Demande")
                {
                }
                field("Date Approbation";"Date Approbation")
                {
                }
                field("No Réception SAV";"No Réception SAV")
                {
                }
            }
            part(;69073)
            {
                SubPageLink = Reparation No=FIELD(No.);
                Visible = true;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Envoyer demande d'approbation")
            {
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    IF "Operation Type" = "Operation Type"::"Service Rapide" THEN BEGIN
                      TESTFIELD("Code Entretien");
                    END
                    ELSE IF "Operation Type" = "Operation Type"::"Grands Travaux" THEN BEGIN
                      LigneRepGS.RESET;
                      LigneRepGS.SETRANGE(LigneRepGS."Reparation No","No.");
                      IF LigneRepGS.ISEMPTY THEN
                        ERROR(TXT50001);
                    END
                    ELSE IF "Operation Type" = "Operation Type"::"Réparation Externe" THEN
                      TESTFIELD("No Devis Client");

                    TESTFIELD("Approbation RH","Approbation RH"::Ouvert);
                    VALIDATE("Approbation RH","Approbation RH"::"Demande Envoyé");
                    "Date Envoie Demande" := CURRENTDATETIME;
                    MODIFY;
                end;
            }
            action("Approver demande")
            {
                Image = Approval;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    UserSetup.GET(USERID);
                    IF UserSetup."Approver demande réparation" THEN BEGIN
                      TESTFIELD("Approbation RH","Approbation RH"::"Demande Envoyé");
                      VALIDATE("Approbation RH","Approbation RH"::Approuvé);
                      "Date Approbation" := CURRENTDATETIME;
                      MODIFY;
                    END ELSE
                      ERROR(TXT50000);
                end;
            }
            action("Réfuser demande")
            {
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    TESTFIELD("Approbation RH","Approbation RH"::"Demande Envoyé");
                    VALIDATE("Approbation RH","Approbation RH"::Refusé);
                    MODIFY;
                end;
            }
            action("Créer Fiche Réception SAV")
            {
                Image = CreateDocument;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    IF ("Operation Type"="Operation Type"::"Grands Travaux") OR ("Operation Type"="Operation Type"::"Service Rapide") THEN BEGIN
                      IF "No Réception SAV"='' THEN BEGIN
                        TESTFIELD("Approbation RH","Approbation RH"::Approuvé);
                        CreationFicheReception(Rec);
                      END ELSE ERROR(TXT50002);
                    END ELSE ERROR(TXT50003);
                end;
            }
            action("Imprimer demande")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    TESTFIELD("Approbation RH","Approbation RH"::Approuvé);
                    RecDemandeReparation.RESET;
                    RecDemandeReparation.SETRANGE("No.","No.");
                    REPORT.RUNMODAL(50017,TRUE,TRUE,RecDemandeReparation);
                end;
            }
        }
    }

    var
        UserSetup : Record "91";
        TXT50000 : Label 'Vous n''avez pas le droit d''approver une demande de réparation';
        LigneRepGS : Record "60068";
        TXT50001 : Label '"Veuillez Saisir les lignes réception grand service "';
        TXT50002 : Label 'Fiche de réception déja crée !';
        TXT50003 : Label 'Type d''opération doit être grand service ou service rapide';
        RecDemandeReparation : Record "60067";
}

