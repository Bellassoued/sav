page 60186 "Configurateur Fiche Article"
{
    // version CT16V002

    PageType = Card;

    layout
    {
        area(content)
        {
            group()
            {
                field("Code Version";CdeVersion)
                {
                    DrillDownPageID = "Version Article";
                    OptionCaption = 'Code Version';
                    TableRelation = "Version Article";

                    trigger OnDrillDown();
                    begin
                        CLEAR(PagVersion);
                        PagVersion.LOOKUPMODE := TRUE;
                        PagVersion.SETTABLEVIEW(RecVersion);
                        PagVersion.SETRECORD(RecVersion);
                        IF PagVersion.RUNMODAL = ACTION::LookupOK THEN BEGIN
                          PagVersion.GETRECORD(RecVersion);
                          CdeVersion:= RecVersion."Code version";
                          Cdeitem:= CdeVersion;
                        END;
                    end;

                    trigger OnValidate();
                    begin
                        Cdeitem:= CdeVersion;
                    end;
                }
                field("Code Perse";CdePerse)
                {
                    OptionCaption = 'Code Perse';

                    trigger OnDrillDown();
                    begin
                        CLEAR(PagPerse);
                        PagPerse.LOOKUPMODE := TRUE;
                        PagPerse.SETTABLEVIEW(RecPerse);
                        PagPerse.SETRECORD(RecPerse);
                        IF PagPerse.RUNMODAL = ACTION::LookupOK THEN BEGIN
                          PagPerse.GETRECORD(RecPerse);
                          CdePerse:= RecPerse."Code Perse";
                          Cdeitem:=Cdeitem + CdePerse;
                        END;
                        IF RecFicheTechnique.GET(Cdeitem) THEN
                             MESSAGE(Txt50002,Cdeitem);
                    end;

                    trigger OnValidate();
                    begin
                        Cdeitem := Cdeitem + CdePerse;
                        IF RecFicheTechnique.GET(Cdeitem) THEN;
                    end;
                }
                field("Code Couleur";CdeCouleur)
                {
                    OptionCaption = 'Code Couleur';

                    trigger OnDrillDown();
                    begin
                        CLEAR(PagCouleur);
                        PagCouleur.LOOKUPMODE := TRUE;
                        PagCouleur.SETTABLEVIEW(RecCouleur);
                        PagCouleur.SETRECORD(RecCouleur);
                        IF PagCouleur.RUNMODAL = ACTION::LookupOK THEN BEGIN
                          PagCouleur.GETRECORD(RecCouleur);
                          CdeCouleur:= RecCouleur."Code Couleur";
                          CdeVariant:= CdeCouleur;
                        END;
                    end;
                }
                field("Code Garantie";CdeGarantie)
                {
                    OptionCaption = 'Code Garantie';

                    trigger OnDrillDown();
                    begin
                        CLEAR(PagGarantie);
                        PagGarantie.LOOKUPMODE := TRUE;
                        PagGarantie.SETTABLEVIEW(RecGarantie);
                        PagGarantie.SETRECORD(RecGarantie);
                        IF PagGarantie.RUNMODAL = ACTION::LookupOK THEN BEGIN
                          PagGarantie.GETRECORD(RecGarantie);
                        //  CdeGarantie:= RecGarantie."Code Garanissage";
                          CdeVariant:=  CdeVariant + CdeGarantie;
                        END;
                    end;
                }
            }
            group()
            {
                field("Code Article";Cdeitem)
                {
                    OptionCaption = 'Code Article';

                    trigger OnValidate();
                    begin
                        IF RecFicheTechnique.GET(Cdeitem) THEN
                             MESSAGE(Txt50002,Cdeitem);
                    end;
                }
                field(Description;TxtDescription)
                {
                    OptionCaption = 'Description';
                }
                field("Code Variant";CdeVariant)
                {
                    OptionCaptionML = ENU='Code Variant',
                                      FRA='Code Variant';
                }
                field("Description Variante";TxtDescriptionVariant)
                {
                    OptionCaptionML = ENU='Description Variante',
                                      FRA='Description Variante';
                }
            }
            group()
            {
                field(RecFicheTechnique."Make Code";RecFicheTechnique."Make Code")
                {
                    CaptionML = ENU='Make Code',
                                FRA='Code Marque';
                    TableRelation = Make.Code;
                }
                field(RecFicheTechnique."Vehicle Type Code";RecFicheTechnique."Vehicle Type Code")
                {
                    CaptionML = ENU='Vehicle Type Code',
                                FRA='Code type véhicule';
                    TableRelation = "Vehicule type".Code;
                }
                field(RecFicheTechnique."Vehicle Category Code";RecFicheTechnique."Vehicle Category Code")
                {
                    CaptionML = ENU='Vehicle Category Code',
                                FRA='Code catégorie véhicule';
                    TableRelation = "Vehicle Category".Code;
                }
                field(RecFicheTechnique."Emissions Test Category Code";RecFicheTechnique."Emissions Test Category Code")
                {
                    CaptionML = ENU='Emissions Test Category Code',
                                FRA='Code catégorie test échappement';
                    TableRelation = "Emissions Test Category".Code;
                }
                field(RecFicheTechnique."Model Code";RecFicheTechnique."Model Code")
                {
                    CaptionML = ENU='Model Code',
                                FRA='Code Modèle';
                    TableRelation = "Hiérarchie Pièce"."Model Code";
                }
                field(RecFicheTechnique."MVEG Consumption";RecFicheTechnique."MVEG Consumption")
                {
                    CaptionML = ENU='MVEG Consumption',
                                FRA='Consommation MVEG';
                }
                field(RecFicheTechnique."Engine Type Code";RecFicheTechnique."Engine Type Code")
                {
                    CaptionML = ENU='Engine Type Code',
                                FRA='Code Type Moteur';
                    TableRelation = "Engine Type".Code;
                }
                field(RecFicheTechnique."Transmission Type Code";RecFicheTechnique."Transmission Type Code")
                {
                    CaptionML = ENU='Transmission Type Code',
                                FRA='Code Type transmission';
                    TableRelation = "Transmission Type".Code;
                }
                field(RecFicheTechnique."Cylinder Capacity (ccm)";RecFicheTechnique."Cylinder Capacity (ccm)")
                {
                    CaptionML = ENU='Cylinder Capacity (ccm)',
                                FRA='Cylindrée (cc)';
                }
                field(RecFicheTechnique."No. of Cylinders";RecFicheTechnique."No. of Cylinders")
                {
                    CaptionML = ENU='No. of Cylinders',
                                FRA='Nbre cylindres';
                }
                field(RecFicheTechnique."Power (kW)";RecFicheTechnique."Power (kW)")
                {
                    CaptionML = ENU='Power (kW)',
                                FRA='Puissance (KW)';
                }
                field(RecFicheTechnique."Power (hp)";RecFicheTechnique."Power (hp)")
                {
                    CaptionML = ENU='Power (hp)',
                                FRA='Puissance (CH)';
                }
                field(RecFicheTechnique.Tires;RecFicheTechnique.Tires)
                {
                    CaptionML = ENU='Tires',
                                FRA='Pneus';
                }
                field(RecFicheTechnique."Empty Weight (kg)";RecFicheTechnique."Empty Weight (kg)")
                {
                    CaptionML = ENU='Empty Weight (kg)',
                                FRA='Poids vide (KG)';
                }
                field(RecFicheTechnique."Total Weight (kg)";RecFicheTechnique."Total Weight (kg)")
                {
                    CaptionML = ENU='Total Weight (kg)',
                                FRA='Poids total (KG)';
                }
                field(RecFicheTechnique."Roof Load (kg)";RecFicheTechnique."Roof Load (kg)")
                {
                    CaptionML = ENU='Roof Load (kg)',
                                FRA='Charge toit (KG)';
                }
                field(RecFicheTechnique."Trailer Load (kg)";RecFicheTechnique."Trailer Load (kg)")
                {
                    CaptionML = ENU='Trailer Load (kg)',
                                FRA='Charge remorque (KG)';
                }
                field(RecFicheTechnique."Trailer Tongue Load (kg)";RecFicheTechnique."Trailer Tongue Load (kg)")
                {
                    CaptionML = ENU='Trailer Tongue Load (kg)',
                                FRA='Capacité de charge (KG)';
                }
                field(RecFicheTechnique."4WD";RecFicheTechnique."4WD")
                {
                    CaptionML = ENU='4WD',
                                FRA='Tous terrains';
                }
                field(RecFicheTechnique."No. of Axles";RecFicheTechnique."No. of Axles")
                {
                    CaptionML = ENU='No. of Axles',
                                FRA='Nbre essieux';
                }
                field(RecFicheTechnique."Wheelbase (mm)";RecFicheTechnique."Wheelbase (mm)")
                {
                    CaptionML = ENU='Wheelbase (mm)',
                                FRA='Distance de roues (mm)';
                }
                field(RecFicheTechnique."Front Axle Load (kg)";RecFicheTechnique."Front Axle Load (kg)")
                {
                    CaptionML = ENU='Front Axle Load (kg)',
                                FRA='Charge axe avant (KG)';
                }
                field(RecFicheTechnique."Rear Axle Load (kg)";RecFicheTechnique."Rear Axle Load (kg)")
                {
                    CaptionML = ENU='Rear Axle Load (kg)',
                                FRA='Charge essieu arrière (KG)';
                }
                field(RecFicheTechnique."No. of Doors";RecFicheTechnique."No. of Doors")
                {
                    CaptionML = ENU='No. of Doors',
                                FRA='Nbre portes';
                }
                field(RecFicheTechnique."Seasonal Factor";RecFicheTechnique."Seasonal Factor")
                {
                    CaptionML = ENU='Seasonal Factor',
                                FRA='Facteur saisonnier';
                }
                field(RecFicheTechnique."Fiscal Power";RecFicheTechnique."Fiscal Power")
                {
                    CaptionML = ENU='Fiscal Power',
                                FRA='Puissance fiscal';
                }
                field(RecFicheTechnique."Frais energie";RecFicheTechnique."Frais energie")
                {
                    CaptionML = ENU='Frais energie',
                                FRA='Frais energie';
                }
                field(RecFicheTechnique."Frais immatriculation";RecFicheTechnique."Frais immatriculation")
                {
                    CaptionML = ENU='Frais immatriculation',
                                FRA='Frais immatriculation';
                }
                field(RecFicheTechnique."Total Immatriculation";RecFicheTechnique."Total Immatriculation")
                {
                    CaptionML = ENU='Total Immatriculation',
                                FRA='Total Immatriculation';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CreateItem)
            {
                CaptionML = ENU='Create item',
                            FRA='Creation Article';
                Image = CreateMovement;
                Promoted = true;
                PromotedCategory = New;

                trigger OnAction();
                begin
                    FctCallTryCreateItem(CdeVersion,CdePerse,CdeCouleur,CdeGarantie);
                    CurrPage.CLOSE;
                end;
            }
            action("Page Item List")
            {
                CaptionML = ENU='Item List',
                            FRA='Liste des Articles';
                Image = List;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page 31;
            }
        }
    }

    trigger OnOpenPage();
    begin
        OpenItemCard := TRUE;
    end;

    var
        CdeVersion : Code[20];
        CdePerse : Code[10];
        CdeCouleur : Code[10];
        CdeGarantie : Code[10];
        Cdeitem : Code[20];
        TxtDescription : Text[50];
        PagVersion : Page "60181";
        PagPerse : Page "60182";
        PagCouleur : Page "60183";
        PagGarantie : Page "60184";
        RecVersion : Record "50033";
        RecPerse : Record "50034";
        RecCouleur : Record "50035";
        RecGarantie : Record "50036";
        RecFicheTechnique : Record "50032";
        CdeVariant : Code[10];
        TxtDescriptionVariant : Text[50];
        Txt50001 : TextConst ENU='Item %1 is created successfully',FRA='Article %1 est crée avec succès';
        Txt50002 : TextConst ENU='Item %1 exist',FRA='Article %1 est crée';
        Txt50003 : TextConst ENU='Item %1 is not created successfully : %2 %3',FRA='Article %1 n''est pas  crée correctement : %2 %3';
        RecInventorySetup : Record "313";
        OpenItemCard : Boolean;
        DescriptionVeh : Text;
        Txt50005 : Label 'Le %1 ne doit pas être zéro ou inférieur pour la pièce %2.';
        RecItemAUTO : Record "27";
        RecItemAlternatif : Record "27";
        RecCurrentItemReplacement : Record "70091";
        DoReplcmts : Report "70093";
        RecItemMasterAlternatif : Record "70007";
        RecCurrentItemReplacement2 : Record "70091";
        RecCompletedItemReplacement : Record "70092";

    procedure FctCreateItem(PcdeVersion : Code[20];PcdePerse : Code[10];PCdeCouleur : Code[10];PcodeGarantie : Code[10];TxtDescription : Text[50]);
    var
        LRecItem : Record "27";
        LRecItemVariant : Record "5401";
        LRecFicheTechnique : Record "50032";
        LRecItemInsert : Record "27";
        LPagItem : Page "30";
        ConfigTemplateMgt : Codeunit "8612";
        RecRef : RecordRef;
        CheckItemExist : Record "27";
        PurchasesPayablesSetup : Record "312";
        SalesReceivablesSetup : Record "311";
        LRecItemModif : Record "27";
    begin
        //ADD KK 040816
        IF CheckItemExist.GET((PcdeVersion + PcdePerse)) THEN BEGIN
            CheckVarianteCode(PCdeCouleur,PcodeGarantie,(PcdeVersion+PcdePerse));
            EXIT;
        END ELSE BEGIN
        
          LRecItem.INIT;
          LRecItem.VALIDATE("No.",(PcdeVersion + PcdePerse));
          LRecItem.Description :=  TxtDescription;
          //add rh
          PurchasesPayablesSetup.GET;
          SalesReceivablesSetup.GET;
          LRecItem."Gen. Prod. Posting Group" :=  PurchasesPayablesSetup."VN Gen. Prod. Posting Group";
          //KT 21112018
          LRecItem."Model en cours":=TRUE;
          LRecItem."Item type":=LRecItem."Item type"::Vehicule;
          LRecItem."Inventory Posting Group":=SalesReceivablesSetup."Groupe Compta. Véhicule";
          LRecItem."Code Version":=PcdeVersion;
          //add rh
          LRecItem.INSERT(TRUE);
          LRecItemModif.GET(PcdeVersion+PcdePerse);
          LRecItemModif.VALIDATE("Base Unit of Measure",'VEH');
          LRecItemModif.MODIFY;
         /*KT TMP 15112018 IF (PCdeCouleur <> '') OR (PcodeGarantie<> '') THEN BEGIN
              LRecItemVariant.INIT;
              //SM 260617
              LRecItem.FctSetBlnFromMaster(TRUE);
              //END SM
              LRecItemVariant.VALIDATE("Item No.",(PcdeVersion + PcdePerse));
              LRecItemVariant.VALIDATE(Code,(PCdeCouleur+PcodeGarantie));
              LRecItemVariant.VALIDATE("Code Couleur",PCdeCouleur);
              LRecItemVariant.VALIDATE("Code Garnissage",PcodeGarantie);
              LRecItemVariant.VALIDATE(Description,TxtDescriptionVariant);
              LRecItemVariant.INSERT(TRUE);
          END;*/
        END;
        LRecFicheTechnique.INIT;
        LRecFicheTechnique.VALIDATE("Item No.",LRecItem."No.");
        LRecFicheTechnique.VALIDATE("Make Code",RecFicheTechnique."Make Code");
        LRecFicheTechnique.VALIDATE("Vehicle Type Code",RecFicheTechnique."Vehicle Type Code");
        LRecFicheTechnique.VALIDATE("Vehicle Category Code",RecFicheTechnique."Vehicle Category Code");
        LRecFicheTechnique.VALIDATE("Emissions Test Category Code",RecFicheTechnique."Emissions Test Category Code");
        LRecFicheTechnique.VALIDATE("Model Code",RecFicheTechnique."Model Code");
        LRecFicheTechnique.VALIDATE("MVEG Consumption",RecFicheTechnique."MVEG Consumption");
        LRecFicheTechnique.VALIDATE("Engine Type Code",RecFicheTechnique."Engine Type Code");
        LRecFicheTechnique.VALIDATE("Transmission Type Code",RecFicheTechnique."Transmission Type Code");
        LRecFicheTechnique.VALIDATE("Cylinder Capacity (ccm)",RecFicheTechnique."Cylinder Capacity (ccm)");
        LRecFicheTechnique.VALIDATE("No. of Cylinders",RecFicheTechnique."No. of Cylinders");
        LRecFicheTechnique.VALIDATE("Power (kW)",RecFicheTechnique."Power (kW)");
        LRecFicheTechnique.VALIDATE("Power (hp)",RecFicheTechnique."Power (kW)");
        LRecFicheTechnique.VALIDATE(Tires,RecFicheTechnique.Tires);
        LRecFicheTechnique.VALIDATE("Empty Weight (kg)",RecFicheTechnique."Empty Weight (kg)");
        LRecFicheTechnique.VALIDATE("Total Weight (kg)",RecFicheTechnique."Total Weight (kg)");
        LRecFicheTechnique.VALIDATE("Roof Load (kg)",RecFicheTechnique."Roof Load (kg)");
        LRecFicheTechnique.VALIDATE("Trailer Load (kg)",RecFicheTechnique."Trailer Load (kg)");
        LRecFicheTechnique.VALIDATE("Trailer Tongue Load (kg)",RecFicheTechnique."Trailer Tongue Load (kg)");
        LRecFicheTechnique.VALIDATE("4WD",RecFicheTechnique."4WD");
        LRecFicheTechnique.VALIDATE("No. of Axles",RecFicheTechnique."No. of Axles");
        LRecFicheTechnique.VALIDATE("Wheelbase (mm)",RecFicheTechnique."Wheelbase (mm)");
        LRecFicheTechnique.VALIDATE("Front Axle Load (kg)",RecFicheTechnique."Front Axle Load (kg)");
        LRecFicheTechnique.VALIDATE("Rear Axle Load (kg)",RecFicheTechnique."Rear Axle Load (kg)");
        LRecFicheTechnique.VALIDATE("No. of Doors",RecFicheTechnique."No. of Doors");
        LRecFicheTechnique.VALIDATE("Seasonal Factor",RecFicheTechnique."Seasonal Factor");
        LRecFicheTechnique.VALIDATE("Fiscal Power",RecFicheTechnique."Fiscal Power");
        LRecFicheTechnique.VALIDATE("Frais energie",RecFicheTechnique."Frais energie");
        LRecFicheTechnique.VALIDATE("Frais immatriculation",RecFicheTechnique."Frais immatriculation");
        LRecFicheTechnique.VALIDATE("Total Immatriculation",RecFicheTechnique."Total Immatriculation");
        LRecFicheTechnique.VALIDATE("Make Code",'TOYOTA');
        LRecFicheTechnique.INSERT(TRUE);
        LRecItemInsert.RESET;
        
        //IF LRecItemInsert.GET(LRecItem."No.") THEN BEGIN
        LRecItemInsert.GET(LRecItem."No.");
          RecRef.GETTABLE(LRecItemInsert);
          ConfigTemplateMgt.FctUpdateFromTemplateSelection(RecRef);
        
        // TMP Commentaire KK 04082016
         IF OpenItemCard THEN
           BEGIN
              CLEAR(LPagItem);
              LPagItem.SETTABLEVIEW(LRecItemInsert);
              LPagItem.SETRECORD(LRecItemInsert);
              LPagItem.RUN;
          END;
        // END;

    end;

    procedure FctCallTryCreateItem(PcdeVersion : Code[20];PcdePerse : Code[10];PCdeCouleur : Code[10];PcodeGarantie : Code[10]);
    begin
        // TMP Commentaire KK
        /*
        IF FctCreateItem(PcdeVersion,PcdePerse,PCdeCouleur,PcodeGarantie)
         THEN
            MESSAGE(Txt50001,Cdeitem)
          ELSE
             MESSAGE(Txt50003,Cdeitem,GETLASTERRORCODE ,GETLASTERRORTEXT)
        */
        // MODIF KK 040816
        
        //SM 260617
        //OLDIF NOT (FctCreateItem(PcdeVersion,PcdePerse,PCdeCouleur,PcodeGarantie)) THEN
        //OLD MESSAGE(Txt50003,Cdeitem,GETLASTERRORCODE ,GETLASTERRORTEXT)
        
        FctCreateItem(PcdeVersion,PcdePerse,PCdeCouleur,PcodeGarantie,TxtDescription)
        //END SM

    end;

    procedure SetOpenItemCard(OpenCard : Boolean);
    begin
        OpenItemCard := OpenCard ;
    end;

    local procedure CheckVarianteCode(Couleur : Code[10];Garnissage : Code[10];ItemNo : Code[20]);
    var
        ItemVariant : Record "5401";
    begin
        IF NOT ItemVariant.GET(ItemNo,(Couleur+Garnissage)) THEN BEGIN
          ItemVariant.INIT;
          ItemVariant.VALIDATE("Item No.",ItemNo);
          ItemVariant.VALIDATE(Code,(Couleur+Garnissage));
          ItemVariant.VALIDATE("Code Couleur",Couleur);
          ItemVariant.VALIDATE("Code Garnissage",Garnissage);
          ItemVariant.VALIDATE(Description,TxtDescriptionVariant);
          ItemVariant.INSERT(TRUE);
        END;
    end;

    procedure SetDescription(DesItem : Text);
    begin
        DescriptionVeh := DesItem;
    end;

    [TryFunction]
    procedure FctCreateItemPieceOLD(PRecItemMaster : Record "70007");
    var
        LRecItem : Record "27";
        LRecItemVariant : Record "5401";
        LRecFicheTechnique : Record "50032";
        LRecItemInsert : Record "27";
        LPagItem : Page "30";
        ConfigTemplateMgt : Codeunit "8612";
        RecRef : RecordRef;
        CheckItemExist : Record "27";
        LRecItemMasterPrice : Record "70008";
        LRepUpdateItemSalesPrice : Report "70004";
        DecUnitPrice : Decimal;
        LRecItemFilePriceCalculation : Record "70014";
        LRecCurrencyExchangeRate : Record "330";
        LRecCoderemiseMaster : Record "70050";
        LRecInventorySetup : Record "313";
    begin
        //ADD KK 040816
        LRecInventorySetup.GET;
        DecUnitPrice:=0;
        IF CheckItemExist.GET(PRecItemMaster."No.") THEN
          BEGIN
              DecUnitPrice := 0;
              LRecItemMasterPrice.SETRANGE("Item No.",PRecItemMaster."No.");
              IF LRecItemMasterPrice.FINDFIRST THEN
                IF CheckItemExist."Code Remise" <> '' THEN
                  BEGIN
                    LRecItemFilePriceCalculation.SETRANGE("Item Group",CheckItemExist."Code Remise");
                    IF LRecItemFilePriceCalculation.FINDFIRST THEN
                    BEGIN
                        //DecUnitPrice :=ROUND((LRecItemMasterPrice.Price * LRecCurrencyExchangeRate.ExchangeRate(WORKDATE,'EUR'))
                     DecUnitPrice := ROUND(
                  LRecCurrencyExchangeRate.ExchangeAmtFCYToLCY(
                    WORKDATE,'EUR',
                    LRecItemMasterPrice.Price,LRecCurrencyExchangeRate.ExchangeRate(WORKDATE,'EUR')),
                  0.001)
                              * ((100 + LRecItemFilePriceCalculation."Factor %")/100);
                        LRepUpdateItemSalesPrice.FctUpdateItem(CheckItemExist,DecUnitPrice);
                        LRepUpdateItemSalesPrice.FctUpdateItemSalesPrice(CheckItemExist,DecUnitPrice);
                    END;
                  END;
             // MESSAGE(Txt50002,PRecItemMaster."No.")
          END
         ELSE
           BEGIN
            LRecItem.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");
            LRecItem.FctSetBlnFromMaster(TRUE);
            LRecItem.INIT;
            //LRecItem.VALIDATE("No.",Cdeitem);
            LRecItem.VALIDATE("No.",PRecItemMaster."No.");
            LRecItem.Description :=  PRecItemMaster.Description;
            LRecItem.INSERT(TRUE);
            LRecItem.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");
            LRecItem.FctSetBlnFromMaster(TRUE);
            //LRecItem.VALIDATE("Base Unit of Measure", PRecItemMaster."Base Unit of Measure");
            //LRecItem.VALIDATE("Purch. Unit of Measure", PRecItemMaster."Purch. Unit of Measure Code");
            LRecItem.VALIDATE(Description ,PRecItemMaster.Description);
            //LRecItem.VALIDATE( PRecItemMaster."Main Group Code");
            //LRecItem.VALIDATE( PRecItemMaster."Subgroup Code";
            //LRecItem.VALIDATE(Famille ,PRecItemMaster."Line Group Code");
            LRecItem.VALIDATE(Poids ,PRecItemMaster."Net weight");
            LRecItem.VALIDATE(Largeur,PRecItemMaster."Width (cm)");
            LRecItem.VALIDATE(Longueur,PRecItemMaster."Length (cm)");
            LRecItem.VALIDATE(Hauteur,PRecItemMaster."Height (cm)");
            LRecItem.VALIDATE(Volume,PRecItemMaster."Volume packaging");
            LRecItem.VALIDATE("Unit Price" ,PRecItemMaster.Price);
           // LRecItem.VALIDATE("Gross Weight" ,PRecItemMaster.Weight);
           // LRecItem.VALIDATE("Unit Volume",PRecItemMaster."Volume (Liter)");
            LRecItem.VALIDATE("Code Index",PRecItemMaster."Main Group Code");
            LRecItem.VALIDATE("Code Segment",PRecItemMaster."Product Code");
            LRecItem.VALIDATE("Code Famille",PRecItemMaster."Line Group Code");
            LRecItem.VALIDATE("Pièce d'origine",TRUE);
            LRecItem.VALIDATE("Achat Etrangé",TRUE);
            LRecItem.VALIDATE(Statut,LRecItem.Statut::Validated);
            LRecItem.VALIDATE("Modified by Master Item",TRUE);
            LRecItem.VALIDATE("Date Modified Master Item",WORKDATE);
            LRecItem.VALIDATE("EPM Non Reorder Code",PRecItemMaster."EPM Non Reorder Code");
            LRecItem.VALIDATE("Non Stock Code",PRecItemMaster."Non Stock Code");
            LRecItem."Vehicule Type" := PRecItemMaster."Vehicle Type";
            IF LRecCoderemiseMaster.GET(PRecItemMaster."No.") THEN
                LRecItem.VALIDATE("Code Remise",LRecCoderemiseMaster."Nouveau code remise")
               ELSE
                 LRecItem.VALIDATE("Code Remise",PRecItemMaster."Item Group");
            LRecItem.MODIFY(TRUE);

            //IF LRecItemInsert.GET(LRecItem."No.") THEN BEGIN
            LRecItemInsert.GET(LRecItem."No.");
            RecRef.GETTABLE(LRecItemInsert);
            ConfigTemplateMgt.FctUpdateFromTemplateSelectionPiece(RecRef);

            DecUnitPrice := 0;
            LRecItemMasterPrice.SETRANGE("Item No.",PRecItemMaster."No.");
            IF LRecItemMasterPrice.FINDFIRST THEN
              IF LRecItemInsert."Code Remise" <> '' THEN
                BEGIN
                  LRecItemFilePriceCalculation.SETRANGE("Item Group",LRecItemInsert."Code Remise");
                    IF LRecItemFilePriceCalculation.FINDFIRST THEN
                    BEGIN
                       // DecUnitPrice :=ROUND((LRecItemMasterPrice.Price * LRecCurrencyExchangeRate.ExchangeRate(WORKDATE,'EUR'))
                       //       * ((100 + LRecItemFilePriceCalculation."Factor %")/100),0.001);
                                    DecUnitPrice := ROUND(
                  LRecCurrencyExchangeRate.ExchangeAmtFCYToLCY(
                    WORKDATE,'EUR',
                    LRecItemMasterPrice.Price,LRecCurrencyExchangeRate.ExchangeRate(WORKDATE,'EUR')),
                  0.001)
                              * ((100 + LRecItemFilePriceCalculation."Factor %")/100);
                        LRepUpdateItemSalesPrice.FctUpdateItemSalesPrice(LRecItemInsert,DecUnitPrice);
                    END;
                  END;

              // TMP Commentaire KK 04082016
               IF OpenItemCard THEN
                 BEGIN
                    CLEAR(LPagItem);
                    LPagItem.SETTABLEVIEW(LRecItemInsert);
                    LPagItem.SETRECORD(LRecItemInsert);
                    LPagItem.RUN;
                END;
              // END;
        END;
    end;

    procedure FctCallTryCreateItemPiece(PRecItemMaster : Record "70007");
    var
        LRecItemMasterPrice : Record "70008";
    begin
        //SM 300517IF NOT (FctCreateItemPiece(PRecItemMaster)) THEN
        //SM 300517  MESSAGE(Txt50003,Cdeitem,GETLASTERRORCODE ,GETLASTERRORTEXT)
    end;

    procedure FctGetMasterPriceCostGrosDetail(PRecItemMaster : Record "70007";PPrixFob : Decimal;var PPriceGros : Decimal;var PPriceDetail : Decimal;var PCostGros : Decimal;var PCostDetail : Decimal;PFraisDapproche : Decimal;PPercMarge : Decimal;PTauxdeChangeSimule : Decimal);
    var
        LRecItem : Record "27";
        LRecItemVariant : Record "5401";
        LRecFicheTechnique : Record "50032";
        LRecItemInsert : Record "27";
        LPagItem : Page "30";
        ConfigTemplateMgt : Codeunit "8612";
        RecRef : RecordRef;
        CheckItemExist : Record "27";
        LRecItemMasterPrice : Record "70008";
        LRepUpdateItemSalesPrice : Report "70004";
        DecUnitPrice : Decimal;
        LRecItemFilePriceCalculation : Record "70014";
        LRecCurrencyExchangeRate : Record "330";
        LRecCoderemiseMaster : Record "70050";
        LRecInventorySetup : Record "313";
    begin

        IF (PTauxdeChangeSimule = 0) THEN
          ERROR(Txt50005,' Taux de change de simulation ',PRecItemMaster."No.");

        IF (PPrixFob = 0) THEN
          ERROR(Txt50005,' Prix Fob ',PRecItemMaster."No.");

        IF (PPercMarge <= 0) THEN
          ERROR(Txt50005,' % Marge ',PRecItemMaster."No.");

        PPercMarge:=PPercMarge/100;

        IF PFraisDapproche <> 0 THEN
          PFraisDapproche := PFraisDapproche/100;

        //PR FOB * (T * (1+Fa)
        PCostGros    := PPrixFob * ( PTauxdeChangeSimule * ( 1 + PFraisDapproche));
        PCostGros := ROUND(PCostGros,0.001);

        //PR FOB * (T * (1+Fa)/1-Mx))
        PPriceGros   := PPrixFob * ( PTauxdeChangeSimule * ( 1 + PFraisDapproche)*(1 + PPercMarge));
        PPriceGros := ROUND(PPriceGros,0.001);


        //Le Cout= PR VTE Gros -7%
        PCostDetail  := PPriceGros * (1 - 0.07);
        PCostDetail  := ROUND(PCostDetail,0.001);

        //PR VTE= PR VTE GROS*(1+21,5%)
        PPriceDetail := PPriceGros * (1 + 0.215);
        PPriceDetail := ROUND(PPriceDetail,0.001);

        //MESSAGE('calc %1 %2 %3 %4',PCostGros,PPriceGros,PCostDetail,PPriceDetail);
    end;

    procedure FctCreateItemPiece(PRecItemMaster : Record "70007");
    var
        LRecItem : Record "27";
        LRecItemVariant : Record "5401";
        LRecFicheTechnique : Record "50032";
        LRecItemInsert : Record "27";
        LPagItem : Page "30";
        ConfigTemplateMgt : Codeunit "8612";
        RecRef : RecordRef;
        CheckItemExist : Record "27";
        LRecItemMasterPrice : Record "70008";
        LRepUpdateItemSalesPrice : Report "70004";
        LRecItemFilePriceCalculation : Record "70014";
        LRecCurrencyExchangeRate : Record "330";
        LRecCoderemiseMaster : Record "70050";
        LRecInventorySetup : Record "313";
        LPriceGros : Decimal;
        LPriceDetail : Decimal;
        LCostDetail : Decimal;
        LCostGros : Decimal;
        CodeRemise : Code[10];
        LMargeV : Decimal;
        LrecCodeNGP : Record "70048";
        LrecItemePriceCalculationCheck : Record "70014";
        TraductionDescriptionItem : Record "50110";
    begin
        //ADD KK 040816
        
        LRecInventorySetup.GET;
        
        LPriceGros   := 0;
        LPriceDetail := 0;
        LCostDetail  := 0;
        LCostGros    := 0;
        
        CodeRemise := '';
        
        //ZMN 11/03/2019 Non utile LRecCoderemiseMaster.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");
        //IF LRecCoderemiseMaster.GET(PRecItemMaster."Main Group Code",PRecItemMaster."Product Code",PRecItemMaster."Line Group Code") THEN
        /*
        LRecCoderemiseMaster.SETRANGE("Code Remise",PRecItemMaster."Product Code");
        IF LRecCoderemiseMaster.FINDFIRST THEN
          CodeRemise := LRecCoderemiseMaster."Nouveau code remise"
        ELSE
          CodeRemise := PRecItemMaster."Product Code";
          //CodeRemise := PRecItemMaster."Item Group";
        */
        //LRecItem.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");
        //IF LRecItem.GET(PRecItemMaster."No.") THEN
        //  CodeRemise := LRecItem."Code Remise";
        
        CodeRemise := PRecItemMaster."Product Code";
        LrecItemePriceCalculationCheck.SETRANGE("Item Group",CodeRemise);
        IF NOT LrecItemePriceCalculationCheck.FINDFIRST THEN
          CodeRemise := 'AUTRES';
        
        //ZMN 11/03/2019 Non utile LRecItemFilePriceCalculation.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");
        LRecItemFilePriceCalculation.SETRANGE("Item Group",CodeRemise);
        
        IF LRecItemFilePriceCalculation.FINDFIRST THEN BEGIN
        
          // LRecItem.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");
          // IF LRecItem.GET(PRecItemMaster."No.") AND (LRecItem."Profit %" <> 0) THEN
          //     LMargeV := LRecItem."Profit %"
          //   ELSE
          LRecItemFilePriceCalculation.TESTFIELD("% Marge");
          LMargeV := LRecItemFilePriceCalculation."% Marge";
        
        
          FctGetMasterPriceCostGrosDetail(PRecItemMaster,PRecItemMaster.Price,
          LPriceGros,LPriceDetail,LCostGros,LCostDetail,
          LRecItemFilePriceCalculation."Frais d'approche",LMargeV,LRecItemFilePriceCalculation."Taux de change Simulé");
          //ZMN 11/03/2019 Non utile LRecItem.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");  //Modification GROS
          // TMP KT 090617 IF CheckItemExist.GET(PRecItemMaster."No.") THEN BEGIN
          IF LRecItem.GET(PRecItemMaster."No.") THEN BEGIN
            LRecItem.VALIDATE("Profit %",LMargeV);
        
            LRecItem.VALIDATE("Coût Théorique",LCostGros);
            LRecItem.VALIDATE("Unit Price" ,LPriceGros);
        
            //SM OLD 160917 LRecItem.VALIDATE("Cout Théorique Detail",LCostDetail);
            //SM OLD 160917 LRecItem.VALIDATE("Prix Vente Détail",LPriceDetail);
        
            LRecItem.VALIDATE(Poids ,PRecItemMaster."Net weight");
            LRecItem.VALIDATE(Largeur,PRecItemMaster."Width (cm)");
            LRecItem.VALIDATE(Longueur,PRecItemMaster."Length (cm)");
            LRecItem.VALIDATE(Hauteur,PRecItemMaster."Height (cm)");
            LRecItem.VALIDATE(Volume,PRecItemMaster."Volume packaging");
            LRecItem.VALIDATE("Code Index",PRecItemMaster."Main Group Code");
            LRecItem.VALIDATE("Code Segment",PRecItemMaster."Product Code");
            LRecItem.VALIDATE("Code Famille",PRecItemMaster."Line Group Code");
            LRecItem.VALIDATE("Pièce d'origine",TRUE);
            LRecItem.VALIDATE("Achat Etrangé",TRUE);
             LRecItem.VALIDATE("Item type" , LRecItem."Item type"::Pièce);
            LRecItem."Prix Fob" := PRecItemMaster.Price;
        
            LRecItem."Vehicule Type" := PRecItemMaster."Vehicle Type";
            LRecItem."Manufacturer Code" := PRecItemMaster."Make Code";
            LRecItem."Product Code" := PRecItemMaster."Product Code";
            LRecItem.VALIDATE("Code Remise",CodeRemise);
        
            LRecItem.VALIDATE("Modified by Master Item",TRUE);
            LRecItem.VALIDATE("Date Modified Master Item",WORKDATE);
        
            LRecItem."Ordre Cycle" := 5;
            LRecItem."Lead Time" := 125;
            LRecItem."S/S For L/T" := 25;
            LRecItem.VALIDATE("Vendor No.",'FR000653');
            LRecItem."Prix Fob" := PRecItemMaster.Price;
            LRecItem."EPM Non Reorder Code" := PRecItemMaster."EPM Non Reorder Code";
            LRecItem."Non Stock Code"  := PRecItemMaster."Non Stock Code";
            LRecItem."PART NAME CODE" := PRecItemMaster."Part Name Code";
            LRecItem."PRICE CLASS" := PRecItemMaster."Price Class";
            LRecItem.VALIDATE("Manufacturer Code" , 'TOYOTA');
            LRecItem."Code NGP" := PRecItemMaster."Tariff code";
        
            LrecCodeNGP.RESET;
            LrecCodeNGP.SETRANGE(Code,PRecItemMaster."Tariff code");
            IF LrecCodeNGP.FINDFIRST THEN
              LRecItem."Contrôl Technique" := LrecCodeNGP."Controle Technique";
        
            LRecItem.MODIFY(TRUE);
        
            //SM 160917
            /*//ZMN 11/03/2019 Non utile
            RecItemAUTO.RESET;
            RecItemAUTO.CHANGECOMPANY('AURES AUTO');
            RecItemAUTO.GET(LRecItem."No.");
            RecItemAUTO.VALIDATE("Coût Théorique",LCostDetail);
            RecItemAUTO.VALIDATE("Unit Price" ,LPriceDetail);
            RecItemAUTO.MODIFY;
            */
            //END SM
          END ELSE BEGIN                                                 //Creation GROS
            LRecItem.FctSetBlnFromMaster(TRUE);
            LRecItem.INIT;
            LRecItem.VALIDATE("No.",PRecItemMaster."No.");
        
            IF STRPOS(PRecItemMaster.Description,'01') = 0 THEN
            BEGIN
               TraductionDescriptionItem.RESET;
               TraductionDescriptionItem.SETRANGE("Part Name Code",PRecItemMaster."Part Name Code");
               IF TraductionDescriptionItem.FINDFIRST THEN
                  LRecItem.Description := TraductionDescriptionItem."Description FR"
                ELSE
                  LRecItem.Description :=  PRecItemMaster.Description;
             END ELSE
                 LRecItem.Description :=  PRecItemMaster.Description;
        
            LRecItem.INSERT(TRUE);
            //ZMN NON UTILE LRecItem.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");
            LRecItem.FctSetBlnFromMaster(TRUE);
            LRecItem.VALIDATE("Base Unit of Measure",'PIECE');
            //LRecItem.VALIDATE("Purch. Unit of Measure", PRecItemMaster."Purch. Unit of Measure Code");
            LRecItem.VALIDATE(Description ,PRecItemMaster.Description);
            LRecItem.VALIDATE(Poids ,PRecItemMaster."Net weight");
            LRecItem.VALIDATE(Largeur,PRecItemMaster."Width (cm)");
            LRecItem.VALIDATE(Longueur,PRecItemMaster."Length (cm)");
            LRecItem.VALIDATE(Hauteur,PRecItemMaster."Height (cm)");
            LRecItem.VALIDATE(Volume,PRecItemMaster."Volume packaging");
            LRecItem.VALIDATE("Item type" , LRecItem."Item type"::Pièce);
            LRecItem."Prix Fob" := PRecItemMaster.Price;
            LRecItem."Sur commande" := TRUE;
            LRecItem.VALIDATE("Profit %",LMargeV);
            LRecItem.VALIDATE("Coût Théorique",LCostGros);
            LRecItem.VALIDATE("Manufacturer Code" , 'TOYOTA');
            LRecItem.VALIDATE("Unit Price" ,LPriceGros);
        
            //SM OLD 160917 LRecItem.VALIDATE("Cout Théorique Detail",LCostDetail);
            //SM OLD 160917 LRecItem.VALIDATE("Prix Vente Détail",LPriceDetail);
        
            LRecItem.VALIDATE("Code Index",PRecItemMaster."Main Group Code");
            LRecItem.VALIDATE("Code Segment",PRecItemMaster."Product Code");
            LRecItem.VALIDATE("Code Famille",PRecItemMaster."Line Group Code");
            LRecItem.VALIDATE("Pièce d'origine",TRUE);
            LRecItem.VALIDATE("Achat Etrangé",TRUE);
            LRecItem."Manufacturer Code" := PRecItemMaster."Make Code";
            LRecItem.VALIDATE(Statut,LRecItem.Statut::Validated);
            LRecItem.VALIDATE("Modified by Master Item",TRUE);
            LRecItem.VALIDATE("Date Modified Master Item",WORKDATE);
            LRecItem."Vehicule Type" := PRecItemMaster."Vehicle Type";
            LRecItem.VALIDATE("Code Remise",CodeRemise);
            LRecItem."Product Code" := PRecItemMaster."Product Code";
            LRecItem."Ordre Cycle" := 5;
            LRecItem."Lead Time" := 125;
            LRecItem."S/S For L/T" := 25;
            LRecItem.Rotation := 'F';
            LRecItem.VALIDATE("Vendor No.",'FR000653');
            LRecItem."Prix Fob" := PRecItemMaster.Price;
            LRecItem."EPM Non Reorder Code" := PRecItemMaster."EPM Non Reorder Code";
            LRecItem."Non Stock Code"  := PRecItemMaster."Non Stock Code";
            LRecItem."PART NAME CODE" := PRecItemMaster."Part Name Code";
            LRecItem."PRICE CLASS" := PRecItemMaster."Price Class";
            LRecItem."Code NGP" := PRecItemMaster."Tariff code";
            LrecCodeNGP.RESET;
            LrecCodeNGP.SETRANGE(Code,PRecItemMaster."Tariff code");
            IF LrecCodeNGP.FINDFIRST THEN
              LRecItem."Contrôl Technique" := LrecCodeNGP."Controle Technique";
            LRecItem.MODIFY(TRUE);
        
        
            LRecItemInsert.GET(LRecItem."No.");
            RecRef.GETTABLE(LRecItemInsert);
            ConfigTemplateMgt.FctUpdateFromTemplateSelectionPiece(RecRef);
        
            LRecItem.GET(PRecItemMaster."No.") ;
            LRecItem.MODIFY(TRUE);
            //SM 160917
            /*//ZMN 11/03/2019 Non utile
            RecItemAUTO.RESET;
            RecItemAUTO.CHANGECOMPANY('AURES AUTO');
            RecItemAUTO.GET(LRecItem."No.");
            RecItemAUTO.VALIDATE("Coût Théorique",LCostDetail);
            RecItemAUTO.VALIDATE("Unit Price" ,LPriceDetail);
            RecItemAUTO.MODIFY;
            */
            //END SM
          END;
        
        END ELSE ERROR('Code Remise n existe pas pour l''artcile %1',PRecItemMaster."No.");
        // Zied__KAMEL__RABI_YOSTER
        
        IF PRecItemMaster."Alternative No."<> '' THEN BEGIN
        
          IF NOT RecItemAlternatif.GET(PRecItemMaster."Alternative No.") THEN
            BEGIN
              RecItemMasterAlternatif.SETRANGE("No.",PRecItemMaster."Alternative No.");
              IF RecItemMasterAlternatif.FINDFIRST THEN
               FctCreateItemPiece(RecItemMasterAlternatif);
            END;
          RecCompletedItemReplacement.RESET;
          RecCompletedItemReplacement.SETRANGE("Old Item No.",PRecItemMaster."No.");
          RecCompletedItemReplacement.SETRANGE("New Item No.",PRecItemMaster."Alternative No.");
          IF RecCompletedItemReplacement.ISEMPTY THEN
            BEGIN
              IF NOT RecCurrentItemReplacement.GET(PRecItemMaster."No.",PRecItemMaster."Alternative No.") THEN
                BEGIN
                  RecCurrentItemReplacement.INIT;
                  RecCurrentItemReplacement.VALIDATE("Old Item No.",PRecItemMaster."No.");
                  RecCurrentItemReplacement.VALIDATE("New Item No." ,PRecItemMaster."Alternative No.");
                  RecCurrentItemReplacement."Make Code" := PRecItemMaster."Make Code";
                  RecCurrentItemReplacement.INSERT(TRUE);
                  COMMIT;
                END;
              END;
        
        
         RecCurrentItemReplacement2.RESET;
         IF  RecCurrentItemReplacement2.GET(RecCurrentItemReplacement."Old Item No.",RecCurrentItemReplacement."New Item No.") THEN BEGIN
          CLEAR(DoReplcmts);
          //DoReplcmts.USEREQUESTPAGE(FALSE);
          DoReplcmts.SETTABLEVIEW(RecCurrentItemReplacement2);//CurrReplcmts);
          DoReplcmts.RUNMODAL;
         // REPORT.RUNMODAL(70093, FALSE, FALSE,RecCurrentItemReplacement2);
         END;
        
        END;
        
        // TMP Commentaire KK 04082016
        IF OpenItemCard THEN BEGIN
            CLEAR(LPagItem);
            LPagItem.SETTABLEVIEW(LRecItemInsert);
            LPagItem.SETRECORD(LRecItemInsert);
            LPagItem.RUN;
        END;

    end;

    procedure FctCreateItemPieceLocal(ItemGroup : Code[10];LDecPrice : Decimal;LCdeItemNo : Code[20];LDecWeight : Decimal;LDecWidth : Decimal;LDecLength : Decimal;LDecHeight : Decimal;LDecVolume : Decimal;LCdeMainGroupCode : Code[10];LCdeSubGrpCode : Code[10];LCdeLineGrpCode : Code[10];LTextVehType : Text[80];LCdeMakeCode : Code[10];LCdeCodeRemise : Code[10];LTextItemDescription : Text[100];LBPieceOrigine : Boolean);
    var
        LRecItem : Record "27";
        LRecItemVariant : Record "5401";
        LRecFicheTechnique : Record "50032";
        LRecItemInsert : Record "27";
        LPagItem : Page "30";
        ConfigTemplateMgt : Codeunit "8612";
        RecRef : RecordRef;
        CheckItemExist : Record "27";
        LRecItemMasterPrice : Record "70008";
        LRepUpdateItemSalesPrice : Report "70004";
        LRecItemFilePriceCalculation : Record "70014";
        LRecCurrencyExchangeRate : Record "330";
        LRecCoderemiseMaster : Record "70050";
        LRecInventorySetup : Record "313";
        LPriceGros : Decimal;
        LPriceDetail : Decimal;
        LCostDetail : Decimal;
        LCostGros : Decimal;
        CodeRemise : Code[10];
        LMargeV : Decimal;
    begin
        //ADD KK 040816
        
        LRecInventorySetup.GET;
        
        LPriceGros   := 0;
        LPriceDetail := 0;
        LCostDetail  := 0;
        LCostGros    := 0;
        
        CodeRemise := '';
        
        LRecCoderemiseMaster.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");
        /*IF LRecCoderemiseMaster.GET(PRecItemMaster."Main Group Code",PRecItemMaster."Subgroup Code",PRecItemMaster."Line Group Code") THEN
          CodeRemise := LRecCoderemiseMaster."Nouveau code remise"
        ELSE*/
        //Modif
          CodeRemise := ItemGroup;
        
        
        //LRecItem.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");
        //IF LRecItem.GET(PRecItemMaster."No.") THEN
        //  CodeRemise := LRecItem."Code Remise";
        
        
        
        LRecItemFilePriceCalculation.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");
        LRecItemFilePriceCalculation.SETRANGE("Item Group",CodeRemise);
        
        IF LRecItemFilePriceCalculation.FINDFIRST THEN BEGIN
        
          // LRecItem.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");
          // IF LRecItem.GET(PRecItemMaster."No.") AND (LRecItem."Profit %" <> 0) THEN
          //     LMargeV := LRecItem."Profit %"
          //   ELSE
          LRecItemFilePriceCalculation.TESTFIELD("% Marge");
          LMargeV := LRecItemFilePriceCalculation."% Marge";
        
        
          FctGetLocalPriceCostGrosDetail(LCdeItemNo,LDecPrice,
          LPriceGros,LPriceDetail,LCostGros,LCostDetail,
          LRecItemFilePriceCalculation."Frais d'approche",LMargeV,LRecItemFilePriceCalculation."Taux de change Simulé");
          //MESSAGE('%1 %2 %3 %4 %5 %6 %7 %8',LPriceGros,LPriceDetail,LCostGros,LCostDetail,LRecItemFilePriceCalculation."Frais d'approche",LMargeV,LRecItemFilePriceCalculation."Taux de change Simulé",PRecItemMaster.Price);
          LRecItem.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");  //Modification GROS
          // TMP KT 090617 IF CheckItemExist.GET(PRecItemMaster."No.") THEN BEGIN
          IF LRecItem.GET(LCdeItemNo) THEN BEGIN
            LRecItem.VALIDATE("Profit %",LMargeV);
        
            LRecItem.VALIDATE("Coût Théorique",LCostGros);
            LRecItem.VALIDATE("Unit Price" ,LPriceGros);
        
            //SM OLD 160917 LRecItem.VALIDATE("Cout Théorique Detail",LCostDetail);
            //SM OLD 160917 LRecItem.VALIDATE("Prix Vente Détail",LPriceDetail);
        
            LRecItem.VALIDATE(Poids ,LDecWeight);
            LRecItem.VALIDATE(Largeur,LDecWidth);
            LRecItem.VALIDATE(Longueur,LDecLength);
            LRecItem.VALIDATE(Hauteur,LDecHeight);
            LRecItem.VALIDATE(Volume,LDecVolume);
            LRecItem.VALIDATE("Code Index",LCdeMainGroupCode);
            LRecItem.VALIDATE("Code Segment",LCdeSubGrpCode);
            LRecItem.VALIDATE("Code Famille",LCdeLineGrpCode);
            LRecItem.VALIDATE("Pièce d'origine",LBPieceOrigine);
            LRecItem.VALIDATE("Achat Etrangé",FALSE);
            LRecItem."Vehicule Type" := LTextVehType;
            LRecItem."Manufacturer Code" := LCdeMakeCode;
            LRecItem.VALIDATE("Code Remise",CodeRemise);
        
            LRecItem.VALIDATE("Modified by Master Item",FALSE);
            LRecItem.VALIDATE("Date Modified Master Item",WORKDATE);
        
            LRecItem.MODIFY(TRUE);
            //SM 160917
            RecItemAUTO.RESET;
            RecItemAUTO.CHANGECOMPANY('AURES AUTO');
            RecItemAUTO.GET(LRecItem."No.");
            RecItemAUTO.VALIDATE("Coût Théorique",LCostDetail);
            RecItemAUTO.VALIDATE("Unit Price" ,LPriceDetail);
            RecItemAUTO.MODIFY;
            //END SM
          END ELSE BEGIN                                                 //Creation GROS
            LRecItem.FctSetBlnFromMaster(TRUE);
            LRecItem.INIT;
            LRecItem.VALIDATE("No.",LCdeItemNo);
            LRecItem.Description :=  LTextItemDescription;
            LRecItem.VALIDATE("Gen. Prod. Posting Group",'PR');
            LRecItem.INSERT(TRUE);
        
        
        
        
            LRecItem.CHANGECOMPANY(LRecInventorySetup."Socité stock consolidé");
            LRecItem.FctSetBlnFromMaster(TRUE);
            LRecItem.VALIDATE("Base Unit of Measure",'PIECE');
            //LRecItem.VALIDATE("Purch. Unit of Measure", PRecItemMaster."Purch. Unit of Measure Code");
            LRecItem.VALIDATE(Description ,LTextItemDescription);
            LRecItem.VALIDATE(Poids ,LDecWeight);
            LRecItem.VALIDATE(Largeur,LDecWidth);
            LRecItem.VALIDATE(Longueur,LDecLength);
            LRecItem.VALIDATE(Hauteur,LDecHeight);
            LRecItem.VALIDATE(Volume,LDecVolume);
        
            LRecItem.VALIDATE("Profit %",LMargeV);
            LRecItem.VALIDATE("Coût Théorique",LCostGros);
        
            LRecItem.VALIDATE("Unit Price" ,LPriceGros);
        
            //SM OLD 160917 LRecItem.VALIDATE("Cout Théorique Detail",LCostDetail);
            //SM OLD 160917 LRecItem.VALIDATE("Prix Vente Détail",LPriceDetail);
        
            LRecItem.VALIDATE("Code Index",LCdeMainGroupCode);
            LRecItem.VALIDATE("Code Segment",LCdeSubGrpCode);
            LRecItem.VALIDATE("Code Famille",LCdeLineGrpCode);
            LRecItem.VALIDATE("Pièce d'origine",FALSE);
            LRecItem.VALIDATE("Achat Etrangé",FALSE);
            LRecItem."Manufacturer Code" := LCdeMakeCode;
            LRecItem.VALIDATE(Statut,LRecItem.Statut::Validated);
            LRecItem.VALIDATE("Modified by Master Item",FALSE);
            LRecItem.VALIDATE("Date Modified Master Item",WORKDATE);
            LRecItem."Vehicule Type" := LTextVehType;
            LRecItem.VALIDATE("Code Remise",CodeRemise);
            LRecItem.MODIFY(TRUE);
        
            LRecItemInsert.GET(LRecItem."No.");
            RecRef.GETTABLE(LRecItemInsert);
            ConfigTemplateMgt.FctUpdateFromTemplateSelectionPiece(RecRef);
        
        
            LRecItem.GET(LRecItemInsert."No.") ;
            LRecItem.MODIFY(TRUE);
            //SM 160917
            RecItemAUTO.RESET;
            RecItemAUTO.CHANGECOMPANY('AURES AUTO');
            RecItemAUTO.GET(LRecItem."No.");
            RecItemAUTO.VALIDATE("Coût Théorique",LCostDetail);
            RecItemAUTO.VALIDATE("Unit Price" ,LPriceDetail);
            RecItemAUTO.MODIFY;
            //END SM
          END;
        
        END ELSE ERROR('Code Remise n existe pas');
        
        // TMP Commentaire KK 04082016
        IF OpenItemCard THEN BEGIN
            CLEAR(LPagItem);
            LPagItem.SETTABLEVIEW(LRecItemInsert);
            LPagItem.SETRECORD(LRecItemInsert);
            LPagItem.RUN;
        END;

    end;

    procedure FctGetLocalPriceCostGrosDetail(ItemNo : Code[20];PPrixFob : Decimal;var PPriceGros : Decimal;var PPriceDetail : Decimal;var PCostGros : Decimal;var PCostDetail : Decimal;PFraisDapproche : Decimal;PPercMarge : Decimal;PTauxdeChangeSimule : Decimal);
    var
        LRecItem : Record "27";
        LRecItemVariant : Record "5401";
        LRecFicheTechnique : Record "50032";
        LRecItemInsert : Record "27";
        LPagItem : Page "30";
        ConfigTemplateMgt : Codeunit "8612";
        RecRef : RecordRef;
        CheckItemExist : Record "27";
        LRecItemMasterPrice : Record "70008";
        LRepUpdateItemSalesPrice : Report "70004";
        DecUnitPrice : Decimal;
        LRecItemFilePriceCalculation : Record "70014";
        LRecCurrencyExchangeRate : Record "330";
        LRecCoderemiseMaster : Record "70050";
        LRecInventorySetup : Record "313";
    begin

        IF (PTauxdeChangeSimule = 0) THEN
          ERROR(Txt50005,' Taux de change de simulation ',ItemNo);

        IF (PPrixFob = 0) THEN
          ERROR(Txt50005,' Prix Fob ',ItemNo);

        IF (PPercMarge <= 0) THEN
          ERROR(Txt50005,' % Marge ',ItemNo);

        PPercMarge:=PPercMarge/100;

        IF PFraisDapproche <> 0 THEN
          PFraisDapproche := PFraisDapproche/100;

        //PR FOB * (T * (1+Fa)
        PCostGros    := PPrixFob * ( PTauxdeChangeSimule * ( 1 + PFraisDapproche));
        PCostGros := ROUND(PCostGros,0.001);

        //PR FOB * (T * (1+Fa)/1-Mx))
        PPriceGros   := PPrixFob * ( PTauxdeChangeSimule * ( 1 + PFraisDapproche)/(1- PPercMarge));
        PPriceGros := ROUND(PPriceGros,0.001);


        //Le Cout= PR VTE Gros -7%
        PCostDetail  := PPriceGros * (1 - 0.07);
        PCostDetail  := ROUND(PCostDetail,0.001);

        //PR VTE= PR VTE GROS*(1+21,5%)
        PPriceDetail := PPriceGros * (1 + 0.215);
        PPriceDetail := ROUND(PPriceDetail,0.001);

        //MESSAGE('calc %1 %2 %3 %4',PCostGros,PPriceGros,PCostDetail,PPriceDetail);
    end;
}

