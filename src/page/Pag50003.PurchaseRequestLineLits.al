page 50003 "Purchase Request Line Lits"
{
    // version DEM ACHAT,CT16V001

    // //>>ALM1.00  TRIUM-MOY  08/09/2008
    // Immobilisation - Affichage de la liste des budget d'investissement
    // //<<ALM1.00

    CaptionML = ENU='Investment Budgets',
                FRA='Budgets d''investissement';
    Editable = true;
    PageType = List;
    SourceTable = 50008;

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Request No.";"Request No.")
                {
                }
                field(Type;Type)
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field("Approved quantity";"Approved quantity")
                {
                }
                field("Vendor No.";"Vendor No.")
                {
                }
                field("Vendor Name";"Vendor Name")
                {
                }
                field(Montant;Montant)
                {
                }
                field("A imprimer";"A imprimer")
                {
                }
                field("Request Date";"Request Date")
                {
                }
                field("Approvée par la D.C.G";"Approvée par la D.C.G")
                {
                }
                field("Order No.";"Order No.")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Calculate Payment")
            {
                CaptionML = ENU='Calculate Payment',
                            FRA='Calculer le paiement';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    RecLDoc : Record "265" temporary;
                begin
                     RecLDoc.DELETEALL;
                     IF RecGFABudget.FINDFIRST THEN  BEGIN
                    REPEAT
                      DecGAmount:=0;
                      RecGentry.RESET;
                      RecGentry.SETCURRENTKEY("N° budget d'investissement");
                     RecGentry.SETRANGE(RecGentry."N° budget d'investissement",RecGFABudget."No Budget");
                     IF  RecGentry.FINDFIRST THEN
                     REPEAT
                        RecGLedgerVendor.RESET;
                        RecGLedgerVendor.SETCURRENTKEY("Vendor No.","Document No.","Posting Date");
                       RecGLedgerVendor.SETRANGE(RecGLedgerVendor."Document No.",RecGentry."Document No.");
                       RecGLedgerVendor.SETRANGE(RecGLedgerVendor."Posting Date",RecGentry."Posting Date");
                       //RecGLedgerVendor.SETRANGE(RecGLedgerVendor."Vendor No.",RecGentry."Source No.");
                       IF RecGLedgerVendor.FINDFIRST THEN REPEAT
                        IF NOT RecLDoc.GET(RecGLedgerVendor."Entry No.") THEN BEGIN

                         RecGLedgerVendor.CALCFIELDS(RecGLedgerVendor."Remaining Amt. (LCY)",RecGLedgerVendor."Original Amt. (LCY)");
                         DecGAmount:=DecGAmount+(RecGLedgerVendor."Original Amt. (LCY)"-RecGLedgerVendor."Remaining Amt. (LCY)");
                         RecLDoc.INIT;
                         RecLDoc."Entry No.":=RecGLedgerVendor."Entry No.";
                         RecLDoc.INSERT;
                       END;
                       UNTIL RecGLedgerVendor.NEXT=0;
                     UNTIL RecGentry.NEXT=0;
                     RecGFABudget."Payment Amount":=-DecGAmount;
                    RecGFABudget.CALCFIELDS("Montant en commande","Montant comptabilisé","Receive not posted");

                    RecGFABudget."Total Amount":=RecGFABudget."Montant en commande"+RecGFABudget."Montant comptabilisé"+
                    RecGFABudget."Receive not posted"+RecGFABudget."Acquisitions since Jan 1st"+
                    RecGFABudget."PO issued/received Apr 30th";



                     RecGFABudget.MODIFY;
                    UNTIL RecGFABudget.NEXT=0;
                    END;
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        IF CurrPage.LOOKUPMODE THEN
          CurrPage.EDITABLE := FALSE;
    end;

    var
        RecGLedgerVendor : Record "25";
        RecGFABudget : Record "50001";
        RecGentry : Record "17";
        DecGAmount : Decimal;
}

