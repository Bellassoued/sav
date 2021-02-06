page 60384 "Calcule SOQ"
{
    // version Reappro TYT V01

    PageType = List;
    SourceTable = Table50045;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Créer Commande Achat";"Créer Commande Achat")
                {
                }
                field("Item No.";"Item No.")
                {
                    StyleExpr = LineColor;
                }
                field(Description;Description)
                {
                }
                field("Product Code";"Product Code")
                {
                }
                field(MAD;MAD)
                {
                }
                field("Order Cycle";"Order Cycle")
                {
                }
                field("Lead Time";"Lead Time")
                {
                }
                field("S/S For L/T";"S/S For L/T")
                {
                }
                field("S/S For Demand";"S/S For Demand")
                {
                }
                field("On Hand";"On Hand")
                {
                }
                field("On Order";"On Order")
                {
                }
                field("B/O";"B/O")
                {
                }
                field(SOQ;SOQ)
                {
                }
                field(ICC;ICC)
                {
                }
                field("SCC Manual";"SCC Manual")
                {
                }
                field("SCC Auto";"SCC Auto")
                {
                }
                field(FC;FC)
                {
                }
                field("No Commande Achat";"No Commande Achat")
                {
                }
                field("EPM Non Reorder Code";"EPM Non Reorder Code")
                {
                }
                field("Substitution codes";"Substitution codes")
                {
                }
                field("Unit pack code";"Unit pack code")
                {
                }
                field("Not used anymore";"Not used anymore")
                {
                }
                field("Source Code";"Source Code")
                {
                }
                field("Distribution Code";"Distribution Code")
                {
                }
                field("Sub Supplier Code";"Sub Supplier Code")
                {
                }
                field("Origin Code";"Origin Code")
                {
                }
                field("Non Stock Code";"Non Stock Code")
                {
                }
                field("Max qty via VOR";"Max qty via VOR")
                {
                }
                field("Tariff code";"Tariff code")
                {
                }
                field("TMC Stock Code";"TMC Stock Code")
                {
                }
                field("Accessory Code";"Accessory Code")
                {
                }
                field("Purchase Order Type";"Purchase Order Type")
                {
                }
                field("Ancien MAD";"Ancien MAD")
                {
                }
                field("Standard Stock";"Standard Stock")
                {
                }
                field("Dern. Date Vente";"Dern. Date Vente")
                {
                }
                field("Dern. Date Achat";"Dern. Date Achat")
                {
                }
                field("Dern. Date Vente Histo.";"Dern. Date Vente Histo.")
                {
                }
                field("Dern. Date Achat Histo.";"Dern. Date Achat Histo.")
                {
                }
                field(Eur1;Eur1)
                {
                }
                field("Controle technique";"Controle technique")
                {
                }
                field("Sur Commande";"Sur Commande")
                {
                }
                field("Qty in package";"Qty in package")
                {
                }
                field("Warning Output Crietria";"Warning Output Crietria")
                {
                }
                field("Qté Réserver";"Qté Réserver")
                {
                }
                field("Short stock warning";"Short stock warning")
                {
                }
                field("Mois Saisonalite";"Mois Saisonalite")
                {
                }
                field("Mois +1 Saisonalite";"Mois +1 Saisonalite")
                {
                }
                field(modele;modele)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group()
            {
                action("Calcule Vente")
                {
                    Image = UpdateUnitCost;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        ReportReapproetrangerNAS : Report "70065";
                        "CalculeRéapproTYT" : Page "60385";
                    begin
                        Modif := FALSE;
                        CLEAR(ReportReapproetrangerNAS);
                        //ReportReapproetrangerNAS.SETTABLEVIEW(Rec);
                        ReportReapproetrangerNAS.RUN;

                        CLEAR(CalculeRéapproTYT);
                        CalculeRéapproTYT.RUN;
                        Modif := TRUE;
                    end;
                }
                action("Calcule Standard Stock")
                {
                    Image = Calculate;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        RecItem : Record "27";
                        ProgressWindow : Dialog;
                    begin

                        RecItem.RESET;
                        ProgressWindow.OPEN('Réappro article N°:  #1#######');
                        IF RecItem.FINDSET THEN
                          REPEAT
                            ProgressWindow.UPDATE(1,RecItem."No.");
                            CUSystemeReapproTYT.CalculeMADV2(RecItem."No.",BlnOptSQ);
                          UNTIL RecItem.NEXT = 0;
                        ProgressWindow.CLOSE

                        // CUSystemeReapproTYT.CalculeMADV2('4581060130',BlnOptSQ);
                        // CUSystemeReapproTYT.CalculeMADV2('521190u904',BlnOptSQ);
                    end;
                }
                action("Mise à jour SOQ")
                {
                    Image = UpdateUnitCost;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction();
                    var
                        RecItem : Record "27";
                        ProgressWindow : Dialog;
                        RecResultSOQ : Record "50045";
                    begin
                        
                        Selection := STRMENU(TXT50000,2);
                                      IF Selection = 0 THEN
                                        EXIT;
                        IF Selection = 1 THEN
                         BlnOptSQ := TRUE
                          ELSE
                           BlnOptSQ := FALSE;
                        
                        IF Selection = 3 THEN
                          BLlOptSQ3 := TRUE;
                        
                        IF Selection = 2 THEN
                          BLlOptSQ2 := TRUE;
                        
                        RecResultSOQ.RESET;
                        RecResultSOQ.DELETEALL;
                        
                        RecItem.RESET;
                        RecItem.SETRANGE("Sur commande",FALSE);
                        RecItem.SETFILTER("Vendor No.",'%1|%2|%3','FR000653','FR000024|FR000508');
                        //RecItem.SETRANGE("No.",'1610009711');
                        ProgressWindow.OPEN('Réappro article N°:  #1#######');
                        IF RecItem.FINDSET THEN
                          REPEAT
                            ProgressWindow.UPDATE(1,RecItem."No.");
                            CUSystemeReapproTYT.FctCalcAndInsertSQ(RecItem."No.",BlnOptSQ,BLlOptSQ3,BLlOptSQ2);
                          UNTIL RecItem.NEXT = 0;
                        ProgressWindow.CLOSE
                        
                        
                        
                        //CUSystemeReapproTYT.CalculeMADV2('48790F4010',FALSE);
                        /*
                        CUSystemeReapproTYT.CalculeMADV2('1350567042');
                        CUSystemeReapproTYT.CalculeMADV2('9008043037');
                        */

                    end;
                }
                action("Créer Commande Achat")
                {
                    Image = CreateInteraction;

                    trigger OnAction();
                    begin

                        CUSystemeReapproTYT.FctCreateautoCmdAchat();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        LineColor:= '';
        IF "Warning Output Crietria" < 0  THEN
          LineColor := 'Unfavorable'
          ELSE
            LineColor := '';
    end;

    var
        Modif : Boolean;
        CUSystemeReapproTYT : Codeunit "70009";
        RecParametreMAD : Record "50026";
        Selection : Integer;
        TXT50000 : Label 'SQ > 0, SQ , SQ And SCC Manual And Auto';
        BlnOptSQ : Boolean;
        BLlOptSQ3 : Boolean;
        LineColor : Text;
        BLlOptSQ2 : Boolean;
}

