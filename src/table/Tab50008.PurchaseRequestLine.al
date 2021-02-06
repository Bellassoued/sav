table 50008 "Purchase Request Line"
{
    // version DEM ACHAT

    CaptionML = ENU = 'Purchase Request Line',
                FRA = 'Ligne Demande Achat';
    DrillDownPageID = 50003;
    LookupPageID = 50003;

    fields
    {
        field(1; "Request No."; Code[20])
        {
            CaptionML = ENU = 'Request No.',
                        FRA = 'N° Demande';
        }
        field(2; "Line No."; Integer)
        {
            CaptionML = ENU = 'Line No.',
                        FRA = 'N° ligne';
        }
        field(3; Type; Option)
        {
            CaptionML = ENU = 'Type',
                        FRA = 'Type';
            OptionCaptionML = ENU = ' ,Item,New Fixed Asset,Charge (Item),Existing Fixed Asset',
                              FRA = ' ,Article,-,Frais annexes,_';
            OptionMembers = " ",Item,"Fixed Asset","Charge (Item)","Existing Fixed Asset";

            trigger OnValidate();
            begin
                ControleModif("Request No.");

                "Item No." := '';
                Description := '';
                "Location Code" := '';
                "FA Posting Group" := '';
                "N° budget d'investissement" := '';
            end;
        }
        field(5; "Item No."; Code[20])
        {
            CaptionML = ENU = 'No',
                        FRA = 'N°';
            TableRelation = IF (Type = FILTER(Item)) Item WHERE(Manufacturer Code=FILTER(<>TOYOTA))
                            ELSE IF (Type=FILTER('Charge (Item)')) "Item Charge"
                            ELSE IF (Type=FILTER(Fixed Asset)) "Fixed Assets Template"
                            ELSE IF (Type=FILTER(Existing Fixed Asset),
                                     N° budget d'investissement=FILTER(<>'')) "Fixed Asset".No. WHERE (No budget d'investissement=FIELD(N° budget d'investissement))
                                     ELSE IF (Type=FILTER(Existing Fixed Asset),
                                              N° budget d'investissement=FILTER('')) "Fixed Asset".No.;

            trigger OnValidate();
            begin
                ControleModif("Request No.");
                
                CASE Type OF
                  Type::Item : BEGIN
                                RecGItem.GET("Item No.");
                                RecGPurchReqHeader.GET("Request No.");
                                Description := RecGItem.Description;
                                "Unit of Measure Code" := RecGItem."Purch. Unit of Measure";
                                "Vendor No." := RecGItem."Vendor No.";
                                "Vendor Item No." := RecGItem."Vendor Item No.";
                                "Unit Cost":=GetVendorPrice("Item No.",'',RecGPurchReqHeader."Currency Code");
                                 VALIDATE("Unit Cost");
                                "Stock de rotation":=CalcStockRotation;
                                CLEAR(GeneralPostingSetup);
                                GeneralPostingSetup.SETRANGE(GeneralPostingSetup."Gen. Bus. Posting Group",'LOCAL-ASS');
                                GeneralPostingSetup.SETRANGE(GeneralPostingSetup."Gen. Prod. Posting Group",RecGItem."Gen. Prod. Posting Group");
                                GeneralPostingSetup.FIND('-');
                                "No. compte comptable" := GeneralPostingSetup."Purch. Account";
                                CLEAR(GLAccount);
                                GLAccount.SETRANGE("No.",GeneralPostingSetup."Purch. Account");
                                IF GLAccount."Exclure Budget" THEN
                                  "Exclure budget" := TRUE;
                
                
                               END;
                
                  Type::"Charge (Item)" : BEGIN
                                          IF RecGFrais.GET("Item No.") THEN
                                            Description := RecGFrais.Description;
                                            CLEAR(GeneralPostingSetup);
                                            GeneralPostingSetup.SETRANGE(GeneralPostingSetup."Gen. Bus. Posting Group",'LOCAL-ASS');
                                            GeneralPostingSetup.SETRANGE(GeneralPostingSetup."Gen. Prod. Posting Group",RecGFrais."Gen. Prod. Posting Group");
                                            GeneralPostingSetup.FIND('-');
                                            "No. compte comptable" := GeneralPostingSetup."Purch. Account";
                                            CLEAR(GLAccount);
                                            GLAccount.SETRANGE("No.","No. compte comptable");
                                            GLAccount.FINDFIRST;
                                              "Exclure budget" := GLAccount."Exclure Budget";
                                          END;
                
                  Type::"Existing Fixed Asset" : BEGIN
                                                  IF RecGFixedAsset.GET("Item No.") THEN
                                                  BEGIN
                                                     Description := RecGFixedAsset.Description;
                                                  //<< TRIUM RAD 06/06/2010 - Valeur par defaut du N° budget d'investissement
                                                    "N° budget d'investissement" := RecGFixedAsset."No budget d'investissement" ;
                                                  //>> END TRIUM RAD 06/06/2010
                                                  END;
                                                 END;
                END;
                
                
                
                
                "Exclure budget." := TRUE;
                "Inlure Budget."  := FALSE;
                IF Type = Type::"Charge (Item)" THEN
                  BEGIN
                      CLEAR(GLAccount);
                      GLAccount.SETRANGE("No.","No. compte comptable");
                      GLAccount.FINDFIRST;
                      BEGIN
                        IF COPYSTR(GLAccount."No.",1,1) = '6' THEN
                          BEGIN
                            "Exclure budget." := FALSE;
                            "Inlure Budget." := TRUE;
                          END;
                        IF COPYSTR(GLAccount."No.",1,3) = '607' THEN
                          BEGIN
                          "Exclure budget." :=  TRUE;
                          "Inlure Budget." := FALSE;
                          END;
                        END;
                  END;
                
                
                
                
                
                 /*
                    CASE "No."[1] OF
                    '1'..'5': "Income/Balance" := "Income/Balance"::"Balance Sheet";
                    '6'..'9': "Income/Balance" := "Income/Balance"::"Income Statement";
                    ELSE
                  */
                
                
                IF UserSetup.GET(USERID) THEN
                  BEGIN
                  UserSetup.TESTFIELD("Type ligne D.A");
                
                      IF (UserSetup."Type ligne D.A" = UserSetup."Type ligne D.A"::"Charge (Item)") AND (Type <> Type::"Charge (Item)") THEN
                         ERROR(Text00001);
                         IF (UserSetup."Type ligne D.A" = UserSetup."Type ligne D.A"::Item) AND (Type <> Type::Item) THEN
                         ERROR(Text00001);
                 END;

            end;
        }
        field(6;"Variant code";Code[20])
        {
            CaptionML = ENU='Variante Code',
                        FRA='Code Variante';
            TableRelation = IF (Type=CONST(Item)) "Item Variant".Code WHERE (Item No.=FIELD(Item No.));
        }
        field(7;"Location Code";Code[10])
        {
            CaptionML = ENU='Location Code',
                        FRA='Code magasin';
            TableRelation = Location.Code WHERE (Use As In-Transit=CONST(No));

            trigger OnValidate();
            var
                Error001 : Label 'Vous n''avez pas l''autorisation d''effectuer des demandes d''achats sur ce magasin\Le paramétrage du groupe compta stock est incomplet.';
                RecLItem : Record "27";
                RecLInventoryPostingSetup : Record "5813";
                RecLInventoryPostingGroup : Record "94";
            begin
                ControleModif("Request No.");
            end;
        }
        field(8;"FA Posting Group";Code[10])
        {
            caption='Type immo.',comment='FRA=Type immo.,ENU=FA Type';

            CaptionML = ENU='FA Type',
                        FRA='';
            TableRelation = "FA Posting Group";

            trigger OnLookup();
            var
                "PageFA PostingGroups" : Page 50014 ;
                                             "RecLFA PostingGroups" : Record 5606;
                
            begin
                TESTFIELD(Type,Type::"Fixed Asset");
                CLEAR("PageFA PostingGroups");
                "PageFA PostingGroups".SETRECORD("RecLFA PostingGroups");
                "PageFA PostingGroups".SETTABLEVIEW("RecLFA PostingGroups");
                "PageFA PostingGroups".LOOKUPMODE:=TRUE;
                "PageFA PostingGroups".EDITABLE:=FALSE;
                IF "PageFA PostingGroups".RUNMODAL = ACTION::LookupOK THEN
                BEGIN
                  "PageFA PostingGroups".GETRECORD("RecLFA PostingGroups");
                  "FA Posting Group":= "RecLFA PostingGroups".Code;
                END
            end;

            trigger OnValidate();
            begin
                TESTFIELD(Type,Type::"Fixed Asset");
            end;
        }
        field(11;Description;Text[50])
        {
            CaptionML = ENU='Description',
                        FRA='Désignation';

            trigger OnValidate();
            begin
                ControleModif("Request No.");
            end;
        }
        field(13;"Unit of Measure Code";Code[10])
        {
            CaptionML = ENU='Unit of Measure Code',
                        FRA='Unité';
            TableRelation = IF (Type=FILTER(Item)) "Item Unit of Measure".Code WHERE (Item No.=FIELD(Item No.));

            trigger OnValidate();
            begin
                TestStatusOpen;

                //<<TRIUM RAD 24/04/2010 - Recupere le prix de l'article suite à la modification de l'unité de mesure
                IF Type=Type::Item THEN
                  BEGIN
                    "Unit Cost":=GetVendorPrice("Item No.",'',RecGPurchReqHeader."Currency Code");
                    VALIDATE("Unit Cost");
                  END;
                //>> END TRIUM RAD 24/04/2010
            end;
        }
        field(15;Quantity;Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Quantity',
                        FRA='Quantité';
            DecimalPlaces = 0:5;
            MinValue = 0;

            trigger OnValidate();
            begin
                ControleModif("Request No.");


                VALIDATE ("Approved quantity", Quantity);

                IF Type=Type::Item THEN
                 BEGIN
                 "Unit Cost":=GetVendorPrice("Item No.",'',RecGPurchReqHeader."Currency Code");
                  VALIDATE("Unit Cost");
                END;
            end;
        }
        field(16;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            Editable = true;
            TableRelation = Currency;

            trigger OnValidate();
            begin
                ControleModif("Request No.");
            end;
        }
        field(17;"Unit Cost";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            BlankZero = true;
            CaptionML = ENU='Unit Cost',
                        FRA='Coût unitaire';
            Editable = true;

            trigger OnValidate();
            begin
                ControleModif("Request No.");
                UpdateAmount;

                IF xRec."Unit Cost" <> "Unit Cost" THEN
                 BEGIN
                  "Dépassement budget" := FALSE;
                    "Solde budget" := 0;
                 END;
                  CLEAR(PurchaseRequestHeader);
                  PurchaseRequestHeader.GET("Request No.");
                    BEGIN
                    PurchaseRequestHeader."Dépassement Budget" := '';
                    PurchaseRequestHeader.MODIFY;
                    END;


            end;
        }
        field(18;"Approved quantity";Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Approved quantity',
                        FRA='Quantité approuvée';
            DecimalPlaces = 0:5;
            MinValue = 0;

            trigger OnValidate();
            begin
                ControleModif("Request No.");

                //IF "Approved quantity" > Quantity THEN
                //  ERROR(Error001);
                UpdateAmount;
            end;
        }
        field(22;"Vendor No.";Code[20])
        {
            CaptionML = ENU='Vendor No.',
                        FRA='N° fournisseur';
            TableRelation = Vendor.No. WHERE (No.=FILTER(FR*));

            trigger OnValidate();
            var
                Vendor : Record "23";
                LRecPurchaseRequestLine : Record "50008";
            begin
                ControleModif("Request No.");

                IF Vendor.GET("Vendor No.") THEN
                  "Vendor Name" := Vendor.Name
                ELSE
                  "Vendor Name" := '';
                IF "Vendor No."<>'' THEN BEGIN
                  LRecPurchaseRequestLine.RESET;
                  LRecPurchaseRequestLine.SETRANGE("Vendor No.","Vendor No.");
                  LRecPurchaseRequestLine.SETRANGE("Vendor Invoice No.","Vendor Invoice No.");
                  IF LRecPurchaseRequestLine.FINDFIRST THEN
                    IF "Vendor Invoice No."<>'' THEN
                      ERROR('Le N° facture %1 a été saisi dans la ligne %2 de la DA %3',"Vendor Invoice No.",LRecPurchaseRequestLine."Line No.",LRecPurchaseRequestLine."Request No.");
                  //Commentaire+=' ' +"Vendor Name" +' ' +"Vendor Invoice No.";
                END;
            end;
        }
        field(23;"Vendor Item No.";Text[20])
        {
            CaptionML = ENU='Vendor Item No.',
                        FRA='Référence fournisseur';

            trigger OnLookup();
            var
                ItemCrossReference : Record "5717";
            begin
                TESTFIELD(Type,Type::Item);
                ItemCrossReference.RESET;
                ItemCrossReference.SETCURRENTKEY("Cross-Reference Type","Cross-Reference Type No.");
                ItemCrossReference.SETFILTER(
                "Cross-Reference Type",'%1|%2',
                    ItemCrossReference."Cross-Reference Type"::Vendor,
                    ItemCrossReference."Cross-Reference Type"::" ");
                ItemCrossReference.SETFILTER("Cross-Reference Type No.",'%1|%2',"Vendor No.",'');
                ItemCrossReference.SETFILTER(ItemCrossReference."Item No.","Item No.");
                IF PAGE.RUNMODAL(PAGE::"Cross Reference List",ItemCrossReference) = ACTION::LookupOK THEN
                BEGIN
                  VALIDATE("Item No.",ItemCrossReference."Item No.");
                  "Vendor Item No.":=ItemCrossReference."Cross-Reference No.";
                END
            end;

            trigger OnValidate();
            begin
                ControleModif("Request No.");
            end;
        }
        field(24;"Vendor Name";Text[100])
        {
            Caption = 'Nom fournisseur';
            Editable = false;
        }
        field(29;"Purchaseperson Code";Code[10])
        {
            CaptionML = ENU='Purchaser Code',
                        FRA='Code acheteur';
            Editable = false;
            TableRelation = Salesperson/Purchaser;
        }
        field(30;"Dimension Value";Code[20])
        {
            CaptionML = ENU='Dimension Code',
                        FRA='Section analytique';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE (Dimension Code=FILTER(COSTCENTER));

            trigger OnValidate();
            var
                RecLDimensionValue : Record "349";
            begin
                ControleModif("Request No.");
                IF RecGeneralSetup.GET THEN;
                RecLDimensionValue.GET(RecGeneralSetup."Global Dimension 1 Code","Dimension Value");
                RecLDimensionValue.TESTFIELD(RecLDimensionValue."Dimension Value Type",RecLDimensionValue."Dimension Value Type"::Standard);
            end;
        }
        field(68;Inventory;Decimal)
        {
            BlankZero = true;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE (Item No.=FIELD(Item No.)));
            CaptionML = ENU='Inventory',
                        FRA='Stock';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50000;Status;Option)
        {
            CaptionML = ENU='Status',
                        FRA='Statut';
            Editable = true;
            OptionCaptionML = ENU='Open,Released,Ordered,Refused,Archived',
                              FRA='Ouvert,Lancé,Commandé,Refusé,Archivé';
            OptionMembers = Open,Released,Ordered,Refused,Archived;
        }
        field(50001;"Stock de rotation";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(50002;"N° budget d'investissement";Code[10])
        {
            CaptionML = ENU='Investment Budget Code',
                        FRA='N° budget d''investissement';
            TableRelation = "FA Budget" WHERE (Cloture=FILTER(No));

            trigger OnValidate();
            begin

                IF (Type <> Type::"Fixed Asset") AND  (Type <> Type::"Existing Fixed Asset") THEN
                  ERROR(Error001);

                CLEAR("Item No.");
            end;
        }
        field(50003;"Code Rubrique";Code[10])
        {

            trigger OnValidate();
            var
                RecLLignesBudget : Record "50002";
            begin
            end;
        }
        field(50004;Montant;Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            BlankZero = true;
            CaptionML = ENU='Amount',
                        FRA='Montant';
            Editable = false;
            FieldClass = Normal;
        }
        field(50005;"Montant DS";Decimal)
        {
            AutoFormatType = 1;
            BlankZero = true;
            CaptionML = ENU='Amount LCY',
                        FRA='Montant DS';
            Editable = false;
        }
        field(50006;"Code Client";Code[20])
        {
            CaptionML = ENU='Customer Code',
                        FRA='Code Client';
            TableRelation = Customer;
        }
        field(50007;"% Remise";Decimal)
        {
            BlankZero = true;
            CaptionML = ENU='Discount %',
                        FRA='% Remise';
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate();
            begin
                UpdateAmount;
            end;
        }
        field(50008;"Code Motif Refus";Code[20])
        {
            CaptionML = ENU='Refusal reason',
                        FRA='Code Motif Refus';
            DataClassification = ToBeClassified;
            TableRelation = "Motif refus"."Code Motif";

            trigger OnValidate();
            begin
                RecGUserSetup.GET(USERID);
                IF NOT RecGUserSetup."Approuver Demande Achat" THEN
                   ERROR(CstGText006,USERID);
            end;
        }
        field(50009;"Ligne approuvée";Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                RecGUserSetup.GET(USERID);
                IF NOT RecGUserSetup."Service Compta." THEN
                   ERROR(CstGText006,USERID);
            end;
        }
        field(50010;"Employée";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee.No.;

            trigger OnValidate();
            begin
                CLEAR(Employee);
                IF Employee.GET(Employée) THEN
                  "Nom employée" := Employee."First Name" +' ' + Employee."Last Name";
            end;
        }
        field(50011;"Nom employée";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50012;"Order No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'KK_271218';
        }
        field(50013;"Order Line No.";Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'KK_271218';
        }
        field(50014;"A imprimer";Boolean)
        {
            DataClassification = ToBeClassified;
            Description = 'KK_020118';
        }
        field(50015;"No. série";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(80008;"No. compte comptable";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(80009;Commentaire;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(80010;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            CaptionML = ENU='Global Dimension 1 Code',
                        FRA='Code axe principal 1';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(1));
        }
        field(80011;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            CaptionML = ENU='Global Dimension 2 Code',
                        FRA='Code axe principal 2';
            TableRelation = "Dimension Value".Code WHERE (Global Dimension No.=CONST(2));

            trigger OnValidate();
            begin
                "Centre de gestion" := "Global Dimension 2 Code";
            end;
        }
        field(80012;"Request Date";Date)
        {
            Caption = 'Date demande Achat';
            DataClassification = ToBeClassified;
        }
        field(80013;"Solde budget";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80014;"Budget initial";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80015;"Budget consommé";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(80016;"Montant budget ligne D.A";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                 RecGUserSetup.GET(USERID);
                IF NOT RecGUserSetup."Approuver Demande Achat" THEN
                   ERROR(CstGText006,USERID);

            end;
        }
        field(80017;"Dépassement budget";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80018;"Approbation Directeur Site";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80019;"Code Immo. A affecter";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset".No.;

            trigger OnValidate();
            begin
                CLEAR(FixedAsset);
                IF "Code Immo. A affecter" <> '' THEN
                  BEGIN
                FixedAsset.GET("Code Immo. A affecter");
                    "Libelle Immo." := FixedAsset.Description;
                    END;
            end;
        }
        field(80020;"Libelle Immo.";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(80021;"Exclure budget";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80022;"Inlure Budget.";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80023;"Exclure budget.";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(80024;"Frs réglément";Code[20])
        {
            CalcFormula = Lookup("Payment Line"."Account No." WHERE (No. D.A=FIELD(Request No.),
                                                                     No. Ligne D.A=FIELD(Line No.)));
            FieldClass = FlowField;
        }
        field(80025;"No bordereau";Code[20])
        {
            CalcFormula = Lookup("Payment Line".No. WHERE (No. D.A=FIELD(Request No.),
                                                           No. Ligne D.A=FIELD(Line No.)));
            FieldClass = FlowField;
        }
        field(80026;"Montant Bordereau";Decimal)
        {
            CalcFormula = Sum("Payment Line".Amount WHERE (No. D.A=FIELD(Request No.),
                                                           No. Ligne D.A=FIELD(Line No.),
                                                           Status No.=FILTER(<>120000)));
            FieldClass = FlowField;
        }
        field(80027;"Vendor Invoice No.";Code[20])
        {
            CaptionML = ENU='Vendor Invoice No.',
                        FRA='N° Facture Fournisseur';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            var
                LRecPurchaseRequestLine : Record "50008";
            begin
                IF "Vendor No."<>'' THEN BEGIN
                  LRecPurchaseRequestLine.RESET;
                  LRecPurchaseRequestLine.SETRANGE("Vendor No.","Vendor No.");
                  LRecPurchaseRequestLine.SETRANGE("Vendor Invoice No.","Vendor Invoice No.");
                  IF LRecPurchaseRequestLine.FINDFIRST THEN
                    IF "Vendor Invoice No."<>'' THEN
                      ERROR('Le N° facture %1 a été saisi dans la ligne %2 de la DA %3',"Vendor Invoice No.",LRecPurchaseRequestLine."Line No.",LRecPurchaseRequestLine."Request No.");
                  //Commentaire+=' ' +"Vendor Name" +' ' +"Vendor Invoice No.";
                END;
            end;
        }
        field(80028;"No. Chassie";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                DetailVNArrivage.RESET;
                DetailVNArrivage.SETRANGE( VIN,"No. Chassie");
                DetailVNArrivage.FINDFIRST;
            end;
        }
        field(80029;"No. Facture vente";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sales Invoice Header"."Sell-to Customer No." WHERE (Order Type=FILTER(VN));
        }
        field(80030;"Centre de gestion";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center";
        }
        field(80031;"Code Activité";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Service Shelf";
        }
        field(80032;"N° budget d'investissement.";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name".Name;
        }
        field(80033;"Approvée par la D.C.G";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Request No.","Line No.")
        {
            SumIndexFields = Montant;
        }
        key(Key2;"Request No.","Vendor No.","Item No.")
        {
            SumIndexFields = Montant;
        }
        key(Key3;"N° budget d'investissement",Status,Type)
        {
            SumIndexFields = Montant,"Montant DS";
        }
        key(Key4;"Item No.",Status)
        {
            SumIndexFields = "Approved quantity";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        RecGPurchaseRequestLine : Record "50008";
        IntLIndex : Integer;
    begin
        //ControleModif("Request No.");
        
        /*RecGPurchaseRequestLine.SETRANGE("Request No.","Request No.");
        IF RecGPurchaseRequestLine.COUNT = 1 THEN
        BEGIN
          IF RecGPurchaseRequestLine.FINDFIRST THEN
            IntLIndex:= RecGPurchaseRequestLine."Line No." +1000;
          RecGPurchaseRequestLine.RESET;
          RecGPurchaseRequestLine.INIT;
          RecGPurchaseRequestLine."Request No.":="Request No.";
          RecGPurchaseRequestLine."Line No.":=IntLIndex;
          RecGPurchaseRequestLine.Status:=RecGPurchaseRequestLine.Status::Open;
          RecGPurchaseRequestLine.Type:=RecGPurchaseRequestLine.Type::Item;
          RecGPurchaseRequestLine.INSERT;
        END;
        */

    end;

    trigger OnInsert();
    begin
        ControleModif("Request No.");
        
        /*IF RecGPurchReqHeader.GET("Request No.") THEN
        BEGIN
          "N° budget d'investissement":=  RecGPurchReqHeader."N° budget d'investissement";
        END;
        */
        IF RecGPurchReqHeader.GET("Request No.") THEN
         BEGIN
          "Request Date":=  RecGPurchReqHeader."Request Date";
          "Global Dimension 1 Code" := RecGPurchReqHeader."Global Dimension 1 Code";
          "Global Dimension 2 Code" := RecGPurchReqHeader."Global Dimension 2 Code";
          //KK_271218
          RecGPurchReqHeader.TESTFIELD(RecGPurchReqHeader."Responsibility Center");
          ResponsibilityCenter.GET(RecGPurchReqHeader."Responsibility Center");
          "Location Code" := ResponsibilityCenter."Location Code DIV";
          "N° budget d'investissement." := RecGPurchReqHeader."Code Budget";
          //END_KK
         END;

    end;

    trigger OnModify();
    begin
         //ControleModif("Request No.");
    end;

    var
        RecGItem : Record "27";
        RecGPurchReqHeader : Record "50005";
        ItemAvailByDate : Page 157;
                              ItemAvailByVar : Page "5414";
                              ItemAvailByLoc : Page "492";
                              DecGMontant : Decimal;
                              RecGUserSetup : Record "91";
                              Error003 : TextConst ENU='Please choose first  "item" or "item charge"  or "fixed assets" code',FRA='Veuillez d''abord saisir une référence article';
                              RecGFrais : Record "5800";
                              Error001 : TextConst ENU='Type must be Fixed Asset  or Existing fixed asset',FRA='Type doit être immobilisation ou immobilisation existante';
                              RecGFixedAsset : Record "5600";
                              "-TRIUM-" : Integer;
                              RecGeneralSetup : Record "98";
                              CodGDimensionValue : Code[20];
                              Employee : Record "5200";
                              GeneralPostingSetup : Record "252";
                              ItemCharge : Record "5800";
                              PurchaseRequestHeader : Record "50005";
                              GLBudgetEntry : Record "96";
                              MntAutoriseBudgetLigne : Decimal;
                              GLAccount : Record "15";
                              DateDebBud : Date;
                              DateFinBud : Date;
                              GLBudgetName : Record "95";
                              CstGText006 : Label 'Vous n''avez pas le droit de modifier le budget par ligne';
        PurchaseRequestLine : Record "50008";
        ResponsibilityCenter : Record "5714";
        CstGText007 : Label 'Vous ne pouvez pas modifier une demande lancée !';
        FixedAsset : Record "5600";
        DetailVNArrivage : Record "70015";
        UserSetup : Record "91";
        Text00001 : Label 'Vous n''''êtes pas autoriser a saisir des DA de type article, Veuillez contacter votre administrateur système';

    local procedure TestStatusOpen();
    begin
        RecGPurchReqHeader.GET("Request No.");
        RecGPurchReqHeader.TESTFIELD(Status,RecGPurchReqHeader.Status::Open);
    end;

    procedure ItemAvailability(AvailabilityType : Option Date,Location);
    begin
        TESTFIELD("Item No.");
        RecGItem.RESET;
        RecGItem.GET("Item No.");
        RecGItem.SETRANGE("No.","Item No.");
        RecGItem.SETRANGE("Date Filter",0D,TODAY);

        CASE AvailabilityType OF
          AvailabilityType::Date:
            BEGIN
              RecGItem.SETRANGE("Location Filter","Location Code");
              CLEAR(ItemAvailByDate);
              ItemAvailByDate.LOOKUPMODE(TRUE);
              ItemAvailByDate.SETRECORD(RecGItem);
              ItemAvailByDate.SETTABLEVIEW(RecGItem);
              IF ItemAvailByDate.RUNMODAL = ACTION::LookupOK THEN;
            END;
          AvailabilityType::Location:
            BEGIN
              //RecGItem.SETRANGE("Variant Filter","Variant Code");
              CLEAR(ItemAvailByLoc);
              ItemAvailByLoc.LOOKUPMODE(TRUE);
              ItemAvailByLoc.SETRECORD(RecGItem);
              ItemAvailByLoc.SETTABLEVIEW(RecGItem);
              IF ItemAvailByLoc.RUNMODAL = ACTION::LookupOK THEN
                IF "Location Code" <> ItemAvailByLoc.GetLastLocation THEN
                    VALIDATE("Location Code",ItemAvailByLoc.GetLastLocation);
            END;
        END;
    end;

    procedure GetVendorPrice(CodLItem : Code[20];CodLVariant : Code[10];CurrencyCode : Code[10]) : Decimal;
    var
        RecLItem : Record "27";
        CodLVendor : Code[20];
        RecLPurchasePrice : Record "7012";
        DecLPuchasePrice : Decimal;
        DecLPuchasePriceDS : Decimal;
        PurchPriceCalcMgt : Codeunit "7010";
        PurchHeader : Record "38";
        PurchLine : Record "39";
        CalledByFieldNo : Integer;
    begin
        RecGPurchReqHeader.GET("Request No.");
        IF (RecGPurchReqHeader."Vendor No." <> '') AND (CodLItem<>'') THEN
        BEGIN
          PurchHeader.INIT;
          PurchHeader."Document Type":=PurchHeader."Document Type"::Order;
          PurchHeader."No.":='1';
          PurchHeader."Posting Date":=TODAY;
          PurchHeader."Order Date":=TODAY;
          PurchHeader.VALIDATE("Buy-from Vendor No.",RecGPurchReqHeader."Vendor No.");
          PurchHeader."Currency Code":=CurrencyCode;

          PurchLine.INIT;
          PurchLine."Document Type":=PurchLine."Document Type"::Order;
          PurchLine."Document No.":='1';
          PurchLine."Buy-from Vendor No.":=RecGPurchReqHeader."Vendor No.";
          PurchLine."Pay-to Vendor No.":=RecGPurchReqHeader."Vendor No.";
          PurchLine.Type:=PurchLine.Type::Item;
          PurchLine."No.":=CodLItem;

        //<< TRIUM RAD 24/04/2010 -
        //ajout de l'unité de mesure pour pouvoir récuperer le prix s'il existe une liste de prix
          PurchLine."Unit of Measure Code" := "Unit of Measure Code" ;
        //>> END TRIUM RAD 24/04/2010

          PurchLine."Currency Code":=CurrencyCode;
          PurchLine.Quantity:= "Approved quantity";
          CalledByFieldNo:=1;

          PurchPriceCalcMgt.FindPurchLinePrice(PurchHeader,PurchLine,CalledByFieldNo);
          DecLPuchasePrice:= PurchLine."Direct Unit Cost";
        END;
        EXIT(DecLPuchasePrice);
    end;

    procedure GetMontantDS(CurrencyCode : Code[10];DecLMnt : Decimal) : Decimal;
    var
        DecLMntDS : Decimal;
        CurrExchRate : Record "330";
    begin
        IF CurrencyCode <> '' THEN BEGIN
           DecLMntDS := CurrExchRate.ExchangeAmtFCYToLCY(WORKDATE,CurrencyCode,DecLMnt,
                         CurrExchRate.ExchangeRate(WORKDATE,CurrencyCode));

        END
        ELSE
          DecLMntDS:=DecLMnt;
        EXIT(ROUND(DecLMntDS));
    end;

    procedure CalcStockRotation() : Decimal;
    var
        SOuverture : Decimal;
        Scloture : Decimal;
        SortieStock : Decimal;
        DateDeb : Date;
        dateFin : Date;
        StockMoyen : Decimal;
        StockRotation : Decimal;
        RecL50005 : Record "50005";
        RecLItem : Record "27";
    begin
        SOuverture:=0;
        Scloture:=0;
        SortieStock:=0;
        StockMoyen:=0;
        StockRotation:=0;
        IF Type= Type::Item THEN
          IF ("Item No."<>'') THEN BEGIN
            RecL50005.GET("Request No.");
            RecLItem.GET("Item No.");

            DateDeb:=CALCDATE('<-1Y>' ,RecL50005."Request Date");
            RecLItem.SETRANGE(RecLItem."Date Filter",CALCDATE('<-1D>',DateDeb));
            RecLItem.CALCFIELDS(RecLItem."Net Change");
            dateFin:=RecL50005."Request Date";
            SOuverture:=RecLItem."Net Change";
            RecLItem.SETRANGE(RecLItem."Date Filter",DateDeb,dateFin);
            RecLItem.CALCFIELDS(RecLItem."Net Change");
            Scloture:= RecLItem."Net Change";
            RecLItem.SETRANGE(RecLItem."Date Filter",DateDeb,dateFin);
            RecLItem.CALCFIELDS(RecLItem."Sales (Qty.)",RecLItem."Negative Adjmt. (Qty.)");
            SortieStock:=RecLItem."Sales (Qty.)"+RecLItem."Negative Adjmt. (Qty.)";
            StockMoyen:=(SOuverture+Scloture)/2;
            IF SortieStock <>0 THEN
            StockRotation:=(StockMoyen/SortieStock)*360;
          END;
          EXIT(StockRotation);
    end;

    procedure UpdateAmount();
    begin
          Montant:="Approved quantity"*"Unit Cost";
          Montant:=("Approved quantity"*"Unit Cost") - (("Approved quantity"*"Unit Cost")*"% Remise"/100);
          RecGPurchReqHeader.GET("Request No.");
          IF RecGPurchReqHeader."Currency Code" = '' THEN
           "Montant DS":=Montant
          ELSE
           "Montant DS":= GetMontantDS(RecGPurchReqHeader."Currency Code",Montant);
        
          "Montant budget ligne D.A" := "Montant DS"
        
        
        
        
         /*
         "Budget alloué" := 0;
         "Budget consommé" := 0;
         "Solde budget" := 0;
        
         CLEAR(PurchaseRequestHeader);
         PurchaseRequestHeader.GET("Request No.");
         CLEAR(GLBudgetEntry);
         GLBudgetEntry.SETFILTER("Budget Name",'%1',PurchaseRequestHeader."Code Budget");
         GLBudgetEntry.SETFILTER("G/L Account No.",'%1',"No. compte comptable");
         GLBudgetEntry.SETFILTER("Global Dimension 1 Code",'%1',"Global Dimension 1 Code");
         GLBudgetEntry.FINDFIRST;
          REPEAT
           "Budget alloué" += GLBudgetEntry.Amount;
          UNTIL GLBudgetEntry.NEXT = 0;
        
        CLEAR(GLBudgetName);
        GLBudgetName.GET(PurchaseRequestHeader."Code Budget");
        
        CLEAR(GLAccount);
        GLAccount.GET("No. compte comptable");
        GLAccount.SETRANGE("Date Filter",DMY2DATE(1,1,GLBudgetName."Année budget"),DMY2DATE(31,12,GLBudgetName."Année budget"));
        GLAccount.CALCFIELDS("Total D.A");
        "Budget consommé" := GLAccount."Total D.A";
        
        "Solde budget" := "Budget alloué" - "Budget consommé";
        */

    end;

    procedure ControleModif(NumDemande : Code[20]);
    var
        RecLPurchReqHdr : Record "50005";
        RecGUserSetup : Record "91";
        Error001 : TextConst ENU='The status of the purchase request don''t allow update',FRA='Le statut de la demande ne permet plus sa modification';
    begin
        RecLPurchReqHdr.GET(NumDemande) ;
        RecGUserSetup.GET(UPPERCASE(USERID));

        //KK
        IF NOT RecGUserSetup."Approuver Demande Achat" THEN
          BEGIN
            IF (NOT ("Ligne approuvée" <> xRec."Ligne approuvée")) AND (NOT ("A imprimer" <> xRec."A imprimer"))  THEN
              IF RecLPurchReqHdr.Status = RecLPurchReqHdr.Status::Released THEN
                ERROR(CstGText007);
          END;

        //IF (RecLPurchReqHdr.Status = RecLPurchReqHdr.Status::Open) AND  (RecLPurchReqHdr."Request User ID" <> UPPERCASE(USERID)) THEN
          //  ERROR(Error001);


        IF (RecLPurchReqHdr.Status = RecLPurchReqHdr.Status::Released) AND (NOT ("A imprimer" <> xRec."A imprimer")) THEN
          RecGUserSetup.TESTFIELD("Approuver Demande Achat");
        //IF (RecLPurchReqHdr.Status >= RecLPurchReqHdr.Status::Released) AND (NOT RecGUserSetup."Transf. Demande --> Commande")THEN
          //ERROR(Error001);



        IF (RecLPurchReqHdr.Status >= RecLPurchReqHdr.Status::Ordered) AND (RecLPurchReqHdr.Status <> RecLPurchReqHdr.Status::Refused) THEN
            ERROR(Error001);


    end;
}

