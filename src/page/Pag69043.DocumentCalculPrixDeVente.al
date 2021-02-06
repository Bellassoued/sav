page 69043 "Document Calcul Prix De Vente"
{
    // version MAZDA77.2

    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Table60060;

    layout
    {
        area(content)
        {
            group("Général")
            {
                field("No.";"No.")
                {
                }
                field("Document type";"Document type")
                {
                }
                field("No. document achat";"No. document achat")
                {
                }
                field("Taux de change actuelle";"Taux de change actuelle")
                {
                }
                field("Taux de change simulation";"Taux de change simulation")
                {
                }
                field(coefficient;coefficient)
                {
                }
                field("Mode de calcul";"Mode de calcul")
                {
                }
                field("Date début";"Date début")
                {
                }
                field(Statut;Statut)
                {
                    Editable = false;
                }
                field("Filter No. Fournisseur";"Filter No. Fournisseur")
                {
                }
                field("Filter No. Document";"Filter No. Document")
                {
                }
                field("Prix de vente actuel zéro";"Prix de vente actuel zéro")
                {
                }
            }
            part(;69040)
            {
                SubPageLink = Document No.=FIELD(No.);
            }
            part(;69044)
            {
                SubPageLink = No. Document=FIELD(No.);
            }
        }
    }

    actions
    {
        area(creation)
        {
            Caption = 'Group';
            action(Initialisation)
            {
                Image = CancelLine;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    Salespricebuffer : Record "60037";
                begin
                    //ADD KK MAZDA77.2
                    TESTFIELD(Statut,Statut::Ouvert);
                    //END KK MAZDA77.2

                    //SM MAZDA77.1
                    IF (("No. document achat"='')AND("Filter No. Document"='')) OR ("Taux de change simulation" = 0) OR (coefficient = 0) OR ("Date début" = 0D) THEN
                      ERROR(TXT0005);

                    IF ("No. document achat"<>'')AND("Filter No. Document"<>'') THEN
                      ERROR(TXT0006);

                    CalcPrix("Document type","No. document achat","Taux de change simulation",coefficient,"Date début","Mode de calcul","Taux de change actuelle","Filter No. Document");
                end;
            }
            action(UpdateSalesPrice)
            {
                Caption = 'Mise à jour prix de vente';
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    //ADD KK MAZDA77.2
                    TESTFIELD(Statut,Statut::Approuvé);
                    //END KK MAZDA77.2
                    IF UserSetup.GET(USERID) AND UserSetup."Autoriser mise a jour prix" THEN
                    BEGIN
                       IF CONFIRM(TXT0001) THEN BEGIN
                          IF ("Document type"="Document type"::"Facture Achat Enregistrée") AND ("Filter No. Document"<>'') THEN BEGIN
                            RecPurchInvHeader.RESET;
                            RecPurchInvHeader.SETFILTER("No.",'%1',"Filter No. Document");
                            RecPurchInvHeader.SETFILTER("Buy-from Vendor No.",'%1',"Filter No. Fournisseur");
                            IF RecPurchInvHeader.FINDFIRST THEN
                            REPEAT
                              UpdateSalesPrice(RecPurchInvHeader."No.");
                            UNTIL RecPurchInvHeader.NEXT=0;
                          END ELSE
                            UpdateSalesPrice("No. document achat");
                       END;
                    END
                    ELSE ERROR(TXT0003);

                    //ADD KK MAZDA77.2
                    VALIDATE(Statut,Statut::Validé);
                    MODIFY;
                    CurrPage.UPDATE;
                    //END KK MAZDA77.2
                end;
            }
            action("Envoyer demande approvation")
            {
                Caption = 'Envoyer demande approvation';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    //ADD KK MAZDA77.2
                    TESTFIELD(Statut,Statut::Ouvert);
                    VALIDATE(Statut,Statut::"En cours d'approbation");
                    MODIFY;
                    CurrPage.UPDATE;
                    //END KK MAZDA77.2
                end;
            }
            action("Approver document")
            {
                Caption = 'Approver document';
                Image = Approval;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    //ADD KK MAZDA77.2
                    TESTFIELD(Statut,Statut::"En cours d'approbation");
                    VALIDATE(Statut,Statut::Approuvé);
                    MODIFY;
                    CurrPage.UPDATE;
                    //END KK MAZDA77.2
                end;
            }
            action("Réouvrir")
            {
                Caption = 'Réouvrir';

                trigger OnAction();
                begin
                    //ADD KK MAZDA77.2
                    VALIDATE(Statut,Statut::Ouvert);
                    MODIFY;
                    CurrPage.UPDATE;
                end;
            }
        }
    }

    var
        UserSetup : Record "91";
        TXT0001 : Label 'Attention ! tous les prix des articles ci-dessous seront modifié.\Voulez vous confirmez ?';
        TXT0002 : Label 'Vous devez initialiser les données avant de traiter un nouveau docuement !';
        TXT0003 : Label 'Vous n''etes pas autoriser';
        TXT0004 : Label 'Type Document et Mode Calcule incompatible';
        TXT0005 : Label 'Merci de remplir tous les champs de l''entête';
        TXT0006 : Label '"No. document achat et Filter No. document achat ne peuvent pas être remplis les deux "';
        RecPurchInvHeader : Record "122";
}

