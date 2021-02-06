page 69044 "Ligne Sales Price Buffer"
{
    // version MAZDA77.2

    PageType = ListPart;
    SourceTable = Table60037;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Doc no";"Doc no")
                {
                }
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
    }

    trigger OnAfterGetCurrRecord();
    begin
        //ADD KK MAZDA77.2
        // UpdateStyle;
        //ADD KK MAZDA77.2
    end;

    trigger OnAfterGetRecord();
    begin
        //ADD KK MAZDA77.2
        // UpdateStyle;
        //ADD KK MAZDA77.2
    end;

    var
        "EntêteCalculPrixVente" : Record "60060";
        StylePrevuCost : Text;
        StylePrevuAC : Text;
        StyleSimulatedCost : Text;
        StyleSimulatedAC : Text;
        StyleAC : Text;

    procedure UpdateStyle();
    begin
        //ADD KK MAZDA77.2
        EntêteCalculPrixVente.GET("No. Document");
        //END KK MAZDA77.2
        //SM MAZDA77.1
        CASE EntêteCalculPrixVente."Mode de calcul" OF
          EntêteCalculPrixVente."Mode de calcul"::"Prix de Vente = Coût Simulé * MARGE" :BEGIN
                                                               StyleSimulatedCost:= 'Attention';
                                                               StyleSimulatedAC  := 'Standard' ;
                                                               StylePrevuAC      := 'Standard' ;
                                                               StylePrevuCost    := 'Standard' ;
                                                               StyleAC           := 'Standard' ;
                                                             END;
          EntêteCalculPrixVente."Mode de calcul"::"Prix de Vente = CM Simulé * MARGE" :BEGIN
                                                               StyleSimulatedCost:= 'Standard';
                                                               StyleSimulatedAC  := 'Attention' ;
                                                               StylePrevuAC      := 'Standard' ;
                                                               StylePrevuCost    := 'Standard' ;
                                                               StyleAC           := 'Standard' ;
                                                             END;
          EntêteCalculPrixVente."Mode de calcul"::"Prix de Vente = Coût Prévu * MARGE" :BEGIN
                                                               StyleSimulatedCost:= 'Standard';
                                                               StyleSimulatedAC  := 'Standard' ;
                                                               StylePrevuAC      := 'Standard' ;
                                                               StylePrevuCost    := 'Attention' ;
                                                               StyleAC           := 'Standard' ;
                                                             END;
          EntêteCalculPrixVente."Mode de calcul"::"Prix de Vente = CM Prévu * MARGE" :BEGIN
                                                               StyleSimulatedCost:= 'Standard';
                                                               StyleSimulatedAC  := 'Standard' ;
                                                               StylePrevuAC      := 'Attention' ;
                                                               StylePrevuCost    := 'Standard' ;
                                                               StyleAC           := 'Standard' ;
                                                             END;
          EntêteCalculPrixVente."Mode de calcul"::"Prix de Vente = CM  Réel * MARGE" :BEGIN
                                                               StyleSimulatedCost:= 'Standard';
                                                               StyleSimulatedAC  := 'Standard' ;
                                                               StylePrevuAC      := 'Standard' ;
                                                               StylePrevuCost    := 'Standard' ;
                                                               StyleAC           := 'Attention' ;
                                                             END;
        END;
    end;
}

