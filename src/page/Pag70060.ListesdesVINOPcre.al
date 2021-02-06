page 70060 "Listes des VIN OP crée"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Table5940;
    SourceTableView = WHERE(Statut PVN=FILTER(Encours de préparation|Ordre de préparation crée),
                            Accepté=CONST(No),
                            Préparation/Livraison=CONST(" "));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No Préparation";"No Préparation")
                {
                    Caption = 'No Préparation (OR)';
                }
                field("Commande Service PVN";"Commande Service PVN")
                {
                }
                field("No.";"No.")
                {
                    Visible = false;
                }
                field("Serial No.";"Serial No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Couleur et garnissage";"Couleur et garnissage")
                {
                    Editable = false;
                }
                field(Chez;Emplacement)
                {
                    CaptionML = ENU='Chez',
                                FRA='Chez';
                }
                field("Customer No.";"Customer No.")
                {
                }
                field("Location of Service Item";"Location of Service Item")
                {
                }
                field("Statut PVN";"Statut PVN")
                {
                    Visible = false;
                }
                field("Préparation/Livraison";"Préparation/Livraison")
                {
                }
                field("Statut Carte Grise";"Statut Carte Grise")
                {
                }
                field("Date Mise en Circulation";"Date Mise en Circulation")
                {
                }
                field("No. Bord. PVN";"No. Bord. PVN")
                {
                }
                field("Date Emission Bord. PVN";"Date Emission Bord. PVN")
                {
                }
                field("Heure Emission Bord. PVN";"Heure Emission Bord. PVN")
                {
                }
                field(Emplacement;GetBin("Serial No."))
                {
                    CaptionML = ENU='Emplacement',
                                FRA='Emplacement';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Fiche véhicule")
            {
                Image = Shipment;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page 70067;
                RunPageLink = No.=FIELD(No.);
            }
            action("Crées Ordre de préparation")
            {
                Image = PostedShipment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    RecPreparationVN : Record "60025";
                begin
                    TESTFIELD("Statut PVN","Statut PVN"::"Préparation lancée");

                    IF (Emplacement=Emplacement::"Chez Aures Auto") THEN
                    BEGIN
                      CLEAR(RecPreparationVN);
                      RecPreparationVN.SETRANGE(VIN,"Serial No.");
                      IF NOT RecPreparationVN.FINDFIRST THEN
                      BEGIN
                          IF CONFIRM(TXT50000)THEN
                          BEGIN
                              CLEAR(RecPreparationVN);
                              RecPreparationVN."Service Type":=RecPreparationVN."Service Type"::Préparation;
                              RecPreparationVN.VALIDATE(VIN,"Serial No.");
                              IF RecPreparationVN.INSERT(TRUE) THEN
                              BEGIN
                                  PAGE.RUN(PAGE::"Fiche Preparation VN",RecPreparationVN);
                                  "No Préparation" := RecPreparationVN."Preparation No";
                                  "Statut PVN" := "Statut PVN"::"Ordre de préparation crée";
                                  MODIFY;
                              END;
                          END;
                      END ELSE ERROR(TXT50001,RecPreparationVN."Preparation No","Serial No.");
                    END
                    ELSE ERROR(TXT50002);
                end;
            }
            action("Consulter Ordre de préparation")
            {
                Image = OpenWorksheet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction();
                var
                    RecPreparationVN : Record "60025";
                    ServiceItem : Record "5940";
                begin
                    CLEAR(RecPreparationVN);
                    RecPreparationVN.SETRANGE("Service Type",RecPreparationVN."Service Type"::Préparation);
                    RecPreparationVN.SETRANGE("Preparation No","No Préparation");

                    IF RecPreparationVN.FINDFIRST THEN
                    BEGIN
                         PAGE.RUN(PAGE::"Fiche Preparation VN",RecPreparationVN);
                    END ELSE ERROR(TXT50003);
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        //SM 18/09/2015
        RecShipmentInvoiced.RESET;
        RecShipmentInvoiced.SETRANGE("Shipment No.","Sales/Serv. Shpt. Document No.");
        RecShipmentInvoiced.SETRANGE("Shipment Line No.","Sales/Serv. Shpt. Line No.");
        IF RecShipmentInvoiced.FINDFIRST THEN BEGIN
          IF RecSalesInvoiceHeader.GET(RecShipmentInvoiced."Invoice No.") THEN BEGIN
            IF RecSalesInvoiceLine.GET(RecShipmentInvoiced."Invoice No.",RecShipmentInvoiced."Invoice Line No.") THEN BEGIN
              NoFacture    := RecSalesInvoiceHeader."No.";
              DateFacture  := RecSalesInvoiceHeader."Posting Date";
              Magasin      := RecSalesInvoiceHeader."Item Source Location";
              BinCode      := RecSalesInvoiceLine."Bin Code";
            END;
          END;
        END ELSE BEGIN
          NoFacture    := '';
          DateFacture  := 0D;
          Magasin      := '';
          BinCode  := '';
        END;
        //END SM
    end;

    var
        TXT50000 : Label 'Voulez-vous crée un ordre de préparation ?';
        TXT50001 : Label '"Il existe ordre de préparation N° %1 pour le véhicule N° %2 "';
        TXT50002 : Label 'Véhicule est déja préparé';
        TXT50003 : Label 'Ordre de préparation n''est pas encore crée !';
        RecSalesInvoiceHeader : Record "112";
        RecSalesInvoiceLine : Record "113";
        RecShipmentInvoiced : Record "10825";
        NoLivraison : Code[20];
        NoFacture : Code[20];
        DateFacture : Date;
        Magasin : Code[20];
        BinCode : Code[20];
}

