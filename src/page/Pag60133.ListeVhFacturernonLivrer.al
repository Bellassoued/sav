page 60133 "Liste Véh Facturer non Livrer"
{
    // version Preparation VN,MAZDA301

    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Table5940;
    SourceTableView = SORTING(Item No.,Serial No.)
                      ORDER(Ascending)
                      WHERE(Emplacement=CONST(Chez Aures Auto),
                            Sales/Serv. Shpt. Document No.=FILTER(<>''),
                            Statut Carte Grise=FILTER(Envoyé|CHQ Préparé|Déposé|Reçue),
                            Status Préparation=FILTER(<>Véhicule Préparée));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No.";"No.")
                {
                }
                field(Description;Description)
                {
                }
                field("Serial No.";"Serial No.")
                {
                }
                field(Matricule;Matricule)
                {
                }
                field("Customer No.";"Customer No.")
                {
                }
                field(Name;Name)
                {
                }
                field(Emplacement;Emplacement)
                {
                }
                field("Préparation/Livraison";"Préparation/Livraison")
                {
                }
                field(NoPreparation;NoPreparation)
                {
                    Caption = 'N° Préparation';
                    StyleExpr = TextStyle;
                }
                field(StatusPrp;StatusPrp)
                {
                    Caption = 'Status préparation';
                    Editable = false;
                    StyleExpr = TextStyle;
                }
                field(NoLivraison;NoLivraison)
                {
                    Caption = 'N° Livraison';
                    StyleExpr = TextStyle;
                }
                field(StatusLiv;StatusLiv)
                {
                    Caption = 'Status Livraison';
                    StyleExpr = TextStyle;
                }
                field("Sales/Serv. Shpt. Document No.";"Sales/Serv. Shpt. Document No.")
                {
                }
                field("Statut Carte Grise";"Statut Carte Grise")
                {
                }
                field("Status Préparation";"Status Préparation")
                {
                }
                field("No Préparation";"No Préparation")
                {
                }
                field("No Facture VN";NoFacture)
                {
                }
                field("Date Facture VN";DateFacture)
                {
                }
                field(Magasin;Magasin)
                {
                }
                field("Code Emplacement";BinCode)
                {
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
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
                    IF (Emplacement=Emplacement::"Chez Aures Auto") AND ("Préparation/Livraison"="Préparation/Livraison"::" ") THEN
                    BEGIN
                      CLEAR(RecPreparationVN);
                      RecPreparationVN.SETRANGE(VIN,"Serial No.");
                      IF NOT RecPreparationVN.FINDFIRST THEN
                      BEGIN
                          IF CONFIRM('Voulez-vous crée un ordre de préparation ?')THEN
                          BEGIN
                              CLEAR(RecPreparationVN);
                              RecPreparationVN."Service Type":=RecPreparationVN."Service Type"::Préparation;
                              RecPreparationVN.VALIDATE(VIN,"Serial No.");
                              IF RecPreparationVN.INSERT(TRUE) THEN
                              BEGIN
                                  PAGE.RUN(PAGE::"Fiche Preparation VN",RecPreparationVN);
                              END;
                          END;
                      END ELSE ERROR('Il existe ordre de préparation N° %1 pour la véhicule N° %2 ',RecPreparationVN."Preparation No","Serial No.");
                    END
                    ELSE ERROR('Véhicule est déja préparer');
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
                begin
                    CLEAR(RecPreparationVN);
                    RecPreparationVN.SETRANGE("Service Type",RecPreparationVN."Service Type"::Préparation);
                    RecPreparationVN.SETRANGE("Preparation No",NoPreparation);

                    IF RecPreparationVN.FINDFIRST THEN
                    BEGIN
                         PAGE.RUN(PAGE::"Fiche Preparation VN",RecPreparationVN);
                    END ELSE ERROR('Pas d''ordre de préparation !');
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    var
        RecSalesInvoiceHeader : Record "112";
        RecSalesInvoiceLine : Record "113";
        RecShipmentInvoiced : Record "10825";
    begin
        //SM 18/09/2015
        RecShipmentInvoiced.RESET;
        RecShipmentInvoiced.SETRANGE("Shipment No.","Sales/Serv. Shpt. Document No.");
        RecShipmentInvoiced.SETRANGE("Shipment Line No.","Sales/Serv. Shpt. Line No.");
        IF RecShipmentInvoiced.FINDFIRST THEN BEGIN
          RecSalesInvoiceHeader.GET(RecShipmentInvoiced."Invoice No.");
          RecSalesInvoiceLine.GET(RecShipmentInvoiced."Invoice No.",RecShipmentInvoiced."Invoice Line No.");
          NoFacture    := RecSalesInvoiceHeader."No.";
          DateFacture  := RecSalesInvoiceHeader."Posting Date";
          Magasin      := RecSalesInvoiceHeader."Item Source Location";
          BinCode      := RecSalesInvoiceLine."Bin Code";
        END ELSE BEGIN
          NoFacture    := '';
          DateFacture  := 0D;
          Magasin      := '';
          BinCode      := '';
        END;
        //END SM
    end;

    trigger OnAfterGetRecord();
    var
        RecSalesInvoiceHeader : Record "112";
        RecSalesInvoiceLine : Record "113";
        RecShipmentInvoiced : Record "10825";
    begin

        // GMED --> Information sur différent status de N° chassi ( préparation et livraison)

        NoPreparation :='';
        NoLivraison := '';

         CLEAR(RecGPréparationVN);
         RecGPréparationVN.SETRANGE(VIN,"Serial No.");
         IF RecGPréparationVN.FINDFIRST THEN
          BEGIN
            IF  RecGPréparationVN."Service Type" = RecGPréparationVN."Service Type"::Préparation THEN
              BEGIN
                 StatusPrp := FORMAT(RecGPréparationVN."Status Préparation");
                 NoPreparation := RecGPréparationVN."Preparation No";
              END
            ELSE
              BEGIN
                 StatusLiv := FORMAT(RecGPréparationVN."Status Livraison");
                 NoLivraison := RecGPréparationVN."Preparation No";
              END
          END
         ELSE
          BEGIN
              StatusPrp := 'Non préparer';
              StatusLiv := 'Non Livrer';
          END;

        // GMED ---> couleur de ligne selon status
        TextStyle :=SetStyle();


        //SM 18/09/2015
        RecShipmentInvoiced.RESET;
        RecShipmentInvoiced.SETRANGE("Shipment No.","Sales/Serv. Shpt. Document No.");
        RecShipmentInvoiced.SETRANGE("Shipment Line No.","Sales/Serv. Shpt. Line No.");
        IF RecShipmentInvoiced.FINDFIRST THEN BEGIN
          RecSalesInvoiceHeader.GET(RecShipmentInvoiced."Invoice No.");
          RecSalesInvoiceLine.GET(RecShipmentInvoiced."Invoice No.",RecShipmentInvoiced."Invoice Line No.");
          NoFacture    := RecSalesInvoiceHeader."No.";
          DateFacture  := RecSalesInvoiceHeader."Posting Date";
          Magasin      := RecSalesInvoiceHeader."Item Source Location";
          BinCode      := RecSalesInvoiceLine."Bin Code";
        END ELSE BEGIN
          NoFacture    := '';
          DateFacture  := 0D;
          Magasin      := '';
          BinCode  := '';
        END;
        //END SM
    end;

    var
        "RecGPréparationVN" : Record "60025";
        StatusPrp : Text;
        StatusLiv : Text;
        TextStyle : Text;
        NoPreparation : Code[20];
        NoLivraison : Code[20];
        NoFacture : Code[20];
        DateFacture : Date;
        Magasin : Code[20];
        BinCode : Code[20];

    procedure SetStyle() : Text;
    begin

        IF StatusPrp <> 'Non préparer' THEN EXIT('StandardAccent');
        IF StatusLiv = 'Livrée' THEN EXIT('Favorable');
    end;
}

