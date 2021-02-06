page 60137 "Liste des Preparation VN"
{
    // version Preparation VN

    Caption = 'liste des Preparation VN';
    CardPageID = "Fiche Preparation VN";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table60025;
    SourceTableView = SORTING(Preparation No)
                      WHERE(Service Type=CONST(Préparation),
                            Existe Fiche Livraison=CONST(No));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Preparation No";"Preparation No")
                {
                    Editable = false;
                }
                field(VIN;VIN)
                {
                    CaptionML = ENU='VIN',
                                FRA='VIN';
                    Editable = false;
                }
                field("Status Préparation";"Status Préparation")
                {
                    Editable = false;
                }
                field("Vehicle No.";"Vehicle No.")
                {
                    Editable = false;
                }
                field("Service Item Description";"Service Item Description")
                {
                    CaptionML = ENU='Service Item Description',
                                FRA='Désignation';
                    Editable = false;
                }
                field("Creation date";"Creation date")
                {
                    Editable = false;
                }
                field("Created By";"Created By")
                {
                    Editable = false;
                }
                field("Responsibility Center";"Responsibility Center")
                {
                    Editable = false;
                }
                field("Existe Fiche Livraison";"Existe Fiche Livraison")
                {
                    Editable = false;
                }
                field("N° Matriculation";"N° Matriculation")
                {
                    Editable = false;
                }
                field("No Client";NoClient)
                {
                    TableRelation = Customer;
                }
                field("Nom CLient";NomCLient)
                {
                }
                field("Date Facturation";DateFacturation)
                {
                }
                field("No Demande VIN";"No Demande VIN")
                {
                }
                field(Demandé;Demandé)
                {
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sélectionner VIN à Livrer")
            {
                Visible = AfficherSelectionVIN;

                trigger OnAction();
                var
                    PSelectListePVN : Page "50073";
                begin
                    RecUserSetup.GET(USERID);
                    IF NOT RecUserSetup."Approbation Livraison VN" THEN
                      ERROR(TXT50002);

                    PSelectListePVN.RUN;
                end;
            }
            action("Imprimer demande livraison")
            {
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction();
                begin
                    RecPrepVN.RESET;
                    RecPrepVN.SETRANGE("No Demande VIN","No Demande VIN");
                    RecPrepVN.SETRANGE("Service Type","Service Type"::Préparation);
                    RecPrepVN.SETRANGE("Existe Fiche Livraison",FALSE);
                    IF RecPrepVN.FINDFIRST THEN
                      REPORT.RUN(50094,TRUE,TRUE,RecPrepVN);

                    IF RecPrepVN.FINDSET THEN
                      RecPrepVN.MODIFYALL("Date remise véhicule",CURRENTDATETIME);
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        //SM
        RecItemLedgerEntry.RESET;
        RecItemLedgerEntry.SETCURRENTKEY("Serial No.");
        RecItemLedgerEntry.SETRANGE("Serial No.",VIN);
        RecItemLedgerEntry.SETRANGE("Entry Type",RecItemLedgerEntry."Entry Type"::Sale);
        RecItemLedgerEntry.SETRANGE("Document Type",RecItemLedgerEntry."Document Type"::"Sales Shipment");
        IF RecItemLedgerEntry.FINDLAST THEN BEGIN
          RecSalesShipmentHeader.GET(RecItemLedgerEntry."Document No.");
          NoClient := RecSalesShipmentHeader."Sell-to Customer No.";
          NomCLient := RecSalesShipmentHeader."Ship-to Name";
          DateFacturation := RecItemLedgerEntry."Posting Date";
        END ELSE BEGIN
          NoClient  := '';
          NomCLient := '';
          DateFacturation := 0D;
        END;
        //END SM
    end;

    trigger OnAfterGetRecord();
    begin
        //SM
        RecItemLedgerEntry.RESET;
        RecItemLedgerEntry.SETCURRENTKEY("Serial No.");
        RecItemLedgerEntry.SETRANGE("Serial No.",VIN);
        RecItemLedgerEntry.SETRANGE("Entry Type",RecItemLedgerEntry."Entry Type"::Sale);
        RecItemLedgerEntry.SETRANGE("Document Type",RecItemLedgerEntry."Document Type"::"Sales Shipment");
        IF RecItemLedgerEntry.FINDLAST THEN BEGIN
          RecSalesShipmentHeader.GET(RecItemLedgerEntry."Document No.");
          NoClient := RecSalesShipmentHeader."Sell-to Customer No.";
          NomCLient := RecSalesShipmentHeader."Ship-to Name";
          DateFacturation := RecItemLedgerEntry."Posting Date";
        END ELSE BEGIN
          NoClient  := '';
          NomCLient := '';
          DateFacturation := 0D;
        END;
        //END SM
    end;

    trigger OnOpenPage();
    begin

        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetServiceFilter);
          FILTERGROUP(0);
        END;

        //SM 24022016

        AfficherSelectionVIN := ((GETFILTER("Service Type") = FORMAT("Service Type"::Préparation))
         AND (GETFILTER("Status Préparation") = FORMAT("Status Préparation"::"Véhicule Préparée"))
         AND (GETFILTER("Existe Fiche Livraison")='Non')
         AND (GETFILTER(Accepté) = 'Non')
         AND (GETFILTER("CheckListe Validée") = 'Oui')
         AND (GETFILTER("N° Matriculation") = '<>''''')
         AND (GETFILTER(Demandé) = '')
         );
        //MESSAGE('%1 : %2',GETFILTER("N° Matriculation"),'<>''''');
        //END SM
    end;

    var
        UserMgt : Codeunit "5700";
        DemandeVisible : Boolean;
        NoClient : Code[20];
        DateFacturation : Date;
        RecItemLedgerEntry : Record "32";
        RecSalesShipmentHeader : Record "110";
        NomCLient : Text[100];
        RecUserSetup : Record "91";
        TXT50002 : Label 'Vous n''avez pas le droit de demander Véhicule';
        RecPrepVN : Record "60025";
        AfficherSelectionVIN : Boolean;
}

