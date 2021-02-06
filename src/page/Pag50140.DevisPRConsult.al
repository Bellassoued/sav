page 50140 "Devis PR Consult"
{
    // version M&MS

    PageType = List;
    SourceTable = Table50102;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No.";"Line No.")
                {
                    Visible = false;
                }
                field("Item No.";"Item No.")
                {
                    LookupPageID = "Liste Article Consultation";
                    TableRelation = Item;

                    trigger OnValidate();
                    var
                        RecInventorySetup : Record "313";
                        RecItem : Record "27";
                        LPagConfigurateurFicheArticle : Page "60186";
                        LRecItemMaster : Record "70007";
                        ShowReplcmt : Boolean;
                        WithoutReplcmtWindow : Boolean;
                        ReplcmtChains : Record "70095";
                        ReplcmtChains2 : Record "70095";
                        ReplcmtByLocation : Page "70279";
                        CduItemavailability : Codeunit "70000";
                    begin
                        
                        IF NOT Item.GET("Item No.") THEN BEGIN
                          RecInventorySetup.GET;
                          IF Item.FctCheckItemInMaster("Item No.") THEN
                            BEGIN
                              LRecItemMaster.CHANGECOMPANY(RecInventorySetup."Socité stock consolidé");
                                LRecItemMaster.SETRANGE("No.","Item No.");
                              IF LRecItemMaster.FINDFIRST THEN
                                LPagConfigurateurFicheArticle.FctCreateItemPiece(LRecItemMaster);
                            END;
                        END ELSE BEGIN
                              Item.CALCFIELDS(Inventory);
                              IF (Item."Sur commande") AND (Item.Inventory = 0) THEN BEGIN
                                  LRecItemMaster.SETRANGE("No.","Item No.");
                                  IF LRecItemMaster.FINDFIRST THEN
                                        LPagConfigurateurFicheArticle.FctCreateItemPiece(LRecItemMaster);
                              END;
                        END;
                        
                        /*
                          BEGIN
                            ShowReplcmt := FALSE;
                            IF NOT WithoutReplcmtWindow AND (Item.GET("No.")) THEN BEGIN
                              IF CduItemavailability.FctCalcStockDispoByCompany("No.",'') <= 0 THEN
                                BEGIN
                                    IF (Item."Replacement Status" = Item."Replacement Status"::"A été remplacé") THEN
                                      ShowReplcmt := CONFIRM(TXT50006,TRUE,"No.");
                                    IF (Item."Replacement Status" = Item."Replacement Status"::"Pièce de remplacement") THEN
                                      ShowReplcmt := CONFIRM(TXT50007,TRUE,"No.");
                                    IF (Item."Replacement Status" = Item."Replacement Status"::"En cours de remplacement") AND
                                      (Item."Old Replacement Status" = Item."Old Replacement Status"::"Replacement Item")
                                    THEN
                                      ShowReplcmt := CONFIRM(TXT50007,TRUE,"No.");
                                  END;
                                  IF ShowReplcmt THEN BEGIN
                                    ReplcmtChains.SETRANGE("Item No.","No.");
                                    IF ReplcmtChains.FIND('-') THEN BEGIN
                                      ReplcmtChains2.SETCURRENTKEY("Chain No.");
                                      ReplcmtChains2.SETRANGE("Chain No.",ReplcmtChains."Chain No.");
                                      ReplcmtChains2.CALCFIELDS("Total Inventory");
                                      IF ReplcmtChains2.GET("No.",ReplcmtChains."Chain No.") THEN;
                                      CLEAR(ReplcmtByLocation);
                                      ReplcmtByLocation.LOOKUPMODE(TRUE);
                                      ReplcmtByLocation.SETTABLEVIEW(ReplcmtChains2);
                                      ReplcmtByLocation.SETRECORD(ReplcmtChains2);
                        
                                      IF ReplcmtByLocation.RUNMODAL = ACTION::LookupOK THEN BEGIN
                                        ReplcmtByLocation.GETRECORD(ReplcmtChains2);
                                        WithoutReplcmtWindow := TRUE;
                                        VALIDATE("No.", ReplcmtChains2."Item No.");
                                        WithoutReplcmtWindow := FALSE;
                                        EXIT;
                                      END;
                                    END;
                                  END;
                              END;
                          END;
                        END;
                        */
                        
                        
                        UPDATELINE;

                    end;
                }
                field(Description;Description)
                {
                    Editable = false;
                }
                field(Qty;Qty)
                {

                    trigger OnValidate();
                    begin
                        UPDATELINE;
                    end;
                }
                field("Unit Price";"Unit Price")
                {
                    Editable = false;
                }
                field("Ligne Amount HT";"Ligne Amount HT")
                {
                    Editable = false;
                }
                field("Ligne Amount TTC";"Ligne Amount TTC")
                {
                    Editable = false;
                }
            }
            group()
            {
                group()
                {
                    field("Total Amount Excl. VAT";TotalSalesLineAmount)
                    {
                        ApplicationArea = Basic,Suite;
                        AutoFormatType = 1;
                        CaptionML = ENU='Total Amount Excl. VAT',
                                    FRA='Montant total HT';
                        DrillDown = false;
                        Editable = false;
                        ToolTipML = ENU='Specifies the sum of the value in the Line Amount Excl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field.',
                                    FRA='Spécifie la somme de la valeur du champ Montant ligne HT sur toutes les lignes du document, moins l''éventuel montant remise indiqué dans le champ Montant remise facture.';
                    }
                    field("Total VAT Amount";VATAmount)
                    {
                        ApplicationArea = Basic,Suite;
                        AutoFormatType = 1;
                        CaptionML = ENU='Total VAT',
                                    FRA='Total TVA';
                        Editable = false;
                        ToolTipML = ENU='Specifies the sum of VAT amounts on all lines in the document.',
                                    FRA='Spécifie la somme des montants de TVA sur toutes les lignes du document.';
                    }
                    field("Total Amount Incl. VAT";TotalSalesLineAmountIncludingVAT)
                    {
                        ApplicationArea = Basic,Suite;
                        AutoFormatType = 1;
                        CaptionML = ENU='Total Amount Incl. VAT',
                                    FRA='Montant total TTC';
                        Editable = false;
                        ToolTipML = ENU='Specifies the sum of the value in the Line Amount Incl. VAT field on all lines in the document minus any discount amount in the Invoice Discount Amount field.',
                                    FRA='Spécifie la somme de la valeur du champ Montant TTC sur toutes les lignes du document, moins l''éventuel montant remise indiqué dans le champ Montant remise facture.';
                    }
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        VATAmount  := 0;
        TotalSalesLineAmountIncludingVAT := 0;
        TotalSalesLineAmount := 0;
        DevisMMS.RESET;
        IF DevisMMS.FINDSET THEN BEGIN
          REPEAT
            TotalSalesLineAmount += DevisMMS."Ligne Amount HT";
            TotalSalesLineAmountIncludingVAT += DevisMMS."Ligne Amount TTC";
          UNTIL DevisMMS.NEXT = 0;
          VATAmount  := TotalSalesLineAmountIncludingVAT - TotalSalesLineAmount;
        END;
    end;

    var
        Item : Record "27";
        TotalSalesLineAmountIncludingVAT : Decimal;
        VATAmount : Decimal;
        TotalSalesLineAmount : Decimal;
        DevisMMS : Record "50102";

    local procedure UPDATELINE();
    begin
        IF "Item No." <> '' THEN BEGIN
            Item.GET("Item No.");
            Description := Item.Description;
            "Unit Price" := Item."Unit Price";
            "Ligne Amount HT" := Qty * "Unit Price";
            "Ligne Amount TTC" := "Ligne Amount HT" * 1.19;
        END ELSE BEGIN
          Description := '';
          "Unit Price" := Item."Unit Price";
          "Ligne Amount HT" := Qty * "Unit Price";
          "Ligne Amount TTC" := "Ligne Amount HT" * 1.19;
        END;

        CurrPage.SAVERECORD;
        CurrPage.UPDATE;

        VATAmount  := 0;
        TotalSalesLineAmountIncludingVAT := 0;
        TotalSalesLineAmount := 0;
        DevisMMS.RESET;
        IF DevisMMS.FINDSET THEN BEGIN
          REPEAT
            TotalSalesLineAmount += DevisMMS."Ligne Amount HT";
            TotalSalesLineAmountIncludingVAT += DevisMMS."Ligne Amount TTC";
          UNTIL DevisMMS.NEXT = 0;
          VATAmount  := TotalSalesLineAmountIncludingVAT - TotalSalesLineAmount;
        END;
    end;
}

