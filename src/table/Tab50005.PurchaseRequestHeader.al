table 50005 "Purchase Request Header"
{
    // version DEM ACHAT

    CaptionML = ENU = 'Purchase Request Header',
                FRA = 'En-Tête Demande Achat';
    DataCaptionFields = "No.", "Request Date", "Vendor No.";
    DrillDownPageID = 50006;
    LookupPageID = 50006;

    fields
    {
        field(1; "No."; Code[20])
        {
            CaptionML = ENU = 'No.',
                        FRA = 'N°';

            trigger OnValidate();
            begin

                IF "No." <> xRec."No." THEN BEGIN
                    RecGPurchaseSetup.GET;
                    CuGNoSeriesMgt.TestManual(RecGPurchaseSetup."Request Nos.");
                END;
            end;
        }
        field(2; "Request Date"; Date)
        {
            CaptionML = ENU = 'Request Date',
                        FRA = 'Date demande';

            trigger OnValidate();
            begin
                TESTFIELD(Status, Status::Open);

                ControleModif("No.");
            end;
        }
        field(3; "Requested Receipt Date"; Date)
        {
            CaptionML = ENU = 'Requested Receipt Date',
                        FRA = 'Date réception demandée';

            trigger OnValidate();
            begin
                ControleModif("No.");
            end;
        }
        field(4; Status; Option)
        {
            CaptionML = ENU = 'Status',
                        FRA = 'Statut';
            OptionCaptionML = ENU = 'Open,Released,Ordered,Refused,Archived',
                              FRA = 'Ouvert,Lancé,Commandé,Refusé,Archivé';
            OptionMembers = Open,Released,Ordered,Refused,Archived;

            trigger OnValidate();
            var
                RecLPurchaseLine: Record "50008";
            begin
                RecLPurchaseLine.SETRANGE("Request No.", "No.");
                IF RecLPurchaseLine.FINDSET THEN
                    RecLPurchaseLine.MODIFYALL(Status, Status);
            end;
        }
        field(5; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            CaptionML = ENU = 'Global Dimension 1 Code',
                        FRA = 'Code axe principal 1';
            TableRelation = "Dimension Value".Code WHERE(Global Dimension No.=CONST(1));

            trigger OnValidate();
            begin
                RecGPurchReqLine.RESET;
                RecGPurchReqLine.SETFILTER("Request No.", '%1', "No.");
                RecGPurchReqLine.MODIFYALL("Global Dimension 1 Code", "Global Dimension 1 Code");

            end;
        }
        field(6; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            CaptionML = ENU = 'Global Dimension 2 Code',
                        FRA = 'Code axe principal 2';
            TableRelation = "Dimension Value".Code WHERE(Global Dimension No.=CONST(2));

            trigger OnValidate();
            begin
                RecGPurchReqLine.RESET;
                RecGPurchReqLine.SETFILTER("Request No.", '%1', "No.");
                RecGPurchReqLine.MODIFYALL("Global Dimension 2 Code", "Global Dimension 2 Code");
            end;
        }
        field(10; "Request User ID"; Code[50])
        {
            CaptionML = ENU = 'Requesting User',
                        FRA = 'Code utilisateur demandeur';
            DataClassification = EndUserIdentifiableInformation;
            Editable = false;
            TableRelation = User."User Name";

            trigger OnValidate();
            var
                CuLLoginMgt: Codeunit "418";
            begin
            end;
        }
        field(11; "No. Series"; Code[10])
        {
            CaptionML = ENU = 'No. Series',
                        FRA = 'Souches de n°';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(18; "Date Refus"; DateTime)
        {
            CaptionML = ENU = 'Refusal Date',
                        FRA = 'Date Refus';
            Editable = false;
        }
        field(19; "Approval UserID"; Code[50])
        {
            CaptionML = ENU = 'Approval User ID',
                        FRA = 'Code utilisateur approbateur';
            DataClassification = EndUserIdentifiableInformation;

            trigger OnLookup();
            var
                CuLLoginMgt: Codeunit "418";
            begin
            end;

            trigger OnValidate();
            var
                CuLLoginMgt: Codeunit "418";
            begin
            end;
        }
        field(20; "Refused by"; Code[50])
        {
            CaptionML = ENU = 'Refused by',
                        FRA = 'Refusé par';
        }
        field(21; "Code Motif Refus"; Code[20])
        {
            CaptionML = ENU = 'Refusal reason',
                        FRA = 'Code Motif Refus';
            TableRelation = "Motif refus"."Code Motif";
        }
        field(22; "Purchaseperson Code"; Code[20])
        {
            CaptionML = ENU = 'Purchaseperson Code',
                        FRA = 'Code Acheteur';
            TableRelation = Salesperson/Purchaser.Code WHERE (Acheteur/vendeur=CONST(Acheteur));
        }
        field(30;"Source Type";Option)
        {
            CaptionML = ENU='Source Type',
                        FRA='Type Origine';
            OptionCaptionML = ENU='Inventory,Customer,Exploitation,Sales,SAV',
                              FRA='Stock,Client,Exploitation,Vente,SAV';
            OptionMembers = Stock,Customer,Exploitation,Sales,SAV;

            trigger OnValidate();
            var
                RecLLigneReqAchat : Record "50008";
            begin
                ControleModif("No.");

                IF "Source Type" <> xRec."Source Type" THEN
                  CLEAR("Source No.");
            end;
        }
        field(31;"Source No.";Code[20])
        {
            CaptionML = ENU='Source No.',
                        FRA='N° Origine';
            TableRelation = IF (Source Type=CONST(Stock)) "Standard Text"
                            ELSE IF (Source Type=CONST(Customer)) Customer;

            trigger OnValidate();
            var
                ICPartner : Record "413";
                ItemCrossReference : Record "5717";
                PrepaymentMgt : Codeunit "441";
                KitUnitPrice : Decimal;
            begin
            end;
        }
        field(46;Comment;Boolean)
        {
            CaptionML = ENU='Comment',
                        FRA='Commentaires';
            Editable = false;
            FieldClass = Normal;
        }
        field(100;"Montant HT";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 2;
            CalcFormula = Sum("Purchase Request Line".Montant WHERE (Request No.=FIELD(No.)));
            CaptionML = ENU='Amount',
                        FRA='Montant HT';
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate();
            begin
                "Montant HT DS":="Montant HT";
            end;
        }
        field(101;"Currency Code";Code[10])
        {
            CaptionML = ENU='Currency Code',
                        FRA='Code devise';
            FieldClass = Normal;
            TableRelation = Currency.Code;

            trigger OnValidate();
            var
                RecLPurchReqLine : Record "50008";
            begin
                ControleModif("No.");

                IF xRec."Currency Code" <> "Currency Code" THEN
                BEGIN
                  IF CONFIRM(CstGText004) = TRUE THEN
                  BEGIN
                   RecGVendor.GET("Vendor No.");
                   //MODIFY;
                   RecLPurchReqLine.SETRANGE(RecLPurchReqLine."Request No.","No.");
                   RecLPurchReqLine.SETFILTER(Type,'<>%1',RecLPurchReqLine.Type::" ");
                   IF RecLPurchReqLine.FINDFIRST THEN
                    REPEAT
                     IF "Currency Code" = '' THEN
                       RecLPurchReqLine."Montant DS":=RecLPurchReqLine.Montant
                     ELSE
                       RecLPurchReqLine."Montant DS":= RecLPurchReqLine.GetMontantDS("Currency Code",RecLPurchReqLine.Montant);

                      RecLPurchReqLine.MODIFY;
                    UNTIL RecLPurchReqLine.NEXT=0;
                  END

                END;
            end;
        }
        field(50011;"Approval User ID 2";Code[50])
        {
            CaptionML = ENU='Approval User ID  2',
                        FRA='Code utilisateur approbateur 2';

            trigger OnLookup();
            var
                CuLLoginMgt : Codeunit "418";
            begin
            end;

            trigger OnValidate();
            var
                CuLLoginMgt : Codeunit "418";
            begin
            end;
        }
        field(50016;"Vendor No.";Code[20])
        {
            CaptionML = ENU='Vendor No.',
                        FRA='N° Fournisseur';
            TableRelation = Vendor.No. WHERE (No.=FILTER(FR*));

            trigger OnValidate();
            var
                RecLPurchReqLine : Record "50008";
            begin
                ControleModif("No.");
                IF RecGVendor.GET("Vendor No.") THEN
                BEGIN
                  IF xRec."Vendor No." <> "Vendor No." THEN
                  BEGIN

                      RecGVendor.GET("Vendor No.");
                      "Currency Code":=RecGVendor."Currency Code";
                      "Purchaseperson Code":=RecGVendor."Purchaser Code";
                      MODIFY;
                      RecLPurchReqLine.SETRANGE(RecLPurchReqLine."Request No.","No.");
                      RecLPurchReqLine.SETRANGE(Type,RecLPurchReqLine.Type::Item);
                      IF RecLPurchReqLine.FINDFIRST THEN
                      REPEAT
                        IF CONFIRM(CstGText003) = TRUE THEN
                          BEGIN
                            RecLPurchReqLine.VALIDATE("Unit Cost",RecLPurchReqLine.GetVendorPrice(RecLPurchReqLine."Item No.",'',"Currency Code"));
                            RecLPurchReqLine.MODIFY;
                          END;
                      UNTIL RecLPurchReqLine.NEXT=0;

                  END;
                  "Nom Fournisseur" := RecGVendor.Name;
                END;

                RecGPurchReqLine.RESET;
                RecGPurchReqLine.SETFILTER("Request No.",'%1',"No.");
                RecGPurchReqLine.MODIFYALL("Vendor No.","Vendor No.");
                RecGPurchReqLine.MODIFYALL("Vendor Name","Nom Fournisseur");
            end;
        }
        field(50017;"Montant HT DS";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Purchase Request Line"."Montant DS" WHERE (Request No.=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(50019;"Date Approbation";DateTime)
        {
            CaptionML = ENU='Approbation Date',
                        FRA='Date Approbation';
        }
        field(50020;"Date Approb. 2";DateTime)
        {
        }
        field(50024;"Nom Fournisseur";Text[50])
        {
            CaptionML = ENU='Vendor Name',
                        FRA='Nom Fournisseur';
            Editable = false;
        }
        field(50026;Description;Text[30])
        {
        }
        field(50027;"Fichier Joint";BLOB)
        {
            CaptionML = ENU='File Attached',
                        FIN='Fichier Joint';
        }
        field(50028;"N° Commande Achat";Code[20])
        {
            CaptionML = ENU='Purchase Order No.',
                        FRA='N° Commande Achat';
        }
        field(50029;Visible;Boolean)
        {
            CalcFormula = Exist("Purchase Request Line" WHERE (Request No.=FIELD(No.),
                                                               Type=FILTER(<>' '),
                                                               Status=FILTER(<>Archived)));
            FieldClass = FlowField;
        }
        field(50030;Immobilisation;Boolean)
        {
            CalcFormula = Exist("Purchase Request Line" WHERE (Type=FILTER(Fixed Asset|Existing Fixed Asset),
                                                               Request No.=FIELD(No.)));
            CaptionML = ENU='Fixed Asset',
                        FRA='Immobilisation';
            FieldClass = FlowField;
        }
        field(50031;"Responsibility Center";Code[10])
        {
            CaptionML = ENU='Responsibility Center',
                        FRA='Centre de gestion';
            TableRelation = "Responsibility Center";
        }
        field(50032;"Approvée par la D.C.G";Boolean)
        {
            CaptionML = ENU='Checked by the Finance',
                        FRA='Approvée par la D.C.G';
        }
        field(50033;"Purchase Type";Code[20])
        {
            CaptionML = ENU='Purchase Type',
                        FRA='Type achat';
            TableRelation = "Type Achat".Code;
        }
        field(50034;"Customer No.";Code[20])
        {
            CaptionML = ENU='Customer No.',
                        FRA='Num Client';
        }
        field(50035;"Approbation totale";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50036;"Approbation partielle";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50037;"Pour le compte de :";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50041;"Approvée par la D.F";Boolean)
        {
            CaptionML = ENU='Checked by the Finance',
                        FRA='Approvée par la D.F';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                RecGUserSetup.GET(USERID);
                RecGUserSetup.TESTFIELD("Finance approve");
                //SM 120219
                TESTFIELD("Approvée par la D.C.G",TRUE);
                //END SM
            end;
        }
        field(50042;"Code Budget";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name".Name;
        }
        field(50043;"Dépassement Budget";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(50044;"Approuvé par la DCG par";Text[50])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(50045;"Approuvé par la DCG le";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50046;"Approuvé par la DF par";Text[50])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(50047;"Approuvé par la DF le";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50048;"Temp d'approbation DCG";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50049;"Temp d'approbation Finance";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50050;"D.A pour app Budget";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50051;"Mode de règlement";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '" ,Chèque,Espèce"';
            OptionMembers = " ","Chèque","Espèce";

            trigger OnValidate();
            begin
                RecGUserSetup.GET(USERID);
                RecGUserSetup.TESTFIELD("Finance approve");
            end;
        }
        field(50052;"D.A réglé";Boolean)
        {
            CalcFormula = Exist("Payment Line" WHERE (No. D.A=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(50053;"Approvée par la Dir.Genenal";Boolean)
        {
            CaptionML = ENU='Checked by the Finance',
                        FRA='Approvée par la Dir.Genenal';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin

                RecGUserSetup.GET(USERID);
                RecGUserSetup.TESTFIELD("Profil Directeur Général");

                IF "Approvée par la Dir.Genenal"  THEN
                BEGIN

                 "Approvée par la Dir.Genenal le" := WORKDATE;
                 "Temp d'approbation Dir.Genenal" := TIME;
                 "En Attente d'approbation D.G" := FALSE;
                END;



            end;
        }
        field(50054;"Approvée par la Dir.Genenal le";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50055;"Temp d'approbation Dir.Genenal";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50056;"Motif Refus Dir. Général.";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50057;"---------------------";Option)
        {
            CaptionML = ENU='Checked by the Finance',
                        FRA='Accepter / Réfusé Dir.Genenal';
            DataClassification = ToBeClassified;
            OptionCaption = '" ,Accepter,Refusée"';
            OptionMembers = " ",Accepter,"Refusée";

            trigger OnValidate();
            begin
                RecGUserSetup.GET(USERID);
                RecGUserSetup.TESTFIELD("Profil Directeur Général");

                IF "---------------------" = "---------------------"::Accepter THEN
                BEGIN
                 "Approvée par la Dir.Genenal" := TRUE;
                 "Approvée par la Dir.Genenal le" := WORKDATE;
                 "Temp d'approbation Dir.Genenal" := TIME;
                 "En Attente d'approbation D.G" := FALSE;
                END;

                 IF "---------------------" = "---------------------"::Refusée THEN
                BEGIN
                "Refusé par la Dir.Genenal" := TRUE;
                "Refusé par la Dir.Genenal le" := WORKDATE;
                 "Temp Refus Dir.Genenal" := TIME;
                 Status := Status::Refused;
                 "Motif Refus Dir. Général." := 'Refus DG :';

                END;
            end;
        }
        field(50058;"Refusé par la Dir.Genenal le";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50059;"Temp Refus Dir.Genenal";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50060;"Nature de l'achat";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'SM120219';
            OptionCaption = 'Utilisation Interne,Habituel,Occasionnel,Pour la revente';
            OptionMembers = "Utilisation Interne",Habituel,Occasionnel,"Pour la revente";
        }
        field(50061;"No. L.C";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Lettre de crédit L.C"."Code L.C";
        }
        field(50062;"No. Dossier Import";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Entête Facture P.R / Colis".No.;
        }
        field(50063;"No. Facture achat";Code[20])
        {
            CalcFormula = Lookup("Purch. Inv. Header".No. WHERE (Request No.=FIELD(No.)));
            FieldClass = FlowField;
        }
        field(50064;"Refusé par la Dir.Genenal";Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                 RecGUserSetup.GET(USERID);
                RecGUserSetup.TESTFIELD("Profil Directeur Général");
                IF "Refusé par la Dir.Genenal" THEN
                BEGIN
                  "Refusé par la Dir.Genenal le" := WORKDATE;
                   "Temp Refus Dir.Genenal" := TIME;
                   Status := Status::Refused;
                   "Motif Refus Dir. Général." := 'Refus DG :';
                 END;
            end;
        }
        field(50065;"Ré-Ouvrir par Dir.Genenal";Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                RecGUserSetup.GET(USERID);
                RecGUserSetup.TESTFIELD("Profil Directeur Général");
                IF "Ré-Ouvrir par Dir.Genenal" THEN
                  BEGIN
                      "Approvée par la Dir.Genenal" := FALSE;
                      "Refusé par la Dir.Genenal" := FALSE;
                      "Approvée par la Dir.Genenal le" := 0D;
                       "Temp d'approbation Dir.Genenal" := 0T;
                      "Refusé par la Dir.Genenal le" := 0D;
                       "Temp Refus Dir.Genenal" := 0T;
                      "Motif Refus Dir. Général." := '';
                      Status := Status::Released;
                      "En Attente d'approbation D.G" := TRUE;
                   END;
                   "Ré-Ouvrir par Dir.Genenal" := FALSE;
            end;
        }
        field(50066;"En Attente d'approbation D.G";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50067;"Payment Terms Code";Code[10])
        {
            CaptionML = ENU='Payment Terms Code',
                        FRA='Code condition paiement';
            DataClassification = ToBeClassified;
            TableRelation = "Payment Terms";

            trigger OnValidate();
            begin
                /*IF ("Payment Terms Code" <> '') AND ("Document Date" <> 0D) THEN BEGIN
                  PaymentTerms.GET("Payment Terms Code");
                  IF IsCreditDocType AND NOT PaymentTerms."Calc. Pmt. Disc. on Cr. Memos" THEN BEGIN
                    VALIDATE("Due Date","Document Date");
                    VALIDATE("Pmt. Discount Date",0D);
                    VALIDATE("Payment Discount %",0);
                  END ELSE BEGIN
                    "Due Date" := CALCDATE(PaymentTerms."Due Date Calculation","Posting Date"); //ancien code date compta demande comptabilité pour rem par date compta
                    "Pmt. Discount Date" := CALCDATE(PaymentTerms."Discount Date Calculation","Document Date");
                    IF NOT UpdateDocumentDate THEN
                      VALIDATE("Payment Discount %",PaymentTerms."Discount %")
                  END;
                END ELSE BEGIN
                  VALIDATE("Due Date","Document Date");
                  IF NOT UpdateDocumentDate THEN BEGIN
                    VALIDATE("Pmt. Discount Date",0D);
                    VALIDATE("Payment Discount %",0);
                  END;
                END;
                IF xRec."Payment Terms Code" = "Prepmt. Payment Terms Code" THEN
                  VALIDATE("Prepmt. Payment Terms Code","Payment Terms Code");
                  */

            end;
        }
        field(50068;"Payment Method Code";Code[10])
        {
            CaptionML = ENU='Payment Method Code',
                        FRA='Code mode de règlement';
            DataClassification = ToBeClassified;
            TableRelation = "Payment Method";

            trigger OnValidate();
            begin
                /*PaymentMethod.INIT;
                IF "Payment Method Code" <> '' THEN
                  PaymentMethod.GET("Payment Method Code");
                "Bal. Account Type" := PaymentMethod."Bal. Account Type";
                "Bal. Account No." := PaymentMethod."Bal. Account No.";
                IF "Bal. Account No." <> '' THEN BEGIN
                  TESTFIELD("Applies-to Doc. No.",'');
                  TESTFIELD("Applies-to ID",'');
                END;
                */

            end;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
        }
        key(Key2;Status,"Request User ID")
        {
        }
        key(Key3;"Source Type","Source No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        ControleModif("No.");

        RecGPurchRequestLine.SETFILTER(RecGPurchRequestLine."Request No.","No.");
        RecGPurchRequestLine.DELETEALL;

        RecGPurchCommentLine.SETRANGE("Document Type",RecGPurchCommentLine."Document Type"::"10");
        RecGPurchCommentLine.SETRANGE("No.","No.");
        RecGPurchCommentLine.DELETEALL;
    end;

    trigger OnInsert();
    var
        CodLDefaultSeriesCode : Code[20];
    begin
        RecGPurchaseSetup.GET;

        IF "No." = '' THEN BEGIN
          RecGPurchaseSetup.TESTFIELD("Request Nos.");
          CodLDefaultSeriesCode:=RecGPurchaseSetup."Request Nos.";
          CuGNoSeriesMgt.InitSeries(CodLDefaultSeriesCode,xRec."No. Series",WORKDATE,"No.","No. Series");
        END;

        InitRecord;
    end;

    trigger OnModify();
    begin
        //ControleModif("No.");
    end;

    var
        RecGPurchaseSetup : Record "312";
        CuGNoSeriesMgt : Codeunit "396";
        RecGUserSetup : Record "91";
        RecGPurchCommentLine : Record "43";
        RecGPurchRequestLine : Record "50008";
        UserMgt : Codeunit "5700";
        CstGText003 : TextConst ENU='Vendor modification will recalculate request lines cost \Do you want to recalculate request lines cost?.',FRA='La modification du fournisseur va entrainer le recalcul des lignes de la demande\Souhaitez vous recalculer les lignes de la demande ?';
        RecGVendor : Record "23";
        RecGPurchaseRequestLine : Record "50008";
        CstGText004 : TextConst ENU='Currency modification will recalculate request lines cost \Do you want to recalculate request lines cost?.',FRA='La modification de la devise va entrainer le recalcul des lignes de la demande\Souhaitez vous recalculer les lignes de la demande ?';
        i : Integer;
        RecGPurchOrderHeader : Record "38";
        RecGPurchReqLine : Record "50008";
        Ligne : Integer;
        RecGFASetup : Record "5603";
        RecGGenaralSetup : Record "98";
        AnneeDA : Integer;
        GLBudgetName : Record "95";
        CstGText005 : Label 'Vous ne pouvez pas modifier une demande lancée !';
        NoSeries : Record "308";
        NoSeriesLine : Record "309";
        PurchasesPayablesSetup : Record "312";
        ServiceShelf : Record "5929";
        AnnDiv : Integer;

    procedure InitRecord();
    begin
        "Request User ID" := USERID;
        "Request Date" := TODAY;
        "Requested Receipt Date" := TODAY;
        "Responsibility Center":=UserMgt.GetPurchasesFilter();
        "Global Dimension 2 Code" := "Responsibility Center";

        AnneeDA := DATE2DMY(WORKDATE,3);
        CLEAR(GLBudgetName);
        GLBudgetName.SETRANGE("Année budget",AnneeDA);
        GLBudgetName.FINDFIRST;
        "Code Budget" :=GLBudgetName.Name;

        //RecGPurchaseRequestLine."Request No.":="No.";
        //RecGPurchaseRequestLine.Status:=RecGPurchaseRequestLine.Status::Open;
        //RecGPurchaseRequestLine.Type:=RecGPurchaseRequestLine.Type::Item;
        //RecGPurchaseRequestLine."Line No.":=10000;
        //RecGPurchaseRequestLine.INSERT;
    end;

    procedure AssistEdit(OldPurchaseRequest : Record "50005") : Boolean;
    begin
    end;

    procedure GetTotal() : Decimal;
    var
        RecPurchaseRequestLine : Record "50008";
        DecLMontant : Decimal;
        MontantTemp : Decimal;
    begin
        RecPurchaseRequestLine.SETRANGE(RecPurchaseRequestLine."Request No.", "No.");
        IF RecPurchaseRequestLine.FINDFIRST THEN
        REPEAT
          DecLMontant:=DecLMontant+ (RecPurchaseRequestLine."Unit Cost" * RecPurchaseRequestLine.Quantity);
          MontantTemp:=(RecPurchaseRequestLine.Quantity * RecPurchaseRequestLine."Unit Cost") -
          ((RecPurchaseRequestLine.Quantity * RecPurchaseRequestLine."Unit Cost")*RecPurchaseRequestLine."% Remise"/100);

          DecLMontant:=DecLMontant+ MontantTemp;
        UNTIL RecPurchaseRequestLine.NEXT=0;

        EXIT(DecLMontant);
    end;

    procedure SendMail();
    var
        RecLRequest : Record "50005";
        RecLUserSetup : Record "91";
        Text001 : Label '"Veuillez SVP valider la demande d''achat  N° %1 "';
        SenderName : Text[250];
        SenderAddress : Text[250];
        Subject : Text[250];
        Body : Text[250];
        SMTP : Codeunit "400";
        Recipient : Text[250];
        Text002 : Label 'Approbation demande d''achat  N° %1';
    begin
    end;

    procedure ControleModif(NumDemande : Code[20]);
    var
        RecLPurchReqHdr : Record "50005";
        Error001 : TextConst ENU='The status of the purchase request don''t allow update',FRA='Le statut de la demande ne permet plus sa modification';
    begin
         RecLPurchReqHdr.GET(NumDemande) ;
        RecGUserSetup.GET(UPPERCASE(USERID));
        
        //KK
        IF NOT RecGUserSetup."Approuver Demande Achat" THEN
          IF Status = Status::Released THEN
            ERROR(CstGText005);
        /*
        IF (RecLPurchReqHdr.Status =RecLPurchReqHdr.Status::Open) AND  (UPPERCASE(RecLPurchReqHdr."Request User ID")
           <> UPPERCASE(RecGUserSetup."User ID")) THEN
            ERROR(Error001);
        */
        //IF (RecLPurchReqHdr.Status >=RecLPurchReqHdr.Status::Released) AND (NOT RecGUserSetup."Transf. Demande --> Commande")THEN
        //    ERROR(Error001);
        
        
        //OLD IF RecLPurchReqHdr.Status = RecLPurchReqHdr.Status::Released THEN
        //OLD  RecGUserSetup.TESTFIELD("Approuver Demande Achat");
        
         IF (RecLPurchReqHdr.Status >=RecLPurchReqHdr.Status::Ordered) AND (RecLPurchReqHdr.Status <> RecLPurchReqHdr.Status::Refused)THEN
            ERROR(Error001);
        

    end;

    procedure InsertHeader(var PurchReqHeader : Record "50005";PurchaseType : Integer;VendorNo : Code[20]);
    var
        Window : Dialog;
        PurchaseCommentLine : Record "43";
        OldPurchaseCommentLine : Record "43";
        RecLImmo : Record "5600";
        RecLBudget : Record "50001";
        CodeImmobilisation : Code[20];
        CstLText001 : Label 'Création commande     #1######';
        CstLText002 : Label 'Création devis             #1######';
    begin

        RecGPurchaseSetup.GET;
        RecGPurchaseSetup.TESTFIELD("Order Nos.");

        i:=0;

        IF PurchaseType = 1 THEN
          Window.OPEN(CstLText002)
        ELSE
          Window.OPEN(CstLText001);

        RecGPurchOrderHeader.INIT;

        // new purch line de type
        IF PurchaseType = 1 THEN
          RecGPurchOrderHeader."Document Type" := RecGPurchOrderHeader."Document Type"::Quote
        ELSE
          RecGPurchOrderHeader."Document Type" := RecGPurchOrderHeader."Document Type"::Order;

        RecGPurchOrderHeader."No." := '';

        RecGPurchOrderHeader.INSERT(TRUE);
        RecGPurchOrderHeader."Request No." := PurchReqHeader."No.";
        RecGPurchOrderHeader."Order Date" := TODAY;
        RecGPurchOrderHeader."Expected Receipt Date" := PurchReqHeader."Requested Receipt Date";

        RecGPurchOrderHeader."Posting Date" := TODAY;
        RecGPurchOrderHeader.VALIDATE("Buy-from Vendor No.",VendorNo);
        RecGPurchOrderHeader.VALIDATE("Currency Code",PurchReqHeader."Currency Code");
        PurchReqHeader."N° Commande Achat":= RecGPurchOrderHeader."No.";
        RecGPurchOrderHeader."Purchaser Code" := PurchReqHeader."Purchaseperson Code";
        RecGPurchOrderHeader."Code Demandeur" := PurchReqHeader."Request User ID";
        RecGPurchOrderHeader."Responsibility Center":=PurchReqHeader."Responsibility Center";
        RecGPurchOrderHeader."Shortcut Dimension 1 Code"  := PurchReqHeader."Global Dimension 1 Code";
        RecGPurchOrderHeader."Shortcut Dimension 2 Code"  := PurchReqHeader."Global Dimension 2 Code";
        RecGPurchOrderHeader."No budget d'investissement" := PurchReqHeader."Code Budget";
        RecGPurchOrderHeader."Order Type" := 3;
        RecGPurchOrderHeader.MODIFY;
        Window.UPDATE(1,RecGPurchOrderHeader."No.");

        // charger lignes DA du header DA courant

        RecGPurchReqLine.RESET;
        RecGPurchReqLine.SETCURRENTKEY("Request No.","Vendor No.","Item No.");
        RecGPurchReqLine.SETFILTER(RecGPurchReqLine."Request No.",PurchReqHeader."No.");
        RecGPurchReqLine.SETFILTER(RecGPurchReqLine."Ligne approuvée",'%1',TRUE);
        RecGPurchReqLine.FINDFIRST;

        // pour chaque liqne
        REPEAT
          //IF RecGPurchReqLine.Type = RecGPurchReqLine.Type::"Fixed Asset" THEN
            //CodeImmobilisation:=CreateFA(RecGPurchReqLine);

          InsertLine(RecGPurchReqLine, RecGPurchOrderHeader,FALSE,CodeImmobilisation);

        UNTIL RecGPurchReqLine.NEXT = 0;

        PurchaseCommentLine.SETRANGE("Document Type",PurchaseCommentLine."Document Type"::"10");
        PurchaseCommentLine.SETRANGE("No.",PurchReqHeader."No.");
        IF NOT PurchaseCommentLine.ISEMPTY THEN BEGIN
          PurchaseCommentLine.LOCKTABLE;
          IF PurchaseCommentLine.FINDSET THEN
            REPEAT
              OldPurchaseCommentLine := PurchaseCommentLine;
              PurchaseCommentLine."Document Type" := RecGPurchOrderHeader."Document Type";
              PurchaseCommentLine."No." := RecGPurchOrderHeader."No.";
              PurchaseCommentLine.INSERT;
              PurchaseCommentLine := OldPurchaseCommentLine;
            UNTIL PurchaseCommentLine.NEXT = 0;
        END;
        //PurchReqHeader.MODIFY;
        Window.CLOSE;
    end;

    procedure InsertLine(var RecLPurchReqLine : Record "50008";var PurchOrderHeader : Record "38";InitLigne : Boolean;CodeImmobilisation : Code[20]);
    var
        RecLPurchOrderLine : Record "39";
        PurchReqtLineToModify : Record "50008";
    begin
        
        WITH RecLPurchReqLine DO BEGIN
        
          //TESTFIELD("Currency Code",PurchOrderHeader."Currency Code");
        
          RecLPurchOrderLine.INIT;
        
          RecLPurchOrderLine.BlockDynamicTracking(TRUE);
          RecLPurchOrderLine."Document Type" := PurchOrderHeader."Document Type";
          RecLPurchOrderLine."Buy-from Vendor No." := "Vendor No.";
          RecLPurchOrderLine."Document No." := PurchOrderHeader."No.";
          RecLPurchOrderLine.Description:=RecLPurchReqLine.Description;
        
          IF InitLigne = FALSE THEN
            RecLPurchOrderLine."Line No." := "Line No."
          ELSE
            RecLPurchOrderLine."Line No.":= Ligne;
        
          RecLPurchOrderLine."Request No." := "Request No.";
        
          CASE  RecLPurchReqLine.Type OF
        
            RecLPurchReqLine.Type::Item                   :  RecLPurchOrderLine.VALIDATE(Type,RecLPurchOrderLine.Type::Item);
            RecLPurchReqLine.Type::"Fixed Asset" ,
            RecLPurchReqLine.Type::"Existing Fixed Asset" :  RecLPurchOrderLine.VALIDATE(Type,RecLPurchOrderLine.Type::"Fixed Asset");
            RecLPurchReqLine.Type::"Charge (Item)"        :  RecLPurchOrderLine.VALIDATE(Type,RecLPurchOrderLine.Type::"Charge (Item)");
        
          END;
        
          IF Type <> Type::" " THEN
          BEGIN
            IF ( Type= Type::Item ) OR (Type= Type::"Charge (Item)") OR (Type= Type::"Existing Fixed Asset")THEN
              RecLPurchOrderLine.VALIDATE("No.","Item No.");
        
            IF  (Type= Type::"Fixed Asset")  THEN
              RecLPurchOrderLine.VALIDATE("No.",CodeImmobilisation);
        
            //RecLPurchOrderLine.VALIDATE("Location Code","Location Code");
            RecLPurchOrderLine."Location Code":="Location Code";
            RecLPurchOrderLine.VALIDATE("Unit of Measure Code","Unit of Measure Code");
            RecLPurchOrderLine.VALIDATE(Quantity,RecLPurchReqLine."Approved quantity");
            IF PurchOrderHeader."Document Type" = PurchOrderHeader."Document Type"::Order THEN
              RecLPurchOrderLine.VALIDATE("Direct Unit Cost","Unit Cost")
            ELSE
              RecLPurchOrderLine.VALIDATE("Direct Unit Cost",0);
        
        
            RecLPurchOrderLine."Vendor Item No." := "Vendor Item No.";
            RecLPurchOrderLine.Description := Description;
            RecLPurchOrderLine."Request No." := "Request No.";
            RecLPurchOrderLine."Request Line No." := "Line No.";
            RecLPurchOrderLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
            RecLPurchOrderLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
            RecLPurchOrderLine."No. compte comptable"      := "No. compte comptable";
            RecLPurchOrderLine."No budget d'investissement":="Code Budget";
        
            RecLPurchOrderLine.VALIDATE("Line Discount %","% Remise");
        
        
        
           // IF RecLPurchReqLine."Vendor Item No." <> '' THEN
           //   RecLPurchOrderLine.VALIDATE("Cross-Reference No.",RecLPurchReqLine."Vendor Item No.");
            RecLPurchOrderLine.INSERT;
            Ligne:=Ligne +10000;
        
            //KK_271218
            PurchReqtLineToModify.GET("Request No.","Line No.");
            PurchReqtLineToModify."Order No." := RecLPurchOrderLine."Document No.";
            PurchReqtLineToModify."Order Line No." := RecLPurchOrderLine."Line No.";
            PurchReqtLineToModify.MODIFY;
            //END KK
            //AddOnIntegrMgt.TransferFromReqLineToPurchLine(PurchOrderLine,ReqLine2);
        /*
            DocDim.SETRANGE("Table ID",DATABASE::"Purchase Line");
            DocDim.SETRANGE("Document Type",RecLPurchOrderLine."Document Type");
            DocDim.SETRANGE("Document No.",RecLPurchOrderLine."Document No.");
            DocDim.SETRANGE("Line No.",RecLPurchOrderLine."Line No.");
            IF RecLPurchReqLine."Dimension Value" <> '' THEN
            BEGIN
              RecDocumentDimension."Table ID":=39;
              RecDocumentDimension."Document Type":=RecLPurchOrderLine."Document Type";
              RecDocumentDimension."Document No.":=RecLPurchOrderLine."Document No.";
              RecDocumentDimension."Line No.":=RecLPurchOrderLine."Line No.";
              RecDocumentDimension."Dimension Code":='COSTCENTER';
              RecDocumentDimension."Dimension Value Code":=RecLPurchReqLine."Dimension Value";
              IF RecDocumentDimension.INSERT THEN;
            END
        */
          END
          ELSE
          BEGIN
             RecLPurchOrderLine.Description := Description;
             RecLPurchOrderLine.INSERT;
             Ligne:=Ligne +10000;
        
          END
        END;

    end;

    procedure CreateFA(RecPurchReqLine : Record "50008") : Code[20];
    var
        RecLImmo : Record "5600";
        RecLBudget : Record "50001";
        RecLFADepreciationBook : Record "5612";
    begin
        
        RecGFASetup.GET;
        RecGFASetup.TESTFIELD("Default Depr. Book");
        RecLImmo.SETRANGE("Request No.",RecPurchReqLine."Request No.");
        RecLImmo.SETRANGE("Request No. FA Code",RecPurchReqLine."Item No.");
        IF  NOT RecLImmo.FINDFIRST THEN
        BEGIN
          RecLImmo.INIT;
          RecLImmo."No.":='';
          RecLImmo."No budget d'investissement":=RecGPurchReqLine."N° budget d'investissement";
          RecLImmo.Description:= RecGPurchReqLine.Description  ;
          RecLImmo."Search Description":=RecGPurchReqLine.Description ;
          RecLImmo."Request No.":=RecPurchReqLine."Request No.";
          RecLImmo."Request No. FA Code":=RecPurchReqLine."Item No.";
          RecLBudget.GET(RecGPurchReqLine."N° budget d'investissement");
          IF RecLImmo.INSERT(TRUE) THEN
          BEGIN
           RecGGenaralSetup.GET;
           /*
           IF RecLBudget."Nature d'investissement"<>'' THEN
           BEGIN
             RecLDocumentDimension."Table ID":=5600;
             RecLDocumentDimension."No.":=RecLImmo."No.";
             RecLDocumentDimension."Dimension Code":=RecGGenaralSetup."Nature d'investissement";
             RecLDocumentDimension."Dimension Value Code":=RecLBudget."Nature d'investissement";
             IF RecLDocumentDimension.INSERT THEN;
           END;
        
           IF RecLBudget."Type d'investissement" <> '' THEN
           BEGIN
             RecLDocumentDimension."Table ID":=5600;
             RecLDocumentDimension."No.":=RecLImmo."No.";
             RecLDocumentDimension."Dimension Code":=RecGGenaralSetup."Type d'investissement"   ;
             RecLDocumentDimension."Dimension Value Code":=RecLBudget."Type d'investissement";
             IF RecLDocumentDimension.INSERT THEN;
           END;
           */
           RecLFADepreciationBook.INIT;
           RecLFADepreciationBook."FA No.":=RecLImmo."No.";
           RecLFADepreciationBook.VALIDATE("Depreciation Book Code",RecGFASetup."Default Depr. Book");
           RecLFADepreciationBook.VALIDATE(RecLFADepreciationBook."FA Posting Group",RecPurchReqLine."FA Posting Group");
           RecLFADepreciationBook.INSERT(TRUE);
        
          END;
        END;
        EXIT(RecLImmo."No.");

    end;

    procedure InsertHeader2(var PurchReqHeader : Record "50005";PurchaseType : Integer;VendorNo : Code[20]) : Code[20];
    var
        Window : Dialog;
        PurchaseCommentLine : Record "43";
        OldPurchaseCommentLine : Record "43";
        RecLImmo : Record "5600";
        RecLBudget : Record "50001";
        CodeImmobilisation : Code[20];
        CstLText001 : Label 'Création commande     #1######';
        CstLText002 : Label 'Création devis             #1######';
    begin
        
        
        RecGPurchaseSetup.GET;
        RecGPurchaseSetup.TESTFIELD("Order Nos.");
        
        i:=0;
        
        IF PurchaseType = 1 THEN
          Window.OPEN(CstLText002)
        ELSE
          Window.OPEN(CstLText001);
        
        
        RecGPurchOrderHeader.INIT;
        
        // new purch line de type
        IF PurchaseType = 1 THEN
          RecGPurchOrderHeader."Document Type" := RecGPurchOrderHeader."Document Type"::Quote
        ELSE
          RecGPurchOrderHeader."Document Type" := RecGPurchOrderHeader."Document Type"::Order;
        
        RecGPurchOrderHeader."No." := '';
        
        
        CLEAR(NoSeriesLine);
        
        PurchasesPayablesSetup.GET;
        AnnDiv := DATE2DMY(WORKDATE,3);
        
        NoSeriesLine.SETRANGE( NoSeriesLine."Series Code",PurchasesPayablesSetup."No. Commande Achat divers");
        NoSeriesLine.SETRANGE( NoSeriesLine."Starting Date",DMY2DATE(1,1,AnnDiv));
        NoSeriesLine.FIND('+');
        NoSeriesLine.TESTFIELD("Last No. Used");
        IF NoSeriesLine."Last No. Used" <> '' THEN
            NoSeriesLine."Last No. Used" := INCSTR(NoSeriesLine."Last No. Used")
           ELSE
             NoSeriesLine."Last No. Used"  := INCSTR(NoSeriesLine."Starting No.") ;
        NoSeriesLine.MODIFY;
        
        PurchasesPayablesSetup.GET;
        RecGPurchOrderHeader."No." := '';
        //RecGPurchOrderHeader.INSERT(TRUE);
        RecGPurchOrderHeader."No." :=  NoSeriesLine."Last No. Used";
        RecGPurchOrderHeader."Request No." := PurchReqHeader."No.";
        RecGPurchOrderHeader."Order Date" := WORKDATE;  //XCode = Today
        RecGPurchOrderHeader."Expected Receipt Date" := PurchReqHeader."Requested Receipt Date";
        
        RecGPurchOrderHeader."Posting Date" := WORKDATE;  //XCode = Today
        RecGPurchOrderHeader.VALIDATE("Buy-from Vendor No.",VendorNo);
        RecGPurchOrderHeader.VALIDATE("Currency Code",PurchReqHeader."Currency Code");
        PurchReqHeader."N° Commande Achat":= RecGPurchOrderHeader."No.";
        RecGPurchOrderHeader."Purchaser Code" := PurchReqHeader."Purchaseperson Code";
        RecGPurchOrderHeader."Code Demandeur" := PurchReqHeader."Request User ID";
        RecGPurchOrderHeader."Responsibility Center":=PurchReqHeader."Responsibility Center";
        RecGPurchOrderHeader."Shortcut Dimension 1 Code"  := PurchReqHeader."Global Dimension 1 Code";
        RecGPurchOrderHeader."Shortcut Dimension 2 Code"  := PurchReqHeader."Global Dimension 2 Code";
        RecGPurchOrderHeader."No budget d'investissement" := PurchReqHeader."Code Budget";
        RecGPurchOrderHeader."Order Type" := 3;
        RecGPurchOrderHeader."Order Type" := RecGPurchOrderHeader."Order Type"::"Frais Généraux";
        RecGPurchOrderHeader."No dossier" := PurchReqHeader."No. Dossier Import";
        RecGPurchOrderHeader."Posting No. Series" :=   PurchasesPayablesSetup."No. Facture enregistrée divers";
        //RecGPurchOrderHeader.MODIFY;
        RecGPurchOrderHeader.INSERT;
        //kt 02062020
        RecGPurchOrderHeader.VALIDATE("Payment Method Code",PurchReqHeader."Payment Method Code");
        RecGPurchOrderHeader.VALIDATE("Payment Terms Code",PurchReqHeader."Payment Terms Code");
        RecGPurchOrderHeader.MODIFY;
        //end kt
        Window.UPDATE(1,RecGPurchOrderHeader."No.");
        
        /*
        // charger lignes DA du header DA courant
        RecGPurchReqLine.RESET;
        RecGPurchReqLine.SETCURRENTKEY("Request No.","Vendor No.","Item No.");
        RecGPurchReqLine.SETFILTER(RecGPurchReqLine."Request No.",PurchReqHeader."No.");
        RecGPurchReqLine.SETFILTER(RecGPurchReqLine."Ligne approuvée",'%1',TRUE);
        RecGPurchReqLine.FINDFIRST;
        
        // pour chaque liqne
        REPEAT
          //IF RecGPurchReqLine.Type = RecGPurchReqLine.Type::"Fixed Asset" THEN
            //CodeImmobilisation:=CreateFA(RecGPurchReqLine);
          InsertLine(RecGPurchReqLine, RecGPurchOrderHeader,FALSE,CodeImmobilisation);
        UNTIL RecGPurchReqLine.NEXT = 0;
        */
        
        PurchaseCommentLine.SETRANGE("Document Type",PurchaseCommentLine."Document Type"::"10");
        PurchaseCommentLine.SETRANGE("No.",PurchReqHeader."No.");
        IF NOT PurchaseCommentLine.ISEMPTY THEN BEGIN
          PurchaseCommentLine.LOCKTABLE;
          IF PurchaseCommentLine.FINDSET THEN
            REPEAT
              OldPurchaseCommentLine := PurchaseCommentLine;
              PurchaseCommentLine."Document Type" := RecGPurchOrderHeader."Document Type";
              PurchaseCommentLine."No." := RecGPurchOrderHeader."No.";
              PurchaseCommentLine.INSERT;
              PurchaseCommentLine := OldPurchaseCommentLine;
            UNTIL PurchaseCommentLine.NEXT = 0;
        END;
        //PurchReqHeader.MODIFY;
        
        Window.CLOSE;
        EXIT(RecGPurchOrderHeader."No.");

    end;

    procedure InsertLine2(var RecLPurchReqLine : Record "50008";var PurchOrderHeader : Record "38";InitLigne : Boolean;CodeImmobilisation : Code[20]);
    var
        RecLPurchOrderLine : Record "39";
        PurchReqtLineToModify : Record "50008";
    begin
        
        WITH RecLPurchReqLine DO BEGIN
        
          //TESTFIELD("Currency Code",PurchOrderHeader."Currency Code");
        
          RecLPurchOrderLine.INIT;
        
          RecLPurchOrderLine.BlockDynamicTracking(TRUE);
          RecLPurchOrderLine."Document Type" := PurchOrderHeader."Document Type";
          RecLPurchOrderLine."Buy-from Vendor No." := "Vendor No.";
          RecLPurchOrderLine."Document No." := PurchOrderHeader."No.";
          RecLPurchOrderLine.Description:=RecLPurchReqLine.Description;
        
        
          IF InitLigne = FALSE THEN
            RecLPurchOrderLine."Line No." := "Line No."
          ELSE
            RecLPurchOrderLine."Line No.":= Ligne;
        
          RecLPurchOrderLine."Request No." := "Request No.";
          RecLPurchOrderLine."Request Line No." := "Line No.";
        
          CASE  RecLPurchReqLine.Type OF
        
            RecLPurchReqLine.Type::Item                   :  RecLPurchOrderLine.VALIDATE(Type,RecLPurchOrderLine.Type::Item);
            RecLPurchReqLine.Type::"Fixed Asset" ,
            RecLPurchReqLine.Type::"Existing Fixed Asset" :  RecLPurchOrderLine.VALIDATE(Type,RecLPurchOrderLine.Type::"Fixed Asset");
            RecLPurchReqLine.Type::"Charge (Item)"        :  RecLPurchOrderLine.VALIDATE(Type,RecLPurchOrderLine.Type::"Charge (Item)");
        
          END;
        
          IF Type <> Type::" " THEN
          BEGIN
            IF ( Type= Type::Item ) OR (Type= Type::"Charge (Item)") OR (Type= Type::"Existing Fixed Asset")THEN
              RecLPurchOrderLine.VALIDATE("No.","Item No.");
        
            IF  (Type= Type::"Fixed Asset")  THEN
              RecLPurchOrderLine.VALIDATE("No.",CodeImmobilisation);
        
            //RecLPurchOrderLine.VALIDATE("Location Code","Location Code");
            RecLPurchOrderLine."Location Code":="Location Code";
            RecLPurchOrderLine.VALIDATE("Unit of Measure Code","Unit of Measure Code");
            RecLPurchOrderLine.VALIDATE(Quantity,RecLPurchReqLine."Approved quantity");
            IF PurchOrderHeader."Document Type" = PurchOrderHeader."Document Type"::Order THEN
              RecLPurchOrderLine.VALIDATE("Direct Unit Cost","Unit Cost")
            ELSE
              RecLPurchOrderLine.VALIDATE("Direct Unit Cost",0);
        
        
            RecLPurchOrderLine."Vendor Item No." := "Vendor Item No.";
            //RecLPurchOrderLine.Description := Description;
            RecLPurchOrderLine.Description := Commentaire;
            RecLPurchOrderLine."Request No." := "Request No.";
            RecLPurchOrderLine."Request Line No." := "Line No.";
            RecLPurchOrderLine."Shortcut Dimension 1 Code" := "Global Dimension 1 Code";
            RecLPurchOrderLine."Shortcut Dimension 2 Code" := "Global Dimension 2 Code";
        
            //RecLPurchOrderLine."Code activité" := "Code Activité";
            ServiceShelf.GET("Code Activité");
            CASE ServiceShelf."Type activité" OF
              ServiceShelf."Type activité"::PR : RecLPurchOrderLine."Order Type" := RecLPurchOrderLine."Order Type"::PR;
              ServiceShelf."Type activité"::VN : RecLPurchOrderLine."Order Type" := RecLPurchOrderLine."Order Type"::VN;
              ServiceShelf."Type activité"::PVN : RecLPurchOrderLine."Order Type" := RecLPurchOrderLine."Order Type"::Service;
              ServiceShelf."Type activité"::CHRONO : RecLPurchOrderLine."Order Type" := RecLPurchOrderLine."Order Type"::Service;
              ServiceShelf."Type activité"::SAV : RecLPurchOrderLine."Order Type" := RecLPurchOrderLine."Order Type"::Service;
        
              ELSE  RecLPurchOrderLine."Order Type" := RecLPurchOrderLine."Order Type"::"Frais Généraux";
            END;
            RecLPurchOrderLine."Responsibility Center" := "Centre de gestion";
        
            RecLPurchOrderLine."No. compte comptable"      := "No. compte comptable";
            RecLPurchOrderLine."No budget d'investissement":="Code Budget";
        
            RecLPurchOrderLine.VALIDATE("Line Discount %","% Remise");
        
            RecLPurchOrderLine.VIN := RecLPurchReqLine."No. Chassie";
        
           // IF RecLPurchReqLine."Vendor Item No." <> '' THEN
           //   RecLPurchOrderLine.VALIDATE("Cross-Reference No.",RecLPurchReqLine."Vendor Item No.");
            RecLPurchOrderLine.INSERT;
            Ligne:=Ligne +10000;
        
            //KK_271218
            PurchReqtLineToModify.GET("Request No.","Line No.");
            PurchReqtLineToModify."Order No." := RecLPurchOrderLine."Document No.";
            PurchReqtLineToModify."Order Line No." := RecLPurchOrderLine."Line No.";
            PurchReqtLineToModify.MODIFY;
            //END KK
            //AddOnIntegrMgt.TransferFromReqLineToPurchLine(PurchOrderLine,ReqLine2);
        /*
            DocDim.SETRANGE("Table ID",DATABASE::"Purchase Line");
            DocDim.SETRANGE("Document Type",RecLPurchOrderLine."Document Type");
            DocDim.SETRANGE("Document No.",RecLPurchOrderLine."Document No.");
            DocDim.SETRANGE("Line No.",RecLPurchOrderLine."Line No.");
            IF RecLPurchReqLine."Dimension Value" <> '' THEN
            BEGIN
              RecDocumentDimension."Table ID":=39;
              RecDocumentDimension."Document Type":=RecLPurchOrderLine."Document Type";
              RecDocumentDimension."Document No.":=RecLPurchOrderLine."Document No.";
              RecDocumentDimension."Line No.":=RecLPurchOrderLine."Line No.";
              RecDocumentDimension."Dimension Code":='COSTCENTER';
              RecDocumentDimension."Dimension Value Code":=RecLPurchReqLine."Dimension Value";
              IF RecDocumentDimension.INSERT THEN;
            END
        */
          END
          ELSE
          BEGIN
             RecLPurchOrderLine.Description := Description;
             RecLPurchOrderLine.INSERT;
             Ligne:=Ligne +10000;
        
          END
        END;

    end;
}

