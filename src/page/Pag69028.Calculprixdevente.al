page 69028 "Calcul prix de vente"
{
    // version MAZDA77,MAZDA77.1

    DelayedInsert = true;
    PageType = List;
    SourceTable = Table60037;

    layout
    {
        area(content)
        {
            group(Filtre)
            {
                Caption = 'Filtre';
                field("Type Document";TypeDocOption)
                {

                    trigger OnValidate();
                    begin
                        //SM MAZDA77.1
                        IF (ModeCalcul = ModeCalcul::"Prix de Vente = Coût Prévu * MARGE") AND (TypeDocOption <> TypeDocOption::"Réception Achat Enregistrée") THEN
                          ERROR(TXT0004);
                        IF (ModeCalcul = ModeCalcul::"Prix de Vente = CM Prévu * MARGE") AND (TypeDocOption <> TypeDocOption::"Réception Achat Enregistrée") THEN
                          ERROR(TXT0004);
                    end;
                }
                field("N° Document Achat";NFactAchat)
                {
                    Caption = 'N° Document Achat';

                    trigger OnValidate();
                    var
                        RecPurchaseHeader : Record "38";
                        RecPurchRcptHeader : Record "120";
                        PuchaseInvHeader : Record "122";
                        RecTransportMethod : Record "259";
                        RecPurchaseLine : Record "39";
                        "RecMargeParGroupePièce" : Record "60052";
                        RecPurchRcptLine : Record "121";
                        RecPuchaseInvLine : Record "123";
                        RecItem : Record "27";
                    begin
                        CheckFactAchat(TypeDocOption,NFactAchat);
                        RecSalesReceivablesSetup.GET;
                        //SM MAZDA77.1
                        RecMargeParGroupePièce.DELETEALL;


                        CASE TypeDocOption OF
                          0  :BEGIN
                                IF RecPurchaseHeader.GET(RecPurchaseHeader."Document Type"::Order,NFactAchat) THEN BEGIN
                                   IF RecPurchaseHeader."Currency Factor" <> 0 THEN BEGIN
                                     TauxDechangeActuelle := 1/RecPurchaseHeader."Currency Factor";
                                     //IF RecTransportMethod.GET(RecPurchaseHeader."Transport Method") THEN
                                     //  ModeTransport := RecTransportMethod.Description;
                                     //IF RecPurchaseHeader."Order Type" =  RecPurchaseHeader."Order Type"::PR THEN BEGIN
                                     // IF RecPurchaseHeader."Transport Method" = '1' THEN
                                     // ELSE IF RecPurchaseHeader."Transport Method" = '4' THEN
                                     //   Coef := RecSalesReceivablesSetup."Coefficient Voie Aérienne PR";
                                   END;
                                   Coef := RecSalesReceivablesSetup."Coefficient Import";

                                   //SM MAZDA77.1
                                   //GET RecPurchaseLine
                                   CLEAR(RecPurchaseLine);
                                   RecPurchaseLine.SETRANGE("Document No.",NFactAchat);
                                   RecPurchaseLine.SETRANGE(Type,RecPurchaseLine.Type::Item);
                                   IF RecPurchaseLine.FINDFIRST THEN
                                   REPEAT
                                     RecItem.GET(RecPurchaseLine."No.");
                                     IF NOT RecMargeParGroupePièce.GET(RecItem."Product Group Code") THEN BEGIN
                                       RecMargeParGroupePièce.INIT;
                                       RecMargeParGroupePièce."Posting Group" := RecItem."Product Group Code";
                                       RecMargeParGroupePièce.INSERT;
                                     END;
                                   UNTIL RecPurchaseLine.NEXT = 0;
                                   //END SM MAZDA77.1

                                END;
                              END;
                          1  :BEGIN
                                IF RecPurchRcptHeader.GET(NFactAchat) THEN BEGIN
                                   IF RecPurchRcptHeader."Currency Factor" <> 0 THEN BEGIN
                                     TauxDechangeActuelle := 1/RecPurchRcptHeader."Currency Factor";
                                     //IF RecTransportMethod.GET(RecPurchaseHeader."Transport Method") THEN
                                     //  ModeTransport := RecTransportMethod.Description;
                                     //IF RecPurchRcptHeader."Order Type" = RecPurchRcptHeader."Order Type"::PR THEN BEGIN
                                     // IF RecPurchRcptHeader."Transport Method" = '1' THEN
                                     // ELSE IF RecPurchRcptHeader."Transport Method" = '4' THEN
                                     //  Coef := RecSalesReceivablesSetup."Coefficient Voie Aérienne PR";
                                     END;
                                     Coef := RecSalesReceivablesSetup."Coefficient Import";
                                     //SM MAZDA77.1
                                     //GET RecPurchRcptLine
                                     CLEAR(RecPurchRcptLine);
                                     RecPurchRcptLine.SETRANGE("Document No.",NFactAchat);
                                     RecPurchRcptLine.SETRANGE(Type,RecPurchRcptLine.Type::Item);
                                     IF RecPurchRcptLine.FINDFIRST THEN
                                     REPEAT
                                      RecItem.GET(RecPurchRcptLine."No.");
                                      IF NOT RecMargeParGroupePièce.GET(RecItem."Product Group Code") THEN BEGIN
                                        RecMargeParGroupePièce.INIT;
                                        RecMargeParGroupePièce."Posting Group" := RecItem."Product Group Code";
                                        RecMargeParGroupePièce.INSERT;
                                      END;
                                     UNTIL RecPurchRcptLine.NEXT = 0;
                                     //END SM MAZDA77.1
                                END;
                              END;
                          2  :BEGIN
                                IF PuchaseInvHeader.GET(NFactAchat) THEN BEGIN
                                   IF PuchaseInvHeader."Currency Factor" <> 0 THEN BEGIN
                                     TauxDechangeActuelle := 1/PuchaseInvHeader."Currency Factor";
                                     //IF RecTransportMethod.GET(RecPurchaseHeader."Transport Method") THEN
                                     //  ModeTransport := RecTransportMethod.Description;
                                     //IF PuchaseInvHeader."Order Type" = PuchaseInvHeader."Order Type"::PR THEN BEGIN
                                     //  IF PuchaseInvHeader."Transport Method" = '1' THEN

                                     //  ELSE IF PuchaseInvHeader."Transport Method" = '4' THEN
                                     //    Coef := RecSalesReceivablesSetup."Coefficient Voie Aérienne PR";
                                     //END;

                                   END;
                                   Coef := RecSalesReceivablesSetup."Coefficient Import";
                                   //SM MAZDA77.1
                                  //GET PuchaseInvLine
                                  CLEAR(RecPuchaseInvLine);
                                  RecPuchaseInvLine.SETRANGE("Document No.",NFactAchat);
                                  RecPuchaseInvLine.SETRANGE(Type,RecPuchaseInvLine.Type::Item);
                                  IF RecPuchaseInvLine.FINDFIRST THEN
                                  REPEAT
                                    RecItem.GET(RecPuchaseInvLine."No.");
                                    IF NOT RecMargeParGroupePièce.GET(RecItem."Product Group Code") THEN BEGIN
                                      RecMargeParGroupePièce.INIT;
                                      RecMargeParGroupePièce."Posting Group" := RecItem."Product Group Code";
                                      RecMargeParGroupePièce.INSERT;
                                    END;
                                  UNTIL RecPuchaseInvLine.NEXT = 0;
                                   //END SM  MAZDA77.1
                                END;
                              END;
                        END;
                    end;
                }
                field("Taux De change Actuelle";TauxDechangeActuelle)
                {
                    DecimalPlaces = 1:6;
                    Editable = false;
                }
                field("Taux De change Simulation";TauxDechangeSimulation)
                {
                    DecimalPlaces = 1:6;
                }
                field("Mode Transport";ModeTransport)
                {
                    Editable = false;
                    Visible = false;
                }
                field(Coef;Coef)
                {
                    Caption = 'Coefficient';
                    DecimalPlaces = 1:6;
                    Editable = true;
                }
                field("Marge Commerciale";MargeC)
                {
                    Visible = false;
                }
                field(DateDebut;DateDebut)
                {
                    Caption = 'Date Debut';
                }
                field("Mode Calcule";ModeCalcul)
                {

                    trigger OnValidate();
                    begin
                        //SM MAZDA77.1
                        IF (ModeCalcul = ModeCalcul::"Prix de Vente = Coût Prévu * MARGE") AND (TypeDocOption <> TypeDocOption::"Réception Achat Enregistrée") THEN
                          ERROR(TXT0004);
                        IF (ModeCalcul = ModeCalcul::"Prix de Vente = CM Prévu * MARGE") AND (TypeDocOption <> TypeDocOption::"Réception Achat Enregistrée") THEN
                          ERROR(TXT0004);
                    end;
                }
            }
            part(;69040)
            {
            }
            repeater(Group)
            {
                field("Item no";"Item no")
                {
                    Enabled = false;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field("Product Group Code";"Product Group Code")
                {
                    Editable = false;
                }
                field("Model Code";"Model Code")
                {
                    Editable = false;
                }
                field("Unit cost Curr Inv";"Unit cost Curr Inv")
                {
                }
                field("Unit cost Curr Inv LCY";"Unit cost Curr Inv LCY")
                {
                }
                field("Last Direct Cost";"Last Direct Cost")
                {
                }
                field("Unit Cost";"Unit Cost")
                {
                    Caption = 'Coût Moyen Actuel';
                    StyleExpr = StyleAC;
                }
                field("CM Sécurité de Change";"CM Sécurité de Change")
                {
                    Style = Favorable;
                    StyleExpr = TRUE;
                }
                field("Unit cost Curr Inv Sim LCY";"Unit cost Curr Inv Sim LCY")
                {
                }
                field("Coefficient vente";"Coefficient vente")
                {
                    DecimalPlaces = 1:6;
                    Editable = false;
                    Visible = false;
                }
                field("Coût Prévu";"Coût Prévu")
                {
                    Editable = false;
                    StyleExpr = StylePrevuCost;
                }
                field("CM Prévu";"CM Prévu")
                {
                    Editable = false;
                    StyleExpr = StylePrevuAC;
                }
                field("Unit Cost Calc";"Unit Cost Calc")
                {
                    Caption = 'CM Calculé';
                    StyleExpr = StyleSimulatedCost;
                }
                field("CM Simulé";"CM Simulé")
                {
                    Editable = false;
                    StyleExpr = StyleSimulatedAC;
                }
                field(Marge;Marge)
                {
                }
                field("New Sales Price";"New Sales Price")
                {
                }
                field("Actual Unit Price";"Actual Unit Price")
                {
                }
                field("Différence Prix";"Différence Prix")
                {
                    Editable = false;
                }
                field("Start Date";"Start Date")
                {
                }
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
                    //SM MAZDA77.1
                    IF (NFactAchat = '') OR (TauxDechangeSimulation = 0) OR (Coef = 0) OR (DateDebut = 0D) THEN
                      ERROR(TXT0005);
                    CalcPrix(TypeDocOption,NFactAchat,TauxDechangeSimulation,Coef,DateDebut,ModeCalcul,TauxDechangeActuelle);
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
                    IF UserSetup.GET(USERID) AND UserSetup."Autoriser mise a jour prix" THEN
                    BEGIN
                       IF CONFIRM(TXT0001) THEN
                          UpdateSalesPrice("Doc no");
                    END
                    ELSE ERROR(TXT0003);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        //SM MAZDA77.1
        UpdateStyle;
    end;

    trigger OnAfterGetRecord();
    begin
        //SM MAZDA77.1
        UpdateStyle;
    end;

    trigger OnOpenPage();
    begin
        IF UserSetup.GET(USERID) AND NOT UserSetup."Autoriser mise a jour prix" THEN
        BEGIN
          FILTERGROUP(0);
          SETRANGE("User Id",USERID);
          FILTERGROUP(2);
        END;

        TypeDocOption :=0;
        ModeCalcul    :=0;
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    var
        "RecMargeParGroupePièce" : Record "60052";
    begin

        DELETEALL;
        //SM MAZDA77.1
        RecMargeParGroupePièce.DELETEALL;
    end;

    var
        NFactAchat : Code[30];
        TauxDechangeActuelle : Decimal;
        TauxDechangeSimulation : Decimal;
        Coef : Decimal;
        TXT0001 : Label 'Attention ! tous les prix des articles ci-dessous seront modifié.\Voulez vous confirmez ?';
        TXT0002 : Label 'Vous devez initialiser les données avant de traiter un nouveau docuement !';
        MargeC : Decimal;
        UserSetup : Record "91";
        TXT0003 : Label 'Vous n''etes pas autoriser';
        DateDebut : Date;
        TypeDocOption : Option "Commande Achat","Réception Achat Enregistrée","Facture Achat Enregistrée";
        RecSalesReceivablesSetup : Record "311";
        ModeTransport : Text[50];
        ModeCalcul : Option "Prix de Vente = Coût Simulé * MARGE","Prix de Vente = CM Simulé * MARGE","Prix de Vente = Coût Prévu * MARGE","Prix de Vente = CM Prévu * MARGE","Prix de Vente = CM  Réel * MARGE";
        TXT0004 : Label 'Type Document et Mode Calcule incompatible';
        TXT0005 : Label 'Merci de remplir tous les champs de l''entête';
        StylePrevuCost : Text;
        StylePrevuAC : Text;
        StyleSimulatedCost : Text;
        StyleSimulatedAC : Text;
        StyleAC : Text;

    procedure UpdateStyle();
    begin
        //SM MAZDA77.1
        CASE ModeCalcul OF
          ModeCalcul::"Prix de Vente = Coût Simulé * MARGE" :BEGIN
                                                               StyleSimulatedCost:= 'Attention';
                                                               StyleSimulatedAC  := 'Standard' ;
                                                               StylePrevuAC      := 'Standard' ;
                                                               StylePrevuCost    := 'Standard' ;
                                                               StyleAC           := 'Standard' ;
                                                             END;
          ModeCalcul::"Prix de Vente = CM Simulé * MARGE" :BEGIN
                                                               StyleSimulatedCost:= 'Standard';
                                                               StyleSimulatedAC  := 'Attention' ;
                                                               StylePrevuAC      := 'Standard' ;
                                                               StylePrevuCost    := 'Standard' ;
                                                               StyleAC           := 'Standard' ;
                                                             END;
          ModeCalcul::"Prix de Vente = Coût Prévu * MARGE" :BEGIN
                                                               StyleSimulatedCost:= 'Standard';
                                                               StyleSimulatedAC  := 'Standard' ;
                                                               StylePrevuAC      := 'Standard' ;
                                                               StylePrevuCost    := 'Attention' ;
                                                               StyleAC           := 'Standard' ;
                                                             END;
          ModeCalcul::"Prix de Vente = CM Prévu * MARGE" :BEGIN
                                                               StyleSimulatedCost:= 'Standard';
                                                               StyleSimulatedAC  := 'Standard' ;
                                                               StylePrevuAC      := 'Attention' ;
                                                               StylePrevuCost    := 'Standard' ;
                                                               StyleAC           := 'Standard' ;
                                                             END;
          ModeCalcul::"Prix de Vente = CM  Réel * MARGE" :BEGIN
                                                               StyleSimulatedCost:= 'Standard';
                                                               StyleSimulatedAC  := 'Standard' ;
                                                               StylePrevuAC      := 'Standard' ;
                                                               StylePrevuCost    := 'Standard' ;
                                                               StyleAC           := 'Attention' ;
                                                             END;
        END;
    end;
}

