page 60162 "Historique Chassis"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTable = Table60038;

    layout
    {
        area(content)
        {
            group()
            {
                field("Numéro de chassis1";TxtNumChassis)
                {

                    trigger OnValidate();
                    begin
                        DELETEALL;
                        IF TxtNumChassis = '' THEN
                          ERROR('vous devez saisir un numéro de chassis');

                        //<< TRIUM RAD 22/08/2014 - Traitement des écriture articles
                        IntnumSsequence := 1 ;
                        RecGItemLedentry.SETCURRENTKEY("Item No.","Location Code","Serial No.","Lot No.","Posting Date");
                        RecGItemLedentry.SETRANGE(RecGItemLedentry."Serial No.",TxtNumChassis);
                        IF RecGItemLedentry.FINDSET THEN
                          BEGIN
                            IF RecGItemVariant.GET(RecGItemLedentry."Item No.",RecGItemLedentry."Variant Code") THEN
                              TxtDescription := RecGItemVariant.Description ;

                            ModèleVehicule := RecGItemLedentry."Item No." ;
                            VarianteVehicule := RecGItemLedentry."Variant Code" ;

                            REPEAT
                              INIT;
                              "Entry No." := IntnumSsequence;
                              "Modèle Vehicule" := RecGItemLedentry."Item No." ;
                              "Code Variante" :=   RecGItemLedentry."Variant Code" ;
                              "Numéro de chassis" :=  RecGItemLedentry."Serial No." ;
                              //"Type operation" :=
                              "Date operation" :=  RecGItemLedentry."Posting Date" ;
                              "Numero document" := RecGItemLedentry."Document No." ;
                              "statut service" :=  ' ';
                              //Montant :=
                              Provenance :=  RecGItemLedentry."Location Code" ;
                             // Destination :=
                             // Kilométrage :=
                              "Entry Type" := RecGItemLedentry."Entry Type" ;
                              "Document Type" := RecGItemLedentry."Document Type" ;
                              "Order Type" := RecGItemLedentry."Order Type" ;
                              "Table source" :=  FORMAT(DATABASE::"Item Ledger Entry") ;
                              //SM ADD
                              IF RecGItemLedentry."Document Type" = RecGItemLedentry."Document Type"::"Sales Shipment" THEN BEGIN
                                "No BL"        :=  RecGItemLedentry."Document No.";
                                RecShipmentInvoiced.RESET;
                                RecShipmentInvoiced.SETRANGE(RecShipmentInvoiced."Shipment No.",RecGItemLedentry."Document No.");
                                IF RecShipmentInvoiced.FINDFIRST THEN
                                  "No Facture"   := RecShipmentInvoiced."Invoice No.";
                              END;
                              //END SM

                              INSERT ;
                              IntnumSsequence +=1 ;
                            UNTIL RecGItemLedentry.NEXT = 0 ;
                          END;

                        //SM Montage Démontage
                        RecPostedItemjournalHeader.RESET;
                        RecPostedItemjournalHeader.SETRANGE("Numero de Chassis",TxtNumChassis);
                        IF RecPostedItemjournalHeader.FINDSET THEN BEGIN
                          REPEAT
                            INIT;
                            "Entry No."         := IntnumSsequence;
                            "Modèle Vehicule"   := RecPostedItemjournalHeader."Modèle Vehicule";
                            "Code Variante"     := '' ;
                            "Numéro de chassis" := TxtNumChassis ;
                            "Entry Type"        := "Entry Type"::Service ;
                            "Date operation"    := RecPostedItemjournalHeader."Date comptabilisation" ;
                            "Numero document"   := RecPostedItemjournalHeader."N°";
                            "Table source"      :=  FORMAT(DATABASE::"Posted Item journal Header") ;
                            INSERT;
                            IntnumSsequence     += 1;
                          UNTIL RecPostedItemjournalHeader.NEXT = 0;
                        END;
                        //<< TRIUM RAD 22/08/2014 - Traitement des reclassements de stock

                        //OLD RecGWarehouseEntry.SETCURRENTKEY("Item No.","Bin Code","Location Code","Variant Code","Unit of Measure Code","Lot No.","Serial No.","Entry Type",Dedicated);
                        RecGWarehouseEntry.SETCURRENTKEY("Serial No.");
                        RecGWarehouseEntry.SETRANGE(RecGWarehouseEntry."Serial No.",TxtNumChassis);
                        RecGWarehouseEntry.SETRANGE(RecGWarehouseEntry."Entry Type",RecGWarehouseEntry."Entry Type"::Movement);
                        IF RecGWarehouseEntry.FINDSET THEN
                          REPEAT
                            INIT;
                            "Entry No." := IntnumSsequence;
                            "Modèle Vehicule" := RecGWarehouseEntry."Item No."  ;
                            "Code Variante" :=   RecGWarehouseEntry."Variant Code" ;
                            "Numéro de chassis" := TxtNumChassis ;
                            "Date operation" :=  RecGWarehouseEntry."Registering Date" ;
                            "Numero document" := RecGWarehouseEntry."Reference No.";
                            "Entry Type" := "Entry Type"::Transfer ;

                             IF RecGWarehouseEntry.Quantity > 0 THEN
                                "Document Type" := "Document Type"::"Transfer Receipt"
                              ELSE "Document Type" := "Document Type"::"Transfer Shipment";

                            Provenance := RecGWarehouseEntry."Location Code" ;
                            "Code Emplacement" := RecGWarehouseEntry."Bin Code";
                            "Table source" :=  FORMAT(DATABASE::"Warehouse Entry") ;
                            INSERT ;
                            IntnumSsequence +=1 ;

                          UNTIL RecGWarehouseEntry.NEXT = 0 ;


                        //<< TRIUM RAD 22/08/2014 - Traitement des preparation VN

                        RecGPreparationVN.SETCURRENTKEY(VIN);
                        RecGPreparationVN.SETRANGE(RecGPreparationVN.VIN,TxtNumChassis);
                        IF RecGPreparationVN.FINDSET THEN
                            REPEAT
                              INIT;
                              "Entry No."       := IntnumSsequence;
                              "Modèle Vehicule"    := RecGPreparationVN."Vehicle No."  ;
                              "Code Variante"      := RecGPreparationVN."Variant Code" ;
                              "Numéro de chassis"  := TxtNumChassis ;
                              "Date operation"     := RecGPreparationVN."Creation date" ;
                              "Numero document"    := RecGPreparationVN."Preparation No";

                              "Entry Type" := "Entry Type"::Sale ;
                              CASE RecGPreparationVN."Service Type" OF
                                0 : BEGIN
                                      "Document Type" := "Document Type"::"Preparation VN" ;
                                      "statut service" :=  FORMAT(RecGPreparationVN."Status Préparation");
                                    END;
                                1 : BEGIN
                                      "Document Type" := "Document Type"::"Livraison VN" ;
                                      "statut service" :=  FORMAT(RecGPreparationVN."Status Livraison");
                                    END;
                              END;

                              "Table source" :=  FORMAT(DATABASE::"Preparation VN");
                              //SM 211015
                              RecServiceShipmentHeader.RESET;
                              RecServiceShipmentHeader.SETRANGE("Reception No",RecGPreparationVN."Preparation No");
                              IF RecServiceShipmentHeader.FINDFIRST THEN
                                "No BL"      := RecServiceShipmentHeader."No.";

                              RecServiceInvoiceHeader.RESET;
                              RecServiceInvoiceHeader.SETRANGE("Reception No",RecGPreparationVN."Preparation No");
                              IF RecServiceInvoiceHeader.FINDFIRST THEN
                                "No Facture" := RecServiceInvoiceHeader."No.";
                              //END SM
                              //SM 071015
                              RecGPreparationVN.CALCFIELDS("Existe Fiche Livraison","N° Matriculation");

                              IF (RecGPreparationVN."Service Type" = RecGPreparationVN."Service Type"::Préparation) AND
                               (RecGPreparationVN."Status Préparation" = RecGPreparationVN."Status Préparation"::"Fiche Crée") AND
                               (RecGPreparationVN."Existe Fiche Livraison" = FALSE) THEN
                                "Statut PVN" := "Statut PVN"::"Encours de Préparation";

                              IF (RecGPreparationVN."Service Type" = RecGPreparationVN."Service Type"::Préparation) AND
                               (RecGPreparationVN."Status Préparation" = RecGPreparationVN."Status Préparation"::"Véhicule Préparée") AND
                               (RecGPreparationVN."Existe Fiche Livraison" = FALSE) AND
                               (RecGPreparationVN.Accepté = FALSE) AND
                               (RecGPreparationVN."CheckListe Validée" = FALSE) THEN
                                "Statut PVN" := "Statut PVN"::"Véhicule Acceessoires Montés";

                              IF (RecGPreparationVN."Service Type" = RecGPreparationVN."Service Type"::Préparation) AND
                               (RecGPreparationVN."Status Préparation" = RecGPreparationVN."Status Préparation"::"Véhicule Préparée") AND
                               (RecGPreparationVN."Existe Fiche Livraison" = FALSE) AND
                               (RecGPreparationVN.Accepté = FALSE) AND
                               (RecGPreparationVN."CheckListe Validée" = TRUE) AND
                               (RecGPreparationVN."N° Matriculation" = '') THEN
                                "Statut PVN" := "Statut PVN"::"Véhicule Préparé";

                              //MESSAGE('2  :%1: %2: %3: %4: %5: %6: %7: %8: %9',RecGPreparationVN."Service Type",RecGPreparationVN."Status Préparation",
                              //RecGPreparationVN."Existe Fiche Livraison",RecGPreparationVN.Accepté,RecGPreparationVN."CheckListe Validée",RecGPreparationVN."N° Matriculation");


                              IF (RecGPreparationVN."Service Type" = RecGPreparationVN."Service Type"::Préparation) AND
                               (RecGPreparationVN."Status Préparation" = RecGPreparationVN."Status Préparation"::"Véhicule Préparée") AND
                               (RecGPreparationVN."Existe Fiche Livraison" = FALSE) AND
                               (RecGPreparationVN.Accepté = FALSE) AND
                               (RecGPreparationVN."CheckListe Validée" = TRUE) AND
                               (RecGPreparationVN."N° Matriculation" <> '') THEN
                                "Statut PVN" := "Statut PVN"::"Véhicule Disponible Livraison";

                              IF (RecGPreparationVN."Service Type" = RecGPreparationVN."Service Type"::Préparation) AND
                               (RecGPreparationVN."Status Préparation" = RecGPreparationVN."Status Préparation"::"Véhicule Préparée") AND
                               (RecGPreparationVN."Existe Fiche Livraison" = FALSE) AND
                               (RecGPreparationVN.Accepté = FALSE) AND
                               (RecGPreparationVN."CheckListe Validée" = TRUE) AND
                               (RecGPreparationVN."N° Matriculation" <> '') AND
                               (RecGPreparationVN.Demandé = TRUE) THEN
                                "Statut PVN" := "Statut PVN"::"Véhicule Demandé livraison";

                              IF (RecGPreparationVN."Service Type" = RecGPreparationVN."Service Type"::Préparation) AND
                               (RecGPreparationVN."Status Préparation" = RecGPreparationVN."Status Préparation"::"Véhicule Préparée") AND
                               (RecGPreparationVN."Existe Fiche Livraison" = FALSE) AND
                               (RecGPreparationVN.Accepté = TRUE) THEN
                                "Statut PVN" := "Statut PVN"::"PVN Accepté";

                              IF (RecGPreparationVN."Service Type" = RecGPreparationVN."Service Type"::Livraison) AND
                               (RecGPreparationVN."Status Livraison" = RecGPreparationVN."Status Livraison"::"Fiche Crée") THEN
                                "Statut PVN" := "Statut PVN"::"Livraison Fiche Crée";

                              IF (RecGPreparationVN."Service Type" = RecGPreparationVN."Service Type"::Livraison) AND
                               (RecGPreparationVN."Status Livraison" = RecGPreparationVN."Status Livraison"::Livrée) THEN
                                "Statut PVN" := "Statut PVN"::Livré;
                              //END SM

                              INSERT ;
                              IntnumSsequence +=1 ;
                            UNTIL RecGPreparationVN.NEXT = 0 ;


                        //<< TRIUM RAD 22/08/2014 - Traitement des receptions service

                        RecGReception.SETCURRENTKEY(VIN);
                        RecGReception.SETRANGE(RecGReception.VIN,TxtNumChassis);
                        IF RecGReception.FINDSET THEN
                            REPEAT
                              INIT;
                              "Entry No." := IntnumSsequence;
                              "Modèle Vehicule" := RecGReception."Vehicle No."  ;
                              "Code Variante" :=   RecGReception."Variant Code" ;
                              "Numéro de chassis" := TxtNumChassis ;
                              "Date operation" :=  RecGReception."Creation date" ;
                              "Numero document" := RecGReception."Reception No";
                              "statut service" :=  FORMAT(RecGReception."Status SR");
                              IF RecGControl.GET(RecGReception."Reception No") THEN
                                 Kilométrage := RecGControl.Kilometrage ;

                              "Entry Type" := "Entry Type"::Service ;
                              CASE  RecGReception."Service Type" OF
                                0 : "Document Type" := "Document Type"::"Service Rapide" ;
                                1 : "Document Type" :=  "Document Type"::"Grand service";
                                2 : "Document Type" :=  "Document Type"::"Reparation Interne";
                              END;

                              "Table source" :=  FORMAT(DATABASE::"Reception SAV") ;
                              //SM 211015
                              RecServiceShipmentHeader.RESET;
                              RecServiceShipmentHeader.SETRANGE("Reception No",RecGReception."Reception No");
                              IF RecServiceShipmentHeader.FINDFIRST THEN
                                "No BL"      := RecServiceShipmentHeader."No.";

                              RecServiceInvoiceHeader.RESET;
                              RecServiceInvoiceHeader.SETRANGE("Reception No",RecGReception."Reception No");
                              IF RecServiceInvoiceHeader.FINDFIRST THEN
                                "No Facture" := RecServiceInvoiceHeader."No.";
                              //END SM
                              //SM 071015

                              INSERT ;
                              IntnumSsequence +=1 ;
                            UNTIL RecGReception.NEXT = 0 ;


                        //Avoir service
                        RecServiceCrMemoLine.RESET;
                        RecServiceCrMemoLine.SETRANGE("Service Item Serial No.",TxtNumChassis);
                        IF RecServiceCrMemoLine.FINDFIRST THEN BEGIN
                           RESET;
                           SETRANGE("Numero document",RecServiceCrMemoLine."Document No.");
                           IF ISEMPTY THEN BEGIN
                              RESET;
                              INIT;
                              "Entry No."         := IntnumSsequence;
                              "Modèle Vehicule"   := '';
                              "Code Variante"     := '' ;
                              "Numéro de chassis" := TxtNumChassis ;
                              "Entry Type"        := "Entry Type"::Service ;
                              "Date operation"    := RecServiceCrMemoLine."Posting Date" ;
                              "Numero document"   := RecServiceCrMemoLine."Document No.";
                              "Table source"      :=  FORMAT(DATABASE::"Service Cr.Memo Line") ;

                             INSERT ;
                             IntnumSsequence +=1 ;
                           END;
                        END;
                    end;
                }
                field("Modèle Véhicule";ModèleVehicule)
                {
                    Editable = false;
                }
                field("Variante Véhicule";VarianteVehicule)
                {
                    Editable = false;
                }
                field("Désignation";TxtDescription)
                {
                    Editable = false;
                }
            }
            repeater()
            {
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                field("Table source";"Table source")
                {
                }
                field("Entry No.";"Entry No.")
                {
                    Visible = false;
                }
                field("Modèle Vehicule";"Modèle Vehicule")
                {
                }
                field("Code Variante";"Code Variante")
                {
                }
                field("Numéro de chassis";"Numéro de chassis")
                {
                }
                field("Entry Type";"Entry Type")
                {
                }
                field("Order Type";"Order Type")
                {
                }
                field("Document Type";"Document Type")
                {
                }
                field("Date operation";"Date operation")
                {
                }
                field("Numero document";"Numero document")
                {

                    trigger OnValidate();
                    begin
                        //SM
                        /*CASE "Table source" OF
                          FORMAT(DATABASE::"Service Cr.Memo Line") :BEGIN
                        
                                                                    END;
                          FORMAT(DATABASE::"Reception SAV")        :BEGIN
                                                                      RecGReception.GET("Numero document");
                        
                                                                    END;
                          FORMAT(DATABASE::"Preparation VN")       :BEGIN
                                                                    END;
                          FORMAT(DATABASE::"Warehouse Entry")      :BEGIN
                                                                    END;
                          FORMAT(DATABASE::"Posted Item journal Header") : BEGIN
                                                                           END;
                          FORMAT(DATABASE::"Item Ledger Entry")    :BEGIN
                                                                    END;
                        END;
                        */
                        //END SM

                    end;
                }
                field("statut service";"statut service")
                {
                }
                field(Provenance;Provenance)
                {
                }
                field("Code Emplacement";"Code Emplacement")
                {
                }
                field(Kilométrage;Kilométrage)
                {
                }
                field("Statut PVN";"Statut PVN")
                {
                }
                field("No BL";"No BL")
                {
                }
                field("No Facture";"No Facture")
                {
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin

        DELETEALL;
    end;

    var
        TxtNumChassis : Code[20];
        "ModèleVehicule" : Code[20];
        VarianteVehicule : Code[20];
        TxtDescription : Text[50];
        RecGItemLedentry : Record "32";
        IntnumSsequence : Integer;
        RecGItemVariant : Record "5401";
        RecGReception : Record "60008";
        RecGControl : Record "60009";
        RecGPreparationVN : Record "60025";
        RecGWarehouseEntry : Record "7312";
        RecShipmentInvoiced : Record "10825";
        RecServiceInvoiceHeader : Record "5992";
        RecServiceShipmentHeader : Record "5990";
        RecPostedItemjournalHeader : Record "50010";
        RecServiceCrMemoLine : Record "5995";
}

