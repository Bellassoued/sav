page 60164 "Reservation Entries VN"
{
    // version CT16V002

    CaptionML = ENU='Reservation Entries',
                FRA='Écritures réservation VN';
    DataCaptionExpression = TextCaption;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Table337;
    SourceTableView = SORTING(Source ID,Source Ref. No.,Source Type,Source Subtype,Source Batch Name,Source Prod. Order Line,Reservation Status,Shipment Date,Expected Receipt Date)
                      ORDER(Ascending)
                      WHERE(Source Type=CONST(37),
                            Reservation Status=CONST(Reservation));

    layout
    {
        area(content)
        {
            repeater()
            {
                field("Entry No.";"Entry No.")
                {
                    Editable = false;
                }
                field("Creation Date";"Creation Date")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = BoolExpired;
                    Visible = false;
                }
                field("Item No.";"Item No.")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = BoolExpired;
                }
                field("Variant Code";"Variant Code")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = BoolExpired;
                    Visible = false;
                }
                field("Type Commerciale";Designation)
                {
                }
                field(Description;TxtDesciption)
                {
                    CaptionML = ENU='Description',
                                FRA='Designation';
                    Editable = false;
                    Style = Attention;
                    StyleExpr = BoolExpired;
                    Visible = false;
                }
                field("Location Code";"Location Code")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = BoolExpired;
                }
                field(Emplacement;BinCode)
                {
                }
                field("Quantité";ABS("Quantity (Base)"))
                {
                    Caption = 'Quantité';
                    DecimalPlaces = 0:0;
                    Editable = false;
                    Style = Attention;
                    StyleExpr = BoolExpired;

                    trigger OnValidate();
                    begin
                        ReservEngineMgt.ModifyReservEntry(xRec,"Quantity (Base)",Description,FALSE);
                        QuantityBaseOnAfterValidate;
                    end;
                }
                field(NumerodeSerie;NumerodeSerie)
                {
                    Caption = 'Numéro de Série';
                    Editable = false;
                    Style = Attention;
                    StyleExpr = BoolExpired;
                    Visible = false;
                }
                field("VIN ";ReservedFromSerialNo."Serial No.")
                {
                }
                field(ReservedFromSerialNo."Source Type";ReservedFromSerialNo."Source Type")
                {
                }
                field(Production;Production)
                {
                }
                field(ReservEngineMgt.CreateForText(Rec);ReservEngineMgt.CreateForText(Rec))
                {
                    CaptionML = ENU='Reserved For',
                                FRA='Réservé pour';
                    Editable = false;
                    Style = Attention;
                    StyleExpr = BoolExpired;
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupReservedFor;
                    end;
                }
                field(ReservedFrom;ReservEngineMgt.CreateFromText(Rec))
                {
                    CaptionML = ENU='Reserved From',
                                FRA='Réservé à partir de';
                    Editable = false;
                    Style = Attention;
                    StyleExpr = BoolExpired;
                    Visible = false;

                    trigger OnLookup(Text : Text) : Boolean;
                    begin
                        LookupReservedFrom;
                    end;
                }
                field("Nom Vendeur";ReservEngineMgt.CreateTextVendor(Rec))
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = BoolExpired;
                }
                field("Nom Client";ReservEngineMgt.CreateTextCustomer(Rec))
                {
                }
                field("Délai expiration Reservation VN";IntdelaiEpirReserv)
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = BoolExpired;
                }
                field("Expire Dans (jours)";IntExpireDans)
                {
                    Editable = false;
                }
                field("Shipment Date";"Shipment Date")
                {
                    Editable = false;
                    Style = Attention;
                    StyleExpr = BoolExpired;
                    Visible = false;
                }
                field(Commentaire;Commentaire)
                {

                    trigger OnValidate();
                    begin
                        MODIFY;
                    end;
                }
            }
            part("Commande Achat Non Réservé";69038)
            {
            }
            part("Stock NonRéservé";69039)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("F&unctions")
            {
                CaptionML = ENU='F&unctions',
                            FRA='Fonction&s';
                Image = "Action";
                action(CancelReservation)
                {
                    CaptionML = ENU='Cancel Reservation',
                                FRA='Annuler la réservation';
                    Image = Cancel;

                    trigger OnAction();
                    var
                        ReservEntry : Record "337";
                    begin
                        CurrPage.SETSELECTIONFILTER(ReservEntry);
                        IF ReservEntry.FIND('-') THEN
                          REPEAT
                            ReservEntry.TESTFIELD("Reservation Status","Reservation Status"::Reservation);
                            ReservEntry.TESTFIELD("Disallow Cancellation",FALSE);
                            IF CONFIRM(
                                 Text001,FALSE,ReservEntry."Quantity (Base)",
                                 ReservEntry."Item No.",ReservEngineMgt.CreateForText(Rec),
                                 ReservEngineMgt.CreateFromText(Rec))
                            THEN BEGIN
                              ReservEngineMgt.CancelReservation(ReservEntry);
                              COMMIT;
                            END;
                          UNTIL ReservEntry.NEXT = 0;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    var
        PurchLine : Record "39";
        ItemLedgEntry : Record "32";
        RecPurchaseHeader : Record "38";
    begin
        //<< TRIUM RAD 26/08/2014 - Calcul de l'expiration de la réservation

        NumerodeSerie := '';
        IntExpireDans := 0 ;
        IntdelaiEpirReserv := 0 ;

        IF RecItemVariant.GET("Item No.","Variant Code") THEN
          TxtDesciption := RecItemVariant.Description ;

        IF RecItem.GET("Item No.") THEN BEGIN
          IF RecFicheTechnique.GET(RecItem."No.") THEN
            Designation := RecFicheTechnique."Model Code"
        END ELSE
          Designation := '';


        RecGReservEntries.SETRANGE("Entry No.","Entry No.");
        RecGReservEntries.FINDSET ;
        IF  RecGReservEntries.NEXT > 0 THEN
          NumerodeSerie := RecGReservEntries."Serial No." ;

        //SM ADD 2808
        ReservedFromSerialNo.GET("Entry No.",NOT Positive);


        //<< TRIUM RAD 02/10/2014 - Ajout d'une fonction spécifique de calcule des dates
        CalcExpirationDate;
        //>> End Addin


        //>> End Trium RAD Addin

        IF ReservedFrom.GET("Entry No.",TRUE) THEN BEGIN
          WITH ReservedFrom DO
            CASE "Source Type" OF
              DATABASE::"Purchase Line":
                BEGIN
                  PurchLine.RESET;
                  PurchLine.SETRANGE("Document Type","Source Subtype");
                  PurchLine.SETRANGE("Document No.","Source ID");
                  PurchLine.SETRANGE("Line No.","Source Ref. No.");
                  IF PurchLine.FINDFIRST THEN BEGIN
                    BinCode := PurchLine."Bin Code";
                    IF RecPurchaseHeader.GET(PurchLine."Document Type",PurchLine."Document No.") THEN
                      Production :=  RecPurchaseHeader."Vendor Order No."
                    ELSE
                      Production := '';
                  END ELSE BEGIN
                    BinCode := '';
                    Production := '';
                  END;
                END;

              DATABASE::"Item Ledger Entry":
                BEGIN
                  //ItemLedgEntry.RESET;
                  //ItemLedgEntry.SETRANGE("Entry No.","Source Ref. No.");
                  IF ItemLedgEntry.FINDSET THEN
                    RecWarehouseEntry.RESET;
                    RecWarehouseEntry.SETRANGE("Serial No.","Serial No.");
                    RecWarehouseEntry.SETRANGE("Item No.","Item No.");
                    RecWarehouseEntry.SETRANGE("Variant Code","Variant Code");
                    RecWarehouseEntry.SETRANGE("Location Code","Location Code");

                  IF RecWarehouseEntry.FINDLAST THEN
                    BinCode := RecWarehouseEntry."Bin Code"
                  ELSE
                    BinCode := '';

                END;

             END;

        END;
    end;

    trigger OnModifyRecord() : Boolean;
    begin
        ReservEngineMgt.ModifyReservEntry(xRec,"Quantity (Base)",Description,TRUE);
        EXIT(FALSE);
    end;

    var
        Text001 : TextConst ENU='Cancel reservation of %1 of item number %2, reserved for %3 from %4?',FRA='Annuler la réservation de %1 du numéro d''article %2, réservé pour %3 à partir de %4 ?';
        ReservEngineMgt : Codeunit "99000831";
        IntdelaiEpirReserv : Integer;
        RecGItem : Record "27";
        BoolExpired : Boolean;
        TxtDesciption : Text[50];
        RecItemVariant : Record "5401";
        IntExpireDans : Integer;
        NumerodeSerie : Code[20];
        RecGReservEntries : Record "337";
        RecGSalesLine : Record "37";
        RecGSalesHeader : Record "36";
        RecGParamExpirReservVN : Record "60044";
        RecGPurchdr : Record "38";
        Designation : Text[100];
        RecItem : Record "27";
        BinCode : Code[50];
        RecWarehouseEntry : Record "7312";
        ReservedFrom : Record "337";
        Production : Text[100];
        ReservedFromSerialNo : Record "337";
        RecFicheTechnique : Record "50032";

    procedure LookupReservedFor();
    var
        ReservEntry : Record "337";
    begin
        ReservEntry.GET("Entry No.",FALSE);
        LookupReserved(ReservEntry);
    end;

    procedure LookupReservedFrom();
    var
        ReservEntry : Record "337";
    begin
        ReservEntry.GET("Entry No.",TRUE);
        LookupReserved(ReservEntry);
    end;

    procedure LookupReserved(ReservEntry : Record "337");
    var
        SalesLine : Record "37";
        ReqLine : Record "246";
        PurchLine : Record "39";
        ItemJnlLine : Record "83";
        ItemLedgEntry : Record "32";
        ProdOrderLine : Record "5406";
        ProdOrderComp : Record "5407";
        PlanningComponent : Record "99000829";
        ServLine : Record "5902";
        JobPlanningLine : Record "1003";
        TransLine : Record "5741";
        AssemblyHeader : Record "900";
        AssemblyLine : Record "901";
    begin
        WITH ReservEntry DO
          CASE "Source Type" OF
            DATABASE::"Sales Line":
              BEGIN
                SalesLine.RESET;
                SalesLine.SETRANGE("Document Type","Source Subtype");
                SalesLine.SETRANGE("Document No.","Source ID");
                SalesLine.SETRANGE("Line No.","Source Ref. No.");
                PAGE.RUNMODAL(PAGE::"Sales Lines",SalesLine);
              END;
            DATABASE::"Requisition Line":
              BEGIN
                ReqLine.RESET;
                ReqLine.SETRANGE("Worksheet Template Name","Source ID");
                ReqLine.SETRANGE("Journal Batch Name","Source Batch Name");
                ReqLine.SETRANGE("Line No.","Source Ref. No.");
                PAGE.RUNMODAL(PAGE::"Requisition Lines",ReqLine);
              END;
            DATABASE::"Purchase Line":
              BEGIN
                PurchLine.RESET;
                PurchLine.SETRANGE("Document Type","Source Subtype");
                PurchLine.SETRANGE("Document No.","Source ID");
                PurchLine.SETRANGE("Line No.","Source Ref. No.");
                PAGE.RUNMODAL(PAGE::"Purchase Lines",PurchLine);
              END;
            DATABASE::"Item Journal Line":
              BEGIN
                ItemJnlLine.RESET;
                ItemJnlLine.SETRANGE("Journal Template Name","Source ID");
                ItemJnlLine.SETRANGE("Journal Batch Name","Source Batch Name");
                ItemJnlLine.SETRANGE("Line No.","Source Ref. No.");
                ItemJnlLine.SETRANGE("Entry Type","Source Subtype");
                PAGE.RUNMODAL(PAGE::"Item Journal Lines",ItemJnlLine);
              END;
            DATABASE::"Item Ledger Entry":
              BEGIN
                ItemLedgEntry.RESET;
                ItemLedgEntry.SETRANGE("Entry No.","Source Ref. No.");
                PAGE.RUNMODAL(0,ItemLedgEntry);
              END;
            DATABASE::"Prod. Order Line":
              BEGIN
                ProdOrderLine.RESET;
                ProdOrderLine.SETRANGE(Status,"Source Subtype");
                ProdOrderLine.SETRANGE("Prod. Order No.","Source ID");
                ProdOrderLine.SETRANGE("Line No.","Source Prod. Order Line");
                PAGE.RUNMODAL(0,ProdOrderLine);
              END;
            DATABASE::"Prod. Order Component":
              BEGIN
                ProdOrderComp.RESET;
                ProdOrderComp.SETRANGE(Status,"Source Subtype");
                ProdOrderComp.SETRANGE("Prod. Order No.","Source ID");
                ProdOrderComp.SETRANGE("Prod. Order Line No.","Source Prod. Order Line");
                ProdOrderComp.SETRANGE("Line No.","Source Ref. No.");
                PAGE.RUNMODAL(0,ProdOrderComp);
              END;
            DATABASE::"Planning Component":
              BEGIN
                PlanningComponent.RESET;
                PlanningComponent.SETRANGE("Worksheet Template Name","Source ID");
                PlanningComponent.SETRANGE("Worksheet Batch Name","Source Batch Name");
                PlanningComponent.SETRANGE("Worksheet Line No.","Source Prod. Order Line");
                PlanningComponent.SETRANGE("Line No.","Source Ref. No.");
                PAGE.RUNMODAL(0,PlanningComponent);
              END;
            DATABASE::"Transfer Line":
              BEGIN
                TransLine.RESET;
                TransLine.SETRANGE("Document No.","Source ID");
                TransLine.SETRANGE("Line No.","Source Ref. No.");
                TransLine.SETRANGE("Derived From Line No.","Source Prod. Order Line");
                PAGE.RUNMODAL(0,TransLine);
              END;
            DATABASE::"Service Line":
              BEGIN
                ServLine.SETRANGE("Document Type","Source Subtype");
                ServLine.SETRANGE("Document No.","Source ID");
                ServLine.SETRANGE("Line No.","Source Ref. No.");
                PAGE.RUNMODAL(0,ServLine);
              END;
            DATABASE::"Job Planning Line":
              BEGIN
                JobPlanningLine.SETRANGE(Status,"Source Subtype");
                JobPlanningLine.SETRANGE("Job No.","Source ID");
                JobPlanningLine.SETRANGE("Job Contract Entry No.","Source Ref. No.");
                PAGE.RUNMODAL(0,JobPlanningLine);
              END;
            DATABASE::"Assembly Header":
              BEGIN
                AssemblyHeader.SETRANGE("Document Type","Source Subtype");
                AssemblyHeader.SETRANGE("No.","Source ID");
                PAGE.RUNMODAL(0,AssemblyHeader);
              END;
            DATABASE::"Assembly Line":
              BEGIN
                AssemblyLine.SETRANGE("Document Type","Source Subtype");
                AssemblyLine.SETRANGE("Document No.","Source ID");
                AssemblyLine.SETRANGE("Line No.","Source Ref. No.");
                PAGE.RUNMODAL(0,AssemblyLine);
              END;
          END;
    end;

    local procedure QuantityBaseOnAfterValidate();
    begin
        CurrPage.UPDATE;
    end;

    procedure CalcExpirationDate();
    begin

        //IF RecGItem.GET("Item No.") THEN
        //  IntdelaiEpirReserv := RecGItem."Age Réservation VN (jours)";

        BoolExpired := FALSE ;
        RecGSalesLine.RESET;
        RecGSalesHeader.RESET;
        RecGParamExpirReservVN.RESET;


        IF ("Source Type" = 37) AND ("Source Subtype" = 1) THEN
          IF RecGSalesHeader.GET(RecGSalesHeader."Document Type"::Order,"Source ID") AND
             RecGSalesLine.GET(RecGSalesLine."Document Type"::Order,"Source ID","Source Ref. No.") THEN
            BEGIN
              IF RecGParamExpirReservVN.GET(RecGSalesLine."Bin Code",RecGSalesHeader."Type Paiement") THEN
                BEGIN

                IF RecGParamExpirReservVN."Base de calcule" = RecGParamExpirReservVN."Base de calcule"::"Date Reservation" THEN
                  BEGIN
                    IntdelaiEpirReserv := RecGParamExpirReservVN."Délais d'expiration" ;
                    IntExpireDans := CALCDATE('<+'+ FORMAT(IntdelaiEpirReserv) + 'D>',"Creation Date") - TODAY;
                    IF   IntExpireDans < 0 THEN
                      BoolExpired := TRUE ;

                  END;

                // si base de calcule date de
                IF RecGParamExpirReservVN."Base de calcule" = RecGParamExpirReservVN."Base de calcule"::"Date Réception prévue" THEN
                  BEGIN
                    // recupérér la date de reception de la commande achat.
                    IF ( RecGReservEntries."Source Type" = 39 ) AND (RecGReservEntries."Source Subtype" = 1) THEN
                      BEGIN
                        RecGPurchdr.GET(RecGPurchdr."Document Type"::Order,RecGReservEntries."Source ID");

                        IntdelaiEpirReserv := RecGParamExpirReservVN."Délais d'expiration" ;
                        IntExpireDans := CALCDATE('<+'+ FORMAT(IntdelaiEpirReserv) + 'D>',RecGPurchdr."Requested Receipt Date") - TODAY;
                        IF   IntExpireDans < 0 THEN
                          BoolExpired := TRUE ;
                      END ;
                  END;

                 END ELSE IntdelaiEpirReserv := 0 ;

            END
              ELSE IntdelaiEpirReserv := 0 ;
    end;
}

