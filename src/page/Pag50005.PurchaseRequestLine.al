page 50005 "Purchase Request Line"
{
    // version DEM ACHAT,CT16V001

    AutoSplitKey = true;
    CaptionML = ENU='Purchase Request Line',
                FRA='Ligne Demande Achat';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SaveValues = false;
    SourceTable = 50008;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("A imprimer";"A imprimer")
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
                    Editable = false;
                }
                field("Vendor Invoice No.";"Vendor Invoice No.")
                {
                }
                field(Commentaire;Commentaire)
                {
                }
                field(Employée;Employée)
                {
                }
                field("Nom employée";"Nom employée")
                {
                }
                field("Code Immo. A affecter";"Code Immo. A affecter")
                {
                }
                field("Libelle Immo.";"Libelle Immo.")
                {
                }
                field("Vendor Item No.";"Vendor Item No.")
                {
                    Visible = false;

                    trigger OnValidate();
                    begin
                        RecItemCrossReference.SETRANGE( RecItemCrossReference."Cross-Reference No.", "Vendor Item No.");
                        IF RecItemCrossReference.FIND('-') THEN
                        BEGIN
                           "Item No." := RecItemCrossReference."Item No.";
                           VALIDATE("Item No.");
                        END
                    end;
                }
                field(Inventory;Inventory)
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field(Quantity;Quantity)
                {
                }
                field("Approved quantity";"Approved quantity")
                {
                }
                field("Code Rubrique";"Code Rubrique")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Unit Cost";"Unit Cost")
                {
                }
                field("% Remise";"% Remise")
                {
                }
                field(Montant;Montant)
                {
                    DecimalPlaces = 3:3;
                }
                field("Approbation Directeur Site";"Approbation Directeur Site")
                {
                }
                field("Ligne approuvée";"Ligne approuvée")
                {
                }
                field("Code Motif Refus";"Code Motif Refus")
                {
                }
                field("No. série";"No. série")
                {

                    trigger OnLookup(Text : Text) : Boolean;
                    var
                        ServiceItem : Record "5940";
                    begin
                        ServiceItem.RESET;

                        IF PAGE.RUNMODAL(5981,ServiceItem)=ACTION::LookupOK THEN
                          "No. série" := ServiceItem."Serial No.";

                        SerialNoOnValidate;
                    end;

                    trigger OnValidate();
                    var
                        PurchReqLine : Record "50008";
                    begin
                        IF "No. série" <> '' THEN
                          BEGIN
                            //Check Current Request
                            PurchReqLine.RESET;
                            PurchReqLine.SETRANGE("No. série","No. série");
                            PurchReqLine.SETRANGE("Item No.","Item No.");
                            PurchReqLine.SETFILTER("Request No.",'%1',"Request No.");
                            PurchReqLine.SETFILTER("Line No.",'<>%1',"Line No.");
                            IF PurchReqLine.FINDFIRST THEN
                              ERROR(Txt001,PurchReqLine."No. série",PurchReqLine."Request No.",PurchReqLine."Line No.");

                            //Check Others
                            PurchReqLine.RESET;
                            PurchReqLine.SETRANGE("No. série","No. série");
                            PurchReqLine.SETRANGE("Item No.","Item No.");
                            PurchReqLine.SETFILTER("Request No.",'<>%1',"Request No.");
                            IF PurchReqLine.FINDFIRST THEN
                              ERROR(Txt001,PurchReqLine."No. série",PurchReqLine."Request No.",PurchReqLine."Line No.");
                          END;
                    end;
                }
                field("Vendor No.";"Vendor No.")
                {
                }
                field("Vendor Name";"Vendor Name")
                {
                }
                field("Line No.";"Line No.")
                {
                    Editable = false;
                    Visible = false;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                }
                field("Centre de gestion";"Centre de gestion")
                {
                }
                field("Code Activité";"Code Activité")
                {
                }
                field("No. compte comptable";"No. compte comptable")
                {
                    Editable = false;
                }
                field("Request Date";"Request Date")
                {
                    Editable = false;
                }
                field("Frs réglément";"Frs réglément")
                {
                }
                field("No bordereau";"No bordereau")
                {
                }
                field("Montant Bordereau";"Montant Bordereau")
                {
                }
                field("No. Chassie";"No. Chassie")
                {
                }
                field("No. Facture vente";"No. Facture vente")
                {
                }
                field("Montant budget ligne D.A";"Montant budget ligne D.A")
                {
                    Editable = false;
                }
                field("Dépassement budget";"Dépassement budget")
                {
                    Visible = false;
                }
                field("Budget initial";"Budget initial")
                {
                    Editable = false;
                }
                field("Order No.";"Order No.")
                {
                }
                field("Budget consommé";"Budget consommé")
                {
                    Editable = false;
                }
                field("Solde budget";"Solde budget")
                {
                    Editable = false;
                }
                field("Approvée par la D.C.G";"Approvée par la D.C.G")
                {
                }
                field("N° budget d'investissement.";"N° budget d'investissement.")
                {
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
                action("Item Card")
                {
                    CaptionML = ENU='Item Card',
                                FRA='Fiche article';

                    trigger OnAction();
                    begin
                        //This functionality was copied from page #50004. Unsupported part was commented. Please check it.
                        /*CurrPage.PurchaseReqLine.PAGE.*/
                        ItemCard;

                    end;
                }
                group("Item Availability by")
                {
                    CaptionML = ENU='Item Availability by',
                                FRA='Disponibilité article par';
                    action(Period)
                    {
                        CaptionML = ENU='Period',
                                    FRA='Période';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #50004. Unsupported part was commented. Please check it.
                            /*CurrPage.PurchaseReqLine.PAGE.*/
                            _ItemAvailability(0);

                        end;
                    }
                    action(Location)
                    {
                        CaptionML = ENU='Location',
                                    FRA='Magasin';

                        trigger OnAction();
                        begin
                            //This functionality was copied from page #50004. Unsupported part was commented. Please check it.
                            /*CurrPage.PurchaseReqLine.PAGE.*/
                            _ItemAvailability(1);

                        end;
                    }
                }
            }
            group("&Request")
            {
                CaptionML = ENU='&Request',
                            FRA='&Demande';
                action("<&Devis>")
                {
                    CaptionML = ENU='<&Devis>',
                                FRA='&Devis';

                    trigger OnAction();
                    begin
                        
                        //This functionality was copied from page #50004. Unsupported part was commented. Please check it.
                        /*CurrPage.PurchaseReqLine.PAGE.*/
                        ShowPurchaseLineOrder;

                    end;
                }
                action(Order)
                {
                    CaptionML = ENU='Order',
                                FRA='&Commande';

                    trigger OnAction();
                    begin
                        //IF Status <> Status::"Approuved By Dir. Gen." THEN
                        //  ERROR(CstGText011);
                        
                        //This functionality was copied from page #50004. Unsupported part was commented. Please check it.
                        /*CurrPage.PurchaseReqLine.PAGE.*/
                        ShowPurchaseLineOrder;

                    end;
                }
                action("Extraire lignes immatriculation")
                {
                    Image = Line;
                    Promoted = true;

                    trigger OnAction();
                    var
                        CarteGrisesList : Page "60074";
                        CarteGriseEntete : Record "60015";
                        CarteGriseLigne : Record "60016";
                        LDecAmount : Decimal;
                        LIntQuantity : Integer;
                    begin
                        CLEAR(CarteGrisesList);
                        CarteGriseEntete.RESET;
                        TESTFIELD("Item No.");
                        IF CarteGriseEntete.FINDSET THEN BEGIN
                          CarteGrisesList.SETRECORD(CarteGriseEntete);
                          CarteGrisesList.SETTABLEVIEW(CarteGriseEntete);
                          CarteGrisesList.FctSetPurchaseRequestNo("Request No.","Line No.",TRUE);
                          CarteGrisesList.LOOKUPMODE(TRUE);
                          IF CarteGrisesList.RUNMODAL=ACTION::LookupOK THEN BEGIN
                           //CarteGrisesList.GETRECORD(CarteGriseEntete);
                            CarteGriseEntete.RESET;
                            CarteGriseEntete.SETRANGE("Purchase Request No.","Request No.");
                            CarteGriseEntete.SETRANGE("Purchase request line No.","Line No.");
                            IF CarteGriseEntete.FINDSET THEN
                            REPEAT
                               CarteGriseEntete.CALCFIELDS("Nbre Carte Grise");
                               LIntQuantity+=CarteGriseEntete."Nbre Carte Grise";
                               CarteGriseLigne.RESET;
                               CarteGriseLigne.SETRANGE("N° Bordereau",CarteGriseEntete."N° Bordereau");
                               CarteGriseLigne.FINDSET;
                               LDecAmount:=0;
                               REPEAT
                                 LDecAmount+=CarteGriseLigne."Frais immatriculation";
                           UNTIL CarteGriseLigne.NEXT=0;
                           VALIDATE(Quantity,LIntQuantity);
                           //VALIDATE("Unit Cost",CarteGriseEntete.
                           UNTIL CarteGriseEntete.NEXT=0;
                            END;
                        END;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        IF "Solde budget" < 0 THEN DeppBudget := TRUE;
    end;

    trigger OnAfterGetRecord();
    begin
        ChekLine;
    end;

    trigger OnInsertRecord(BelowxRec : Boolean) : Boolean;
    begin
        ChekLine;
    end;

    trigger OnNewRecord(BelowxRec : Boolean);
    begin
        ChekLine;
    end;

    var
        RecGItem : Record "27";
        ShowItemCard : Page "30";
        DimMgt : Codeunit "408";
        myform : Page "50004";
        RecItemCrossReference : Record "5717";
        DeppBudget : Boolean;
        Txt001 : Label '"Le numéro de série %1 a été déja affecté sur la demande %2 ligne %3 ! "';
        UserSetup : Record "91";

    procedure ShowPurchaseLineOrder();
    var
        RecLPurchOrderLine : Record "39";
    begin
        RecLPurchOrderLine.RESET;
        RecLPurchOrderLine.SETRANGE(RecLPurchOrderLine."Request No.","Request No.");
        //RecLPurchOrderLine.SETRANGE("Request Line No.","Line No.");

        PAGE.RUNMODAL(PAGE::"Purchase Lines",RecLPurchOrderLine);
    end;

    procedure _ItemAvailability(AvailabilityType : Option Date,Location);
    begin
        Rec.ItemAvailability(AvailabilityType);
    end;

    procedure ItemAvailability(AvailabilityType : Option Date,Location);
    begin
        Rec.ItemAvailability(AvailabilityType);
    end;

    procedure ItemCard();
    begin
        TESTFIELD("Item No.");
        RecGItem.RESET;
        RecGItem.GET("Item No.");

        CLEAR(ShowItemCard);
        ShowItemCard.LOOKUPMODE(TRUE);
        ShowItemCard.SETRECORD(RecGItem);
        ShowItemCard.SETTABLEVIEW(RecGItem);
        IF ShowItemCard.RUNMODAL = ACTION::LookupOK THEN;
    end;

    procedure CalcAvailability() : Decimal;
    var
        AvailableToPromise : Codeunit "5790";
        GrossRequirement : Decimal;
        ScheduledReceipt : Decimal;
        PeriodType : Option Day,Week,Month,Quarter,Year;
        AvailabilityDate : Date;
        LookaheadDateformula : DateFormula;
    begin
        AvailabilityDate := WORKDATE;

        RecGItem.RESET;
        RecGItem.SETRANGE("Date Filter",0D,AvailabilityDate);
        RecGItem.SETRANGE("Location Filter","Location Code");
        RecGItem.SETRANGE("Drop Shipment Filter",FALSE);

        EXIT(
          AvailableToPromise.QtyAvailabletoPromise(
            RecGItem,
            GrossRequirement,
            ScheduledReceipt,
            AvailabilityDate,
            PeriodType,
            LookaheadDateformula));
    end;

    procedure ShowPurchaseLineInvoice();
    var
        RecLPurchOrderLine : Record "123";
    begin
        RecLPurchOrderLine.RESET;
        RecLPurchOrderLine.SETRANGE("Request No.","Request No.");
        RecLPurchOrderLine.SETRANGE("Request Line No.","Line No.");

        PAGE.RUNMODAL(0,RecLPurchOrderLine);
    end;

    local procedure SerialNoOnValidate();
    var
        PurchReqLine : Record "50008";
    begin
        IF "No. série" <> '' THEN
          BEGIN
            //Check Current Request
            PurchReqLine.RESET;
            PurchReqLine.SETRANGE("No. série","No. série");
            PurchReqLine.SETRANGE("Item No.","Item No.");
            PurchReqLine.SETFILTER("Request No.",'%1',"Request No.");
            PurchReqLine.SETFILTER("Line No.",'<>%1',"Line No.");
            IF PurchReqLine.FINDFIRST THEN
              ERROR(Txt001,PurchReqLine."No. série",PurchReqLine."Request No.",PurchReqLine."Line No.");

            //Check Others
            PurchReqLine.RESET;
            PurchReqLine.SETRANGE("No. série","No. série");
            PurchReqLine.SETRANGE("Item No.","Item No.");
            PurchReqLine.SETFILTER("Request No.",'<>%1',"Request No.");
            IF PurchReqLine.FINDFIRST THEN
              ERROR(Txt001,PurchReqLine."No. série",PurchReqLine."Request No.",PurchReqLine."Line No.");
          END;
    end;

    local procedure ChekLine();
    begin
        IF UserSetup.GET(USERID) THEN
          BEGIN
              UserSetup.TESTFIELD("Type ligne D.A");

              IF UserSetup."Type ligne D.A" = UserSetup."Type ligne D.A"::Item    THEN Type := Type::Item;
              IF UserSetup."Type ligne D.A" = UserSetup."Type ligne D.A"::"Charge (Item)"    THEN Type := Type::"Charge (Item)";
              //IF (UserSetup."Type ligne D.A" = UserSetup."Type ligne D.A"::"Charge (Item)") AND (Type = Type::Item) THEN
                // ERROR('Vous n''êtes pas autoriser a saisir des DA de type article, Veuillez contacter votre administrateur système');
         END;
    end;
}

