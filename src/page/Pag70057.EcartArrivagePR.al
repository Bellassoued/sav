page 70057 "Ecart Arrivage PR"
{
    PageType = List;
    SourceTable = Table70023;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("A Traiter";"A Traiter")
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
                field("Qty Traiter";"Qty Traiter")
                {
                }
                field(Statut;Statut)
                {
                    Editable = true;
                }
                field("No. Commande";"No. Commande")
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Traiter)
            {
                Image = PostponedInteractions;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                var
                    RecEcartArrivagePR : Record "70023";
                begin
                    RecPostedWhseReceiptHeader.RESET;
                    RecPostedWhseReceiptHeader.SETRANGE("No. Dossier Imprort","No. Dossier Import");
                    IF RecPostedWhseReceiptHeader.FINDSET THEN
                      REPEAT
                        IF NOT RecPostedWhseReceiptHeader.Cloturer THEN
                          ERROR('des Colis non cloturer !');
                      UNTIL RecPostedWhseReceiptHeader.NEXT = 0;
                    //create Commande Achat
                    /*
                    RecPurchaseHeaderCreated.RESET;
                    RecPurchaseHeaderCreated.SETRANGE("No. Arrivage PR","No. Dossier Import");
                    RecPurchaseHeaderCreated.SETRANGE("Created from Arrivage PR", TRUE);
                    RecPurchaseHeaderCreated.SETRANGE("No Sequence Ecart Arrivage PR","entry No.");
                    IF RecPurchaseHeaderCreated.FINDFIRST THEN
                      ERROR('Commande Achat %1 etait crée',RecPurchaseHeaderCreated."No.");
                    */
                    ProgressWindow.OPEN('Créer commande achat #1#######');
                    RecPurchasesPayablesSetup.GET;
                    RecPurchasesPayablesSetup.TESTFIELD("Default PR Vendor");
                    RecEcartArrivagePR.RESET;
                    RecEcartArrivagePR.SETRANGE("No. Dossier Import","No. Dossier Import");
                    RecEcartArrivagePR.SETRANGE("A Traiter",TRUE);
                    RecEcartArrivagePR.SETRANGE("No. Commande",'');
                    RecEcartArrivagePR.SETRANGE(Statut,RecEcartArrivagePR.Statut::"Créer Commande Achat");
                    IF RecEcartArrivagePR.FINDFIRST THEN
                      BEGIN
                        RecPurchaseHeader.INIT;
                        RecPurchaseHeader."Document Type" := RecPurchaseHeader."Document Type"::Order;
                        RecPurchaseHeader."No." := '';
                        RecPurchaseHeader.VALIDATE("Buy-from Vendor No.",RecPurchasesPayablesSetup."Default PR Vendor");
                        RecPurchaseHeader.INSERT(TRUE);
                    
                        RecPurchaseHeader."Posting Date" := WORKDATE;
                        RecPurchaseHeader."Order Type" := RecPurchaseHeader."Order Type"::PR;
                        RecPurchaseHeader."No. Arrivage PR":="No. Dossier Import";
                        RecPurchaseHeader."No Sequence Ecart Arrivage PR" := "entry No.";
                        RecPurchaseHeader."Created from Arrivage PR":= TRUE;
                        RecPurchaseHeader.VALIDATE("Location Code" ,RecPurchasesPayablesSetup."Magasin Destination Arrivage");
                        RecPurchaseHeader.MODIFY;
                    
                        LineNo:=10000;
                        RecEcartArrivagePR.RESET;
                        RecEcartArrivagePR.SETRANGE("No. Dossier Import","No. Dossier Import");
                        RecEcartArrivagePR.SETRANGE("A Traiter",TRUE);
                        RecEcartArrivagePR.SETRANGE("No. Commande",'');
                        RecEcartArrivagePR.SETRANGE(Statut,RecEcartArrivagePR.Statut::"Créer Commande Achat");
                        IF RecEcartArrivagePR.FINDSET THEN
                          REPEAT
                              ProgressWindow.UPDATE(1,RecPurchaseHeader."No.");
                              RecPurchaseLine."Document Type" := RecPurchaseLine."Document Type"::Order;
                              RecPurchaseLine."Document No." := RecPurchaseHeader."No.";
                              RecPurchaseLine."Line No."      := LineNo;
                              RecPurchaseLine.INSERT;
                              RecPurchaseLine.VALIDATE("Buy-from Vendor No.",RecPurchasesPayablesSetup."Default PR Vendor");
                              RecPurchaseLine.Type:= RecPurchaseLine.Type::Item;
                    
                              RecPurchaseLine.VALIDATE("No.", RecEcartArrivagePR."Item No");
                              RecPurchaseLine.VALIDATE("Location Code",RecPurchasesPayablesSetup."Magasin Destination Arrivage");
                              RecPurchaseLine.VALIDATE(Quantity,ABS(RecEcartArrivagePR."Qty Ecrat"));
                              RecPurchaseLine.VALIDATE("Line Discount %", 100);
                              RecPurchaseLine.MODIFY;
                    
                              LineNo+=10000;
                              RecEcartArrivagePR."No. Commande" := RecPurchaseLine."Document No.";
                              RecEcartArrivagePR."Qty Traiter" := ABS(RecEcartArrivagePR."Qty Ecrat");
                              RecEcartArrivagePR."A Traiter":=FALSE;
                              RecEcartArrivagePR.Traiter:=TRUE;
                              RecEcartArrivagePR.MODIFY;
                          UNTIL RecEcartArrivagePR.NEXT = 0;
                      END;
                    ProgressWindow.CLOSE;
                    /*
                    RecTransferHeaderCreated.RESET;
                    RecTransferHeaderCreated.SETRANGE("No. Arrivage PR auto","No. Arrivage PR");
                    RecTransferHeaderCreated.SETRANGE("Created from Arrivage PR", TRUE);
                    IF RecTransferHeaderCreated.FINDFIRST THEN
                      ERROR('Commande Achat %1 etait crée',RecTransferHeaderCreated."No.");
                    */
                    ProgressWindow.OPEN('Créer Order de transfer #1#######');
                    // create transfer
                    RecPurchasesPayablesSetup.GET;
                    RecPurchasesPayablesSetup.TESTFIELD("Magasin Destination Arrivage");
                    RecPurchasesPayablesSetup.TESTFIELD("Magazin Manquant");
                    RecEcartArrivagePR.RESET;
                    RecEcartArrivagePR.SETRANGE("No. Dossier Import","No. Dossier Import");
                    RecEcartArrivagePR.SETRANGE("A Traiter",TRUE);
                    RecEcartArrivagePR.SETRANGE("No. Commande",'');
                    RecEcartArrivagePR.SETRANGE(Statut,RecEcartArrivagePR.Statut::"Créer Transfert");
                    IF RecEcartArrivagePR.FINDFIRST THEN
                      BEGIN
                          RecTransferHeader.RESET;
                          RecTransferHeader.INIT;
                          RecTransferHeader."No.":= '';
                          RecTransferHeader.INSERT(TRUE);
                    
                          RecTransferHeader."Receipt Date" :=WORKDATE;
                          RecTransferHeader."Posting Date" := WORKDATE;
                          RecTransferHeader.VALIDATE("Transfer-from Code",RecPurchasesPayablesSetup."Magasin Destination Arrivage");
                          RecTransferHeader.VALIDATE("Transfer-to Code",RecPurchasesPayablesSetup."Magazin Manquant");
                          RecTransferHeader."No. Arrivage PR":=RecEcartArrivagePR."No. Dossier Import";
                          RecTransferHeader."No. Arrivage PR auto":="No. Dossier Import";
                          RecTransferHeader."Created from Arrivage PR":= TRUE;
                          RecTransferHeader.MODIFY;
                    
                          LineNo:=10000;
                          RecEcartArrivagePR.RESET;
                          RecEcartArrivagePR.SETRANGE("No. Dossier Import","No. Dossier Import");
                          RecEcartArrivagePR.SETRANGE("A Traiter",TRUE);
                          RecEcartArrivagePR.SETRANGE("No. Commande",'');
                          RecEcartArrivagePR.SETRANGE(Statut,RecEcartArrivagePR.Statut::"Créer Transfert");
                          IF RecEcartArrivagePR.FINDFIRST THEN
                            REPEAT
                              ProgressWindow.UPDATE(1,RecTransferHeader."No.");
                              RecTransferLine.INIT;
                              RecTransferLine."Document No.":=RecTransferHeader."No.";
                              RecTransferLine."Line No.":=LineNo;
                              RecTransferLine.INSERT;
                    
                              RecTransferLine.VALIDATE("Item No.",RecEcartArrivagePR."Item No");
                              RecTransferLine.Description := RecEcartArrivagePR.Designation ;
                              RecTransferLine."Transfer-from Code" := RecPurchasesPayablesSetup."Magasin Destination Arrivage" ;
                              RecTransferLine."Transfer-to Code" := RecPurchasesPayablesSetup."Magazin Manquant";
                    
                              RecTransferLine."In-Transit Code" := RecTransferHeader."In-Transit Code" ;
                              RecItem.RESET;
                              RecItem.GET(RecEcartArrivagePR."Item No");
                              RecTransferLine.VALIDATE("Unit of Measure Code" ,RecItem."Base Unit of Measure");
                    
                              RecTransferLine.VALIDATE(Quantity,ABS(RecEcartArrivagePR."Qty Ecrat"));
                              RecTransferLine.VALIDATE("Transfer-To Bin Code", RecPurchasesPayablesSetup."Cassier Monquant");
                              LineNo+=10000;
                              RecTransferLine.MODIFY;
                    
                              RecEcartArrivagePR."No. Commande" := RecTransferLine."Document No.";
                              RecEcartArrivagePR."Qty Traiter" := ABS(RecEcartArrivagePR."Qty Ecrat");
                              RecEcartArrivagePR."A Traiter":=FALSE;
                              RecEcartArrivagePR.Traiter:=TRUE;
                              RecEcartArrivagePR.MODIFY;
                    
                            UNTIL RecEcartArrivagePR.NEXT = 0;
                      END;
                    ProgressWindow.CLOSE;
                    
                    RecEcartArrivagePR.RESET;
                    RecEcartArrivagePR.SETRANGE("No. Dossier Import","No. Dossier Import");
                    RecEcartArrivagePR.SETRANGE("A Traiter",TRUE);
                    RecEcartArrivagePR.SETRANGE("No. Commande",'');
                    RecEcartArrivagePR.SETRANGE(Statut,RecEcartArrivagePR.Statut::"Ignorer Écart");
                    IF RecEcartArrivagePR.FINDSET THEN
                      REPEAT
                        RecEcartArrivagePR.Traiter := TRUE;
                        RecEcartArrivagePR.MODIFY;
                      UNTIL RecEcartArrivagePR.NEXT = 0;
                    CurrPage.UPDATE;

                end;
            }
            action("List Order de transfer")
            {
                Image = ListPage;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 5742;
                RunPageLink = No. Arrivage PR=FIELD(No. Dossier Import),
                              No. Arrivage PR auto=FIELD(No. Dossier Import),
                              Created from Arrivage PR=FILTER(Yes);
            }
            action("List Commande Achat")
            {
                Image = ListPage;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 9307;
                RunPageLink = No. Arrivage PR=FIELD(No. Dossier Import),
                              Created from Arrivage PR=FILTER(Yes),
                              Order Type=CONST(PR);
            }
        }
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

