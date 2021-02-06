page 60152 "VIN Disponible sans Carte gris"
{
    // version NAVW17.00,MAZDA13,MAZDA13.1

    CaptionML = ENU='Item Tracking Summary',
                FRA='Disponibilité VIN';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Table338;
    SourceTableTemporary = true;
    SourceTableView = SORTING(Source ID,Source Type);

    layout
    {
        area(content)
        {
            group()
            {
                field(TypeDoc;TypeDoc)
                {
                    Caption = 'Type document';

                    trigger OnValidate();
                    begin
                        IF TypeDoc = TypeDoc::"Commandes Vente" THEN BEGIN
                          SETRANGE("Source Type",37)
                        END ELSE IF TypeDoc = TypeDoc::"Factures Enregistrés" THEN BEGIN
                          SETRANGE("Source Type",32)
                        END ELSE
                          SETRANGE("Source Type");

                        CurrPage.UPDATE(FALSE)
                    end;
                }
                field(NoDoc;NoDoc)
                {
                    Caption = 'No Document';

                    trigger OnValidate();
                    begin

                        IF NoDoc <> '' THEN BEGIN
                          SETRANGE("Source ID",NoDoc);
                        END ELSE BEGIN
                          SETRANGE("Source ID");
                        END;

                        CurrPage.UPDATE(FALSE)
                    end;
                }
            }
            repeater()
            {
                Editable = false;
                field("Sélectionner";MARK)
                {
                }
                field("Serial No.";"Serial No.")
                {
                    Editable = false;
                }
                field(Statut_PVN;Statut_PVN)
                {
                    Caption = 'Statut_PVN';
                }
                field("Source ID";"Source ID")
                {
                }
                field(Status;Status)
                {
                }
                field("Item No.";"Item No.")
                {
                }
                field("Variant Code";"Variant Code")
                {
                }
                field("Location Code";"Location Code")
                {
                }
                field("Source Type";"Source Type")
                {
                    Visible = false;
                }
                field("Source Subtype From 337";"Source Subtype From 337")
                {
                    Visible = false;
                }
                field("Item Ledger Entry No.";"Item Ledger Entry No.")
                {
                    Visible = false;
                }
                field("Created By";"Created By")
                {
                    Visible = false;
                }
                field("Centre de gestion";"Centre de gestion")
                {
                }
                field("Changed By";"Changed By")
                {
                    Visible = false;
                }
                field("Source Ref. No.";"Source Ref. No.")
                {
                    Visible = false;
                }
                field("Sell-to Customer No.";"Sell-to Customer No.")
                {
                }
                field(Name;Name)
                {
                }
                field("Bill-to Customer No.";"Bill-to Customer No.")
                {
                }
                field("Bill-to Name";"Bill-to Name")
                {
                }
                field("Type Paiement";"Type Paiement")
                {
                }
                field("Frais immatriculation";"Frais immatriculation")
                {
                }
                field("Frais Redevence Comp. Véhicule";"Frais Redevence Comp. Véhicule")
                {
                }
                field("Frais TME";"Frais TME")
                {
                }
                field(Campagne;GBoolCampagne)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sélectionner")
            {
                Image = SelectEntries;
                Promoted = true;
                PromotedIsBig = true;
                ShortCutKey = 'Ctrl+g';

                trigger OnAction();
                var
                    Rec338LOCAL : Record "338" temporary;
                begin
                    MARK(NOT MARK)
                end;
            }
            action("Tous Sélectionner")
            {
                Image = SelectField;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    IF FINDSET THEN
                    REPEAT
                      MARK(NOT MARK)
                    UNTIL NEXT = 0;
                end;
            }
            action("Filtrer sur Sélectionner")
            {
                Image = FilterLines;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    MARKEDONLY(NOT MARKEDONLY)
                end;
            }
            action("Supprimer la sélection")
            {
                Image = Delete;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction();
                begin
                    CLEARMARKS
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        //"Document No.HideValue" := FALSE;
        //DocumentNoOnFormat;
        GBoolCampagne:=FALSE;
        ServiceItem.RESET;
        ServiceItem.SETRANGE("Serial No.","Serial No.");
        IF ServiceItem.FINDFIRST THEN BEGIN
          Statut_PVN := FORMAT(ServiceItem."Statut PVN");
          ServiceItem.CALCFIELDS(Compagne);
          GBoolCampagne:=ServiceItem.Compagne;
        END;
    end;

    trigger OnInit();
    var
        Rec336Temp : Record "336";
    begin
    end;

    trigger OnOpenPage();
    begin
        CurrPage.LOOKUPMODE(TRUE);
        //SM 070917
        IF Type = Type::PVN THEN BEGIN
          SETRANGE("Dossier Validé",TRUE);
        END;
        //END SM
    end;

    trigger OnQueryClosePage(CloseAction : Action) : Boolean;
    begin
        IF CloseAction IN [ACTION::OK] THEN
          BEGIN
            CASE Type OF
              Type::"Carte grise" : InsererLigneCarteGrise;
              Type::PVN           : InsererLigneBordPVN;
            END;
          END;
    end;

    var
        TempReservEntry : Record "337" temporary;
        ItemTrackingDataCollection : Codeunit "6501";
        CurrItemTrackingCode : Record "6502";
        MaxQuantity : Decimal;
        SelectedQuantity : Decimal;
        CurrBinCode : Code[20];
        xFilterRec : Record "338";
        [InDataSet]
        "Selected QuantityVisible" : Boolean;
        [InDataSet]
        "Bin ContentVisible" : Boolean;
        [InDataSet]
        MaxQuantity1Visible : Boolean;
        [InDataSet]
        Selected1Visible : Boolean;
        [InDataSet]
        Undefined1Visible : Boolean;
        [InDataSet]
        "Selected QuantityEditable" : Boolean;
        "Document No.HideValue" : Boolean;
        Temp338 : Record "338" temporary;
        PositionRec : Text[250];
        RecGCarteGriseEnt : Record "60015";
        TypeDoc : Option " ","Commandes Vente","Factures Enregistrés";
        NoDoc : Code[20];
        RecBordereauPVN : Record "70021";
        Type : Option "Carte grise",PVN;
        Statut_PVN : Text;
        ServiceItem : Record "5940";
        GBoolCampagne : Boolean;
        RecSalesLine : Record "113";
        LrecSalesReceivablesSetup : Record "311";

    procedure SetSources(var ReservEntry : Record "337";var EntrySummary : Record "338";var CarteGriseEnt : Record "60015";EntryTypeToInsert : Integer);
    var
        xEntrySummary : Record "338";
        RecLigneCarteExistVIN : Record "60016";
    begin
        Type := EntryTypeToInsert;

        RecGCarteGriseEnt := CarteGriseEnt;

        TempReservEntry.RESET;
        TempReservEntry.DELETEALL;
        IF ReservEntry.FIND('-') THEN
          REPEAT
            TempReservEntry := ReservEntry;
            TempReservEntry.INSERT;
          UNTIL ReservEntry.NEXT = 0;

        xEntrySummary.SETVIEW(GETVIEW);
        RESET;
        DELETEALL;
        IF EntrySummary.FINDSET THEN
          REPEAT
            RecLigneCarteExistVIN.RESET;
            RecLigneCarteExistVIN.SETRANGE(VIN,EntrySummary."Serial No.");
            IF RecLigneCarteExistVIN.ISEMPTY THEN BEGIN
              Rec := EntrySummary;
              INSERT;
            END;
          UNTIL EntrySummary.NEXT = 0;
        SETVIEW(xEntrySummary.GETVIEW);
    end;

    local procedure IsFirstDocLine() : Boolean;
    var
        RecL338 : Record "338" temporary;
    begin
        RecL338.COPY(Rec);


        Temp338.RESET;
        Temp338.COPYFILTERS(Rec);
        Temp338.SETRANGE("Source ID","Source ID");
        IF NOT Temp338.FINDFIRST THEN BEGIN
          RecL338.RESET;
          RecL338.COPYFILTERS(Rec);
          RecL338.SETRANGE("Source ID","Source ID");
          IF RecL338.FINDFIRST THEN BEGIN
            Temp338:= RecL338;
            Temp338.INSERT;
          END;
        END;

        IF "Entry No." = Temp338."Entry No." THEN
          EXIT(TRUE);
    end;

    local procedure DocumentNoOnFormat();
    begin
        IF NOT IsFirstDocLine THEN
          "Document No.HideValue" := TRUE;
    end;

    procedure InsererLigneCarteGrise();
    var
        RecLigneCarte : Record "60016";
        MaxLigneNum : Integer;
        RecFicheTechnique : Record "50032";
        ItemCharge : Record "5800";
        Customer : Record "18";
        Titre : Record "60085";
    begin
          MARKEDONLY(TRUE);


          IF FINDFIRST THEN BEGIN
            RecLigneCarte.RESET;
            RecLigneCarte.SETRANGE("N° Bordereau",RecGCarteGriseEnt."N° Bordereau");
            IF RecLigneCarte.FINDLAST THEN
              MaxLigneNum := RecLigneCarte."N° Ligne" + 10000
            ELSE
              MaxLigneNum := 10000;
            REPEAT
                RecLigneCarte.INIT;
                RecLigneCarte."N° Bordereau" := RecGCarteGriseEnt."N° Bordereau";
                RecLigneCarte."N° Ligne"     := MaxLigneNum;
                RecLigneCarte.VIN            := "Serial No.";
                //RecLigneCarte.Statut
                RecLigneCarte."Modèle Véhicule" := "Item No.";
                RecLigneCarte."Code Variant"    := "Variant Code";
                RecLigneCarte."Location Code"   := "Location Code";

                RecLigneCarte."Item No."                := "Item No.";
                RecLigneCarte."Location Code"           := "Location Code";
                RecLigneCarte."Source Type"             := "Source Type";
                RecLigneCarte."Source Subtype From 337" := "Source Subtype From 337";
                RecLigneCarte."Source ID"               := "Source ID";
                RecLigneCarte."Item Ledger Entry No."   := "Item Ledger Entry No.";
                RecLigneCarte."Created By"              := "Created By";
                RecLigneCarte."Changed By"              := "Changed By";
                RecLigneCarte."Variant Code"            := "Variant Code";
                RecLigneCarte."Source Ref. No."         := "Source Ref. No.";
                RecLigneCarte."Sell-to Customer No."    := "Sell-to Customer No.";
                RecLigneCarte.Name                    := Name;
                RecLigneCarte.Status                  := Status;
                RecLigneCarte."Bill-to Customer No."    := "Bill-to Customer No.";
                RecLigneCarte."Bill-to Name"            := "Bill-to Name";
                RecLigneCarte."Type Paiement"           := "Type Paiement";
                RecLigneCarte."Responsibility Center"   := "Centre de gestion";
                RecFicheTechnique.GET("Item No.");
                RecLigneCarte."Frais immatriculation"          := RecFicheTechnique."Frais immatriculation";

                Customer.GET("Sell-to Customer No.");
                Titre.GET(Customer."Code Titre");
                IF Titre."Frais TME" THEN
                    RecLigneCarte."Frais TME"                      := RecFicheTechnique."Frais energie";
                //<<frais 3DT
                IF Titre."Frais Redevence" THEN
                RecLigneCarte."Frais Redevence Comp. Véhicule" := RecFicheTechnique."Frais Red. Grosse Cylindrée";
                LrecSalesReceivablesSetup.GET;
                RecSalesLine.RESET;
                RecSalesLine.SETRANGE("Document No.","Source ID");
                RecSalesLine.SETRANGE("Sell-to Customer No.","Sell-to Customer No.");
                RecSalesLine.SETRANGE(Type,RecSalesLine.Type::"Charge (Item)");
                RecSalesLine.SETRANGE("No.",LrecSalesReceivablesSetup."Autre Frais");
                IF RecSalesLine.FINDFIRST THEN
                  RecLigneCarte."Autre Frais" := LrecSalesReceivablesSetup."Montant autre Frais";




                IF RecLigneCarte."Autre Frais" = 0 THEN
                BEGIN
                    CLEAR(ItemCharge);
                    ItemCharge.SETRANGE(ItemCharge."Remplacé par",LrecSalesReceivablesSetup."Autre Frais");
                    IF ItemCharge.FINDFIRST THEN
                     BEGIN
                          RecSalesLine.RESET;
                          RecSalesLine.SETRANGE("Document No.","Source ID");
                          RecSalesLine.SETRANGE("Sell-to Customer No.","Sell-to Customer No.");
                          RecSalesLine.SETRANGE(Type,RecSalesLine.Type::"Charge (Item)");
                          RecSalesLine.SETRANGE("No.",ItemCharge."No.");
                          IF RecSalesLine.FINDFIRST THEN
                           RecLigneCarte."Autre Frais" := LrecSalesReceivablesSetup."Montant autre Frais";
                    END;
                  END;

                //>>


                MaxLigneNum += 10000;
                RecLigneCarte.INSERT(TRUE);
            UNTIL  NEXT = 0;
          END;
    end;

    procedure SetSources2(var ReservEntry : Record "337";var EntrySummary : Record "338";var BordPVN : Record "70021";EntryTypeToInsert : Integer);
    var
        xEntrySummary : Record "338";
        LignesBordPVN : Record "70022";
        ServiceItem : Record "5940";
    begin
        Type := EntryTypeToInsert;

        RecBordereauPVN := BordPVN;

        TempReservEntry.RESET;
        TempReservEntry.DELETEALL;
        IF ReservEntry.FIND('-') THEN
          REPEAT
            TempReservEntry := ReservEntry;
            TempReservEntry.INSERT;
          UNTIL ReservEntry.NEXT = 0;

        xEntrySummary.SETVIEW(GETVIEW);
        RESET;
        DELETEALL;
        IF EntrySummary.FINDSET THEN
          REPEAT

            LignesBordPVN.RESET;
            LignesBordPVN.SETRANGE(VIN,EntrySummary."Serial No.");
            IF LignesBordPVN.ISEMPTY THEN BEGIN
              Rec := EntrySummary;
              INSERT;
            END;
          UNTIL EntrySummary.NEXT = 0;
        SETVIEW(xEntrySummary.GETVIEW);
    end;

    procedure InsererLigneBordPVN();
    var
        LignebordereauPVN : Record "70022";
        MaxLigneNum : Integer;
        ServiceItem : Record "5940";
        RecFicheTechnique : Record "50032";
    begin
          MARKEDONLY(TRUE);

          IF FINDFIRST THEN BEGIN
            LignebordereauPVN.RESET;
            LignebordereauPVN.SETRANGE("N° Bordereau",RecBordereauPVN."N° Bordereau");
            IF LignebordereauPVN.FINDLAST THEN
              MaxLigneNum := LignebordereauPVN."N° Ligne" + 10000
            ELSE
              MaxLigneNum := 10000;
            REPEAT
                LignebordereauPVN.INIT;
                LignebordereauPVN."N° Bordereau" := RecBordereauPVN."N° Bordereau";
                LignebordereauPVN."N° Ligne"     := MaxLigneNum;
                LignebordereauPVN.VIN            := "Serial No.";
                //RecLigneCarte.Statut
                LignebordereauPVN."Modèle Véhicule" := "Item No.";
                LignebordereauPVN."Code Variant"    := "Variant Code";
                LignebordereauPVN."Location Code"   := "Location Code";

                LignebordereauPVN."Item No."                := "Item No.";
                LignebordereauPVN."Location Code"           := "Location Code";
                LignebordereauPVN."Source Type"             := "Source Type";
                LignebordereauPVN."Source Subtype From 337" := "Source Subtype From 337";
                LignebordereauPVN."Source ID"               := "Source ID";
                LignebordereauPVN."Item Ledger Entry No."   := "Item Ledger Entry No.";
                LignebordereauPVN."Created By"              := "Created By";
                LignebordereauPVN."Changed By"              := "Changed By";
                LignebordereauPVN."Variant Code"            := "Variant Code";
                LignebordereauPVN."Source Ref. No."         := "Source Ref. No.";
                LignebordereauPVN."Sell-to Customer No."    := "Sell-to Customer No.";
                LignebordereauPVN.Name                      := Name;
                LignebordereauPVN.Status                    := Status;
                LignebordereauPVN."Bill-to Customer No."    := "Bill-to Customer No.";
                LignebordereauPVN."Bill-to Name"            := "Bill-to Name";
                LignebordereauPVN."Type Paiement"           := "Type Paiement";
                LignebordereauPVN."Responsibility Center"   := "Centre de gestion";

                //LignebordereauPVN."Frais immatriculation"          := "Frais immatriculation";
                //LignebordereauPVN."Frais Redevence Comp. Véhicule" := "Frais Redevence Comp. Véhicule";
                //LignebordereauPVN."Frais TME"                      := "Frais TME";
                RecFicheTechnique.GET("Item No.");
                LignebordereauPVN."Frais immatriculation"          := RecFicheTechnique."Frais immatriculation";
                LignebordereauPVN."Frais Redevence Comp. Véhicule" := RecFicheTechnique."Frais Red. Grosse Cylindrée";
                LignebordereauPVN."Frais TME"                      := RecFicheTechnique."Frais energie";
                MaxLigneNum += 10000;
                //Update statut PVN service Item
                ServiceItem.RESET;
                ServiceItem.SETRANGE("Serial No.","Serial No.");
                ServiceItem.FINDFIRST;
                ServiceItem.TESTFIELD("Statut PVN",0);
                ServiceItem."Statut PVN"    := 1 ;
                ServiceItem."No. Bord. PVN" := RecBordereauPVN."N° Bordereau";
                ServiceItem.MODIFY;
                //KT 310717 OLD LignebordereauPVN.INSERT;
                LignebordereauPVN.INSERT(TRUE);
            UNTIL  NEXT = 0;
          END;
    end;
}

