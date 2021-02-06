page 60106 "Posted Sales Invoice Sub. VN"
{
    // version SAV Automobile

    AutoSplitKey = true;
    CaptionML = ENU='Lines PR',
                FRA='Lignes VN';
    Editable = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = Table113;

    layout
    {
        area(content)
        {
            repeater()
            {
                field(Type;Type)
                {
                }
                field("VAT Base Amount";"VAT Base Amount")
                {
                }
                field("No.";"No.")
                {
                }
                field("Cross-Reference No.";"Cross-Reference No.")
                {
                    Visible = false;
                }
                field("IC Partner Code";"IC Partner Code")
                {
                    Visible = false;
                }
                field("Variant Code";"Variant Code")
                {
                    Visible = true;
                }
                field(Description;Description)
                {
                }
                field(Quantity;Quantity)
                {
                    BlankZero = true;
                }
                field("Affecter sur";"Affecter sur")
                {
                }
                field("Unit of Measure Code";"Unit of Measure Code")
                {
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    Visible = false;
                }
                field("Timbre Fiscal";"Timbre Fiscal")
                {
                }
                field("Apply Fodec";"Apply Fodec")
                {
                }
                field("Montant Fodec";"Montant Fodec")
                {
                }
                field("Unit Cost (LCY)";"Unit Cost (LCY)")
                {
                    Visible = false;
                }
                field("Unit Price";"Unit Price")
                {
                    BlankZero = true;
                }
                field("Line Amount";"Line Amount")
                {
                    BlankZero = true;
                }
                field("Line Discount %";"Line Discount %")
                {
                    BlankZero = true;
                }
                field("Line Discount Amount";"Line Discount Amount")
                {
                    Visible = false;
                }
                field("Allow Invoice Disc.";"Allow Invoice Disc.")
                {
                    Visible = false;
                }
                field("Job No.";"Job No.")
                {
                    Visible = false;
                }
                field("Appl.-to Item Entry";"Appl.-to Item Entry")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    Visible = false;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                }
                field("Amount Including VAT";"Amount Including VAT")
                {
                }
                field(Amount;Amount)
                {
                }
                field("Return Reason Code";"Return Reason Code")
                {
                    CaptionML = ENU='Return Reason Code',
                                FRA='Motif remise';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                CaptionML = ENU='&Line',
                            FRA='&Ligne';
                Image = Line;
                action(Dimensions)
                {
                    CaptionML = ENU='Dimensions',
                                FRA='Axes analytiques';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction();
                    begin
                        ShowDimensions;
                    end;
                }
                action("Co&mments")
                {
                    CaptionML = ENU='Co&mments',
                                FRA='Co&mmentaires';
                    Image = ViewComments;

                    trigger OnAction();
                    begin
                        ShowLineComments;
                    end;
                }
                action(ItemTrackingEntries)
                {
                    CaptionML = ENU='Item &Tracking Entries',
                                FRA='Écritures &traçabilité';
                    Image = ItemTrackingLedger;

                    trigger OnAction();
                    begin
                        ShowItemTrackingLines;
                    end;
                }
                action("Item Shipment &Lines")
                {
                    CaptionML = ENU='Item Shipment &Lines',
                                FRA='&Lignes expédition article';
                    Image = ShipmentLines;

                    trigger OnAction();
                    begin
                        IF NOT (Type IN [Type::Item,Type::"Charge (Item)"]) THEN
                          TESTFIELD(Type);
                        ShowItemShipmentLines;
                    end;
                }
                action("Créer facture complémentaire")
                {

                    trigger OnAction();
                    var
                        LRepCreerFactureComplementraie : Report "60187";
                        LRecLignesORs : Record "113";
                    begin
                        CLEAR(LRepCreerFactureComplementraie);
                        LRecLignesORs.RESET;
                        LRecLignesORs.SETRANGE("Document No.","Document No.");
                        LRecLignesORs.SETRANGE("Line No.","Line No.");
                        //IF NOT "Facture Complémentaire" THEN
                          IF LRecLignesORs.FINDFIRST THEN BEGIN
                            LRepCreerFactureComplementraie.SETTABLEVIEW(LRecLignesORs);
                            LRepCreerFactureComplementraie.RUN;
                          END;
                    end;
                }
            }
            action("Imprimer BL")
            {
                Caption = 'Imprimer BL';
                Image = PrintForm;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction();
                var
                    RecPreparationVN : Record "60025";
                    TXT50000 : Label 'Livraison doit être valider avant l''''impression de bon de sortie';
                    ServiceItem : Record "5940";
                    LRecSalesInvoiceLine : Record "113";
                    LRecSalesShipmentHeader : Record "110";
                    R_BonsortieVN : Report "60033";
                    ShipmentInvoiced : Record "10825";
                    LRecSalesShipmentLine : Record "111";
                    ItemLedgerEntry : Record "32";
                begin
                    //SM MAZDA301
                    //SM 2306 IF "Status Livraison" = "Status Livraison"::"Rendez-Vous crée" THEN BEGIN
                    //IF "Date rendez vous"=0DT THEN
                      //ERROR('Veuillez créer un rendez-vous!');
                    IF CONFIRM(text001) THEN BEGIN
                      ShipmentInvoiced.RESET;
                      ShipmentInvoiced.SETRANGE("Invoice No.","Document No.");
                      ShipmentInvoiced.SETRANGE("Invoice Line No.","Line No.");
                      ShipmentInvoiced.FINDSET;
                      ItemLedgerEntry.RESET;
                      ItemLedgerEntry.SETRANGE("Document No.",ShipmentInvoiced."Shipment No.");
                      ItemLedgerEntry.SETRANGE("Document Line No.",ShipmentInvoiced."Shipment Line No.");
                      ItemLedgerEntry.FINDFIRST;
                      //MESSAGE(ItemLedgerEntry."Serial No.");
                        //LRecSalesInvoiceLine.CALCFIELDS(VIN);
                      ServiceItem.RESET;
                      ServiceItem.SETRANGE("Serial No.", ItemLedgerEntry."Serial No.");
                      ServiceItem.FINDFIRST;
                      //ServiceItem.CALCFIELDS("Statut Carte Grise");
                      //SM 100917
                     // IF NOT ServiceItem."Dérogation DC Livraison" THEN
                      //END SM
                     //   ServiceItem.TESTFIELD("Statut Carte Grise",ServiceItem."Statut Carte Grise"::Reçue);
                      //END SM
                      LRecSalesShipmentHeader.SETRANGE("No.",ShipmentInvoiced."Shipment No.");
                      R_BonsortieVN.SetServiceItemNo(ServiceItem."No.");
                      R_BonsortieVN.SETTABLEVIEW(LRecSalesShipmentHeader);
                      //SM OLD TMP R_BonsortieVN.SetServiceItemNo(ServiceItem."No.");
                      R_BonsortieVN.RUN;
                      // REPORT.RUN(REPORT::"Bon sortie VN",TRUE,TRUE,SalesShipmentHeader);
                    
                    
                      //SM 270717 TMP A VOIR ServiceItem.TESTFIELD(Emplacement,ServiceItem.Emplacement::"Chez Aures Auto");
                    /*
                      CLEAR(RecPreparationVN);
                      RecPreparationVN.SETRANGE("Preparation No","Preparation No");
                      REPORT.RUN(REPORT::"Bon sortie VN",TRUE,TRUE,RecPreparationVN);
                    */
                    
                      IF ServiceItem."Date Livraison"=0DT THEN
                        ServiceItem."Date Livraison" := CURRENTDATETIME;
                      ServiceItem.Emplacement := ServiceItem.Emplacement::"Chez client";
                      //SM 01/10/17
                      //KT 251017
                      //ServiceItem.Livreur:=use;
                      //END KT
                      ServiceItem."Préparation/Livraison" := ServiceItem."Préparation/Livraison"::Livrer;
                      ServiceItem.TESTFIELD("Réglement réçu Immatriculation");
                      ServiceItem.TESTFIELD("Réglement réçu Livraison");
                      ServiceItem.TESTFIELD(Matricule);
                      //END SM
                      ServiceItem.MODIFY;
                      //MODIFY;
                    END;
                    //SM 2306 END ELSE
                    //SM 2306   ERROR('Vous devez créer un rendez-vous ! ');

                end;
            }
            group("&Invoice")
            {
                CaptionML = ENU='&Invoice',
                            FRA='Fa&cture';
                Image = Invoice;
                action(Shipments)
                {
                    CaptionML = ENU='S&hipments',
                                FRA='E&xpéditions';
                    Image = Shipment;

                    trigger OnAction();
                    begin
                        LinesInvoiced;
                    end;
                }
            }
        }
    }

    var
        text001 : Label 'Voulez-vous imprimer le bon de livraison ?';

    procedure LinesInvoiced();
    var
        ShipmentInvoiced : Record "10825";
    begin
        ShipmentInvoiced.RESET;
        ShipmentInvoiced.SETCURRENTKEY("Invoice No.","Invoice Line No.","Shipment No.","Shipment Line No.");
        ShipmentInvoiced.SETRANGE("Invoice No.","Document No.");
        ShipmentInvoiced.SETRANGE("Invoice Line No.","Line No.");
        PAGE.RUNMODAL(PAGE::"Shipments bound by Invoice",ShipmentInvoiced);
    end;
}

